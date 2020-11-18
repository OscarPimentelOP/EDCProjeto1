declare %updating  function local:DeleteMatch($matchID) 
{

let $coll2 := collection('dataset')//matches
let $nodeToEdit := for $m in $coll2/match[idEvent = $matchID] return $m

return (delete node $nodeToEdit)
};

local:DeleteMatch("999999999")