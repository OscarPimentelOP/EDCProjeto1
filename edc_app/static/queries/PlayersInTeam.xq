(: This query returns all the players in a team :) 
declare function local:PlayersInTeam($team) as element()*
{
let $coll2 := collection('dataset')//players
let  $res :=
for $a in $coll2/player[idTeam = $team]  
return
  <player>
    {$a/Name/text()} 
  </player>
    return <squad> {$res} </squad>
};