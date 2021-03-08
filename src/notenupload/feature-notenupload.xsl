<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

    <xsl:template match="feature">
        <html>
            <head>
                <title>Schule Hinterwald Reloaded</title>
                <link rel="stylesheet" type="text/css" href="../css/style.css"/>
            </head>
            <body>


                <!-- title and nav  -->
                <h1>Feature Noten Upload</h1>
                <small>
                    <a href="../index.xml">Home</a>
                </small>

                <div class="content">

                    <p>
                        <h2>Noten hochladen</h2>
                    </p>


                    <!-- upload a .xml file  -->
                    <div>
					
					
					Hier können Sie eine Musterdatei "Noten.xml" herunterladen, um darin die Noten einer Prüfung einzutragen.
					<br />

					<a href="Noten.xml" download="Noten.xml">Download</a>
					<br />

					<br />
					Die ausgefüllte Datei können Sie anschliessen wieder hier hochladen.
					<br />
					
                    <br />
					<form action="upload.php" method="post" enctype="multipart/form-data">
					Bitte die Datei zum Hochladen auswählen:
					<input type="file" name="fileToUpload" id="fileToUpload"/>
					<input type="submit" value="Datei hochladen" name="submit"/>
					</form>
						
                        
                    </div>
                </div>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
