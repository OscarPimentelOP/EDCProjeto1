declare %updating  function local:EditMatch($matchID, $newLeagueID, $newhomeTeamID, $newawayTeamID, $newdate, $newstadium) 
{

let $coll2 := collection('dataset')//matches
let $coll3 := collection('dataset')//teams
let $nodeToEdit := for $m in $coll2/match[idEvent = $matchID] return $m

 let $teamHome := $coll3/team/strTeam[idTeam = $newhomeTeamID] 
 let $teamAway := $coll3/team/strTeam[idTeam = $newawayTeamID] 

return (
replace value of node $nodeToEdit/strHomeTeam with $teamHome,
replace value of node $nodeToEdit/strAwayTeam with  $teamAway,
replace value of node $nodeToEdit/idHomeTeam with  $newhomeTeamID,
replace value of node $nodeToEdit/idAwayTeam with  $newAwayTeamID,
replace value of node $nodeToEdit/dateEvent with $newdate,
replace value of node $nodeToEdit/strVenue with $newstadium,
replace value of node $nodeToEdit/idLeague with $newLeagueID)
};

