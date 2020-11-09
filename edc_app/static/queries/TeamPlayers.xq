(: This query returns all the players in a team :) 

declare function local:TeamPlayers($team) as element()*{
let $coll2 := collection('dataset')//players
for $a in $coll2/player[idTeam = $team]
return
  <elem>
    {$a/ID} 
    {$a/Name} 
    {$a/BestPosition} 
    {$a/PhotoUrl} 
  </elem>
};