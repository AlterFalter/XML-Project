<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <xsl:template match="menu">
        <html>
            <xsl:copy-of select="document('../layout/head.html')"/>
            <body>
                <xsl:copy-of select="document('../layout/header.html')"/>
                <div id="content" class="container">
                    <xsl:apply-templates select="feature"/>
                </div>
                <xsl:copy-of select="document('../layout/footer.html')"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="feature">
        <h2>Notenauswertung</h2>
        <div class="block">
            <p>
                <a href="feature-notentabelle.xml">Notentabelle anzeigen</a>
            </p>
            <p>
                <a href="feature-verteilung.xml">Die Notenverteilung einer Prüfung abfragen</a>
            </p>
            <p>
                <a href="feature-abfrage.xml">Alle Prüfungsnoten einer Schülerin / eines Schülers abfragen</a>
            </p>
            <p>
                <a href="feature-durchschnitt.xml">Den Notendurchschnitt einer Schülerin / eines Schülers abfragen</a>
            </p>
        </div>
    </xsl:template>
</xsl:stylesheet>
