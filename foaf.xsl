<!-- foaf_to_xhtml.xsl -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:foaf="http://xmlns.com/foaf/0.1/">
  <xsl:output method="html" encoding="UTF-8"/>
  
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <meta charset="UTF-8"/>
        <title>Profil FOAF</title>
        <link rel="stylesheet" type="text/css" href="style.css"/>
      </head>
      <body>
        <h1>Profil FOAF</h1>
        <xsl:apply-templates select="//foaf:Person"/>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="foaf:Person">
    <div>
      <h2><xsl:value-of select="foaf:name"/></h2>
      <p>Âge : <xsl:value-of select="foaf:age"/></p>
      <p>Centres d'intérêt :</p>
      <ul>
        <xsl:for-each select="foaf:interest/rdf:Bag/rdf:li">
          <li><xsl:value-of select="."/></li>
        </xsl:for-each>
      </ul>
      <p>Page d'accueil : <a href="{foaf:homepage/@rdf:resource}"><xsl:value-of select="foaf:homepage/@rdf:resource"/></a></p>
    </div>
  </xsl:template>
</xsl:stylesheet>
