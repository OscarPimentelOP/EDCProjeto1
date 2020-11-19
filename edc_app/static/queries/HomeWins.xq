(: This query returns all matches and results where a team has won playin at home :) 

declare function local:HomeWins($season, $comp, $team) 
{
let $coll3 := collection('dataset')//matches
let $wins :=
for $a in $coll3/match[($season = strSeason) and (idLeague = $comp) and (idHomeTeam = $team) ]
where $a/intHomeScore > $a/intAwayScore
return
  <elem>
      {$a/idEvent} 
      {$a/strEvent} 
      {$a/intHomeScore}
      {$a/intAwayScore} 
      </elem>
return count($wins)
      
};

