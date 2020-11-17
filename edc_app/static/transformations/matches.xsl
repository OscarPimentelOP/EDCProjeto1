<?xml version="1.0" encoding="UTF-8"?>
<!-- Code related to pagination was taken from codeproject.com/Articles/11277/Pagination-using-XSL -->
<!-- Thanks VivekAyer -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:param name="Page" select="0"/>
<xsl:param name="PageSize" select="10"/>

<xsl:template match="/matches">
    <xsl:variable name="counter" select="count(match)"/>
    <xsl:variable name="selectedRowCount" select="floor((number($counter)-1) div $PageSize)+1"/>
    <html>
        <!-- Prev link for pagination -->
        <xsl:choose>
            <xsl:when test="number($Page)-1 &gt;= 0">&#160;
                <A>
                    <xsl:attribute name="href">/matches?page=<xsl:value-of select="number($Page)-1"/>&amp;pagesize=<xsl:value-of
                            select="$PageSize"/></xsl:attribute>
                    &lt;&lt;Prev
                </A>
            </xsl:when>
            <xsl:otherwise>
                <!-- display something else -->
            </xsl:otherwise>
        </xsl:choose>

        <xsl:if test="$selectedRowCount &gt; 1">
            &#160;<b class="blacktext"><xsl:value-of select="number($Page)+1"/>&#160;of&#160;<xsl:value-of
                select="number($selectedRowCount)"/></b>&#160;
        </xsl:if>

        <!-- Next link for pagination -->
        <xsl:choose>
            <xsl:when test="number($Page)+1 &lt; number($selectedRowCount)">&#160;
                <A>
                    <xsl:attribute name="href">/matches?page=<xsl:value-of select="number($Page)+1"/>&amp;pagesize=<xsl:value-of
                            select="$PageSize"/></xsl:attribute>
                    Next&gt;&gt;
                </A>
            </xsl:when>
            <xsl:otherwise>
                <!-- display something else -->
            </xsl:otherwise>
        </xsl:choose>
        <div class="matches">
            <xsl:for-each select="match">
                <xsl:if test="position() &gt;= ($Page * $PageSize) + 1">
                    <xsl:if test="position() &lt;= $PageSize + ($PageSize * $Page)">
                        <div class="match-box">
                            <h1 id="league">
                                <xsl:value-of select="strLeague"/>
                                <!-- League -->
                            </h1>
                            <div class="home-team">
                                <h1 id="name"><xsl:value-of select="strHomeTeam"/></h1>
                                <a id="home">
                                    <xsl:if test="strHomeBadge != ''">
                                        <xsl:attribute name="href">
                                            /teams/<xsl:value-of select="idHomeTeam"/>
                                        </xsl:attribute>
                                    </xsl:if>
                                </a>
                                <img alt="">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="strHomeBadge"/>
                                    </xsl:attribute>
                                </img>
                                <!-- team logo -->
                                <h1 id="score">
                                    <xsl:choose>
                                        <xsl:when test="intHomeScore != ''">
                                            <xsl:value-of select="intHomeScore"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            0
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <!-- score -->
                                </h1>
                            </div>
                            <div class="away-team">
                                <h1 id="name"><xsl:value-of select="strAwayTeam"/></h1>
                                <a id="away">
                                    <xsl:if test="strAwayBadge != ''">
                                        <xsl:attribute name="href">
                                            /teams/<xsl:value-of select="idAwayTeam"/>
                                        </xsl:attribute>
                                    </xsl:if>
                                </a>
                                <img src="https://www.thesportsdb.com/images/media/team/badge/uqtwxx1448813449.png" alt="">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="strAwayBadge"/>
                                    </xsl:attribute>
                                </img>
                                <!-- team logo -->
                                <h1 id="score">
                                    <xsl:choose>
                                        <xsl:when test="intAwayScore != ''">
                                            <xsl:value-of select="intAwayScore"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            0
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <!-- score -->
                                </h1>
                            </div>
                            <h1 id="date">
                                <xsl:value-of select="dateEvent"/>
                                <!-- date -->
                            </h1>
                        </div>
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
        </div>
    </html>
</xsl:template>

</xsl:stylesheet>