<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/players">
    <html>
        <section class="plantel">
            <h1> Plantel</h1>

            <div class="plantel-box">
                <xsl:for-each select="player">
                    <div class="player">
                        <a><xsl:attribute name="href">/players/<xsl:value-of select="ID"/></xsl:attribute></a>
                        <img>
                            <xsl:attribute name="src">
                                <xsl:choose>
                                    <xsl:when test="PhotoUrl != ''">
                                        <xsl:value-of select="PhotoUrl"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        {{% static 'images/notfound.png' %}}
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                        </img>
                        <h1><xsl:value-of select="ClubPosition"/></h1>
                        <h1><xsl:value-of select="Name"/></h1>
                    </div>
                </xsl:for-each>
            </div>
        </section>
    </html>
</xsl:template>
</xsl:stylesheet>