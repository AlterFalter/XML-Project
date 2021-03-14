<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

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
        <!-- title and nav  -->
        <h2>Feature Noten Upload</h2>
        <div>
            <div class="block">
                <h5>1. Noten.xml herunterladen</h5>
                <p>
                    <i>Hier können Sie eine Musterdatei "Noten.xml" herunterladen, um darin die Noten einer Prüfung einzutragen.</i>
                </p>
                <a href="Noten.xml" download="Noten.xml">Download</a>
            </div>
            <div class="block">
                <h5>2. Noten.xml hochladen</h5>
                <p>
                    <i>Die ausgefüllte Datei können Sie anschliessen wieder hier hochladen.</i>
                </p>
                <form action="upload.php" method="post" enctype="multipart/form-data">
                    <span>Bitte die Datei zum Hochladen auswählen: </span>
                    <input type="file" name="fileToUpload" id="fileToUpload"/>
                    <button type="submit" name="submit">Datei hochladen</button>
                </form>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>
