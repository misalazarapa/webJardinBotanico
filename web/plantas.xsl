<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" doctype-system="about:legacy-compat" encoding="utf-8"/>
    
    <xsl:template match="/jardinBotanico">
        <html>
            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
                <meta charset="utf-8"/>
                <meta name="description" content="Página de plantas"/>
                <title>Plantas - Jardín Botánico</title>
            </head>
            
            <body>
                <header>
                    <img src="../img/logotipo.png" alt="Logotipo"/>
                    <a href="zonas.xml">Zonas</a>
                    <a href="plantas.xml">Plantas</a>
                    <a href="actividades.xml">Actividades</a>
                </header>
                
                <main id="jardinbotanico">
                    <h1>PLANTAS</h1>
                    
                    <!-- Aquí aplicamos templates para cada planta -->
                    <xsl:apply-templates select="plantas/planta"/>
                    
                </main>
                
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>
    
    <!-- Template para cada planta -->
    <xsl:template match="planta">
        <article class="articulo">
            <!-- Imagen de la planta -->
            <img class="imagen" src="../img/{@foto}" alt="{nombreComun}"/>
            
            <!-- Si luminosidad es Alta, mostrar icono del sol -->
            <xsl:if test="luminosidad = 'Alta'">
                <img src="../img/Alta.png" class="alta-icono" alt="Luminosidad alta"/>
            </xsl:if>
            
            <!-- Nombre común con enlace a Wikipedia usando la familia -->
            <h2>
                <a href="https://es.wikipedia.org/wiki/{@familia}" target="_blank">
                    <xsl:value-of select="nombreComun"/>
                </a>
            </h2>
            
            <!-- Luminosidad -->
            <h3><xsl:value-of select="luminosidad"/></h3>
        </article>
    </xsl:template>
    
</xsl:stylesheet>