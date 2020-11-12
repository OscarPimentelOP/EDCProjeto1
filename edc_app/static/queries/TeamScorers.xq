declare function local:TeamScorers($season, $comp, $team) as element()*
{
let $coll3 := collection('dataset')//matches
let  $res :=
for $a in $coll3/match[($season = strSeason) and (strLeague = $comp) and ((idAwayTeam = $team) or (idHomeTeam = $team)) ]
return
if ($a/idAwayTeam = $team) then
  <elem>
       {$a/strAwayGoalDetails/text()} 

     </elem>
      else if ($a/idHomeTeam = $team) then
      <elem>
      {$a/strHomeGoalDetails/text()} 
      </elem>
return <root>{$res}</root>
};

