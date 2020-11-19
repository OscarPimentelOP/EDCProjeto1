<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/team">
    <html>
        <section class="info-team">
            <xsl:attribute name="style">
                --team-stadium: url('<xsl:value-of select="strStadiumThumb"/>');
            </xsl:attribute>
            <div class="team-base-info">
                <img alt="">
                    <xsl:attribute name="src">
                        <xsl:value-of select="strTeamBadge"/>
                    </xsl:attribute>
                </img>
                <h1 class="team-name">
                    <xsl:value-of select="strTeam"/>
                </h1>
                <div class="base-info">
                    <h3> League </h3>
                    <p>
                        <a>
                            <xsl:attribute name="href">
                                /teams?league=<xsl:value-of select="idLeague"/>
                            </xsl:attribute>
                            <xsl:value-of select="strLeague"/>
                        </a>
                    </p>
                    <h3> Date of Fundation </h3>
                    <p> <xsl:value-of select="intFormedYear"/> </p>
                    <!-- divisão -->
                    <h3> Stadium </h3>
                    <p><xsl:value-of select="strStadium"/></p>
                    <h3> Alternativa Name </h3>
                    <xsl:choose>
                        <xsl:when test="strAlternate != ''">
                            <p> <xsl:value-of select="strAlternate"/> </p>
                        </xsl:when>
                        <xsl:otherwise>
                            <p>N/A</p>
                        </xsl:otherwise>
                    </xsl:choose>
                    <a>
                        <xsl:attribute name="href">
                            https:/<xsl:value-of select="strWebsite"/>
                        </xsl:attribute>
                        website
                    </a>
                </div>
                <p class="description">
                    <xsl:value-of select="strDescriptionEN"/>
                </p>
            </div>
        </section>

        <section class="equipment-plantel">
          <div class="equipment">

              <h1> Equipment </h1>

              <div class="eq-img">
                  <img  alt="">
                      <xsl:attribute name="src">
                          <xsl:value-of select="strTeamJersey"/>
                      </xsl:attribute>
                  </img>
              </div>
              
          </div>
          <div class="team-extra">
            <h1>Statistics</h1>
            <div class="group" id="Casa">
              <h3>Goals Scored at Home: <xsl:value-of select="homeGoals/HomeScored"/></h3>
              <i class="fas fa-futbol"></i>
              <h3>Goals Conceded at Home: <xsl:value-of select="homeGoals/HomeConceded"/></h3>
              <img src="https://img.icons8.com/officel/32/000000/soccer-goal.png"/>
              <h3>Home Victories: <xsl:value-of select="HomeWins"/></h3>
              <h3>Home Defeats: <xsl:value-of select="HomeLoss"/></h3>
            </div> 
            <div class="group">
              <h3>Goals Scored Away: <xsl:value-of select="awayGoals/AwayScored"/></h3>
              <i class="fas fa-futbol"></i>
              <h3>Goals Conceded Away: <xsl:value-of select="awayGoals/AwayConceded"/></h3>
              <img src="https://img.icons8.com/officel/32/000000/soccer-goal.png"/>
              <h3>Away Victories: <xsl:value-of select="AwayWins"/></h3>
              <h3>Away Defeats: <xsl:value-of select="AwayLoss"/></h3>
            </div>
            <h3>Draws: <xsl:value-of select="Draws"/></h3>
            <h3>Most used player: <xsl:value-of select="mostUsed"/></h3>
            <h3>Best player: <xsl:value-of select="bestPlayers/player[position()=1]/Name"/></h3>
          </div>
      </section>
    </html>
</xsl:template>
</xsl:stylesheet>