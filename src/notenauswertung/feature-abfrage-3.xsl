<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml"
                xmlns:svg="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
>
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

	<xsl:variable name="selectedClass" select="document('selectedClass.xml')/selectedClass/text()"/>
	<xsl:variable name="selectedPupil" select="document('selectedPupil.xml')/selectedPupil/text()"/>
	<xsl:variable name="selectedSubject" select="document('selectedSubject.xml')/selectedSubject/text()"/>
	<xsl:variable name="selectedExam" select="document('selectedExam.xml')/selectedExam/text()"/>

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
				<h3>Prüfungsnoten von <xsl:value-of select="$selectedPupil" /> im Fach <xsl:value-of select="$selectedSubject" /></h3>
			</p>

			<xsl:call-template name="bars"></xsl:call-template>

		</div>
    </xsl:template>
	
	<xsl:variable name="numberOf_1.0" select="count(document('../database/Noten-DB.xml')/Prüfungen/Prüfung/SchülerIn/Note[../../@Klasse=$selectedClass and ../Name=$selectedPupil and ../../@Fach=$selectedSubject and text()='1.0'])" />
	<xsl:variable name="numberOf_1.5" select="count(document('../database/Noten-DB.xml')/Prüfungen/Prüfung/SchülerIn/Note[../../@Klasse=$selectedClass and ../Name=$selectedPupil and ../../@Fach=$selectedSubject and text()='1.5'])" />
	<xsl:variable name="numberOf_2.0" select="count(document('../database/Noten-DB.xml')/Prüfungen/Prüfung/SchülerIn/Note[../../@Klasse=$selectedClass and ../Name=$selectedPupil and ../../@Fach=$selectedSubject and text()='2.0'])" />
	<xsl:variable name="numberOf_2.5" select="count(document('../database/Noten-DB.xml')/Prüfungen/Prüfung/SchülerIn/Note[../../@Klasse=$selectedClass and ../Name=$selectedPupil and ../../@Fach=$selectedSubject and text()='2.5'])" />
	<xsl:variable name="numberOf_3.0" select="count(document('../database/Noten-DB.xml')/Prüfungen/Prüfung/SchülerIn/Note[../../@Klasse=$selectedClass and ../Name=$selectedPupil and ../../@Fach=$selectedSubject and text()='3.0'])" />
	<xsl:variable name="numberOf_3.5" select="count(document('../database/Noten-DB.xml')/Prüfungen/Prüfung/SchülerIn/Note[../../@Klasse=$selectedClass and ../Name=$selectedPupil and ../../@Fach=$selectedSubject and text()='3.5'])" />
	<xsl:variable name="numberOf_4.0" select="count(document('../database/Noten-DB.xml')/Prüfungen/Prüfung/SchülerIn/Note[../../@Klasse=$selectedClass and ../Name=$selectedPupil and ../../@Fach=$selectedSubject and text()='4.0'])" />
	<xsl:variable name="numberOf_4.5" select="count(document('../database/Noten-DB.xml')/Prüfungen/Prüfung/SchülerIn/Note[../../@Klasse=$selectedClass and ../Name=$selectedPupil and ../../@Fach=$selectedSubject and text()='4.5'])" />
	<xsl:variable name="numberOf_5.0" select="count(document('../database/Noten-DB.xml')/Prüfungen/Prüfung/SchülerIn/Note[../../@Klasse=$selectedClass and ../Name=$selectedPupil and ../../@Fach=$selectedSubject and text()='5.0'])" />
	<xsl:variable name="numberOf_5.5" select="count(document('../database/Noten-DB.xml')/Prüfungen/Prüfung/SchülerIn/Note[../../@Klasse=$selectedClass and ../Name=$selectedPupil and ../../@Fach=$selectedSubject and text()='5.5'])" />
	<xsl:variable name="numberOf_6.0" select="count(document('../database/Noten-DB.xml')/Prüfungen/Prüfung/SchülerIn/Note[../../@Klasse=$selectedClass and ../Name=$selectedPupil and ../../@Fach=$selectedSubject and text()='6.0'])" />

    <xsl:variable name="baseline" select="200"/>

    <!-- bars -->
    <xsl:template name="bars">
        <svg:svg width="600" height="600">
			<xsl:call-template name="bar">
			    <xsl:with-param name="position">0</xsl:with-param>
				<xsl:with-param name="grade">Note</xsl:with-param>
				<xsl:with-param name="numberOf">
				</xsl:with-param>
				<xsl:with-param name="color">#007bff</xsl:with-param>
            </xsl:call-template>
	
			<xsl:call-template name="bar">
			    <xsl:with-param name="position">1</xsl:with-param>
				<xsl:with-param name="grade">1.0</xsl:with-param>
				<xsl:with-param name="numberOf">
					<xsl:value-of select="$numberOf_1.0" />
				</xsl:with-param>
				<xsl:with-param name="color">#007bff</xsl:with-param>
            </xsl:call-template>
			
			<xsl:call-template name="bar">
				<xsl:with-param name="position">2</xsl:with-param>
				<xsl:with-param name="grade">1.5</xsl:with-param>
				<xsl:with-param name="numberOf">
					<xsl:value-of select="$numberOf_1.5" />
				</xsl:with-param>
				<xsl:with-param name="color">#007bff</xsl:with-param>
            </xsl:call-template>
			
			<xsl:call-template name="bar">
				<xsl:with-param name="position">3</xsl:with-param>
				<xsl:with-param name="grade">2.0</xsl:with-param>
				<xsl:with-param name="numberOf">
					<xsl:value-of select="$numberOf_2.0" />
				</xsl:with-param>
				<xsl:with-param name="color">#007bff</xsl:with-param>
            </xsl:call-template>
			
			<xsl:call-template name="bar">
				<xsl:with-param name="position">4</xsl:with-param>
				<xsl:with-param name="grade">2.5</xsl:with-param>
				<xsl:with-param name="numberOf">
					<xsl:value-of select="$numberOf_2.5" />
				</xsl:with-param>
				<xsl:with-param name="color">#007bff</xsl:with-param>
            </xsl:call-template>
			
			<xsl:call-template name="bar">
				<xsl:with-param name="position">5</xsl:with-param>
				<xsl:with-param name="grade">3.0</xsl:with-param>
				<xsl:with-param name="numberOf">
					<xsl:value-of select="$numberOf_3.0" />
				</xsl:with-param>
				<xsl:with-param name="color">#007bff</xsl:with-param>
            </xsl:call-template>
			
			<xsl:call-template name="bar">
				<xsl:with-param name="position">6</xsl:with-param>
				<xsl:with-param name="grade">3.5</xsl:with-param>
				<xsl:with-param name="numberOf">
					<xsl:value-of select="$numberOf_3.5" />
				</xsl:with-param>
				<xsl:with-param name="color">#007bff</xsl:with-param>
            </xsl:call-template>
			
			<xsl:call-template name="bar">
				<xsl:with-param name="position">7</xsl:with-param>
				<xsl:with-param name="grade">4.0</xsl:with-param>
				<xsl:with-param name="numberOf">
					<xsl:value-of select="$numberOf_4.0" />
				</xsl:with-param>
				<xsl:with-param name="color">#007bff</xsl:with-param>
            </xsl:call-template>
			
			<xsl:call-template name="bar">
				<xsl:with-param name="position">8</xsl:with-param>
				<xsl:with-param name="grade">4.5</xsl:with-param>
				<xsl:with-param name="numberOf">
					<xsl:value-of select="$numberOf_4.5" />
				</xsl:with-param>
				<xsl:with-param name="color">#007bff</xsl:with-param>
            </xsl:call-template>
			
			<xsl:call-template name="bar">
				<xsl:with-param name="position">9</xsl:with-param>
				<xsl:with-param name="grade">5.0</xsl:with-param>
				<xsl:with-param name="numberOf">
					<xsl:value-of select="$numberOf_5.0" />
				</xsl:with-param>
				<xsl:with-param name="color">#007bff</xsl:with-param>
            </xsl:call-template>
			
			<xsl:call-template name="bar">
				<xsl:with-param name="position">10</xsl:with-param>
				<xsl:with-param name="grade">5.5</xsl:with-param>
				<xsl:with-param name="numberOf">
					<xsl:value-of select="$numberOf_5.5" />
				</xsl:with-param>
				<xsl:with-param name="color">#007bff</xsl:with-param>
            </xsl:call-template>
			
			<xsl:call-template name="bar">
				<xsl:with-param name="position">11</xsl:with-param>
				<xsl:with-param name="grade">6.0</xsl:with-param>
				<xsl:with-param name="numberOf">
					<xsl:value-of select="$numberOf_6.0" />
				</xsl:with-param>
				<xsl:with-param name="color">#007bff</xsl:with-param>
            </xsl:call-template>
			
			<xsl:call-template name="bar">
				<xsl:with-param name="position">12</xsl:with-param>
				<xsl:with-param name="grade"></xsl:with-param>
				<xsl:with-param name="numberOf">
					Anzahl Prüfungen mit dieser Note
				</xsl:with-param>
				<xsl:with-param name="color">#007bff</xsl:with-param>
            </xsl:call-template>
					
        </svg:svg>
    </xsl:template>

	<!-- bar -->
	<xsl:template name="bar" >
		<xsl:param name="position" />
		<xsl:param name="grade" />
		<xsl:param name="numberOf" />
		<xsl:param name="color" />

        <xsl:variable name="x-offset" select="9 + ($position * 40)"/>
        <xsl:variable name="y-offset" select="$baseline"/>
        <xsl:variable name="y" select="$y-offset - $numberOf*10"/>

        <svg:path>
            <xsl:attribute name="style">
                <xsl:text>fill:</xsl:text>
           <!--     color   -->
		   <xsl:value-of select="$color" />
				
            </xsl:attribute>

            <xsl:attribute name="d">
                <!-- move to the lower left corner of the rectangle -->
                <xsl:text>M </xsl:text>
                <xsl:value-of select="$x-offset - 10"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="$y-offset"/>
                <!-- draw line to the upper left corner of the rectangle -->
                <xsl:text> L </xsl:text>
                <xsl:value-of select="$x-offset - 10"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="$y"/>
                <!-- draw line to the upper right corner of the rectangle -->
                <xsl:text> L </xsl:text>
                <xsl:value-of select="$x-offset + 10"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="$y"/>
                <!-- draw line to the lower right corner of the rectangle -->
                <xsl:text> L </xsl:text>
                <xsl:value-of select="$x-offset + 10"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="$y-offset"/>
                <!-- close path and fill the rectangle -->
                <xsl:text> Z</xsl:text>
            </xsl:attribute>
        </svg:path>

        <!-- bar value -->
        <svg:text style="writing-mode:tb">
            <xsl:attribute name="x">
                <xsl:value-of select="$x-offset"/>
            </xsl:attribute>
            <xsl:attribute name="y">
				<xsl:choose>
					<xsl:when test="$numberOf = 0">
						<xsl:value-of select="$y-offset - $numberOf*10 - 7" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$y-offset - $numberOf*10 + 2" />
					</xsl:otherwise>
				</xsl:choose>
            </xsl:attribute>
            <xsl:value-of select="$numberOf"/>
        </svg:text>

        <!-- bar legend -->
        <svg:text fill="black">
            <xsl:attribute name="x">
                <xsl:value-of select="$x-offset - 10"/>
            </xsl:attribute>
            <xsl:attribute name="y">
                <xsl:value-of select="$baseline + 25"/>
            </xsl:attribute>
            <xsl:value-of select="$grade"/>
        </svg:text>
    </xsl:template>
</xsl:stylesheet>