<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/players">
    <html>
        <div class="home-lineup">

            <h1>LineUp</h1>

            <div class="box">
                <xsl:for-each select="player[pos='homeGK']">
                    <div class="player" id="goalkeeper">
                        <img alt="">
                            <xsl:attribute name="src">
                                <xsl:value-of select="PhotoUrl"/>
                            </xsl:attribute>
                        </img>
                        <p>Goalkeeper</p>
                        <a>
                            <xsl:attribute name="href">/players/<xsl:value-of select="ID"/></xsl:attribute>
                        </a>
                    </div>
                </xsl:for-each>
                <ul class="group">
                    <xsl:for-each select="player[pos='homeDef']">
                    <li class="player" id="defense">
                        <img alt="">
                            <xsl:attribute name="src">
                                <xsl:value-of select="PhotoUrl"/>
                            </xsl:attribute>
                        </img>
                        <p>Defense</p>
                        <a>
                            <xsl:attribute name="href">/players/<xsl:value-of select="ID"/></xsl:attribute>
                        </a>
                    </li>
                    </xsl:for-each>
                </ul>
                <ul class="group">
                    <xsl:for-each select="player[pos='homeMid']">
                    <li class="player" id="midfield">
                        <img alt="">
                            <xsl:attribute name="src">
                                <xsl:value-of select="PhotoUrl"/>
                            </xsl:attribute>
                        </img>
                        <p>Midfield</p>
                        <a>
                            <xsl:attribute name="href">/players/<xsl:value-of select="ID"/></xsl:attribute>
                        </a>
                    </li>
                    </xsl:for-each>
                </ul>
                <ul class="group">
                    <xsl:for-each select="player[pos='homeFW']">
                    <li class="player" id="forward">
                        <img alt="">
                            <xsl:attribute name="src">
                                <xsl:value-of select="PhotoUrl"/>
                            </xsl:attribute>
                        </img>
                        <p>Forward</p>
                        <a>
                            <xsl:attribute name="href">/players/<xsl:value-of select="ID"/></xsl:attribute>
                        </a>
                    </li>
                    </xsl:for-each>
                </ul>

                <ul class="substitues">
                    <xsl:for-each select="player[pos='homeSub']">
                    <li class="player">
                        <img alt="">
                            <xsl:attribute name="src">
                                <xsl:value-of select="PhotoUrl"/>
                            </xsl:attribute>
                        </img>
                        <p>Substitute</p>
                        <a>
                            <xsl:attribute name="href">/players/<xsl:value-of select="ID"/></xsl:attribute>
                        </a>
                    </li>
                    </xsl:for-each>
                </ul>
            </div>

        </div>

        <div class="away-lineup">

            <h1>LineUp</h1>

            <div class="box">
                <xsl:for-each select="player[pos='awayGK']">
                    <div class="player" id="goalkeeper">
                        <img alt="">
                            <xsl:attribute name="src">
                                <xsl:value-of select="PhotoUrl"/>
                            </xsl:attribute>
                        </img>
                        <p>Goalkeeper</p>
                        <a>
                            <xsl:attribute name="href">/players/<xsl:value-of select="ID"/></xsl:attribute>
                        </a>
                    </div>
                </xsl:for-each>
                <ul class="group">
                    <xsl:for-each select="player[pos='awayDef']">
                    <li class="player" id="defense">
                        <img alt="">
                            <xsl:attribute name="src">
                                <xsl:value-of select="PhotoUrl"/>
                            </xsl:attribute>
                        </img>
                        <p>Defense</p>
                        <a>
                            <xsl:attribute name="href">/players/<xsl:value-of select="ID"/></xsl:attribute>
                        </a>
                    </li>
                    </xsl:for-each>
                </ul>
                <ul class="group">
                    <xsl:for-each select="player[pos='awayMid']">
                    <li class="player" id="midfield">
                        <img alt="">
                            <xsl:attribute name="src">
                                <xsl:value-of select="PhotoUrl"/>
                            </xsl:attribute>
                        </img>
                        <p>Midfield</p>
                        <a>
                            <xsl:attribute name="href">/players/<xsl:value-of select="ID"/></xsl:attribute>
                        </a>
                    </li>
                    </xsl:for-each>
                </ul>
                <ul class="group">
                    <xsl:for-each select="player[pos='awayFW']">
                    <li class="player" id="forward">
                        <img alt="">
                            <xsl:attribute name="src">
                                <xsl:value-of select="PhotoUrl"/>
                            </xsl:attribute>
                        </img>
                        <p>Forward</p>
                        <a>
                            <xsl:attribute name="href">/players/<xsl:value-of select="ID"/></xsl:attribute>
                        </a>
                    </li>
                    </xsl:for-each>
                </ul>

                <ul class="substitues">
                    <xsl:for-each select="player[pos='awaySub']">
                    <li class="player">
                        <img alt="">
                            <xsl:attribute name="src">
                                <xsl:value-of select="PhotoUrl"/>
                            </xsl:attribute>
                        </img>
                        <p>Substitute</p>
                        <a>
                            <xsl:attribute name="href">/players/<xsl:value-of select="ID"/></xsl:attribute>
                        </a>
                    </li>
                    </xsl:for-each>
                </ul>
            </div>

        </div>
    </html>
</xsl:template>

</xsl:stylesheet>