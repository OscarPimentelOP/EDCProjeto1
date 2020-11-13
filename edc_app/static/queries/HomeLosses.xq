(: This query returns all matches and results where a team has lost playin at home :) 

declare function local:HomeLosses($season, $comp, $team) as element()*
{
let $coll3 := collection('dataset')//matches
for $a in $coll3/match[($season = strSeason) and (idLeague = $comp) and (idHomeTeam = $team) ]
where $a/intHomeScore < $a/intAwayScore
return
  <elem>
      {$a/idEvent} 
      {$a/strEvent} 
      {$a/intHomeScore}
      {$a/intAwayScore} 
      </elem>
};
