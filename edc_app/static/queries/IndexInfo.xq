(: This query returns the basic info of a match for the match page :) 

declare function local:IndexInfo() as element()*
{
let $coll3 := collection('dataset')//matches
for $a in $coll3/match
return
<league>
      {$a/strLeague}     
 </league>

};

