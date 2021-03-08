<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml"
                xmlns:svg="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
>
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

    <xsl:template match="feature">
        <html>
            <head>
                <title>Schule Hinterwald Reloaded</title>
                <link rel="stylesheet" type="text/css" href="../css/style.css"/>
            </head>
            <body>

                <!-- Title and nav  -->

                <h1>Feature Noten Upload</h1>
                <small>
                    <a href="../index.xml">Home</a>
                </small>

                <div class="content">

                    <div>
                        <p>
                            <i>Die Datei Noten.xml wurde erfolgreich hochgeladen</i><br/>
                        </p>

                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>