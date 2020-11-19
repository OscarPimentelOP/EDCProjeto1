(: This query returns all matches and results where a team has lost playin away :) 

declare function local:AwayLosses($season, $comp, $team)
{
let $coll3 := collection('dataset')//matches
let $losses :=
for $a in $coll3/match[($season = strSeason) and (idLeague = $comp) and (idAwayTeam = $team) ]
where $a/intAwayScore < $a/intHomeScore
return
  <elem>
      {$a/idEvent} 
      {$a/strEvent} 
      {$a/intHomeScore}
      {$a/intAwayScore} 
      </elem>

return count($losses)      
};

