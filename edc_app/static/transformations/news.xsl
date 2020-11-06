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
                            <xsl:value-of select="channel/item[position()=1]/title"/>
                        </h3>
                        <p>
                            <xsl:value-of select="channel/item[position()=1]/description"/>
                        </p>
                    </div>
                    <div class="slide s2">
                        <img alt="">
                            <xsl:attribute name="src">
                             <xsl:value-of select="channel/item[position()=2]/enclosure/@url"/>
                            </xsl:attribute>
                        </img>
                        <h3>
                            <xsl:value-of select="channel/item[position()=2]/title"/>
                        </h3>
                        <p>
                            <xsl:value-of select="channel/item[position()=2]/description"/>
                        </p>
                    </div>
                    <div class="slide s3">
                        <img alt="">
                            <xsl:attribute name="src">
                             <xsl:value-of select="channel/item[position()=3]/enclosure/@url"/>
                            </xsl:attribute>
                        </img>
                        <h3>
                            <xsl:value-of select="channel/item[position()=3]/title"/>
                        </h3>
                        <p>
                            <xsl:value-of select="channel/item[position()=3]/description"/>
                        </p>
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
                    <li class="news">
                        <img src="" alt=""/>
                        <h3>
                            Sit Lorem anim ut veniam officia minim ex occaecat eu mollit.
                        </h3>
                        <p>
                            Cupidatat irure voluptate exercitation sunt ad. Nostrud laboris laboris sunt mollit deserunt ut.
                            Laborum nulla elit magna amet nostrud irure eu nostrud quis sit aliquip labore culpa et. Sunt veniam
                            nulla ipsum sunt ut ea id veniam in enim laborum fugiat laborum. Ad eiusmod sint nisi fugiat est
                            commodo ut dolor deserunt ea. Est proident ad sint voluptate sint minim sit.

                            Dolore sunt est qui cillum id laboris. Qui ipsum labore ullamco aliqua nulla officia aute irure in
                            voluptate. Cupidatat pariatur consectetur voluptate consequat.
                        </p>
                    </li>
                    <li class="news">
                        <img src="" alt=""/>
                        <h3>
                            Sit Lorem anim ut veniam officia minim ex occaecat eu mollit.
                        </h3>
                        <p>
                            Cupidatat irure voluptate exercitation sunt ad. Nostrud laboris laboris sunt mollit deserunt ut.
                            Laborum nulla elit magna amet nostrud irure eu nostrud quis sit aliquip labore culpa et. Sunt veniam
                            nulla ipsum sunt ut ea id veniam in enim laborum fugiat laborum. Ad eiusmod sint nisi fugiat est
                            commodo ut dolor deserunt ea. Est proident ad sint voluptate sint minim sit.

                            Dolore sunt est qui cillum id laboris. Qui ipsum labore ullamco aliqua nulla officia aute irure in
                            voluptate. Cupidatat pariatur consectetur voluptate consequat.
                        </p>
                    </li>
                    <li class="news">
                        <img src="" alt=""/>
                        <h3>
                            Sit Lorem anim ut veniam officia minim ex occaecat eu mollit.
                        </h3>
                        <p>
                            Cupidatat irure voluptate exercitation sunt ad. Nostrud laboris laboris sunt mollit deserunt ut.
                            Laborum nulla elit magna amet nostrud irure eu nostrud quis sit aliquip labore culpa et. Sunt veniam
                            nulla ipsum sunt ut ea id veniam in enim laborum fugiat laborum. Ad eiusmod sint nisi fugiat est
                            commodo ut dolor deserunt ea. Est proident ad sint voluptate sint minim sit.

                            Dolore sunt est qui cillum id laboris. Qui ipsum labore ullamco aliqua nulla officia aute irure in
                            voluptate. Cupidatat pariatur consectetur voluptate consequat.
                        </p>
                    </li>
                    <li class="news">
                        <img src="" alt=""/>
                        <h3>
                            Sit Lorem anim ut veniam officia minim ex occaecat eu mollit.
                        </h3>
                        <p>
                            Cupidatat irure voluptate exercitation sunt ad. Nostrud laboris laboris sunt mollit deserunt ut.
                            Laborum nulla elit magna amet nostrud irure eu nostrud quis sit aliquip labore culpa et. Sunt veniam
                            nulla ipsum sunt ut ea id veniam in enim laborum fugiat laborum. Ad eiusmod sint nisi fugiat est
                            commodo ut dolor deserunt ea. Est proident ad sint voluptate sint minim sit.

                            Dolore sunt est qui cillum id laboris. Qui ipsum labore ullamco aliqua nulla officia aute irure in
                            voluptate. Cupidatat pariatur consectetur voluptate consequat.
                        </p>
                    </li>

                </ul>

            </div>


        </body>
    </html>
</xsl:template>

</xsl:stylesheet>