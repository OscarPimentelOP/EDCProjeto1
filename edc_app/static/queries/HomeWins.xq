(: This query returns all matches and results where a team has won playin at home :) 

declare function local:HomeWins($season, $comp, $team) as element()*
{
let $coll3 := collection('dataset')//matches
for $a in $coll3/match[($season = strSeason) and (strLeague = $comp) and (strHomeTeam = $team) ]
where $a/intHomeScore > $a/intAwayScore
return
  <elem>
      {$a/strEvent} 
      {$a/intHomeScore}
      {$a/intAwayScore} 
      </elem>
};

