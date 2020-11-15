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
                    <h3> liga </h3>
                    <p><xsl:value-of select="strLeague"/></p>
                    <h3> data de fundação </h3>
                    <p> <xsl:value-of select="intFormedYear"/> </p>
                    <!-- divisão -->
                    <h3> nome do estadio </h3>
                    <p><xsl:value-of select="strStadium"/></p>
                    <h3> alcunhas </h3>
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
                            <xsl:value-of select="strWebsite"/>
                        </xsl:attribute>
                        website
                    </a>
                </div>
                <p class="description">
                    <xsl:value-of select="strDescriptionEn"/>
                </p>
            </div>
        </section>

        <section class="equipment-plantel">
            <div class="equipment">

                <!-- Could be more than 1 image -->

                <img src="https://www.thesportsdb.com/images/media/team/jersey/yqsyrr1474198169.png" alt=""/>

            </div>
            <div class="plantel">
                <!-- ainda estou a pensar como fazer.
                    O ideal seria colocar lista com os cartões tal como está na pagina "PLayers" -->
            </div>

        </section>

        <section class="calendar" style="visibility: hidden;">

            <!-- igual à pagina de matches mas horizontal -->

        </section>

        <section class="team-extra" style="visibility: hidden;">
            <!-- no idea for now -->
        </section>
    </html>
</xsl:template>
</xsl:stylesheet>