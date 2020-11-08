(: This query returns all matches and results where a team has won playin away :) 

declare function local:StartingEleven($season, $comp, $team) as element()*
{
let $coll3 := collection('dataset')//matches
let  $res :=
for $a in $coll3/match[($season = strSeason) and (strLeague = $comp) and ((strAwayTeam = $team) or (strHomeTeam = $team)) ]
return
if ($a/strAwayTeam = $team) then
  <elem>
       {$a/strAwayLineupGoalkeeper/text()} 
      {$a/strAwayLineupDefense/text()} 
      {$a/strAwayLineupMidfield/text()} 
      {$a/strAwayLineupForward/text()} 
     </elem>
      else if ($a/strHomeTeam = $team) then
      <elem>
      {$a/strHomeLineupGoalkeeper/text()} 
      {$a/strHomeLineupDefense/text()} 
      {$a/strHomeLineupMidfield/text()} 
      {$a/strHomeLineupForward/text()} 
      </elem>
return <root>{$res}</root>
};

