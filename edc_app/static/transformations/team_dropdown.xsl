<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/teams">
    <html>
        <div class="team-selector" id="away">
            <xsl:for-each select="team">
                <label class="team">
                    <xsl:attribute name="id">
                        <xsl:value-of select="idTeam"/>
                    </xsl:attribute>
                    <img alt="">
                        <xsl:attribute name="src">
                            <xsl:value-of select="strTeamBadge"/>
                        </xsl:attribute>
                    </img>
                    <span><xsl:value-of select="strTeam"/></span>
                </label>
            </xsl:for-each>
        </div>
    </html>
</xsl:template>

</xsl:stylesheet>