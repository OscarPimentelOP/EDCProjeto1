declare %updating function local:InsertMatch($matchID,$league, $season, $homeTeam, $awayTeam, $date, $stadium) 
{
  
let $coll2 := collection('dataset')//matches

return insert node element match { 
  element  idEvent {$matchID},
  element strLeague {$league},
  element strSeason {$season},
  element strHomeTeam {$homeTeam},
  element strAwayTeam {$awayTeam},
  element dateEvent {$date},
  element strVenue{$stadium}
}   as last into $coll2[1]
};

local:InsertMatch("999999999", "English Premier League", "2050-2051'", "Porto", "Benfica", "2050-07-22", "Estadio do Dragao")