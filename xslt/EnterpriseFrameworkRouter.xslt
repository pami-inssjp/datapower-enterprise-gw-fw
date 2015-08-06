<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:dp="http://www.datapower.com/extensions"
extension-element-prefixes="dp" exclude-result-prefixes="dp">


	<xsl:template match="/">
		<xsl:copy-of select="."/>
		<xsl:variable name="incomingURI">
			<xsl:value-of select="dp:variable('var://service/URI')"/>
		</xsl:variable>
		<xsl:variable name="tempVar">
			<xsl:value-of select="substring-after($incomingURI,'/')"/>
		</xsl:variable>
		<xsl:variable name="serviceName">
      <xsl:if test="contains($tempVar,'/')">
          <xsl:value-of select="substring-before($tempVar,'/')"/>
      </xsl:if>
      <xsl:if test="not(contains($tempVar,'/'))">
          <xsl:value-of select="$tempVar"/>
      </xsl:if>
		</xsl:variable>
    <xsl:message dp:priority="error">
      <xsl:value-of select="concat('SERVICE NAME -> ', $serviceName)" />
    </xsl:message>

		<xsl:param name="hostAddr" select="'local:///'"/>
		<xsl:variable name="remoteURL" select="concat($hostAddr,'/xml/',$serviceName,'/config.xml')"/>
		<xsl:variable name="environment" select="dp:variable('var://context/wp/environment')"/>
		<xsl:variable name="config" select="document($remoteURL)" />
		<xsl:variable name="serviceDestination">
			<xsl:copy-of select="$config/EnterpriseFrameworkDestinationList/serviceDestination[@environment=$environment]"/>
		</xsl:variable>
    <xsl:variable name="backendURI">
      <xsl:if test="substring($serviceDestination, string-length($serviceDestination) - string-length('/') +1) = '/'">
        <xsl:value-of select="substring-after($tempVar, '/')"/>
      </xsl:if>
      <xsl:if test="substring($serviceDestination, string-length($serviceDestination) - string-length('/') +1) != '/'">
        <xsl:value-of select="substring-after($tempVar, $serviceName)"/>
      </xsl:if>
    </xsl:variable>
    <dp:set-variable name="'var://service/routing-url'" value="concat($serviceDestination,$backendURI)"/>
	</xsl:template>
</xsl:stylesheet>
