(: This query returns players ordered by Overall given a certain field position :) 
<root>{
let $coll2 := collection('dataset')//players
let $clause := "ReleaseClause"
for $a in $coll2/player
order by $a/ReleaseClause/@num
return
  <elem>
    {$a/Name/text()} 
  </elem>
}</root>