<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>


    <xsl:key name="fach-key" match="/Prüfungen/Prüfung[SchülerIn/Name='Karin Mustermann']/@Fach" use="." />

    <xsl:template match="feature">
        <html>
            <head>
                <title>Schule Hinterwald Reloaded</title>
                <link rel="stylesheet" type="text/css" href="../css/style.css"/>
            </head>
            <body>


                <!-- title and nav  -->
                <h1>Feature Notenauswertung</h1>
                <small>
                    <a href="../index.php">Home</a>
                </small>

                <div class="content">

                    <div>
                        <h2>Auswahl:</h2>
						
						<p>
						    <a href="feature-verteilung.xml">Die Notenverteilung einer Prüfung abfragen</a>
						</p>
						<p>
						    <a href="feature-abfrage.xml">Alle Prüfungsnoten einer Schülerin / eines Schülers abfragen</a>
						</p>
						<p>
						    <a href="feature-durchschnitt.xml">Den Notendurchschnitt einer Schülerin / eines Schülers abfragen</a>
						</p>
						
				
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
