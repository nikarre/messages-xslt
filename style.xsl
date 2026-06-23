<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/items">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>Сообщения</title>
      </head>
      <body>
        <h1>Сообщения</h1>
        <ul>
          <xsl:apply-templates select="item[@parentid='0']"/>
        </ul>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="item">
    <xsl:variable name="currentId" select="@id"/>
    <li>
      <b><xsl:value-of select="@author"/></b>
      <xsl:text> пишет: </xsl:text>
      <xsl:value-of select="."/>
      <xsl:if test="//item[@parentid=$currentId]">
        <ul>
          <xsl:apply-templates select="//item[@parentid=$currentId]"/>
        </ul>
      </xsl:if>
    </li>
  </xsl:template>

</xsl:stylesheet>
