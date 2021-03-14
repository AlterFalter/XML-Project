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
                <div id="content" class="container">
                    <xsl:apply-templates select="feature"/>
                </div>
                <xsl:copy-of select="document('../layout/footer.html')"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="feature">
        <h1>Feature Stundenplan</h1>
        <div>
            <div>
                <p>
                    <i>Stundenpläne erstellen oder bearbeiten:</i>
                </p>
                <div>
                    <xsl:apply-templates select="document('../database/stundenplan.xml')/Stundenpläne/Stundenplan" />
                </div>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="Stundenplan">
        <div class="stundenplanblock">
            <h1>Klasse <xsl:value-of select="@Klasse"/></h1>
            <table>
                <tr>
                    <th class="firstColumn">Zeit</th>
                    <th class="column">Montag</th>
                    <th class="column">Dienstag</th>
                    <th class="column">Mittwoch</th>
                    <th class="column">Donnerstag</th>
                    <th class="column">Freitag</th>
                </tr>          

                <xsl:call-template name="add_row">
                    <xsl:with-param name="time">8:15 - 9:45</xsl:with-param>
                </xsl:call-template>

                <xsl:call-template name="add_row">
                    <xsl:with-param name="time">10:15 - 11:45</xsl:with-param>
                </xsl:call-template>

                <tr>
                    <td>Mittag</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

                <xsl:call-template name="add_row">
                    <xsl:with-param name="time">13:15 - 14:45</xsl:with-param>
                </xsl:call-template>

                <xsl:call-template name="add_row">
                    <xsl:with-param name="time">15:00 - 16:30</xsl:with-param>
                </xsl:call-template>
            </table>

            <div class="stundenplanbuttons">
                <xsl:variable name="class" select="@Klasse" />
                <form action="edit.php" method="post">
                    <input type="hidden" name="class" id="class-input" value="{$class}"/>
                    <button type="submit" value="submit">Stundenplan bearbeiten</button>
                </form>
                <form action="pdf.php" method="post">
                    <input type="hidden" name="class" id="class-input" value="{$class}"/>
                    <button type="submit" value="submit">Stundenplan herunterladen (PDF)</button>
                </form>
            </div>
        </div>
    </xsl:template>

    <xsl:template name="add_row">
        <xsl:param name="time" />
        <tr>
            <td><xsl:value-of select="$time" /></td>
            <td><xsl:apply-templates select="Block[Zeit/text()=$time and Tag/text()='Montag']" /></td>
            <td><xsl:apply-templates select="Block[Zeit/text()=$time and Tag/text()='Dienstag']" /></td>
            <td><xsl:apply-templates select="Block[Zeit/text()=$time and Tag/text()='Mittwoch']" /></td>
            <td><xsl:apply-templates select="Block[Zeit/text()=$time and Tag/text()='Donnerstag']" /></td>
            <td><xsl:apply-templates select="Block[Zeit/text()=$time and Tag/text()='Freitag']" /></td>
        </tr>
    </xsl:template>

    <xsl:template match="Block">
        <p><xsl:value-of select="Fach/text()" /></p>
        <p><xsl:value-of select="Raum/text()" /></p>
        <p><xsl:value-of select="Lehrperson/text()" /></p>
    </xsl:template>

</xsl:stylesheet>