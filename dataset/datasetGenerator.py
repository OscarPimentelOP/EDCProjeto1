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


if __name__ == '__main__':
    datasetRoot = etree.Element('leagues')
    dtTree = etree.ElementTree(datasetRoot)

    for filename in os.listdir('teams'):
        datasetRoot.append(build_league('teams\\' + filename))

    dtTree.write('leagueTeams.xml', xml_declaration=True, encoding='utf-8', pretty_print=True)
