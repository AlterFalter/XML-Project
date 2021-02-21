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
                <link rel="stylesheet" type="text/css" href="styles.css"/>
            </head>
            <body>

                <!-- Title and nav  -->

                <h1>Feature #03</h1>
                <small>
                    <a href="welcome.xml">Home</a>
                </small>

                <div class="content">

                    <div>
                        <p>
                            <i>Let's create a printable class statistics (as FO, needs to be sent to web service for PDF
                                rendering:
                            </i>
                        </p>

                        <a href="fo.xml" target="_blank">create FO</a>

                    </div>

                </div>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>