(: This query returns all the best player(s) in a team :) 

declare function local:BestPlayer($team) as element()*{

let $coll2 := collection('dataset')//players
let $max := max($coll2/player[idTeam = $team]/Overall)

for $a in $coll2/player[idTeam  = $team]
where $a/Overall = $max
return
  <player>
    {$a/ID} 
    {$a/Name} 
    {$a/Overall} 
    {$a/BestPosition} 
    {$a/PhotoUrl} 
  </player>
};