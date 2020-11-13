(: This query returns the calendar for a competition :) 

declare function local:ListCalendar($comp, $season) as element()*{
let $coll2 := collection('dataset')//matches
for $a in $coll2/match[(idLeague = $comp) and (strSeason = $season)]
return
  <match>
     {$a/intRound} 
    {$a/strHomeTeam} 
    {$a/strAwayTeam} 
    {$a/intHomeScore} 
    {$a/intAwayScore} 
    
  </match>
};

<calendar>
  {local:ListCalendar("4328", "2020-2021")}
</calendar>