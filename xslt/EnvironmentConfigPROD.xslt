<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0"
    xmlns:dp="http://www.datapower.com/extensions"
    extension-element-prefixes="dp"
    exclude-result-prefixes="xalan dp"
    xmlns:xalan="http://xml.apache.org/xslt">

    <xsl:template match="/">
      <xsl:variable name="masterConfig" select="document('local:///EnvironmentConfigPROD.xml')"/>
      <dp:set-variable name="'var://context/wp/environment'" value="normalize-space($masterConfig/config/environment/text())"/>
    </xsl:template>
</xsl:stylesheet>
