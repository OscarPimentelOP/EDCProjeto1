(: This query returns all matches and results where a team has won playin away :) 

declare function local:AwayWins($season, $comp, $team) as element()*
{
let $coll3 := collection('dataset')//matches
for $a in $coll3/match[($season = strSeason) and (strLeague = $comp) and (strAwayTeam = $team) ]
where $a/intAwayScore > $a/intHomeScore
return
  <elem>
      {$a/strEvent} 
      {$a/intHomeScore}
      {$a/intAwayScore} 
      </elem>
};

<elem>
{ local:AwayWins("2019-2020", "English Premier League","Liverpool")}
</elem>