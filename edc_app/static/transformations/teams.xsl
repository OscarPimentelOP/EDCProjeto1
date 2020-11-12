<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/teams">
    <html>
        <div class="team-group">
            <xsl:for-each select="team[position()&lt;=99]">
                <div class="teambox">
                    <div class="imagebox">
                        <img src="https://www.thesportsdb.com/images/media/team/badge/a1af2i1557005128.png">
                            <xsl:attribute name="src">
                                <xsl:value-of select="strTeamBadge"/>
                            </xsl:attribute>
                        </img>
                    </div>
                    <div class="team-info">
                        <span>Club</span>
                        <h1><xsl:value-of select="strTeam"/></h1>
                        <span>league</span>
                        <h1><xsl:value-of select="strLeague"/></h1>
                        <a>
                            <xsl:attribute name="href">
                                /teams/<xsl:value-of select="idTeam"/>
                            </xsl:attribute>
                            <i class="fas fa-plus"></i>
                        </a>
                    </div>
                </div>
            </xsl:for-each>
        </div>
    </html>
</xsl:template>
</xsl:stylesheet>