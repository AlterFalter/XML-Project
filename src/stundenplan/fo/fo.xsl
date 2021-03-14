<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:variable name="class" select="document('../selectedClass.xml')/selectedClass/text()" />

    <xsl:template match="fo">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="stundenplan" page-height="21cm" page-width="29.7cm" margin-top="1cm"
                                       margin-bottom="2cm" margin-left="2.5cm" margin-right="2.5cm">
                    <fo:region-body margin-top="1cm"/>
                    <fo:region-before extent="2cm"/>
                    <fo:region-after extent="3cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="stundenplan">
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block text-align="center" font-size="8pt">
                        Schule Hinterwald
                    </fo:block>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="19pt" font-family="sans-serif" line-height="24pt" space-after.optimum="20pt"
                              color="black" text-align="left" padding-top="5pt"
                              padding-bottom="5pt">
                        Stundenplan Klasse <xsl:value-of select="$class"/>
                    </fo:block>
                    
                    <xsl:apply-templates select="document('../../database/stundenplan.xml')/Stundenpläne/Stundenplan[@Klasse=$class]"/>

                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="Stundenplan">
        <fo:table space-after.optimum="20pt" width="100%" font-size="11pt">
            <fo:table-column column-number="1" column-width="10%" border-style="solid" border-width="1pt"/>
            <fo:table-column column-number="2" column-width="18%" border-style="solid" border-width="1pt"/>
            <fo:table-column column-number="3" column-width="18%" border-style="solid" border-width="1pt"/>
            <fo:table-column column-number="4" column-width="18%" border-style="solid" border-width="1pt"/>
            <fo:table-column column-number="5" column-width="18%" border-style="solid" border-width="1pt"/>
            <fo:table-column column-number="6" column-width="18%" border-style="solid" border-width="1pt"/>

            <fo:table-header background-color="red" font-size="14pt">
                <fo:table-row>
                    <fo:table-cell column-number="1" display-align="center" padding-top="5pt" padding-bottom="5pt">
                        <fo:block text-align="center">
                            Zeit
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell column-number="2" display-align="center" padding-top="5pt" padding-bottom="5pt">
                        <fo:block text-align="center">
                            Montag
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell column-number="3" display-align="center" padding-top="5pt" padding-bottom="5pt">
                        <fo:block text-align="center">
                            Dienstag
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell column-number="4" display-align="center" padding-top="5pt" padding-bottom="5pt">
                        <fo:block text-align="center">
                            Mittwoch
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell column-number="5" display-align="center" padding-top="5pt" padding-bottom="5pt">
                        <fo:block text-align="center">
                            Donnerstag
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell column-number="6" display-align="center" padding-top="5pt" padding-bottom="5pt">
                        <fo:block text-align="center">
                            Freitag
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-header>

            <fo:table-footer background-color="red">
                <fo:table-row>
                    <fo:table-cell number-columns-spanned="6" height="10pt">
                        <fo:block></fo:block>
                    </fo:table-cell>                         
                </fo:table-row>
            </fo:table-footer>

            <fo:table-body>
                <xsl:call-template name="add_row">
                    <xsl:with-param name="time">8:15 - 9:45</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="add_row">
                    <xsl:with-param name="time">10:15 - 11:45</xsl:with-param>
                </xsl:call-template>

                <fo:table-row border-style="solid" border-width="1pt" background-color="lightgrey">
                    <fo:table-cell column-number="1" number-columns-spanned="6" display-align="center" padding-top="5pt" padding-bottom="5pt">
                        <fo:block text-align="center">
                            Mittag
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>

                <xsl:call-template name="add_row">
                    <xsl:with-param name="time">13:15 - 14:45</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="add_row">
                    <xsl:with-param name="time">15:00 - 16:30</xsl:with-param>
                </xsl:call-template>
            </fo:table-body>

        </fo:table>
    </xsl:template>

    <xsl:template name="add_row">
        <xsl:param name="time" />
        <fo:table-row border-style="solid" border-width="1pt">
            <fo:table-cell column-number="1" display-align="center" padding-top="5pt" padding-bottom="5pt">
                <fo:block text-align="center">
                    <xsl:value-of select="$time" />
                </fo:block>
            </fo:table-cell>
            <fo:table-cell column-number="2" display-align="center" padding-top="5pt" padding-bottom="5pt">
                <fo:block text-align="center">
                    <xsl:apply-templates select="Block[Zeit/text()=$time and Tag/text()='Montag']" />
                </fo:block>
            </fo:table-cell>
            <fo:table-cell column-number="3" display-align="center" padding-top="5pt" padding-bottom="5pt">
                <fo:block text-align="center">
                    <xsl:apply-templates select="Block[Zeit/text()=$time and Tag/text()='Dienstag']" />
                </fo:block>
            </fo:table-cell>
            <fo:table-cell column-number="4" display-align="center" padding-top="5pt" padding-bottom="5pt">
                <fo:block text-align="center">
                    <xsl:apply-templates select="Block[Zeit/text()=$time and Tag/text()='Mittwoch']" />
                </fo:block>
            </fo:table-cell>
            <fo:table-cell column-number="5" display-align="center" padding-top="5pt" padding-bottom="5pt">
                <fo:block text-align="center">
                    <xsl:apply-templates select="Block[Zeit/text()=$time and Tag/text()='Donnerstag']" />
                </fo:block>
            </fo:table-cell>
            <fo:table-cell column-number="6" display-align="center" padding-top="5pt" padding-bottom="5pt">
                <fo:block text-align="center">
                    <xsl:apply-templates select="Block[Zeit/text()=$time and Tag/text()='Freitag']" />
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>

    <xsl:template match="Block">
        <fo:block>
            <xsl:value-of select="Fach/text()" />
        </fo:block>
        <fo:block>
            <xsl:value-of select="Raum/text()" />
        </fo:block>
        <fo:block>
            <xsl:value-of select="Lehrperson/text()" />
        </fo:block>
    </xsl:template>
</xsl:stylesheet>
