
declare function local:MatchInfo($matchID) as element()*
{
let $coll3 := collection('dataset')//matches
let  $res :=
for $a in $coll3/match[(idEvent = $matchID ) ]
return
<elem>     
      {$a/strHomeGoalDetails}
      {$a/strHomeYellowCards} 
      {$a/strHomeRedCards}       
      {$a/strAwayGoalDetails}
      {$a/strAwayYellowCards} 
      {$a/strAwayRedCards} 
      
 </elem>
return <root>{$res}</root>
};

declare function local:Tokens($elemToToken){
  let $tokens := tokenize($elemToToken,";")  
  for $t in $tokens
  return replace($t, ';', '')
};

declare function local:MatchEvents($matchID) {
  let $coll3 := collection('dataset')//players
  let $b :=  local:MatchInfo($matchID)
 let $d := for $c in $b/elem
 return $c

let $homeGoals := 
local:Tokens($d/strHomeGoalDetails/text() ) 
let $hGls :=  for $t in $homeGoals return <elem>{$t}</elem>

let $homeYC := 
local:Tokens($d/strHomeYellowCards/text() ) 
let $hYC :=  for $t in $homeYC return <elem>{$t}</elem>

let $homeRC := 
local:Tokens($d/strHomeRedCards/text() ) 
let $hRC :=  for $t in $homeRC return <elem>{$t}</elem>

let $awayGoals := 
local:Tokens($d/strAwayGoalDetails/text() ) 
let $aGls :=  for $t in $awayGoals return <elem>{$t}</elem>

let $awayYC := 
local:Tokens($d/strAwayYellowCards/text() ) 
let $aYC :=  for $t in $awayYC return <elem>{$t}</elem>

let $awayRC  := 
local:Tokens($d/strAwayRedCards/text() ) 
let $aRC :=  for $t in $awayRC return <elem>{$t}</elem>


return 
<events> 
<home>
<homeGoals>{$hGls}</homeGoals>
<homeYellowCards>{$hYC}</homeYellowCards>
<homeRedCards>{$hRC}</homeRedCards>
</home>
<away>
<awayGoals>{$aGls}</awayGoals>
<awayYellowCards>{$aYC}</awayYellowCards>
<awayRedCards>{$aRC}</awayRedCards>
</away>
</events>
};

