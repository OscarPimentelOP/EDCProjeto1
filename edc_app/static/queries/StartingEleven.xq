(: This query returns all matches and results where a team has won playin away :) 

declare function local:StartingEleven($team) as element()*
{
let $coll3 := collection('dataset')//matches
let  $res :=
for $a in $coll3/match[(idAwayTeam = $team) or (idHomeTeam = $team)]
return
if ($a/idAwayTeam = $team) then
  <elem>
       {$a/strAwayLineupGoalkeeper/text()} 
      {$a/strAwayLineupDefense/text()} 
      {$a/strAwayLineupMidfield/text()} 
      {$a/strAwayLineupForward/text()} 
     </elem>
      else if ($a/idHomeTeam = $team) then
      <elem>
      {$a/strHomeLineupGoalkeeper/text()} 
      {$a/strHomeLineupDefense/text()} 
      {$a/strHomeLineupMidfield/text()} 
      {$a/strHomeLineupForward/text()} 
      </elem>
return <root>{$res}</root>
};

