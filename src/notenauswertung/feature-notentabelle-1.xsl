<?xml version="1.0" ?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:svg="http://www.w3.org/2000/svg"
	xmlns:xlink="http://www.w3.org/1999/xlink">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

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
				<div id="content" class="container">
					<xsl:apply-templates select="feature"/>
				</div>
				<xsl:copy-of select="document('../layout/footer.html')"/>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="feature">
		<h2>Feature Notenauswertung</h2>
		<div class="block">
			<h3>Notentabelle</h3>
			<form action="insertData.php" method="post">
				<div>
					<label for="class">Klasse</label>
					<select name="class" class="class-input">
						<option value="">Alle</option>
						<xsl:for-each select="$classes">
							<xsl:sort select="." data-type="text"/>
							<xsl:if test="generate-id() = generate-id($classes[. = current()][1])">
								<xsl:choose>
									<xsl:when test=". = $selectedClass">
										<option>
											<xsl:attribute name="selected">selected</xsl:attribute>
											<xsl:value-of select="."/>
										</option>
									</xsl:when>
									<xsl:otherwise>
										<option>
											<xsl:value-of select="."/>
										</option>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
						</xsl:for-each>
					</select>
				</div>
				<div>
					<label for="subject">Fach</label>
					<select name="subject" class="class-input">
						<option value="">Alle</option>
						<xsl:for-each select="$subjects">
							<xsl:sort select="." data-type="text" />
							<xsl:if test="generate-id() = generate-id($subjects[. = current()][1])">
								<xsl:choose>
									<xsl:when test=". = $selectedSubject">
										<option>
											<xsl:attribute name="selected">selected</xsl:attribute>
											<xsl:value-of select="."/>
										</option>
									</xsl:when>
									<xsl:otherwise>
										<option>
											<xsl:value-of select="."/>
										</option>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
						</xsl:for-each>
					</select>
				</div>

				<div>
					<label for="exam">Prüfung</label>
					<select name="exam" class="class-input">
						<option value="">Alle</option>
						<xsl:for-each select="$exams">
							<xsl:sort select="." data-type="text" />
							<xsl:if test="generate-id() = generate-id($exams[. = current()][1])">
								<xsl:choose>
									<xsl:when test=". = $selectedExam">
										<option>
											<xsl:attribute name="selected">selected</xsl:attribute>
											<xsl:value-of select="."/>
										</option>
									</xsl:when>
									<xsl:otherwise>
										<option>
											<xsl:value-of select="."/>
										</option>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
						</xsl:for-each>
					</select>
				</div>
				<div>
					<label for="date">Datum</label>
					<select name="date" class="class-input">
						<option value="">Alle</option>
						<xsl:for-each select="$dates">
							<xsl:sort select="." data-type="text" />
							<xsl:if test="generate-id() = generate-id($dates[. = current()][1])">
								<xsl:choose>
									<xsl:when test=". = $selectedDate">
										<option>
											<xsl:attribute name="selected">selected</xsl:attribute>
											<xsl:value-of select="."/>
										</option>
									</xsl:when>
									<xsl:otherwise>
										<option>
											<xsl:value-of select="."/>
										</option>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
						</xsl:for-each>
					</select>
				</div>
				<div>
					<label for="pupil">SchülerIn</label>
					<select name="pupil" class="class-input">
						<option value="">Alle</option>
						<xsl:for-each select="$pupils">
							<xsl:sort select="." data-type="text" />
							<xsl:if test="generate-id() = generate-id($pupils[. = current()][1])">
								<xsl:choose>
									<xsl:when test=". = $selectedPupil">
										<option>
											<xsl:attribute name="selected">selected</xsl:attribute>
											<xsl:value-of select="."/>
										</option>
									</xsl:when>
									<xsl:otherwise>
										<option>
											<xsl:value-of select="."/>
										</option>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
						</xsl:for-each>
					</select>
				</div>
				<div>
					<label for="grade">Note</label>
					<select name="grade" class="class-input">
						<option value="">Alle</option>
						<xsl:for-each select="$grades">
							<xsl:sort select="." data-type="number" />
							<xsl:if test="generate-id() = generate-id($grades[. = current()][1])">
								<xsl:choose>
									<xsl:when test=". = $selectedGrade">
										<option>
											<xsl:attribute name="selected">selected</xsl:attribute>
											<xsl:value-of select="."/>
										</option>
									</xsl:when>
									<xsl:otherwise>
										<option>
											<xsl:value-of select="."/>
										</option>
									</xsl:otherwise>
								</xsl:choose>
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
	</xsl:template>

	<xsl:template match="Prüfungen">

		<table border="1">
			<th>Klasse</th>
			<th>Fach</th>
			<th>Prüfung</th>
			<th>Datum</th>
			<th>SchülerIn</th>
			<th>Note</th>
			<xsl:apply-templates select="Prüfung[contains(@Klasse, $selectedClass) and contains(@Fach, $selectedSubject) and contains(@Name, $selectedExam) and contains(@Datum, $selectedDate)]/SchülerIn[contains(Name, $selectedPupil) and contains(Note, $selectedGrade)]">
				<xsl:sort select="../@Klasse" data-type="text"/>
				<xsl:sort select="../@Fach" data-type="text"/>
				<xsl:sort select="../@Name" data-type="text"/>
				<xsl:sort select="../@Datum" data-type="text"/>
				<xsl:sort select="Name" data-type="text"/>
				<xsl:sort select="Note" data-type="number"/>
			</xsl:apply-templates>
		</table>

	</xsl:template>

	<xsl:template match="Prüfung/SchülerIn">
		<tr>
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
	</xsl:template>
</xsl:stylesheet>