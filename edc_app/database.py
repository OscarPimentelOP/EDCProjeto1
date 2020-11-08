from BaseXClient import BaseXClient
import os.path
from edc.settings import STATICFILES_DIRS

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
    res = run_query('OrderPlayersOverallArgument.xq', 'local:playersByPosition({})'.format(pos))
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


def main():
    #print(list_all_players())
    #print(get_player_by_id(20801))
    #print(order_players_pos('"ST"'))
    #print(get_round_results("'2019-2020'","'English Premier League'", "'2'"))
    #print(get_team_home_wins("'2019-2020'", "'English Premier League'", "'Liverpool'"))
    #print(get_team_home_losses("'2019-2020'", "'Portuguese Primeira Liga'", "'FC Porto'"))
    #print(get_team_away_wins("'2019-2020'", "'English Premier League'", "'Liverpool'"))
    print(get_team_away_losses("'2019-2020'", "'Portuguese Primeira Liga'", "'FC Porto'"))
    #print(get_team_draws("'2019-2020'", "'English Premier League'", "'Liverpool'"))
    #print(get_team_info("'FC Porto'"))
    #print(get_team_players("'FC Porto'"))


if __name__ == "__main__":
    main()
