(: This query returns all the players :) 
<root>{
let $coll2 := collection('dataset')//players

for $p in $coll2/player
return
  <player>
    {$p/ID}
    {$p/Name}
    {$p/PhotoUrl}
    {$p/Nationality}
    {$p/Club} 
  </player>
}</root>