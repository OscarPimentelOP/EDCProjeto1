(: This query returns the basic player info :) 
<root>{
let $coll1 := collection('dataset')//players
let $player := "Lionel Messi"  
for $a in $coll1/player[FullName = $player]  
return
  <elem>
  {$a/FullName} 
    {$a/Age} 
     {$a/Nationality} 
    {$a/BestPosition} 
     {$a/Height} 
     {$a/Weight}
  </elem>
}</root>