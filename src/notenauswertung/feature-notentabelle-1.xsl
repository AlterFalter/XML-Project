<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml"
                xmlns:svg="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
>
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

	<xsl:variable name="selectedClass" select="document('selectedClass.xml')/selectedClass/text()"/>
	<xsl:variable name="selectedSubject" select="document('selectedSubject.xml')/selectedSubject/text()"/>
	<xsl:variable name="selectedExam" select="document('selectedExam.xml')/selectedExam/text()"/>
	<xsl:variable name="selectedDate" select="document('selectedDate.xml')/selectedDate/text()"/>
	<xsl:variable name="selectedPupil" select="document('selectedPupil.xml')/selectedPupil/text()"/>
	<xsl:variable name="selectedGrade" select="document('selectedGrade.xml')/selectedGrade/text()"/>
	
	<xsl:variable name="db" select="document('../database/Noten-DB.xml')"/>
	<xsl:variable name="classes" select="$db/Prüfungen/Prüfung/@Klasse" />
	<xsl:variable name="subjects" select="$db/Prüfungen/Prüfung/@Fach" />
	<xsl:variable name="exams" select="$db/Prüfungen/Prüfung/@Name" />
	<xsl:variable name="dates" select="$db/Prüfungen/Prüfung/@Datum" />
	<xsl:variable name="pupils" select="$db/Prüfungen/Prüfung/SchülerIn/Name" />
	<xsl:variable name="grades" select="$db/Prüfungen/Prüfung/SchülerIn/Note" />
	
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

                <!-- Title and nav  -->

                <h1>Feature Notenauswertung</h1>

                <div class="content">

                    <div>
                        <h2>Notentabelle</h2>
						<br></br>

                        <!-- Form -->
                        <form action="insertData2.php" method="post">
                            <div>
                                <label for="class">Klasse</label>
                                <select name="class" id="class-input" style="width:150px">
									<option>
										Alle       
					                </option>
                                    <xsl:for-each select="$classes">
										<xsl:if test="generate-id() = generate-id($classes[. = current()][1])">
					                    <xsl:if test=". = $selectedClass">
										<option>
										    <xsl:attribute name="selected">selected</xsl:attribute>
						                    <xsl:value-of select="."/> 											
					                    </option>
										</xsl:if>
										<xsl:if test=". != $selectedClass">
										<option>
						                    <xsl:value-of select="."/> 											
					                    </option>
										</xsl:if>
										</xsl:if>
				                    </xsl:for-each>
                                </select>
                            </div>
							<div>
                                <label for="subject">Fach</label>
                                <select name="subject" id="class-input" style="width:150px">
									<option>
										Alle 
					                </option>
                                    <xsl:for-each select="$subjects">
										<xsl:if test="generate-id() = generate-id($subjects[. = current()][1])">
					                    <xsl:if test=". = $selectedSubject">
										<option>
										    <xsl:attribute name="selected">selected</xsl:attribute>
						                    <xsl:value-of select="."/> 											
					                    </option>
										</xsl:if>
										<xsl:if test=". != $selectedSubject">
										<option>
						                    <xsl:value-of select="."/> 											
					                    </option>
										</xsl:if>
										</xsl:if>
				                    </xsl:for-each>
                                </select>
                            </div>
							
							<div>
                                <label for="exam">Prüfung</label>
                                <select name="exam" id="class-input" style="width:150px">
									<option>
										Alle 
					                </option>
                                    <xsl:for-each select="$exams">
										<xsl:if test="generate-id() = generate-id($exams[. = current()][1])">
					                    <xsl:if test=". = $selectedExam">
										<option>
										    <xsl:attribute name="selected">selected</xsl:attribute>
						                    <xsl:value-of select="."/> 											
					                    </option>
										</xsl:if>
										<xsl:if test=". != $selectedExam">
										<option>
						                    <xsl:value-of select="."/> 											
					                    </option>
										</xsl:if>
										</xsl:if>
				                    </xsl:for-each>
                                </select>
                            </div>
							<div>
                                <label for="date">Datum</label>
                                <select name="date" id="class-input" style="width:150px">
									<option>
										Alle 
					                </option>
                                    <xsl:for-each select="$dates">
										<xsl:if test="generate-id() = generate-id($dates[. = current()][1])">
					                    <xsl:if test=". = $selectedDate">
										<option>
										    <xsl:attribute name="selected">selected</xsl:attribute>
						                    <xsl:value-of select="."/> 											
					                    </option>
										</xsl:if>
										<xsl:if test=". != $selectedDate">
										<option>
						                    <xsl:value-of select="."/> 											
					                    </option>
										</xsl:if>
										</xsl:if>
				                    </xsl:for-each>
                                </select>
                            </div>
							<div>
                                <label for="pupil">SchülerIn</label>
                                <select name="pupil" id="class-input" style="width:150px">
									<option>
										Alle 
					                </option>
                                    <xsl:for-each select="$pupils">
										<xsl:if test="generate-id() = generate-id($pupils[. = current()][1])">
					                    <xsl:if test=". = $selectedPupil">
										<option>
										    <xsl:attribute name="selected">selected</xsl:attribute>
						                    <xsl:value-of select="."/> 											
					                    </option>
										</xsl:if>
										<xsl:if test=". != $selectedPupil">
										<option>
						                    <xsl:value-of select="."/> 											
					                    </option>
										</xsl:if>
										</xsl:if>
				                    </xsl:for-each>
                                </select>
                            </div>
							<div>
                                <label for="grade">Note</label>
                                <select name="grade" id="class-input" style="width:150px">
									<option>
										Alle 
					                </option>
                                    <xsl:for-each select="$grades">
										<xsl:if test="generate-id() = generate-id($grades[. = current()][1])">
					                    <xsl:if test=". = $selectedGrade">
										<option>
										    <xsl:attribute name="selected">selected</xsl:attribute>
						                    <xsl:value-of select="."/> 											
					                    </option>
										</xsl:if>
										<xsl:if test=". != $selectedGrade">
										<option>
						                    <xsl:value-of select="."/> 											
					                    </option>
										</xsl:if>
										</xsl:if>
				                    </xsl:for-each>
                                </select>
                            </div>
							<div>
                            <button type="submit">Filter anwenden</button>
							</div>
							<div>
							<button type="reset" onclick="location.href='feature-notentabelle.xml'">Filter zurücksetzen</button>
							</div>
                        </form>
						<br/>
						
						<xsl:apply-templates select="$db/Prüfungen" />
						
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
	
	<xsl:template match="Prüfungen"> 
    
	<xsl:variable name="selectedClass2">
		<xsl:choose>
			<xsl:when test="$selectedClass='Alle'">
				<xsl:value-of select="@*"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$selectedClass"/>
			</xsl:otherwise>
		</xsl:choose>
    </xsl:variable>
	
	<xsl:variable name="selectedSubject2">
		<xsl:choose>
			<xsl:when test="$selectedSubject='Alle'">
				<xsl:value-of select="@*"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$selectedSubject"/>
			</xsl:otherwise>
		</xsl:choose>
    </xsl:variable>
	
	<xsl:variable name="selectedExam2">
		<xsl:choose>
			<xsl:when test="$selectedExam='Alle'">
				<xsl:value-of select="@*"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$selectedExam"/>
			</xsl:otherwise>
		</xsl:choose>
    </xsl:variable>
	
	<xsl:variable name="selectedDate2">
		<xsl:choose>
			<xsl:when test="$selectedDate='Alle'">
				<xsl:value-of select="@*"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$selectedDate"/>
			</xsl:otherwise>
		</xsl:choose>
    </xsl:variable>
	
	<xsl:variable name="selectedPupil2">
		<xsl:choose>
			<xsl:when test="$selectedPupil!='Alle'">
				<xsl:value-of select="$selectedPupil"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="@*"/>
			</xsl:otherwise>
		</xsl:choose>
    </xsl:variable>
	
	<xsl:variable name="selectedGrade2">
		<xsl:choose>
			<xsl:when test="$selectedGrade!='Alle'">
				<xsl:value-of select="$selectedGrade"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="@*"/>
			</xsl:otherwise>
		</xsl:choose>
    </xsl:variable>
	
	
	<table border="1">
		<th style="background-color:green" >Klasse</th>
		<th style="background-color:green" >Fach</th>
		<th style="background-color:green" >Prüfung</th>
		<th style="background-color:green" >Datum</th>
		<th style="background-color:green" >SchülerIn</th>
		<th style="background-color:green" >Note</th>		
		<xsl:apply-templates select="Prüfung[contains(@Klasse, $selectedClass2) and contains(@Fach, $selectedSubject2) and contains(@Name, $selectedExam2) and contains(@Datum, $selectedDate2)]/SchülerIn[contains(Name, $selectedPupil2) and contains(Note, $selectedGrade2)]"/>		
	</table>
	
	</xsl:template>  
	
	<xsl:template match="Prüfung/SchülerIn">
	<xsl:if test="position() mod 2 = 0">
	<tr style= "background:green">
		<td>
			<xsl:value-of select="../@Klasse"/>
		</td>
		<td>
			<xsl:value-of select="../@Fach"/>
		</td>
		<td>
			<xsl:value-of select="../@Name"/>
		</td>
		<td>
			<xsl:value-of select="../@Datum"/>
		</td>
		<td>
			<xsl:value-of select="Name"/>
		</td>
		<td>
			<xsl:value-of select="Note"/>
		</td>
	</tr>
	</xsl:if>
	<xsl:if test="position() mod 2 = 1">
	<tr style="background:gray">
		<td>
			<xsl:value-of select="../@Klasse"/>
		</td>
		<td>
			<xsl:value-of select="../@Fach"/>
		</td>
		<td>
			<xsl:value-of select="../@Name"/>
		</td>
		<td>
			<xsl:value-of select="../@Datum"/>
		</td>
		<td>
			<xsl:value-of select="Name"/>
		</td>
		<td>
			<xsl:value-of select="Note"/>
		</td>
	</tr>
	</xsl:if>
	</xsl:template>
<!--
    <xsl:template match="SchülerIn">
        <option><xsl:value-of select="Name"/></option>
    </xsl:template>
-->
</xsl:stylesheet>