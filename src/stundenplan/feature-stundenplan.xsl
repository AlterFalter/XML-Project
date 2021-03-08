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

                <h1>Feature Stundenplan</h1>
                <small>
                    <a href="../index.xml">Home</a>
                </small>

                <div class="content">

                    <div>
                        <p>
                            <i>Stundenpläne erstellen oder bearbeiten:</i>
                        </p>

                        <!-- Stundenpläne-->
                        <div>
                            <xsl:apply-templates select="document('../database/stundenplan.xml')/Stundenpläne/Stundenplan" />
                        </div>

                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="Stundenplan">
        <div>
            <p>
                <h1>Klasse: <xsl:value-of select="@Klasse"/></h1>
            </p>
            <table>
                <tr>
                    <th>Blöcke</th>
                    <!--<xsl:apply-templates select="document('../database/stundenplan.xml')/Stundenpläne/Konfiguration/Tage" />-->
                    <th>Montag</th>
                    <th>Dienstag</th>
                    <th>Mittwoch</th>
                    <th>Donnerstag</th>
                    <th>Freitag</th>
                </tr>          
                <tr>
                    <td>8:15 - 9:45</td>
                    <td><xsl:apply-templates select="Block[Zeit/text()='8:15 - 9:45' and Tag/text()='Montag']" /></td>
                    <td><xsl:apply-templates select="Block[Zeit/text()='8:15 - 9:45' and Tag/text()='Dienstag']" /></td>
                    <td><xsl:apply-templates select="Block[Zeit/text()='8:15 - 9:45' and Tag/text()='Mittwoch']" /></td>
                    <td><xsl:apply-templates select="Block[Zeit/text()='8:15 - 9:45' and Tag/text()='Donnerstag']" /></td>
                    <td><xsl:apply-templates select="Block[Zeit/text()='8:15 - 9:45' and Tag/text()='Freitag']" /></td>
                </tr>
                <tr>
                    <td>10:15 - 11:45</td>
                    <td><xsl:apply-templates select="Block[Zeit/text()='10:15 - 11:45' and Tag/text()='Montag']" /></td>
                    <td><xsl:apply-templates select="Block[Zeit/text()='10:15 - 11:45' and Tag/text()='Dienstag']" /></td>
                    <td><xsl:apply-templates select="Block[Zeit/text()='10:15 - 11:45' and Tag/text()='Mittwoch']" /></td>
                    <td><xsl:apply-templates select="Block[Zeit/text()='10:15 - 11:45' and Tag/text()='Donnerstag']" /></td>
                    <td><xsl:apply-templates select="Block[Zeit/text()='10:15 - 11:45' and Tag/text()='Freitag']" /></td>
                </tr>
                <tr>
                    <td>Mittag</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>13:15 - 14:45</td>
                    <td><xsl:apply-templates select="Block[Zeit/text()='13:15 - 14:45' and Tag/text()='Montag']" /></td>
                    <td><xsl:apply-templates select="Block[Zeit/text()='13:15 - 14:45' and Tag/text()='Dienstag']" /></td>
                    <td><xsl:apply-templates select="Block[Zeit/text()='13:15 - 14:45' and Tag/text()='Mittwoch']" /></td>
                    <td><xsl:apply-templates select="Block[Zeit/text()='13:15 - 14:45' and Tag/text()='Donnerstag']" /></td>
                    <td><xsl:apply-templates select="Block[Zeit/text()='13:15 - 14:45' and Tag/text()='Freitag']" /></td>
                </tr>
                <tr>
                    <td>15:00 - 16:30</td>
                    <td><xsl:apply-templates select="Block[Zeit/text()='15:00 - 16:30' and Tag/text()='Montag']" /></td>
                    <td><xsl:apply-templates select="Block[Zeit/text()='15:00 - 16:30' and Tag/text()='Dienstag']" /></td>
                    <td><xsl:apply-templates select="Block[Zeit/text()='15:00 - 16:30' and Tag/text()='Mittwoch']" /></td>
                    <td><xsl:apply-templates select="Block[Zeit/text()='15:00 - 16:30' and Tag/text()='Donnerstag']" /></td>
                    <td><xsl:apply-templates select="Block[Zeit/text()='15:00 - 16:30' and Tag/text()='Freitag']" /></td>
                </tr>
            </table>
        </div>
    </xsl:template>

    <xsl:template match="Block">
        <p><xsl:value-of select="Fach/text()" /></p>
        <p><xsl:value-of select="Raum/text()" /></p>
        <p><xsl:value-of select="Lehrperson/text()" /></p>
    </xsl:template>

</xsl:stylesheet>