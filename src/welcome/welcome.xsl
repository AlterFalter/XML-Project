<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" />

    <xsl:template match="menu">
        <html>
            <xsl:copy-of select="document('../layout/head.html')" />
            <body>
                <xsl:copy-of select="document('../layout/header.html')" />
                <div id="content" class="container">
                    <ul>
                        <xsl:apply-templates select="item">
                            <xsl:sort select="index" data-type="text" order="ascending" />
                        </xsl:apply-templates>
                    </ul>
                    <a href="database/database.xml" target="_blank">show Database</a>
                </div>
                <xsl:copy-of select="document('../layout/footer.html')" />
            </body>
        </html>
    </xsl:template>

    <!-- single menu item  -->
    <xsl:template match="item">
        <li>
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="link" />
                </xsl:attribute>
                <xsl:value-of select="text" />
            </a>
        </li>
    </xsl:template>
</xsl:stylesheet>
