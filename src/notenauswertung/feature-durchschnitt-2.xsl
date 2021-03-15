<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <xsl:variable name="class" select="document('selectedClass.xml')/selectedClass/text()"/>
	<xsl:variable name="pupil" select="document('selectedPupil.xml')/selectedPupil/text()"/>
	<xsl:variable name="subjects" select="document('../database/Noten-DB.xml')/Prüfungen/Prüfung[@Klasse=$class and SchülerIn/Name=$pupil]/@Fach" />
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
                <h3>Notendurchschnitt von <xsl:value-of select="$selectedPupil" /></h3>
            </p>
            <div>
                <table class="notendurchschnitt">
                    <xsl:for-each select="$subjects">
										    <xsl:if test="generate-id() = generate-id($subjects[. = current()][1])">
                            <tr>
                                <td class="firstColumn"><xsl:value-of select="."/>: </td>
                                <xsl:variable name="subject" select="."/>
                                <td class="column"><xsl:value-of select="sum(//SchülerIn[Name=$pupil and ../@Klasse=$class and ../@Fach=$subject]/Note) div count(//SchülerIn[Name=$pupil and ../@Klasse=$class and ../@Fach=$subject]/Note)"/></td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="Prüfung">
        <xsl:value-of select="@Fach"/>
    </xsl:template>
</xsl:stylesheet>
