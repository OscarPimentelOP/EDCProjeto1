declare function local:addTeamBadge($match) as element()*
{  
copy $toCP := $match
modify(
  for $match in $toCP
  let $teams := collection('dataset')//teams
  let $idHome := $match/idHomeTeam
  let $idAway := $match/idAwayTeam
  let $homeTeam := $teams/team[idTeam = $idHome]
  let $awayTeam := $teams/team[idTeam = $idAway]
  return insert nodes (<strHomeBadge>{$homeTeam/strTeamBadge/text()}</strHomeBadge>, <strAwayBadge>{$awayTeam/strTeamBadge/text()}</strAwayBadge>) as last into $match
)
return $toCP
};

declare function local:GetMatchById($id) as element()*
{
let $coll2 := collection('dataset')//matches
for $a in $coll2/match[(idEvent = $id )]
let $b :=  local:addTeamBadge($a)
return $b
};
<elem>
{local:GetMatchById("60235")}
</elem>