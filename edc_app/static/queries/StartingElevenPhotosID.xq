
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
  tokenize($elemToToken,"; ") 
};

declare function local:Eleven($season, $comp, $matchID) {
  let $coll3 := collection('dataset')//players
  let $b :=  local:MatchInfo($season, $comp, $matchID)
 let $d := for $c in $b/elem
 return $c

let $homeGK := 
local:Tokens($d/strHomeLineupGoalkeeper/text() ) 
let $hGK :=  for $t in $homeGK return <elem>{$t}</elem>

let $homeDefense := 
local:Tokens($d/strHomeLineupDefense/text() ) 
let $hD :=  for $t in $homeDefense return <elem>{$t}</elem>

let $homeMidfield := 
local:Tokens($d/strHomeLineupMidfield/text() ) 
let $hM :=  for $t in $homeMidfield return <elem>{$t}</elem>

let $homeForward := 
local:Tokens($d/strHomeLineupForward/text() ) 
let $hF :=  for $t in $homeForward return <elem>{$t}</elem>

let $homeSubs := 
local:Tokens($d/strHomeLineupSubstitutes/text() ) 
let $hS :=  for $t in $homeSubs return <elem>{$t}</elem>

let $awayGK := 
local:Tokens($d/strAwayLineupGoalkeeper/text() ) 
let $aGK :=  for $t in $awayGK return <elem>{$t}</elem>

let $awayDefense := 
local:Tokens($d/strAwayLineupDefense/text() ) 
let $aD :=  for $t in $awayDefense return <elem>{$t}</elem>

let $awayMidfield := 
local:Tokens($d/strAwayLineupMidfield/text() ) 
let $aM :=  for $t in $awayMidfield return <elem>{$t}</elem>

let $awayForward := 
local:Tokens($d/strAwayLineupForward/text() ) 
let $aF :=  for $t in $awayForward return <elem>{$t}</elem>

let $awaySubs := 
local:Tokens($d/strAwayLineupSubstitutes/text() ) 
let $aS :=  for $t in $awaySubs return <elem>{$t}</elem>

return <elem>
<homeGK>{$hGK}</homeGK>
<homeDef>{$hD}</homeDef>
<homeMid>{$hM}</homeMid>
<homeFW>{$hF}</homeFW>
<homeSub>{$hS}</homeSub>
<awayGK>{$aGK}</awayGK>
<awayDef>{$aD}</awayDef>
<awayMid>{$aM}</awayMid>
<awayFW>{$aF}</awayFW>
<awaySub>{$aS}</awaySub>
</elem>
};


declare function local:PlayersPhotos($season, $comp, $matchID) {
  let $b :=  local:Eleven($season, $comp, $matchID)
  let $coll3 := collection('dataset')//players
  
  for $elem in $b//elem 
     for $p in $coll3/player 
       return if(contains($p/FullName,$elem) ) then 
         <player>{$p/PhotoUrl}</player>
         

  

};

<eleven>{local:Eleven("2019-2020", "4328", "602129")}</eleven>