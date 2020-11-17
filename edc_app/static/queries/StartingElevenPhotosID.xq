
declare function local:MatchInfo($season, $comp, $matchID) as element()*
{
let $coll3 := collection('dataset')//matches
let  $res :=
for $a in $coll3/match[($season = strSeason) and (idLeague = $comp) and (idEvent = $matchID ) ]
return
<elem>     
      {$a/strHomeLineupGoalkeeper}
      {$a/strHomeLineupDefense} 
      {$a/strHomeLineupMidfield} 
      {$a/strHomeLineupForward} 
      {$a/strHomeLineupSubstitutes} 

 
      {$a/strAwayLineupGoalkeeper} 
      {$a/strAwayLineupDefense} 
      {$a/strAwayLineupMidfield} 
      {$a/strAwayLineupForward} 
      {$a/strAwayLineupSubstitutes}    
   
 </elem>
return <root>{$res}</root>
};

declare function local:Tokens($elemToToken){
  tokenize($elemToToken, ";" ) 
};

declare function local:ElevenPhotos($season, $comp, $matchID) {
  let $coll3 := collection('dataset')//players
  let $b :=  local:MatchInfo($season, $comp, $matchID)
 let $d := for $c in $b/elem
  return $c



let $homeGK := 
 local:Tokens($d/strHomeLineupGoalkeeper/text() ) 
ret

return <elem><homeGK>{$homeGK}</homeGK>
<homeDef> $homeDefense</homeDef>
</elem>

};





<eleven>{local:ElevenPhotos("2019-2020", "4328", "602129")}</eleven>