declare function local:RoundResults($season, $comp, $round) as element()*
{
let $coll3 := collection('dataset')//matches
for $a in $coll3/match[($season = strSeason) and (idLeague = $comp) and (intRound  = $round) ]
return
  <elem>
      {$a/strEvent} 
      {$a/intHomeScore}
      {$a/intAwayScore} </elem>
};

