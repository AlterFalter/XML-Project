<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml"
                xmlns:svg="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
>
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

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

                <h1>Feature #03</h1>

                <div class="content">

                    <div>
                        <p>
                            <i>Let's create a printable class statistics:
                            </i>
                        </p>
                        <p>
                            <a href="fo.xml" target="_blank">create FO</a>
                            <small>(directly in browser with XSTL)</small>
                        </p>
                        <p>
                            <a href="pdf.php" target="_blank">create PDF</a>
                            <small>(create FO and render as PDF via web service)</small>
                        </p>

                    </div>

                </div>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>