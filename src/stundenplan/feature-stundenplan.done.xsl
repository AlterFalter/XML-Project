<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:svg="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" />

    <xsl:template match="menu">
        <html>
            <xsl:copy-of select="document('../layout/head.html')" />
            <body>
                <xsl:copy-of select="document('../layout/header.html')" />
                <div id="content" class="container">
                    <xsl:apply-templates select="feature" />
                </div>
                <xsl:copy-of select="document('../layout/footer.html')" />
            </body>
        </html>
    </xsl:template>

    <xsl:template match="feature">
        <h2>Stundenplan</h2>
        <p>
            <i>Stundenplan erfolgreich updated!</i>
        </p>
        <p>
            <a href="feature-stundenplan-edit.xml">Weiter editieren</a>
        </p>
        <p>
            <a href="feature-stundenplan.xml">Zurück zur Übersicht</a>
        </p>
    </xsl:template>
</xsl:stylesheet>