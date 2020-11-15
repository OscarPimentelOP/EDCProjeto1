(: This query returns the basic info of a match for the match page :) 

declare function local:MatchInfo($season, $comp, $matchID) as element()*
{
let $coll3 := collection('dataset')//matches
let  $res :=
for $a in $coll3/match[($season = strSeason) and (idLeague = $comp) and (idEvent = $matchID ) ]
return
<elem>
      {$a/idEvent} 
      {$a/dateEvent} 
      {$a/strVenue} 
      {$a/strHomeTeam} 
      {$a/idHomeTeam} 
      {$a/strAwayTeam}
      {$a/idAwayTeam} 
      {$a/strLeague} 
      {$a/intRound} 
      {$a/intHomeScore} 
      {$a/intAwayScore} 
      {$a/strHomeLineupGoalkeeper} 
      {$a/strHomeLineupDefense} 
      {$a/strHomeLineupMidfield} 
      {$a/strHomeLineupForward} 
      {$a/strHomeLineupSubstitutes} 
      {$a/strHomeGoalDetails} 
      {$a/strHomeRedCards} 
      {$a/strHomeYellowCards} 
      {$a/strAwayLineupGoalkeeper} 
      {$a/strAwayLineupDefense} 
      {$a/strAwayLineupMidfield} 
      {$a/strAwayLineupForward} 
      {$a/strAwayLineupSubstitutes} 
      {$a/strAwayGoalDetails} 
      {$a/strAwayRedCards} 
      {$a/strAwayYellowCards} 
   
 </elem>
return <root>{$res}</root>
};