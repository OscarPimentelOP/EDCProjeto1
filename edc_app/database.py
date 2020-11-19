from BaseXClient import BaseXClient
import os.path
from edc.settings import STATICFILES_DIRS
import xml.etree.ElementTree as ET

# create session
session = BaseXClient.Session('localhost', 1984, 'admin', 'admin')


def connect_db():
    global session
    session = BaseXClient.Session('localhost', 1984, 'admin', 'admin')


def disconnect_db():
    global session
    if session:
        session.close()


def run_query(file, command=''):
    connect_db()
    res = session.execute(
        'xquery \n' + open(os.path.join(STATICFILES_DIRS[0], "queries", file), 'r').read() + '\n' + command)
    disconnect_db()
    return res


def list_all_players():
    res = run_query("ListAllPlayers.xq")
    return res


def order_players_pos(pos):
    res = run_query('OrderPlayersOverallArgument.xq', 'local:playersByPosition("{}")'.format(pos))
    return res


def list_players_ord():
    res = run_query('ListAllPlayersByOverall.xq')
    return res


def get_player_by_id(player_id):
    res = run_query('GetPlayerById.xq', 'local:getPlayerById({})'.format(player_id))
    return res


def get_round_results(season, comp, round):
    res = run_query('RoundResults.xq', 'local:RoundResults({}, {} ,{})'.format(season, comp, round))
    return res


def get_team_home_wins(season, comp, team):
    res = run_query('HomeWins.xq', 'local:HomeWins({}, {} ,{})'.format(season, comp, team))
    return res


def get_team_away_wins(season, comp, team):
    res = run_query('AwayWins.xq', 'local:AwayWins({}, {} ,{})'.format(season, comp, team))
    return res


def get_team_home_losses(season, comp, team):
    res = run_query('HomeLosses.xq', 'local:HomeLosses({}, {} ,{})'.format(season, comp, team))
    return res


def get_team_away_losses(season, comp, team):
    res = run_query('AwayLosses.xq', 'local:AwayLosses({}, {} ,{})'.format(season, comp, team))
    return res


def get_team_draws(season, comp, team):
    res = run_query('Draws.xq', 'local:Draws({}, {} ,{})'.format(season, comp, team))
    return res


def get_team_info(team):
    res = run_query('BasicTeamInfo.xq', 'local:TeamInfo({})'.format(team))
    return res


def get_team_players(team):
    res = run_query('TeamPlayers.xq', 'local:TeamPlayers({})'.format(team))
    return res


def get_team_best_player(team):
    res = run_query('BestPlayerInTeam.xq', 'local:BestPlayer({})'.format(team))
    return res


def get_player_by_name(player):
    res = run_query('PlayerInfoByName.xq', 'local:PlayerInfoByName({})'.format(player))
    return res


def get_most_used_player(team):
    res = run_query('StartingEleven.xq', 'local:StartingEleven({})'.format(team))
    root = ET.fromstringlist(res)
    dict = {}
    for c in root:
        players = str(c.text).split(';')
        for player in players:
            if len(player) > 2:
                if player in dict and player != 'None':
                    dict[player] += 1
                else:
                    dict[player] = 1
    mostUsedVal = max(dict.values())
    return [p for p in dict if dict[p] == mostUsedVal]


def get_match_info(season, comp, matchID):
    res = run_query('MatchInfo.xq', 'local:MatchInfo({}, {} ,{})'.format(season, comp, matchID))
    return res


def get_match_by_id(match_id):
    res = run_query("GetMatchById.xq", 'local:GetMatchById({})'.format(match_id))
    return res


def get_match_events(match_id):
    res = run_query("MatchEvents.xq", 'local:MatchEvents({})'.format(match_id))
    return res


def get_index_info():
    res = run_query('IndexInfo.xq')
    return res


def get_all_teams_info():
    res = run_query('AllTeamsInfo.xq')
    return res


def get_teams_from_comp(comp):
    res = run_query('LeagueTeamsByID.xq', 'local:LeagueTeamsByID({})'.format(comp))
    return res


def get_calendar_for_index(comp, season):
    res = run_query('ListCalendar.xq', 'local:ListCalendar({}, {})'.format(comp, season))
    return res


def get_plantel(team):
    res = run_query('PlayersInTeam.xq', 'local:PlayersInTeam({})'.format(team))
    return res


def get_matches():
    res = run_query('ListMatches.xq')
    return res


def get_starting_eleven(season, comp, team):
    res = run_query('StartingEleven.xq', 'local:StartingEleven({}, {} ,{})'.format(season, comp, team))
    return res


def get_matches_league(league_id):
    res = run_query('AddBadgesMatchesLeague.xq', 'local:getMatches({})'.format(league_id))
    return res


def insert_match(matchID, league, season, homeTeam, awayTeam, date, stadium, round):
    res = run_query('InsertMatch.xq',
                    'local:InsertMatch({}, {}, "{}", {}, {}, "{}", "{}", {})'.format(matchID, league, season, homeTeam,
                                                                                     awayTeam, date, stadium, round))
    return res


def delete_match(matchID):
    res = run_query('DeleteMatch.xq', 'local:DeleteMatch({})'.format(matchID))
    return res


def edit_match(matchID, newLeagueID, newhomeTeam, newawayTeam, newdate, newstadium, newround):
    res = run_query('EditMatch.xq',
                    'local:EditMatch({}, {}, {}, {}, "{}", "{}", {})'.format(matchID, newLeagueID, newhomeTeam, newawayTeam,
                                                                         newdate, newstadium, newround))
    return res


def get_match_events(matchID):
    res = run_query('MatchEvents.xq', 'local:MatchEvents({})'.format(matchID))
    return res


def match_players_photos(matchID):
    res = run_query('StartingElevenPhotosID.xq', 'local:PlayersPhotos({})'.format(matchID))
    return res


def get_home_Goals(season, comp, team):
    res = run_query('HomeGoals.xq', 'local:HomeGoals({}, {} ,{})'.format(season, comp, team))
    return res

def get_away_Goals(season, comp, team):
    res = run_query('AwayGoals.xq', 'local:AwayGoals({}, {} ,{})'.format(season, comp, team))
    return res




