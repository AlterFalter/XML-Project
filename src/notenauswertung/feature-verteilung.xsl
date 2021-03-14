<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml"
                xmlns:svg="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
>
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

    <xsl:variable name="classes" select="document('../database/Noten-DB.xml')/Prüfungen/Prüfung/@Klasse" />

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
                        <p>
                            Klasse auswählen:
                        </p>

                        <!-- Form -->
                        <form action="insertClass2.php" method="post">
                            <div>
                                <label for="class">Klasse</label>
                                <select name="class" id="class-input">
                                    <xsl:for-each select="$classes">
										<xsl:if test="generate-id() = generate-id($classes[. = current()][1])">
					                    <option>
						                    <xsl:value-of select="."/> 											
					                    </option>
										</xsl:if>
				                    </xsl:for-each>
                                </select>
                            </div>
                            <button type="submit">Weiter</button>
                        </form>

                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
<!--
    <xsl:template match="SchülerIn">
        <option><xsl:value-of select="Name"/></option>
    </xsl:template>
-->
</xsl:stylesheet>