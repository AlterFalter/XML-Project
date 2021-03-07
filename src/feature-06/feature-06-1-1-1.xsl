<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

    <xsl:variable name="selectedPupil" select="document('selectedPupil.xml')/selectedPupil/text()"/>
	
	<xsl:key name="fach-key" match="/Prüfungen/Prüfung/@Fach" use="." />

    <xsl:template match="feature">
        <html>
            <head>
                <title>Schule Hinterwald Reloaded</title>
                <link rel="stylesheet" type="text/css" href="css/style.css"/>
            </head>
            <body>


                <!-- title and nav  -->
                <h1>Feature #06</h1>
                <small>
                    <a href="index.xml">Home</a>
                </small>

                <div class="content">

                    <!-- load data from DB and render  -->
                    <div>
                        <h2>Notendurchschnitt von 
						<xsl:value-of select="$selectedPupil" />
						</h2>
			
				<xsl:for-each select="document('../database/Noten-DB.xml')/Prüfungen/Prüfung/@Fach[generate-id()
                                       = generate-id(key('fach-key',.)[1])]">
					<li>
						<xsl:value-of select="."/>: 
						<xsl:variable name="fach" select="."/>
						<xsl:value-of select="sum(//SchülerIn[Name=$selectedPupil and ../@Fach=$fach]/Note) div count(//SchülerIn[Name=$selectedPupil and ../@Fach=$fach]/Note)"/>
					</li>
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
