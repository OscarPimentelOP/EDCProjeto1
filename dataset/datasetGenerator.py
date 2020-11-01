import os
import xmltodict
from lxml import etree
from lxml.builder import E
import json


def print_elems(elem, text=""):
    elem_contents = text + str(elem.tag) + " " + str(elem.attrib) + " " + str(elem.text)
    elem_contents = elem_contents.replace("{}", "").replace("\n", "")
    print(elem_contents)  # print element
    if len(elem.getchildren()) != 0:  # if they exist, print children
        for e in elem:
            print_elems(e, text + "\t")


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
