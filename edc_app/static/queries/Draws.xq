(: This query returns all matches and results where a team has won playin away :) 

declare function local:Draws($season, $comp, $team) 
{
let $coll3 := collection('dataset')//matches
let $draws := 
for $a in $coll3/match[($season = strSeason) and (idLeague = $comp) and ((idHomeTeam = $team) or (idAwayTeam = $team)) ]
where $a/intAwayScore =  $a/intHomeScore
return
  <elem>
      {$a/idEvent} 
      {$a/strEvent} 
      {$a/intHomeScore}
      {$a/intAwayScore} 
      </elem>
      
return count($draws)      
};