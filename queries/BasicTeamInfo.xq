(: This query returns the basic info of a team :) 
<root>{
let $coll1 := collection('dataset')//teams
let $club := "FC Porto"  
for $a in $coll1/team[strTeam = $club]  
return
  <elem>
  {$a/strTeam} 
    {$a/strTeamBadge} 
     {$a/strTeamJersey} 
    {$a/strStadium} 
     {$a/strStadiumDescription} 
     {$a/strFacebook}
  </elem>
}</root>