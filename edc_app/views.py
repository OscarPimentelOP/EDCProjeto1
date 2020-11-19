import os
import urllib.request
import edc_app.database as db

from django.shortcuts import render, redirect
from django.http import HttpRequest, HttpResponse
from datetime import datetime
from lxml import etree

# Create your views here.
from edc.settings import STATICFILES_DIRS

static_files = STATICFILES_DIRS[0]


def index(request):
    tparams = {
        'title': 'Home Page',
        'year': datetime.now().year,
    }
    return render(request, 'index.html', tparams)


def teams(request):
    league = request.GET.get('league', '')
    teams_schema = etree.XMLSchema(etree.parse(os.path.join(static_files, 'schemas', 'teams.xsd')))
    teams_parser = etree.XMLParser(schema=teams_schema)
    if league:
        teams_data = db.get_teams_from_comp(league)
        try:
            teams_data_xml = etree.fromstring(teams_data, teams_parser)
        except etree.XMLSyntaxError:
            print("Invalid Schema")

    else:
        teams_data = db.get_all_teams_info()
        try:
            teams_data_xml = etree.fromstring(teams_data, teams_parser)
        except etree.XMLSyntaxError:
            print("Invalid Schema")

    # TRANSFORM XSTL
    teams_data_html = transform_to_html(teams_data_xml, "teams.xsl")

    tparams = {
        'generated': teams_data_html,
    }

    return render(request, 'teams.html', tparams)


def team(request, team_id):
    team_data = db.get_team_info(team_id)
    team_schema = etree.XMLSchema(etree.parse(os.path.join(static_files, 'schemas', 'team.xsd')))
    team_parser = etree.XMLParser(schema=team_schema)

    try:
        team_data_xml = etree.fromstring(team_data, team_parser)
    except etree.XMLSyntaxError:
        print("Schema not valid")

    team_data_html = transform_to_html(team_data_xml, 'team.xsl')

    tparams = {
        'generated': team_data_html,
    }

    return render(request, 'team.html', tparams)


def players(request):
    pos = request.GET.get('pos', '')
    players_schema = etree.XMLSchema(etree.parse(os.path.join(static_files, 'schemas', 'players.xsd')))
    players_parser = etree.XMLParser(schema=players_schema)

    if pos:
        players_data = '<players>' + db.order_players_pos(pos) + '</players>'
        try:
            players_data_xml = etree.fromstring(players_data, players_parser)
        except etree.XMLSyntaxError:
            print("Invalid Schema")

    else:
        players_data = db.list_players_ord()
        try:
            players_data_xml = etree.fromstring(players_data, players_parser)
        except etree.XMLSyntaxError:
            print("Invalid Schema")

    # TRANSFORM XSTL
    players_data_html = transform_to_html(players_data_xml, "players.xsl")

    tparams = {
        'generated': players_data_html,
    }
    return render(request, 'players.html', tparams)


# Individual Player Page
def player(request, player_id):
    player_data = db.get_player_by_id(player_id)
    player_schema = etree.XMLSchema(etree.parse(os.path.join(static_files, 'schemas', 'player.xsd')))
    player_parser = etree.XMLParser(schema=player_schema)

    try:
        player_data_xml = etree.fromstring(player_data, player_parser)
    except etree.XMLSyntaxError:
        print("Schema not valid")

    club_position_txt = player_data_xml.find('ClubPosition').text
    national_position_txt = player_data_xml.find('NationalPosition').text

    club_position = translate_position(club_position_txt)

    national_position = translate_position(national_position_txt)

    if national_position == 'N/D':
        player_data_xml.find('NationalNumber').text = 'N/D'

    # Translate positions for readability
    c_pos_trans = etree.Element("ClubPositionTranslated")
    n_pos_trans = etree.Element("NationalPositionTranslated")

    c_pos_trans.text = club_position
    n_pos_trans.text = national_position

    player_data_xml.append(c_pos_trans)
    player_data_xml.append(n_pos_trans)

    # Transform to HTML
    player_data_html = transform_to_html(player_data_xml, 'player.xsl')

    tparams = {
        'generated': player_data_html,
    }

    return render(request, 'player.html', tparams)


# News Page
def news(request):
    # News Source(s), Schemas and Parser
    rss_feed = 'https://www.skysports.com/rss/11095'
    rss_schema = etree.XMLSchema(etree.parse(os.path.join(static_files, 'schemas', 'rss.xsd')))
    rss_parser = etree.XMLParser(schema=rss_schema)

    # Loading xml content fetches from the page
    # Validation is done by the parser
    try:
        with urllib.request.urlopen(rss_feed) as url:
            rss_xml = etree.fromstring(url.read(), rss_parser)
    except etree.XMLSyntaxError:
        print("Schema not valid")

    # TRANSFORM XSTL
    rss_html = transform_to_html(rss_xml, "news.xsl")
    # add proper content to page

    tparams = {
        'generated': rss_html,
    }

    return render(request, 'news.html', tparams)


