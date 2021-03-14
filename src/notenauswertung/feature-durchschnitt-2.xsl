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
                <xsl:apply-templates select="feature"/>
                <xsl:copy-of select="document('../layout/footer.html')"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="feature">
        <html>
            <head>
                <title>Schule Hinterwald Reloaded</title>
                <link rel="stylesheet" type="text/css" href="../css/style.css"/>
            </head>
            <body>

                <!-- title and nav  -->
                <h1>Feature Notenauswertung</h1>

                <div class="content">

                    <!-- load data from DB and render  -->
                    <div>
                        <h2>Notendurchschnitt von 
						<xsl:value-of select="$pupil" />
						</h2>
			
				<xsl:for-each select="$subjects">
										<xsl:if test="generate-id() = generate-id($subjects[. = current()][1])">
					<li>
						<xsl:value-of select="."/>: 
						<xsl:variable name="subject" select="."/>
						<xsl:value-of select="sum(//SchülerIn[Name=$pupil and ../@Klasse=$class and ../@Fach=$subject]/Note) div count(//SchülerIn[Name=$pupil and ../@Klasse=$class and ../@Fach=$subject]/Note)"/>
					</li>
					</xsl:if>
				</xsl:for-each>
                    </div>
                </div>

            </body>
        </html>
    </xsl:template>

    <xsl:template match="Prüfung">
	
        <li>
            <xsl:value-of select="@Fach"/>
        </li>
	
    </xsl:template>       

</xsl:stylesheet>
