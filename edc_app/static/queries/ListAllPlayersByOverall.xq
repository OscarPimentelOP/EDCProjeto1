(: This query returns all the players ordered by overall :) 

declare function local:listAllPlayersByOverall() as element()*
{
let $coll2 := collection('dataset')//players

for $p in $coll2/player
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

<players>
  {local:listAllPlayersByOverall()}
</players>