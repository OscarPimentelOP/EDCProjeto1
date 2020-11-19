declare %updating  function local:EditMatch($matchID, $newLeagueID, $newhomeTeamID, $newawayTeamID, $newdate, $newstadium) 
{

let $coll2 := collection('dataset')//matches
let $coll3 := collection('dataset')//teams
let $coll4 := collection('dataset')//leagues
let $nodeToEdit := for $m in $coll2/match[idEvent = $matchID] return $m

 let $teamHome :=  for $t in $coll3/team[idTeam = $newhomeTeamID] return $t/strTeam
 
 let $teamAway:=  for $t in $coll3/team[idTeam = $newawayTeamID] return $t/strTeam
 let  $newLeagueName := for $l in $coll4/league[leagueid= $newLeagueID]  return $l/leaguename
 
return (
replace value of node $nodeToEdit/strHomeTeam with $teamHome,
replace value of node $nodeToEdit/strAwayTeam with  $teamAway,
replace value of node $nodeToEdit/idHomeTeam with  $newhomeTeamID,
replace value of node $nodeToEdit/idAwayTeam with  $newawayTeamID,
replace value of node $nodeToEdit/dateEvent with $newdate,
replace value of node $nodeToEdit/strVenue with $newstadium,
replace value of node $nodeToEdit/strLeague with $newLeagueName, 
replace value of node $nodeToEdit/idLeague with $newLeagueID)
 

};


