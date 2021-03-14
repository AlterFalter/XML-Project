<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml"
                xmlns:svg="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
>
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

    <xsl:variable name="class" select="document('selectedClass.xml')/selectedClass/text()" />

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
        <p>
            <i>Block für Stundenplan der Klasse <xsl:value-of select="$class"/> hinzufügen:</i>
        </p>
        <div>
            <form action="insertBlock.php" method="post">
                <div>
                    <label for="day">Tag</label>
                    <select name="day" id="day-input" required="true">
                        <xsl:for-each select="document('../database/Stundenplan.xml')/Stundenpläne/Konfiguration/Tage/Tag">
                            <option>
                                <xsl:value-of select="."/> 											
                            </option>
                        </xsl:for-each>
                    </select>
                </div>
                <div>
                    <label for="time">Zeit:</label>
                    <select name="time" id="time-input" required="true">
                        <xsl:for-each select="document('../database/Stundenplan.xml')/Stundenpläne/Konfiguration/Zeiten/Zeit">
                            <option>
                                <xsl:value-of select="."/> 											
                            </option>
                        </xsl:for-each>
                    </select>
                </div>
                <div>
                    <label for="teacher">Lehrperson:</label>
                    <input type="text" name="teacher" id="teacher-input" placeholder="Max Muster..." required="true"/>
                </div>
                <div>
                    <label for="subject">Fach:</label>
                    <input type="text" name="subject" id="subject-input" placeholder="Mathematik..." required="true"/>
                </div>
                <div>
                    <label for="room">Raum:</label>
                    <input type="text" name="room" id="room-input" placeholder="Raum 10A..." required="true"/>
                </div>
                <input type="hidden" name="class" id="class-input" value="{$class}"/>
                <button type="submit" value="submit">Hinzufügen</button>
            </form>
        </div>
    </xsl:template>

</xsl:stylesheet>