<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
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

                <!-- title and nav  -->
                <h1>Feature #01</h1>

                <div class="content">

                    <p>
                        <i>Let's access some data</i>
                    </p>


                    <!-- load data from DB and render  -->
                    <div>
                        <h2>our school own house band:</h2>
                        <xsl:apply-templates
                                select="document('../database/database.xml')/school-register/house-band"
                        >
                        </xsl:apply-templates>
                    </div>
                </div>

            </body>
        </html>
    </xsl:template>

    <xsl:template match="member">
        <li>
            <xsl:value-of select="text()"/>
        </li>
    </xsl:template>

</xsl:stylesheet>
