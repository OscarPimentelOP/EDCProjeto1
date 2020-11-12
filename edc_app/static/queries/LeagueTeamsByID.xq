(: This query returns the basic info for all teams :) 

declare function local:LeagueTeamsByID($comp) as element()*
{
let $coll3 := collection('dataset')//teams
let  $res :=
for $a in $coll3/team[(idLeague = $comp)]
return
<team>
      {$a/idTeam} 
      {$a/strTeam} 
      {$a/strLeague} 
      {$a/strTeamBadge} 
 </team>
return $res
};

