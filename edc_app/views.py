import os
import urllib.request
import edc_app.database as db

from django.shortcuts import render
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


def players(request):
    pos = request.GET.get('pos', '')
    if pos:
        players_data = '<players>' + db.order_players_pos(pos) + '</players>'
        players_data_xml = etree.fromstring(players_data)

    else:
        players_data = db.list_players_ord()
        players_data_xml = etree.fromstring(players_data)

    # TRANSFORM XSTL
    players_data_html = transform_to_html(players_data_xml, "players.xsl")

    tparams = {
        'generated': players_data_html,
    }
    return render(request, 'players.html', tparams)


# Individual Player Page
def player(request, player_id):
    player_data = db.get_player_by_id(player_id)
    player_data_xml = etree.fromstring(player_data)

    club_position_txt = player_data_xml.find('ClubPosition').text
    national_position_txt = player_data_xml.find('NationalPosition').text

    # if len(club_position_txt) > 3:
    #    pos_l = club_position_txt.split(", ")
    #    pos_l_translated = []
    #    for pos_e in pos_l:
    #        pos_l_translated.append(translate_position(pos_e))
    #    club_position = ','.join(pos_l_translated)
    # else:
    club_position = translate_position(club_position_txt)

    # if len(national_position_txt) > 3:
    #    pos_l = national_position_txt.split(", ")
    #    pos_l_translated = []
    #    for pos_e in pos_l:
    #        pos_l_translated.append(translate_position(pos_e))
    #    national_position = ','.join(pos_l_translated)
    # else:
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
# TODO XSTL TRANSFORMATIONS
# TODO Possibly add a simpler schema, using xpath to find just the data we want
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
