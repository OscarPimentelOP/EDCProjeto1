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


def main():
    print(list_all_players())
    print(get_player_by_id(20801))
    # print(order_players_pos('"ST"'))


if __name__ == "__main__":
    main()
