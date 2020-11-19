<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/events">
    <html>
        <!-- Home Team -->
    <ul class="team-info">

        <xsl:for-each select="home/homeGoals/elem">
            <xsl:if test="text() != ''">
                <li class="info">
                    <p>
                        <xsl:value-of select="text()"></xsl:value-of>;
                    </p>
                    <i class="fas fa-futbol"></i>
                </li>
            </xsl:if>
        </xsl:for-each>
        <xsl:for-each select="home/homeYellowCards/elem">
            <xsl:if test="text() != ''">
                <li class="info">
                    <p>
                        <xsl:value-of select="text()"></xsl:value-of>
                    </p>
                    <img src="https://img.icons8.com/color/64/000000/soccer-yellow-card.png" />
                </li>
            </xsl:if>
        </xsl:for-each>
        <xsl:for-each select="home/homeRedCards/elem">
            <xsl:if test="text() != ''">
                <li class="info">
                    <p>
                        <xsl:value-of select="text()"></xsl:value-of>
                    </p>
                    <img src="https://img.icons8.com/color/64/000000/foul.png" />
                </li>
            </xsl:if>
        </xsl:for-each>
    </ul>

    <!-- Away Team -->
    <ul class="team-info">
        <xsl:for-each select="away/awayGoals/elem">
            <xsl:if test="text() != ''">
                <li class="info">
                    <p>
                        <xsl:value-of select="text()"></xsl:value-of>;
                    </p>
                    <i class="fas fa-futbol"></i>
                </li>
            </xsl:if>
        </xsl:for-each>
        <xsl:for-each select="away/awayYellowCards/elem">
            <xsl:if test="text() != ''">
                <li class="info">
                    <p>
                        <xsl:value-of select="text()"></xsl:value-of>
                    </p>
                    <img src="https://img.icons8.com/color/64/000000/soccer-yellow-card.png" />
                </li>
            </xsl:if>
        </xsl:for-each>
        <xsl:for-each select="away/awayRedCards/elem">
            <xsl:if test="text() != ''">
                <li class="info">
                    <p>
                        <xsl:value-of select="text()"></xsl:value-of>
                    </p>
                    <img src="https://img.icons8.com/color/64/000000/foul.png" />
                </li>
            </xsl:if>
        </xsl:for-each>
    </ul>
    </html>
</xsl:template>


</xsl:stylesheet>