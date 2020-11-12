<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/players">
    <html>
        <div class="group">
            <xsl:for-each select="player[position()&lt;=100]">
                <div class="cardbox">
                    <a>
                        <xsl:attribute name="href">
                            /players/<xsl:value-of select="ID"/>
                        </xsl:attribute>
                    </a>
                    <div class="front">
                        <img alt="">
                            <xsl:attribute name="src">
                                <xsl:value-of select="PhotoUrl"/>
                            </xsl:attribute>
                        </img>
                        <h1><xsl:value-of select="Name"/></h1>
                    </div>
                    <div class="back">
                        <div class="back-content">
                            <span>Nationality</span>
                            <h1><xsl:value-of select="Nationality"/></h1>
                            <span>Club</span>
                            <h1><xsl:value-of select="Club"/></h1>
                        </div>
                    </div>
                </div>
            </xsl:for-each>
        </div>
    </html>
</xsl:template>
</xsl:stylesheet>