<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml"
                xmlns:svg="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
>
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>


	<!--<xsl:key name="xxx" match="/Prüfungen/Prüfung[SchülerIn/Name='Karin Mustermann']/@Fach" use="." />-->
    <xsl:key name="xxx" match="/Prüfungen/Prüfung[SchülerIn/Name='Karin Mustermann']/@Fach" use="." />
	
	<xsl:template match="/">
		<html>
			<head>
			
				<title>Schule Hinterwald Reloaded</title>
                <link rel="stylesheet" type="text/css" href="theme.css"/>
            </head>
            <body>
				<p>
				<xsl:variable name="schülerIn" select="//SchülerIn[1]/Name"/>
				<xsl:value-of select="$schülerIn"/>
				</p>
			
				<xsl:for-each select="document('Noten-DB.xml')/Prüfungen/Prüfung/@Fach[generate-id()
                                       = generate-id(key('xxx',.)[1])]">
					<li>
						<xsl:value-of select="."/>: 
						<xsl:variable name="fach" select="."/>
						<xsl:value-of select="sum(//SchülerIn[Name='Karin Mustermann' and ../@Fach=$fach]/Note) div count(//SchülerIn[Name='Karin Mustermann' and ../@Fach=$fach]/Note)"/>
					</li>
				</xsl:for-each>

			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>