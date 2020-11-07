declare function local:RoundResults($comp, $round) as element()*
{
let $coll3 := collection('dataset')//matches
for $a in $coll3/match[(strLeague = $comp) and (intRound  = $round) ]
return
  <elem>
      {$a/strEvent/text()} ({$a/intHomeScore/text()}- {$a/intAwayScore/text()}) </elem>
};

