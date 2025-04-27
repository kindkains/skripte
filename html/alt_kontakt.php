<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="content-type" content="text/html;
charset=ISO-8859-1" />
<title>Kontaktformular - Inka Spirit Germany</title>
<link href="config.css" rel="stylesheet" type="text/css" />
<link rel="SHORTCUT ICON" href="http://www.inka-online.de/favicon.ico">

<meta name="description" content="Schamane in Neuwied, Schamanismus, seelenr&uuml;ckholung, Schamanische Heilsitzungen in Neuwied. Ich behandle nach einer uralten Inka Energiemedizin, welche k&ouml;rper, Geist und Seele heilt." />
<meta name="author" content="Sandro Isoletta" />
<meta name="keywords" content="Schamane, Schamanismus, elizabeth jenkins, anden, peru, qero, heiler, shamanic, Neuwied, gratis buch, download, seminar, vortrag, mediale heilreise, heilreise, seelenr&uuml;ckholung, soul retrieval, ausbildung, seminare, Schamanismus, inka, heilung, chakra, chakras, chakren, Energiemedizin, Koblenz, shaman, shamanic healing, sandro isoletta, alberto villoldo, martin brune, shamanic-healing, heilsitzung, aura, behandlung, geist, k&ouml;rper, seele, angst, depression, schmerzen, priester, besetzungen" />

</head>
<body background="../../bilder/inka/hintergrund.gif" text="#990000" link="#0000CC" vlink="#000066" alink="#000000">
<body id="kontakt">
<div id="kopf">
<?php include("java.sdk");?>

<h1><a name="kontakt"></a>Kontaktformular</h1>
</div>

<?php include("menu.inka.php"); ?>

<div id="inhalt">

<?php
// wenn das Formular übermittelt wurde
if(isset($_POST['abschicken'])){
	while(list($feld,$wert)=each($_POST)){
		// übermittelte Inhalte "entschärfen"
		$wert=preg_replace("/(content-type:|bcc:|cc:|to:|from:)/im", "",$wert);
		$$feld=$wert;
		// die übermittelten Variablen werden zum "Text der Email" zusammengefasst
		if($feld!="abschicken") $mailnachricht.=ucfirst($feld).": $wert\n";
	}
	$mailnachricht.="\nDatum/Zeit: ". date("d.m.Y H:i:s");
	// Überprüfen ob alle Pflichtfelder gefüllt sind
	empty($nachname) ? $err[] = "<p>- Bitte den Nachnamen angeben.</p>" : false;
	empty($vorname) ? $err[] = "<p>- Bitte den Vornamen angeben.</p>" : false;
	empty($email) ? $err[] = "<p>- Bitte die Email-Adresse angeben.</p>" : false;
	empty($text) ? $err[] = "<p>- Welchen Wunsch haben Sie? Bitte den Text eingeben.</p>" : false;
	// wenn nicht, werden die Fehlermeldungen ausgegeben und das "halbgefüllte" Formular angezeigt
	if(!empty($err)) {
		echo "<p>Bitte korrigieren Sie folgende Fehler:</p>";
		foreach($err as $fehler){
			echo $fehler;
		} ?>
		<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
	  <table width="100%" border="0" cellpadding="3" cellspacing="1">
		<tr><td width="140" align="right">*Nachname:</td><td align="left"><input type="text" name="nachname" value="<?php echo $nachname; ?>" style="width:100%;" /></td></tr>
		<tr><td align="right">*Vorname:</td><td align="left"><input type="text" name="vorname" value="<?php echo $vorname; ?>" style="width:100%" /></td></tr>
		<tr><td align="right">Firma:</td><td align="left"><input type="text" name="firma" value="<?php echo $firma; ?>" style="width:100%" /></td></tr>
		<tr><td align="right">Postanschrift:</td><td align="left"><input type="text" name="strasse" value="<?php echo $strasse; ?>" style="width:100%" /></td></tr>
		<tr><td align="right">Telefon:</td><td align="left"><input type="text" name="telefon" value="<?php echo $telefon; ?>" style="width:100%" /></td></tr>
		<tr><td align="right">*E-Mail:</td><td align="left"><input type="text" name="email" value="<?php echo $email; ?>" style="width:100%" /></td></tr>
		<tr><td colspan="2"><textarea rows="12"  style="width:100%" name="text"><?php echo $text; ?></textarea></td><td> </td></tr>
		<tr><td colspan="2" align="left" nowrap><br /><input type="reset" value="Formular löschen" style="width:49%" />  <input type="submit" name="abschicken" class="button" value="Formular absenden" style="width:49%" /></td></tr>
	  </table>
		</form>
		<p>*Pflichtfelder</p>
<?php    // sind keine Fehler vorhanden, wird die Email versendet
	} else {
		$mailbetreff="Kontaktformular ".$_SERVER['HTTP_HOST'];
		// HIER DIE EMPFÄNGER EMAIL-ADRESSE ANPASSEN!!!       
		echo (mail("webmaster@inka-online.de", $mailbetreff, $mailnachricht, "From: $email")) ? "<p>Vielen Dank für Ihre eMail!</p>": "<p>Ein Fehler ist aufgetreten!</p>";
	}
// das Formular welches als erstes dem Besucher angezeigt wird
} else { ?>
		<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
	  <table width="100%" border="0" cellpadding="3" cellspacing="1">
		<tr><td width="140" align="right">*Nachname:</td><td align="left"><input type="text" name="nachname" value="" style="width:100%;" /></td></tr>
		<tr><td align="right">*Vorname:</td><td align="left"><input type="text" name="vorname" value="" style="width:100%" /></td></tr>
		<tr><td align="right">Firma:</td><td align="left"><input type="text" name="firma" value="" style="width:100%" /></td></tr>
		<tr><td align="right">Postanschrift:</td><td align="left"><input type="text" name="strasse" value="" style="width:100%" /></td></tr>
		<tr><td align="right">Telefon:</td><td align="left"><input type="text" name="telefon" value="" style="width:100%" /></td></tr>
		<tr><td align="right">*E-Mail:</td><td align="left"><input type="text" name="email" value="" style="width:100%" /></td></tr>
		<tr><td colspan="2"><textarea rows="12"  style="width:100%" name="text"></textarea></td><td> </td></tr>
		<tr><td colspan="2" align="left" nowrap><br /><input type="reset" value="Formular löschen" style="width:49%" />  <input type="submit" name="abschicken" value="Formular absenden" style="width:49%" /></td></tr>
	  </table>
		</form>
		<p>*Pflichtfelder</p>
		<br />
		<br />
		<br />
		
		
<?php
}
?>

<br /><br /><center><a href="kontakt.php#kontakt">nach oben</a></center>

<?php require_once('footer.php');?>
</div>
</body>
</html>
