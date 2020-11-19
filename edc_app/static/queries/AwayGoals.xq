(: This query returns away scored and conceded goals :) 

declare function local:AwayGoals($season, $comp, $team) 
{
let $coll3 := collection('dataset')//matches
let $scoredGoals := 
for $a in $coll3/match[($season = strSeason) and (idLeague = $comp) and (idAwayTeam = $team) ]
return
  $a/intAwayScore
  
let $concededGoals := 
for $a in $coll3/match[($season = strSeason) and (idLeague = $comp) and (idAwayTeam = $team) ]
return
  $a/intHomeScore  

return <awayGoals>
<AwayScored>{sum($scoredGoals)} </AwayScored>
<AwayConceded>{sum($concededGoals)} </AwayConceded>
</awayGoals>

};

