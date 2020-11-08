<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/rss">
    <html>
        <body>
            <div class="slidershow">
                <div class="slides">
                    <input type="radio" name="r" id="r1" checked="true"/>
                    <input type="radio" name="r" id="r2"/>
                    <input type="radio" name="r" id="r3"/>
                    <div class="slide s1">
                        <img alt="">
                            <xsl:attribute name="src">
                             <xsl:value-of select="channel/item[position()=1]/enclosure/@url"/>
                            </xsl:attribute>
                        </img>
                        <h3>
                            <a>
                                <xsl:attribute name="href">
                                    <xsl:value-of select="channel/item[position()=1]/link"/>
                                </xsl:attribute>
                                <xsl:value-of select="channel/item[position()=1]/title"/>
                            </a>
                        </h3>
                        <p>
                            <xsl:value-of select="channel/item[position()=1]/description"/>
                        </p>
                        <div class="date">
                            <p>
                                <xsl:value-of select="channel/item[position()=1]/pubDate"/>
                            </p>
                            <a>
                                <xsl:attribute name="href">
                                    <xsl:value-of select="channel/link"/>
                                </xsl:attribute>
                                <xsl:value-of select="channel/title"/>
                            </a>
                        </div>
                    </div>
                    <div class="slide s2">
                        <img alt="">
                            <xsl:attribute name="src">
                             <xsl:value-of select="channel/item[position()=2]/enclosure/@url"/>
                            </xsl:attribute>
                        </img>
                        <h3>
                            <a>
                                <xsl:attribute name="href">
                                    <xsl:value-of select="channel/item[position()=2]/link"/>
                                </xsl:attribute>
                                <xsl:value-of select="channel/item[position()=2]/title"/>
                            </a>
                        </h3>
                        <p>
                            <xsl:value-of select="channel/item[position()=2]/description"/>
                        </p>
                        <div class="date">
                            <p>
                                <xsl:value-of select="channel/item[position()=2]/pubDate"/>
                            </p>
                            <a>
                                <xsl:attribute name="href">
                                    <xsl:value-of select="channel/link"/>
                                </xsl:attribute>
                                <xsl:value-of select="channel/title"/>
                            </a>
                        </div>
                    </div>
                    <div class="slide s3">
                        <img alt="">
                            <xsl:attribute name="src">
                             <xsl:value-of select="channel/item[position()=3]/enclosure/@url"/>
                            </xsl:attribute>
                        </img>
                        <h3>
                            <a>
                                <xsl:attribute name="href">
                                    <xsl:value-of select="channel/item[position()=3]/link"/>
                                </xsl:attribute>
                                <xsl:value-of select="channel/item[position()=3]/title"/>
                            </a>
                        </h3>
                        <p>
                            <xsl:value-of select="channel/item[position()=3]/description"/>
                        </p>
                        <div class="date">
                            <p>
                                <xsl:value-of select="channel/item[position()=3]/pubDate"/>
                            </p>
                            <a>
                                <xsl:attribute name="href">
                                    <xsl:value-of select="channel/link"/>
                                </xsl:attribute>
                                <xsl:value-of select="channel/title"/>
                            </a>
                        </div>
                    </div>

                </div>

                <div class="navigation">
                    <label for="r1" class="bar"></label>
                    <label for="r2" class="bar"></label>
                    <label for="r3" class="bar"></label>
                </div>

            </div>

            <div class="news-wrapper">
                <ul class="news-list">
                    <xsl:for-each select="channel/item[position()&gt;3]">
                        <li class="news">
                            <img src="" alt="">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="enclosure/@url"/>
                                </xsl:attribute>
                            </img>
                            <h3>
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="link"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="title"/>
                                </a>
                            </h3>
                            <p>
                                <xsl:value-of select="description"/>
                            </p>
                            <div class="date">
                                <p>
                                    <xsl:value-of select="pubDate"/>
                                </p>
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="../link"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="../title"/>
                                </a>
                            </div>
                        </li>
                    </xsl:for-each>
                </ul>
            </div>
        </body>
    </html>
</xsl:template>

</xsl:stylesheet>