<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:rif="http://automotive-his.de/200706/rif"
                xmlns:rif-xhtml="http://automotive-his.de/200706/rif-xhtml">

    <xsl:template match="@*|node()" priority="1">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="rif:LONG-NAME" priority="2">
        <xsl:copy>
            <xsl:call-template name="convertId"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="*">
        <out>
            <xsl:value-of select="."/>
            <xsl:value-of select="regexp:replace(string(.), 'Title', 'g', 'yes!!!')"/>
            <xsl:value-of select="regexp:replace(string(.), 'Title', 'gi', 'yes!!!')"/>
            <xsl:apply-templates select="*"/>
        </out>
    </xsl:template>

    <!-- =========================================== -->
    <xsl:template name="convertId">
        <xsl:param name="keyName" select="."/>

        <xsl:choose>
            <xsl:when test="$keyName = 'title'">Object Heading</xsl:when>
            <xsl:when test="$keyName = 'Description'">Object Text</xsl:when>
            <xsl:when test="$keyName = 'Type'">Typ</xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$keyName"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>