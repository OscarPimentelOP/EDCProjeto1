import urllib.request
import json
import sys

if __name__ == "__main__":
    league_id = sys.argv[1]
    nr_of_rounds = sys.argv[2]
    season = sys.argv[3]
    league_name = sys.argv[4]
    data = []

    for round_number in range(1, int(nr_of_rounds) + 1):
        with urllib.request.urlopen(" https://www.thesportsdb.com/api/v1/json/1/eventsround.php?id=" + str(league_id)
                                    + "&r=" + str(round_number) + "&s=" + season) as url:
            data.append(json.loads(url.read().decode()))

    pivot = data[0]['events']
    for events in data[1:]:
        pivot.extend(events['events'])

    with open(league_name + '_' + season + '.json', 'w') as outfile:
        json.dump(pivot, outfile)
