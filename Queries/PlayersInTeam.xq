(: This query returns all the players in a team :) 
<root>{
let $coll1 := collection('dataset')//teams
let $coll2 := collection('dataset')//players
let $club := "Arsenal"  
for $a in $coll2/player[Club = $club]  
return
  <elem>
    {$a/Name/text()} 
  </elem>
}</root>