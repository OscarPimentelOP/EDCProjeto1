declare %updating function local:InsertMatch($matchID,$league, $season, $homeTeam, $awayTeam, $date, $stadium, $round) 
{
  
let $coll2 := collection('dataset')//matches
let $coll3 := collection('dataset')//teams
let $coll4 := collection('dataset')//leagues

 let $teamHome :=  for $t in $coll3/team[idTeam = $homeTeam] return $t/strTeam
 
 let $teamAway:=  for $t in $coll3/team[idTeam = $awayTeam] return $t/strTeam
 let  $newLeagueName := for $l in $coll4/league[leagueid= $league]  return $l/leaguename

return insert node element match { 
  element  idEvent {$matchID},
  element idLeague {$league},
  element strLeague {$newLeagueName/text()},
  element strSeason {$season},
  element strHomeTeam {$teamHome/text()},
  element strAwayTeam {$teamAway/text()},
  element intRound{$round},
  element dateEvent {$date},
  element idHomeTeam {$homeTeam},
  element idAwayTeam {$awayTeam},
  element strVenue{$stadium}
}   as last into $coll2[1]
};

