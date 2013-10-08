<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:stk="http://www.enonic.com/cms/xslt/stk">    
    
    <xsl:output indent="yes" method="text"/>
    
    <xsl:variable name="config-file" as="xs:string" select="concat(/result/context/site/path-to-home-resources, '/modules/robots-txt/config.xml')"/>

    <xsl:template match="/">
        <xsl:choose>
            <xsl:when test="doc-available($config-file)">
                <xsl:for-each select="document($config-file)/config/robots/robot">
                    <xsl:value-of select="concat('User-agent: ', @name, '&#10;')"/>
                    <xsl:for-each select="rule">
                        <xsl:value-of select="if (@name = 'disallow') then 'Disallow' else 'Allow'"/>
                        <xsl:value-of select="concat(': ', ., '&#10;')"/>
                    </xsl:for-each>
                    <xsl:if test="position() != last()">
                        <xsl:text>&#10;</xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text># robots.txt config not found</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
                
    </xsl:template>

</xsl:stylesheet>
