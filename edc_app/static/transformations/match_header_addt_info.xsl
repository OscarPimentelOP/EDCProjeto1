<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="match_header.xsl"/>
    <xsl:template match="/match">
        <xsl:call-template name="match_header"/>
        <div class="match-info">

            <h1>
                <xsl:value-of select="strLeague"/>
            </h1>

            <h1>
                Ronda <xsl:value-of select="intRound"/>
            </h1>

        </div>

        <h1 id="date">
            <xsl:value-of select="strDate"/>
        </h1>
    </xsl:template>
</xsl:stylesheet>