(: This query returns all the teams which participate in the English Premier League :) 
<root>{
let $coll := collection('dataset')//teams
let $comp := "English Premier League"  
for $a in $coll/team [strLeague = $comp or strLeague2 = $comp or strLeague3 = $comp or strLeague4 = $comp or strLeague5 = $comp or strLeague6 = $comp or strLeague7 = $comp] 
return
  <elem>
    {$a/strTeam/text()} 
  </elem>
}</root>