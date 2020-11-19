(: This query returns all matches and results where a team has won playin away :) 

declare function local:AwayWins($season, $comp, $team) 
{
let $coll3 := collection('dataset')//matches
let $wins :=
for $a in $coll3/match[($season = strSeason) and (idLeague = $comp) and (idAwayTeam = $team) ]
where $a/intAwayScore > $a/intHomeScore
return
  <elem>
       {$a/idEvent} 
      {$a/strEvent} 
      {$a/intHomeScore}
      {$a/intAwayScore} 
      </elem>
  
return count($wins)      
};


