(: This query returns players ordered by Overall given a certain field position :) 
<root>{
let $coll2 := collection('dataset')//players
let $bestPos := "ST"
for $a in $coll2/player[BestPosition = $bestPos]
order by $a/Overall 
return
  <elem>
    {$a/Name/text()} 
  </elem>
}</root>