declare function local:InsertMatch($league, $season, $homeTeam, $awayTeam, $date, $stadium) as element()*
{
let $coll2 := collection('dataset')//matches
return(
insert node element match { 
  element strLeague {$league},
  element strSeason {$season},
  element strHomeTeam {$homeTeam},
  element strAwayTeam {$awayTeam},
  element dateEvent {$date},
  element strVenue{$stadium}
}   as last into $coll2[1])
};