<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:ca="http://www.univ-grenoble-alpes.fr/l3miage/medical/cabinet">
	<xsl:output method="html"/>
	
	<xsl:variable name="monprog">Ahmadou gueye</xsl:variable>
	<xsl:variable name="date">2024-09-25</xsl:variable>
	
	<xsl:template match="/">
		<html>
			<head>
				<title>Toto</title>
				<style>
					body {background-color: powderblue;}
					h1   {color: blue;}
					p    {color: red;}
					table, th,  td {
					border: 1px solid white;
					border-collapse: collapse;
					}
					th, td {
					background-color: #96D4D4;
					}
				</style>
			</head>
			<body>
				<h1>Page du cabinet</h1>
				<p>Il y a <xsl:value-of select="count(//ca:cabinet/ca:infirmiers/ca:infirmier)"/> références dans le magasin</p>
			</body>
		</html>
	</xsl:template>


</xsl:stylesheet>