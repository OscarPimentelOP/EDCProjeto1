(: This query returns the basic info of a match for the match page, listing the 6 main leagues :) 

declare function local:IndexInfo() as element()*
{
let $coll3 := collection('dataset')//matches

for $a in distinct-values($coll3/match/strLeague)
return
<league>{$a}</league>
};

<index>
  {local:IndexInfo()}
</index>