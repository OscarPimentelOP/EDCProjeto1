import os
import xmltodict
from lxml import etree
from lxml.builder import E


def build_league(file):
    open_file = etree.parse(file)
    root = open_file.getroot()
    doc = xmltodict.parse(open(file, 'rb').read())

    ret = E.league(E.leagueid(doc['root']['team'][0]['idLeague']), E.leaguename(doc['root']['team'][0]['strLeague']),
                   E.teams())

    for children in root:
        ret.find('teams').append(children)

    return ret


def checkIfAlternate(val, alt_list):
    for n in alt_list:
        if val == n:
            return True
    return False


def add_id(players, teams):
    teams_tree = etree.parse(teams)
    teams_root = teams_tree.getroot()
    players_tree = etree.parse(players)
    players_root = players_tree.getroot()

    player_country_root = etree.Element('players')
    pc_tree = etree.ElementTree(player_country_root)

    alt = []

    for team in teams_root:
        team_str = team.find('strTeam').text
        team_id_elem = team.find('idTeam')
        team_alt_str = team.find("strAlternate").text

        if team_alt_str is not None:
            alt = team_alt_str.split(', ')

        for player in players_root:
            player_club_str = player.find('Club').text

            if player_club_str == team_str or checkIfAlternate(player_club_str, alt):
                player.append(team_id_elem)
                player_country_root.append(player)

    pc_tree.write('players\\'+teams.split('_')[0].split('\\')[1] + '_playersWithID.xml', xml_declaration=True, encoding='utf-8', pretty_print=True)


if __name__ == '__main__':
    datasetRoot = etree.Element('leagues')
    dtTree = etree.ElementTree(datasetRoot)

    for filename in os.listdir('teams'):
        datasetRoot.append(build_league('teams\\' + filename))
        add_id('players\\players_fifa21.xml', 'teams\\' + filename)

    dtTree.write('teams\\leagueTeams.xml', xml_declaration=True, encoding='utf-8', pretty_print=True)
