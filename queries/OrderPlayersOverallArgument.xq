(: This query returns players ordered by Overall given a certain field position :) 

declare function local:playersByPosition($pos) as element()*
{

let $coll2 := collection('dataset')//players
for $a in $coll2/player[BestPosition = $pos]
order by $a/Overall 
return
  <elem>
    {$a/Name/text()} 
  </elem>

};


<elem>
{local:playersByPosition('ST')}
</elem>
