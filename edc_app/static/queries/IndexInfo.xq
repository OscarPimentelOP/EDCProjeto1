(: This query returns the basic info of a match for the match page :) 

declare function local:IndexInfo() as element()*
{
let $coll3 := collection('dataset')//matches
let  $res :=
for $a in $coll3/match
return
<league>
      {$a/strLeague} 
    
 </league>
return $res
};

<index>
  {local:IndexInfo()}
</index>