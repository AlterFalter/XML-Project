<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

    <xsl:template match="about">
        <html>
            <xsl:copy-of select="document('../layout/head.html')"/>
            <body>
                <xsl:copy-of select="document('../layout/header.html')"/>
                <div id="content" class="container">
                    <h2>Über uns</h2>
                    <h4>Allgemein</h4>
                    <p>
                        Version:
                        <xsl:value-of select="version"/>
                    </p>
                    <p>
                        Date:
                        <xsl:value-of select="date"/>
                    </p>
                    <h4>Ersteller</h4>
                    <ul>
                        <xsl:apply-templates select="authors/author"></xsl:apply-templates>
                    </ul>
                    <h4>Verwendete Bilder
                    </h4>
                    <ul>
                        <xsl:apply-templates select="usedImages/usedImage"></xsl:apply-templates>
                    </ul>
                </div>
                <xsl:copy-of select="document('../layout/footer.html')"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="author">
        <li>
            <xsl:value-of select="name" />
            -
            <a>
                <xsl:attribute name="href">
                    mailto:<xsl:value-of select="email" />
                </xsl:attribute>
                <xsl:value-of select="email" />
            </a>
        </li>
    </xsl:template>
    <xsl:template match="usedImage">
        <li>
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="path" />
                </xsl:attribute>
                <xsl:value-of select="name" />
            </a>
            -
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="source" />
                </xsl:attribute>
                Quelle
            </a>
        </li>
    </xsl:template>
</xsl:stylesheet>