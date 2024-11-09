<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:ca="http://www.univ-grenoble-alpes.fr/l3miage/medical/cabinet">
	<xsl:output method="html"/>
	
	<xsl:variable name="monprog">Ahmadou gueye</xsl:variable>
	<xsl:variable name="date">2024-09-25</xsl:variable>
	
	<xsl:template match="/">
		
		<!-- Page d'accueil -->
		<html>
			<head>
				<title>Cabinet Médical</title>
				<style>
					/* Ajouter un style de base pour la mise en forme */
					body { font-family: Arial, sans-serif; }
					h1 { color: #004080; }
					ul { list-style-type: none; padding: 0; }
					li { margin: 5px 0; }
					.menu { background-color: #cce6ff; padding: 10px; }
					.menu a { text-decoration: none; color: #004080; font-weight: bold; }
				</style>
			</head>
			<body>
				
				<!-- Titre et informations du cabinet -->
				<h1>Cabinet Médical: <xsl:value-of select="//ca:cabinet/@nom" /></h1>
				
				<!-- Menu de navigation -->
				<div class="menu">
					<ul>
						<li><a href="#infirmiers">Liste des Infirmiers</a></li>
						<li><a href="#patients">Liste des Patients</a></li>
						<li><a href="#actes">Liste des Actes</a></li>
					</ul>
				</div>
				
				<!-- Section des infirmiers -->
				<h2 id="infirmiers">Liste des Infirmiers</h2>
				<table border="1">
					<tr>
						<th>ID</th>
						<th>Nom</th>
						<th>Prénom</th>
						<th>Photo</th>
					</tr>
					<xsl:for-each select="//ca:cabinet/ca:infirmiers/ca:infirmier">
						<tr>
							<td><xsl:value-of select="@id" /></td>
							<td><xsl:value-of select="ca:nom" /></td>
							<td><xsl:value-of select="ca:prenom" /></td>
							<td><xsl:value-of select="ca:photo" /></td>
						</tr>
					</xsl:for-each>
				</table>
				
				<!-- Section des patients -->
				<h2 id="patients">Liste des Patients</h2>
				<table border="1">
					<tr>
						<th>Nom</th>
						<th>Prénom</th>
						<th>Sexe</th>
						<th>Numéro</th>
						<th>Date de Naissance</th>
						<th>Adresse</th>
					</tr>
					<xsl:for-each select="//ca:cabinet/ca:patients/ca:patient">
						<tr>
							<td><xsl:value-of select="ca:nom" /></td>
							<td><xsl:value-of select="ca:prenom" /></td>
							<td><xsl:value-of select="ca:sexe" /></td>
							<td><xsl:value-of select="ca:numero" /></td>
							<td><xsl:value-of select="ca:naissance" /></td>
							<td>
								<xsl:value-of select="concat(ca:adresse/ca:numero, ' ', ca:adresse/ca:rue, ', ', ca:adresse/ca:codePostal, ' ', ca:adresse/ca:ville)" />
							</td>
						</tr>
					</xsl:for-each>
				</table>
				
				<!-- Section des actes -->
				<h2 id="actes">Liste des Actes</h2>
				<table border="1">
					<tr>
						<th>ID</th>
						<th>Type</th>
						<th>Clé</th>
						<th>Coefficient</th>
					</tr>
					<xsl:for-each select="ca:cabinet/ca:acte/ca:actes/ca:acte">
						<tr>
							<td><xsl:value-of select="@id" /></td>
							<td><xsl:value-of select="@type" /></td>
							<td><xsl:value-of select="@clé" /></td>
							<td><xsl:value-of select="@coef" /></td>
						</tr>
					</xsl:for-each>
				</table>
			
			</body>
		</html>
	</xsl:template>


</xsl:stylesheet>