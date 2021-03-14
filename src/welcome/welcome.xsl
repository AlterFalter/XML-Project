<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" />

    <xsl:template match="menu">
        <html>
            <xsl:copy-of select="document('../layout/head.html')" />
            <body>
                <xsl:copy-of select="document('../layout/header.html')" />
                <div id="content" class="container">
                    <h2>Willkommen bei BILIAS</h2>
                    <p><q>Das billigere und benutzerfreundlichere ILIAS!</q> - Die Ersteller von BILIAS</p>
                    <h3>Navigation</h3>
                    <ul>
                        <xsl:apply-templates select="navigationItems/item"></xsl:apply-templates>
                    </ul>
                    <h3>Mehr erfahren</h3>
                    <ul>
                        <xsl:apply-templates select="links/link"></xsl:apply-templates>
                    </ul>
                </div>
                <xsl:copy-of select="document('../layout/footer.html')" />
            </body>
        </html>
    </xsl:template>
    <xsl:template match="item">
        <li>
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="url" />
                </xsl:attribute>
                <xsl:value-of select="text" />
            </a>
        </li>
    </xsl:template>
    <xsl:template match="link">
        <li>
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="url" />
                </xsl:attribute>
                <xsl:value-of select="text" />
            </a>
        </li>
    </xsl:template>
</xsl:stylesheet>
