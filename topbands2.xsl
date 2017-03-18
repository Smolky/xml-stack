<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <style>
                
                    body {
                        max-width: 70rem;
                        margin: 0 auto;
                    }
                
                    textarea {
                        border: 1px solid #ccc;
                        width: 80rem;
                        height: 30rem;
                    }
                </style>
            </head>
            <body>
            
                <h1>
                    XML2JSON
                </h1>
                
                <p>
                    You can grab the content generated in the textarea
                </p>
            
                <label>
                    <div><strong>JSON Generated</strong></div>
                    <textarea>
{"bands": [
<xsl:for-each select="bands/band">
    {"title": "<xsl:value-of select="title"/>"
        <xsl:if test="members">, "members": [
            <xsl:for-each select="members/member">
                {
                    "name": "<xsl:value-of select="fullname"/>",
                    "instruments": [
                        <xsl:for-each select="instruments">"<xsl:value-of select="instrument"/>"<xsl:if test="position() != last()"><xsl:text>,</xsl:text></xsl:if></xsl:for-each>
                    ]
                }
            </xsl:for-each>
            ]
        </xsl:if>
    }<xsl:if test="position() != last()"><xsl:text>,</xsl:text></xsl:if>
</xsl:for-each>
]}
                    </textarea>
                </label>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
