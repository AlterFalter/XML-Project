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
                <link rel="stylesheet" type="text/css" href="theme.css"/>
            </head>
            <body>

                <!-- Title and nav  -->

                <h1>Feature #04</h1>
                <small>
                    <a href="index.xml">Home</a>
                </small>

                <div class="content">

                    <div>
                        <p>
                            <i>Let's change some new class data:</i>
                        </p>

                        <!-- Form -->
                        <form action="feature-04/insert.php" method="post">
                            <div>
                                <label for="class">Class</label>
                                <select name="class" id="class-input">
                                    <xsl:apply-templates
                                            select="document('../database/database.xml')/school-register/statistics"
                                    >
                                    </xsl:apply-templates>
                                </select>
                            </div>
                            <div>
                                <label for="size">new Class Size</label>
                                <input type="text" name="size" id="size-input"
                                       placeholder="Class Size"
                                       value="39"
                                />
                            </div>
                            <button type="submit">Insert</button>
                        </form>

                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="class">
        <option><xsl:value-of select="@name"/></option>
    </xsl:template>

</xsl:stylesheet>