(: This query returns players ordered by Overall given a certain field position :) 

declare function local:playersByPosition($pos) as element()*
{
  
let $coll2 := collection('dataset')//players
for $p in $coll2/player[BestPosition = $pos]
order by $p/Overall descending 
return
  <player>
    {$p/ID}
    {$p/Name}
    {$p/PhotoUrl}
    {$p/Nationality}
    {$p/Club} 
  </player>
};

