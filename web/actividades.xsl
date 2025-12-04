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

                
                
                <main id="jardinbotanico">
                    <!--Se defines la variable que llamaremos con $mes -->
                    <xsl:variable name="mes" select="'11'"/>
                    <h1>Actividades del mes <xsl:value-of select="$mes"/></h1>
                    <!--Aplicamos templates para cada actividad-->
                    <xsl:apply-templates 
                        select="actividades/actividad[substring(fechaHora,6,2) = $mes]">
                        <xsl:sort select="fechaHora" data-type="text" order="ascending"/>
                    </xsl:apply-templates>

                </main>
                
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>
    <!--Plantillas para cada actividad -->
    <xsl:template match="actividad">
        <article class="actividades">   
         <!-- Título con número de responsables -->
            <h4>
                <!--XSLT 1.0: NO tiene upper-case()-->
                <xsl:value-of select="translate(titulo, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/> - 
                <xsl:value-of select="count(responsables/responsable)"/> 
                <xsl:text> RESPONSABLE</xsl:text>
                <xsl:if test="count(responsables/responsable) > 1">S</xsl:if>
            </h4>
            <!-- Fecha (primeros 10 caracteres: 2025-11-10) -->
            <h2>
                Fecha: <xsl:value-of select="substring(fechaHora, 1, 10)"/>
            </h2>
            
            <!-- Hora (caracteres 12-16: 11:00) -->
            <h2>
                Hora: <xsl:value-of select="substring(fechaHora, 12, 5)"/>
            </h2>
            
            <!-- Lugar -->
            <h2>
                Lugar: <xsl:value-of select="@sala"/>
            </h2>
            <!-- Lista de responsables -->
            <ul>
                <xsl:apply-templates select="responsables/responsable"/>
            </ul>
        </article>
    </xsl:template>
    <!-- Template para cada responsable -->
    <xsl:template match="responsable">
        <li>
            <xsl:value-of select="nomresponsable"/> - <xsl:value-of select="email"/>
        </li>
    </xsl:template>

</xsl:stylesheet>    


