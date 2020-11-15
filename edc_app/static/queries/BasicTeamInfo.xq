(: This query returns the basic info of a team :) 
declare function local:TeamInfo($team) as element()*
{
let $coll1 := collection('dataset')//teams
for $a in $coll1/team[idTeam = $team]  
return
  <team>
  {$a/idTeam} 
  {$a/strTeam} 
    {$a/strTeamBadge} 
     {$a/strTeamJersey} 
      {$a/intFormedYear} 
      {$a/strLeague} 
    {$a/strStadium} 
   {$a/strDescriptionEN} 
     {$a/strWebsite}
  </team>
};