def matches(request):
    page_number = request.GET.get('page', '')
    page_size = request.GET.get('pagesize', '')
    league_id = request.GET.get('league', '')

    if league_id:
        matches_data = db.get_matches_league(league_id)
    else:
        matches_data = db.get_matches()

    matches_data_xml = etree.fromstring(matches_data)

    if page_number and page_size:
        matches_xslt_file = etree.parse(os.path.join(static_files, 'transformations', 'matches.xsl'))
        matches_transform = etree.XSLT(matches_xslt_file)
        if league_id:
            matches_data_html = matches_transform(matches_data_xml, Page=page_number, PageSize=page_size,
                                                  League=league_id)
        else:
            matches_data_html = matches_transform(matches_data_xml, Page=page_number, PageSize=page_size)
    else:
        matches_data_html = transform_to_html(matches_data_xml, "matches.xsl")

    tparams = {
        'generated': matches_data_html,
        'league_id': league_id,
    }

    return render(request, 'matches.html', tparams)


def match(request, match_id):
    match_data = db.get_match_by_id(match_id)
    match_schema = etree.XMLSchema(etree.parse(os.path.join(static_files, 'schemas', 'match.xsd')))
    match_parser = etree.XMLParser(schema=match_schema)

    match_team_data = '<players>'+db.match_players_photos(match_id)+'</players>'
    match_extra_data = db.get_match_events(match_id)

    try:
        match_data_xml = etree.fromstring(match_data, match_parser)
        match_extra_xml = etree.fromstring(match_extra_data)
        match_team_xml = etree.fromstring(match_team_data)
    except etree.XMLSyntaxError:
        print("Schema not valid")

    match_header_html = transform_to_html(match_data_xml, 'match_header_addt_info.xsl')

    match_team_html = transform_to_html(match_team_xml, 'match_teams.xsl')

    match_extra_html = transform_to_html(match_extra_xml, 'match_extras.xsl')

    tparams = {
        'match_header': match_header_html,
        'match_extras': match_extra_html,
        'team_lineup' : match_team_html,
    }

    return render(request, 'match.html', tparams)


def edit_match(request, match_id):
    if request.method == 'POST':
        # insert home_team, away_team, league, round, data
        print(request.POST['league'])
        print(request.POST)
        date = "{}-{}-{}".format(request.POST['date[year]'], request.POST['date[month]'], request.POST['date[day]'])

        #db.edit_match(match_id, request.POST['home_team'], request.POST['away_team'], request.POST['league'], \
                      #request.POST['round'], date, "Fantasy Stadium")

    teams_data = db.get_all_teams_info()
    teams_schema = etree.XMLSchema(etree.parse(os.path.join(static_files, 'schemas', 'teams.xsd')))
    teams_parser = etree.XMLParser(schema=teams_schema)

    match_data = db.get_match_by_id(match_id)
    match_schema = etree.XMLSchema(etree.parse(os.path.join(static_files, 'schemas', 'match.xsd')))
    match_parser = etree.XMLParser(schema=match_schema)

    try:
        team_data_xml = etree.fromstring(teams_data, teams_parser)
        match_data_xml = etree.fromstring(match_data, match_parser)
    except etree.XMLSyntaxError:
        print("Schema not valid")

    team_data_html = transform_to_html(team_data_xml, 'team_dropdown.xsl')
    match_header_html = transform_to_html(match_data_xml, 'match_header.xsl')

    tparams = {
        'team_dropdown': team_data_html,
        'match_header': match_header_html,
    }
    return render(request, 'edit_match.html', tparams)


# Function to transform xml to html
def transform_to_html(original_xml, xslt_filename):
    xslt_file = etree.parse(os.path.join(static_files, 'transformations', xslt_filename))
    transform = etree.XSLT(xslt_file)
    html = transform(original_xml)

    return html


# Function to translate position acronyms to full name
def translate_position(pos):
    pos_dict = dict(GK="Goalkeeper",
                    RB="Right Back",
                    CB="Center Back",
                    LB="Left Back",
                    RWB="Right Wing Back",
                    LWB="Left Wing Back",
                    CDM="Center Defensive Midfielder",
                    CM="Center Midfielder",
                    CAM="Center Attacking Midfielder",
                    RM="Right Midfielder",
                    LM="Left Midfielder",
                    RW="Right Wing",
                    LW="Left Wing",
                    CF="Center Forward",
                    RES="Reserved",
                    SUB="Substitute",
                    ST="Striker")
    if not pos:
        return "N/D"
    return pos_dict[pos]
