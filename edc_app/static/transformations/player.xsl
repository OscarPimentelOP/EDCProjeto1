<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
    <html>
        <body>
            <div class="wrapper">
                <div class="cardbox">
                    <h4><xsl:value-of select="player/Name"/></h4>
                    <div class="picture">
                        <a>
                            <xsl:attribute name="href">
                                /teams/<xsl:value-of select="player/idTeam"/>
                            </xsl:attribute>
                            <img class="icon" src="{player/TeamBadge}">
                                   <xsl:attribute name="alt">
                                        <xsl:value-of select="player/Club"/>
                                   </xsl:attribute>
                                    <xsl:attribute name="title">
                                        <xsl:value-of select="player/Club"/>
                                   </xsl:attribute>
                            </img>
                        </a>
                        <img class="player_pic" src="{player/PhotoUrl}" alt=""/>
                    </div>
                </div>
                <div class="info">
                    <div class="info-row personel">
                        <div class="data name">
                            <h4>Full Name</h4>
                            <p><xsl:value-of select="player/FullName"/></p>
                        </div>
                        <div class="data national">
                            <h4>Nationality</h4>
                            <p><xsl:value-of select="player/Nationality"/></p>
                        </div>
                        <div class="data fisico">
                            <h4>Age</h4>
                            <p><xsl:value-of select="player/Age"/></p>
                        </div>
                        <div class="data fisico">
                            <h4>Height</h4>
                            <p><xsl:value-of select="player/Height"/></p>
                        </div>
                        <div class="data fisico">
                            <h4>Weight</h4>
                            <p><xsl:value-of select="player/Weight"/></p>
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="data">
                            <h4>Club Position</h4>
                            <xsl:choose>
                                <xsl:when test="player/ClubPositionTranslated != 'N/D' and player/ClubPositionTranslated != 'Reserved'">
                                    <a>
                                        <xsl:attribute name="href">
                                            /players?pos=<xsl:value-of select="player/ClubPosition"/>
                                        </xsl:attribute>
                                        <p><xsl:value-of select="player/ClubPositionTranslated"/></p>
                                    </a>
                                </xsl:when>
                                <xsl:otherwise>
                                    <p><xsl:value-of select="player/ClubPositionTranslated"/></p>
                                </xsl:otherwise>
                            </xsl:choose>
                        </div>
                        <div class="data">
                            <h4>Club Number</h4>
                            <p><xsl:value-of select="player/ClubNumber"/></p>
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="data">
                            <h4>National Team</h4>
                            <p><xsl:value-of select="player/NationalTeam"/></p>
                        </div>
                        <div class="data">
                            <h4>National Position</h4>
                            <xsl:choose>
                                <xsl:when test="player/NationalPositionTranslated != 'N/D' and player/NationalPositionTranslated != 'Reserved'">
                                    <a>
                                        <xsl:attribute name="href">
                                            /players?pos=<xsl:value-of select="player/NationalPosition"/>
                                        </xsl:attribute>
                                        <p><xsl:value-of select="player/NationalPositionTranslated"/></p>
                                    </a>
                                </xsl:when>
                                <xsl:otherwise>
                                    <p><xsl:value-of select="player/NationalPositionTranslated"/></p>
                                </xsl:otherwise>
                            </xsl:choose>
                        </div>
                        <div class="data">
                            <h4>National Number</h4>
                            <p><xsl:value-of select="player/NationalNumber"/></p>
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="data">
                            <h4>Value</h4>
                            <p><xsl:value-of select="player/ValueEUR"/>€</p>
                        </div>
                        <div class="data">
                            <h4>Wage</h4>
                            <p><xsl:value-of select="player/WageEUR"/>€</p>
                        </div>
                    </div>
                </div>
            </div>
        </body>
    </html>
</xsl:template>

</xsl:stylesheet>