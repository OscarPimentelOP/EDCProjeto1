(: This function returns the player with a given id :) 
(:import module namespace utils= 'ua.utils.edc' at "Utils.xqm";:)

declare function local:renameNode($node, $newName) as element()*{
    copy $c := $node
    modify rename node $c as $newName
    return $c
};

declare function local:getPlayerById($id) as element()*
{
  
let $coll2 := collection('dataset')//players
let $coll3 := collection('dataset')//teams
let $player := $coll2/player[ID = $id]
let $team := $coll3/team[idTeam = $player/idTeam] 
let $teamBadge := local:renameNode($team/strTeamBadge, "TeamBadge")
return
  <player>
    {$player/ID}
    {$player/Name}
    {$player/FullName}
    {$player/Nationality}
    {$player/Age}
    {$player/PhotoUrl}
    {$teamBadge}
    {$player/Height}
    {$player/Weight}
    {$player/Club}
    {$player/ClubPosition}
    {$player/ClubNumber}
    {$player/NationalTeam}
    {$player/NationalNumber}
    {$player/NationalPosition}
    {$player/ValueEUR}
    {$player/WageEUR}
    {$player/idTeam}
  </player>
};
