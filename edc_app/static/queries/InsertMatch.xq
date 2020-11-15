declare function local:InsertMatch($league, $season, $homeTeam, $awayTeam, $date, $stadium) as element()*
{
let $coll2 := collection('dataset')//matches
return(
insert node element match { 
  element strLeague {"AAAA"},
  element strSeason {"AAAA"},
  element strHomeTeam {"AAAA"},
  element strAwayTeam {"AAAA"},
  element dateEvent {"AAAA"},
  element strVenue{"AAAA"}
}   as last into $coll2[1])
};