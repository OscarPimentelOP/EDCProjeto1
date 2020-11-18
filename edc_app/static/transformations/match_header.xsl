<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/match" name="match_header">
        <div class="home-team">

            <a href="">
                <xsl:attribute name="href">
                    /teams/<xsl:value-of select="idHomeTeam"/>
                </xsl:attribute>
                <img alt="">
                    <xsl:attribute name="src">
                        <xsl:value-of select="strHomeBadge"/>
                    </xsl:attribute>
                </img>
            </a>

            <h1>
                <xsl:value-of select="strHomeTeam"/>
            </h1>

            <h1 id="score">
                <xsl:value-of select="intHomeScore"/>
            </h1>

            <button id="home-team">Chose Team</button>

        </div>

        <div class="away-team">

            <a href="">
                <xsl:attribute name="href">
                    /teams/<xsl:value-of select="idAwayTeam"/>
                </xsl:attribute>
                <img alt="">
                    <xsl:attribute name="src">
                        <xsl:value-of select="strAwayBadge"/>
                    </xsl:attribute>
                </img>
            </a>

            <h1>
                <xsl:value-of select="strAwayTeam"/>
            </h1>

            <h1 id="score">
                <xsl:value-of select="intAwayScore"/>
            </h1>

            <button id="away-team">Chose Team</button>

        </div>
</xsl:template>

</xsl:stylesheet>