<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" doctype-system="about:legacy-compat" encoding="utf-8"/>
    
    <xsl:template match="/jardinBotanico">
        <html>    
            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta charset="utf-8"/>
                <meta name="description" content="Página principal" />
                <title>titulo de la web</title>
            </head>

            <body>
                <header>
                    <img src= "../img/logotipo.png" alt= "Reservas" />
                    <a href="zonas.html">Zonas</a>
                    <a href="plantas.html">Plantas</a>
                    <a href="actividades.html">Actividades</a>
                </header>
                
                <main>
                    <h1>ZONAS</h1>
                    <table>
                        <tr>
                            <th>ZONA</th>
                            <th>Ubicación</th>
                            <th>Horario</th>
                        </tr>
                                <xsl:apply-templates select="zonas/zona"/>
                    </table>
                </main>
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                        
                </footer>
            </body>
        </html>
    </xsl:template>
        
    <xsl:template match="zona">
            <xsl:variable name="hora" select="translate(horarioapertura, ':', '')"/>
            <xsl:if test="number($hora) &lt;= 1000">
                <tr>
                    <td><xsl:value-of select="nombre"/></td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="contains(ubicacion, 'Exterior')">
                                <xsl:attribute name="class">azul</xsl:attribute>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:value-of select="ubicacion"/>
                    </td>
                    <td>
                        <xsl:value-of select="concat(horarioapertura, ' - ', horariocierre)"/>
                    </td>
                </tr>
            </xsl:if>
        </xsl:template>
        
    </xsl:stylesheet>	
		