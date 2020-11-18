declare %updating  function local:EditMatch($matchID, $newLeague, $newLeagueID, $newhomeTeam, $newawayTeam, $newdate, $newstadium) 
{

let $coll2 := collection('dataset')//matches
let $nodeToEdit := for $m in $coll2/match[idEvent = $matchID] return $m


return (
replace value of node $nodeToEdit/strHomeTeam with $newhomeTeam,
replace value of node $nodeToEdit/strAwayTeam with $newawayTeam,
replace value of node $nodeToEdit/dateEvent with $newdate,
replace value of node $nodeToEdit/strVenue with $newstadium,
replace value of node $nodeToEdit/strLeague with $newLeague,
replace value of node $nodeToEdit/idLeague with $newLeagueID

)


};

local:EditMatch("999999999", "Portuguese Primeira Liga", "696969669", "Sporting", "Cucujães", "2090-07-22", "Estadio do Dragao")