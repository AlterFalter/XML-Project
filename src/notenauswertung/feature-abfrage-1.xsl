<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:svg="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" />

    <xsl:variable name="class" select="document('selectedClass.xml')/selectedClass/text()" />
    <xsl:variable name="pupils" select="document('../database/Noten-DB.xml')/Prüfungen/Prüfung[@Klasse=$class]/SchülerIn/Name" />

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
        <h2>Feature Notenauswertung</h2>
        <div class="block">
            <p>
                <i>SchülerIn auswählen:</i>
            </p>
            <form action="insertPupil2.php" method="post">
                <div>
                    <label for="class">SchülerIn</label>
                    <select name="class">
                        <xsl:for-each select="$pupils">
                            <xsl:sort select="." data-type="text" />
                            <xsl:if test="generate-id() = generate-id($pupils[. = current()][1])">
                                <option>
                                    <xsl:value-of select="." />
                                </option>
                            </xsl:if>
                        </xsl:for-each>
                    </select>
                </div>
                <button type="submit">Noten abfragen</button>
            </form>
        </div>
    </xsl:template>
</xsl:stylesheet>