declare function local:addTeamBadge($match) as element()*
{  
copy $toCP := $match
modify(
  for $match in $toCP/match
  let $teams := collection('dataset')//teams
  let $idHome := $match/idHomeTeam
  let $idAway := $match/idAwayTeam
  let $homeTeam := $teams/team[idTeam = $idHome]
  let $awayTeam := $teams/team[idTeam = $idAway]
  return insert nodes (<strHomeBadge>{$homeTeam/strTeamBadge/text()}</strHomeBadge>, <strAwayBadge>{$awayTeam/strTeamBadge/text()}</strAwayBadge>) as last into $match
)
return $toCP
};

declare function local:getMatches($league) as element()*
{
<matches>{
let $coll2 := collection('dataset')//matches
for $a in $coll2
let $b :=  local:addTeamBadge($a)
for $c in $b//match[idLeague = $league]
return $c
}</matches>  
};

