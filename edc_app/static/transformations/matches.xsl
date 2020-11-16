<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/matches">
    <html>
        <div class="matches">
            <xsl:for-each select="match[position()&lt;=1000]">
                <div class="match-box">
                    <h1 id="league">
                        <xsl:value-of select="strLeague"/>
                        <!-- League -->
                    </h1>
                    <div class="home-team">
                        <h1 id="name"><xsl:value-of select="strHomeTeam"/></h1>
                        <a id="home">
                            <xsl:if test="strHomeBadge != ''">
                                <xsl:attribute name="href">
                                    /teams/<xsl:value-of select="idHomeTeam"/>
                                </xsl:attribute>
                            </xsl:if>
                        </a>
                        <img alt="">
                            <xsl:attribute name="src">
                                <xsl:value-of select="strHomeBadge"/>
                            </xsl:attribute>
                        </img>
                        <!-- team logo -->
                        <h1 id="score">
                            <xsl:choose>
                                <xsl:when test="intHomeScore != ''">
                                    <xsl:value-of select="intHomeScore"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    0
                                </xsl:otherwise>
                            </xsl:choose>
                            <!-- score -->
                        </h1>
                    </div>
                    <div class="away-team">
                        <h1 id="name"><xsl:value-of select="strAwayTeam"/></h1>
                        <a id="away">
                            <xsl:if test="strAwayBadge != ''">
                                <xsl:attribute name="href">
                                    /teams/<xsl:value-of select="idAwayTeam"/>
                                </xsl:attribute>
                            </xsl:if>
                        </a>
                        <img src="https://www.thesportsdb.com/images/media/team/badge/uqtwxx1448813449.png" alt="">
                            <xsl:attribute name="src">
                                <xsl:value-of select="strAwayBadge"/>
                            </xsl:attribute>
                        </img>
                        <!-- team logo -->
                        <h1 id="score">
                            <xsl:choose>
                                <xsl:when test="intAwayScore != ''">
                                    <xsl:value-of select="intAwayScore"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    0
                                </xsl:otherwise>
                            </xsl:choose>
                            <!-- score -->
                        </h1>
                    </div>
                    <h1 id="date">
                        <xsl:value-of select="dateEvent"/>
                        <!-- date -->
                    </h1>
                </div>
            </xsl:for-each>
        </div>
    </html>
</xsl:template>

</xsl:stylesheet>