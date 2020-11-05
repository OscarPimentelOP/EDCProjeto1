(:Module for generic utils to use in other xqueries:)
module namespace utils= "ua.utils.edc";

declare function utils:renameNode($node, $newName) as element()*{
    copy $c := $node
    modify rename node $c as $newName
    return $c
};