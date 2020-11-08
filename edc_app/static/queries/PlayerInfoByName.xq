declare function local:PlayerInfoByName($name) as element()*
{  
let $coll2 := collection('dataset')//players
for $a in $coll2/player[FullName = $name]
return
  <player>
    {$a/FullName}
    {$a/ID}
    {$a/PhotoUrl}
     </player>
};