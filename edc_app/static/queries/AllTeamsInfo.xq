(: This query returns the basic info for all teams :) 

declare function local:AllTeamsInfo() as element()*
{
let $coll3 := collection('dataset')//teams
let  $res :=
for $a in $coll3/team
return
<elem>
      {$a/idTeam} 
      {$a/strTeam} 
      {$a/strLeague} 
      {$a/strTeamBadge} 
 </elem>
return <root>{$res}</root>
};

<players>
  {local:AllTeamsInfo()}
</players>