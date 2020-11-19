(: This query returns home scored and conceded goals :) 

declare function local:HomeGoals($season, $comp, $team) 
{
let $coll3 := collection('dataset')//matches
let $scoredGoals := 
for $a in $coll3/match[($season = strSeason) and (idLeague = $comp) and (idHomeTeam = $team) ]
return
  $a/intHomeScore
  
let $concededGoals := 
for $a in $coll3/match[($season = strSeason) and (idLeague = $comp) and (idHomeTeam = $team) ]
return
  $a/intAwayScore  

return <homeGoals>
<HomeScored>{sum($scoredGoals)} </HomeScored>
<HomeConceded>{sum($concededGoals)} </HomeConceded>
</homeGoals>

};

