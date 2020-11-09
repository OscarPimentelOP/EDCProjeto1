(: This query returns all matches and results where a team has lost playin away :) 

declare function local:AwayLosses($season, $comp, $team) as element()*
{
let $coll3 := collection('dataset')//matches
for $a in $coll3/match[($season = strSeason) and (strLeague = $comp) and (idAwayTeam = $team) ]
where $a/intAwayScore < $a/intHomeScore
return
  <elem>
      {$a/idEvent} 
      {$a/strEvent} 
      {$a/intHomeScore}
      {$a/intAwayScore} 
      </elem>
};