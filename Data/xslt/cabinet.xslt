<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:ca="http://www.univ-grenoble-alpes.fr/l3miage/medical/cabinet">
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>

	<xsl:variable name="programmer">Ahmadou Gueye</xsl:variable>
	<xsl:variable name="date">2024-11-22</xsl:variable>

	<xsl:template match="/">
		<html>
			<head>
				<title>Cabinet Médical</title>
				<style>
					body { font-family: Arial, sans-serif; margin: 20px; }
					h1, h2 { color: #2C3E50; }
					table { width: 100%; border-collapse: collapse; margin: 20px 0; }
					table, th, td { border: 1px solid #ddd; }
					th, td { padding: 8px; text-align: left; }
					th { background-color: #f4f4f4; }
					.menu { margin-bottom: 20px; }
					.menu a { margin-right: 15px; text-decoration: none; color: #2980B9; }
				</style>
			</head>
			<body>
				<!-- Header -->
				<h1>Cabinet Médical: <xsl:value-of select="//ca:cabinet/@nom" /></h1>
				<p>Généré par: <xsl:value-of select="$programmer" /> | Date: <xsl:value-of select="$date" /></p>

				<!-- Navigation Menu -->
				<div class="menu">
					<a href="#infirmiers">Infirmiers</a>
					<a href="#patients">Patients</a>
					<a href="#actes">Actes</a>
				</div>

				<!-- Infirmiers Section -->
				<h2 id="infirmiers">Liste des Infirmiers</h2>
				<table>
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

				<!-- Patients Section -->
				<h2 id="patients">Liste des Patients</h2>
				<table>
					<tr>
						<th>Nom</th>
						<th>Prénom</th>
						<th>Sexe</th>
						<th>Numéro Sécurité Sociale</th>
						<th>Date de Naissance</th>
						<th>Adresse</th>
					</tr>
					<xsl:for-each select="//ca:cabinet/ca:patients/ca:patient">
						<tr>
							<td><xsl:value-of select="ca:nom" /></td>
							<td><xsl:value-of select="ca:prenom" /></td>
							<td><xsl:value-of select="ca:sexe" /></td>
							<td><xsl:value-of select="ca:numeroSecu" /></td>
							<td><xsl:value-of select="ca:naissance" /></td>
							<td>
								<xsl:value-of select="concat(ca:adresse/ca:numero, ' ', ca:adresse/ca:rue, ', ', ca:adresse/ca:codePostal, ' ', ca:adresse/ca:ville)" />
							</td>
						</tr>
					</xsl:for-each>
				</table>

				<!-- Actes Section -->
				<h2 id="actes">Liste des Actes</h2>
				<table>
					<tr>
						<th>ID</th>
						<th>Type</th>
						<th>Clé</th>
						<th>Coefficient</th>
					</tr>
					<xsl:for-each select="//ca:cabinet/ca:acte/ca:actes/ca:acte">
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
