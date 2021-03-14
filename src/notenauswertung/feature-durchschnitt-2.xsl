<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

    <xsl:variable name="selectedPupil" select="document('selectedPupil.xml')/selectedPupil/text()"/>
	
	<xsl:key name="fach-key" match="/Prüfungen/Prüfung/@Fach" use="." />

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
        <h2>Feature Notenauswertung</h2>
        <!-- load data from DB and render  -->
        <div class="block">
            <p>
                <h5>Notendurchschnitt von <xsl:value-of select="$selectedPupil" /></h5>
            </p>
            <div>
                <table class="notendurchschnitt">
                    <xsl:for-each select="document('../database/Noten-DB.xml')/Prüfungen/Prüfung/@Fach[generate-id()
                                            = generate-id(key('fach-key',.)[1])]">
                        <tr>
                            <td class="firstColumn"><xsl:value-of select="."/>: </td>
                            <xsl:variable name="fach" select="."/>
                            <td class="column"><xsl:value-of select="sum(//SchülerIn[Name=$selectedPupil and ../@Fach=$fach]/Note) div count(//SchülerIn[Name=$selectedPupil and ../@Fach=$fach]/Note)"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="Prüfung">
        <xsl:value-of select="@Fach"/>
    </xsl:template>       

</xsl:stylesheet>
