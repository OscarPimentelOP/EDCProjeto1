(: This query returns all the players in a team :) 
<root>{
let $coll2 := collection('dataset')//players

for $a in $coll2/player
return
  <elem>
    {$a/Name/text()} 
  </elem>
}</root>