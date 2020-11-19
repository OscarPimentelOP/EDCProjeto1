(: This query returns all the players in a team :) 

declare function local:TeamPlayers($team) as element()*{
let $coll2 := collection('dataset')//players
for $a in $coll2/player[idTeam = $team]
return
  <player>
    {$a/ID} 
    {$a/Name} 
    {$a/ClubPosition}
    {$a/PhotoUrl} 
  </player>
};
