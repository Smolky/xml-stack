<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>My custom title</title>
                
                <link href="https://fonts.googleapis.com/css?family=Jim+Nightshade|Roboto" rel="stylesheet" />
                <link rel="stylesheet" href="https://unpkg.com/purecss@0.6.2/build/pure-min.css" integrity="sha384-UQiGfs9ICog+LwheBSRCt1o5cbyKIHbwjWscjemyBMT9YCUMZffs6UqUTd0hObXD" crossorigin="anonymous" />
                <style>
                
                    body {
                        background-color: #37bc9b;
                        font-family: Roboto, sans-serif;
                    }
                
                    .main-container {
                        box-sizing: border-box;
                        max-width: 80rem;
                        margin: 1rem auto;
                        padding: 1rem 3rem;
                        border: 1px solid #ccc;
                        border-radius: .5rem;
                        box-shadow: 0 0.25rem 0.1rem rgba(10,30,10,.7);
                        background-color: white;
                    }
                    
                    h1 {
                        font-family: 'Jim Nightshade', cursive;
                        text-align: center;
                        font-size: 4rem;
                        line-height: 1;
                        color: white;
                        text-shadow: 0 0 1rem black;
                    }
                    
                    article h1 {
                        border-bottom: 2px solid black;
                        font-family: Roboto, sans-serif;
                        font-size: 2rem;
                        text-align: left;
                        text-shadow: none;
                        color: #333;
                    }
                    
                    article h1 small {
                        padding-left: .5rem;
                        font-size: 80%;
                        font-style: italic;
                        color: #333;
                    }
                    
                    article ul {
                        list-style-type: none;
                        margin: 0;
                        padding: 0;
                    }
                    
                    article li {
                        line-height: 1.5;
                        border-bottom: 1px dotted #ccc;
                        margin: 0 0 .25rem 0;
                    }
                </style>
            </head>
            <body>
            
                <h1>
                    The top <xsl:value-of select="count(/bands/band)"/> bands ever
                </h1>
            
                <main class="main-container">
                    <xsl:for-each select="bands/band">
                        <article>
                            <h1>
                                <xsl:value-of select="title"/>
                                <small>a band from <xsl:value-of select="year"/></small>
                            </h1>
                            <ul>
                                <xsl:for-each select="members/member">
                                    <li>
                                        <strong>
                                            <xsl:value-of select="fullname"/>
                                        </strong>
                                        <xsl:for-each select="instruments">
                                            <xsl:choose>
                                                <xsl:when test="instrument='Voice'">
                                                    sings!
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    plays <xsl:value-of select="instrument"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:for-each>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </article>
                    </xsl:for-each>
                </main>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
