declare function local:MatchInfo($matchID) as element()*
{
let $coll3 := collection('dataset')//matches
let  $res :=
for $a in $coll3/match[(idEvent = $matchID ) ]
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
  let $tokens := tokenize($elemToToken,"; ")  
  for $t in $tokens
  return replace($t, ';', '')
};

declare function local:Eleven($matchID) {
  let $coll3 := collection('dataset')//players
  let $b :=  local:MatchInfo($matchID)
 let $d := for $c in $b/elem
 return $c

let $homeGK := 
local:Tokens($d/strHomeLineupGoalkeeper/text() ) 
let $hGK :=  for $t in $homeGK return <elem>
<name>{$t} </name>
<pos>homeGK</pos>
</elem>

let $homeDefense := 
local:Tokens($d/strHomeLineupDefense/text() ) 
let $hD :=  for $t in $homeDefense return <elem><name>{$t} </name>
<pos>homeDef</pos></elem>

let $homeMidfield := 
local:Tokens($d/strHomeLineupMidfield/text() ) 
let $hM :=  for $t in $homeMidfield return <elem><name>{$t} </name>
<pos>homeMid</pos></elem>

let $homeForward := 
local:Tokens($d/strHomeLineupForward/text() ) 
let $hF :=  for $t in $homeForward return <elem><name>{$t} </name>
<pos>homeFW</pos></elem>

let $homeSubs := 
local:Tokens($d/strHomeLineupSubstitutes/text() ) 
let $hS :=  for $t in $homeSubs return <elem><name>{$t} </name>
<pos>homeSub</pos></elem>

let $awayGK := 
local:Tokens($d/strAwayLineupGoalkeeper/text() ) 
let $aGK :=  for $t in $awayGK return <elem><name>{$t} </name>
<pos>awayGK</pos></elem>

let $awayDefense := 
local:Tokens($d/strAwayLineupDefense/text() ) 
let $aD :=  for $t in $awayDefense return <elem><name>{$t} </name>
<pos>awayDef</pos></elem>

let $awayMidfield := 
local:Tokens($d/strAwayLineupMidfield/text() ) 
let $aM :=  for $t in $awayMidfield return <elem><name>{$t} </name>
<pos>awayMid</pos></elem>

let $awayForward := 
local:Tokens($d/strAwayLineupForward/text() ) 
let $aF :=  for $t in $awayForward return <elem><name>{$t} </name>
<pos>awayFW</pos></elem>

let $awaySubs := 
local:Tokens($d/strAwayLineupSubstitutes/text() ) 
let $aS :=  for $t in $awaySubs return <elem><name>{$t} </name>
<pos>awaySub</pos></elem>

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

declare function local:PlayersPhotos($matchID) {
  let $b :=  local:Eleven($matchID)
  let $coll3 := collection('dataset')//players
  let $coll2 := collection('dataset')//matches
  let $match := $coll2/match[idEvent = $matchID] 
                                                                                            
  for $elem in $b//elem
     for $p in $coll3/player 
       return if(matches($p/FullName,replace($elem/name, " ", "|")) and (($p/idTeam = $match/idHomeTeam)  or ($p/idTeam = $match/idAwayTeam)) ) then 
         <player>
         {$p/FullName}
         {$elem/pos}
         {$p/PhotoUrl}</player>
};

<eleven>{local:PlayersPhotos( "609285")}</eleven>