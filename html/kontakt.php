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

<form action="/system-cgi/formmailc.pl" method="POST">
  <input type=hidden name="recipient" value="webmaster@inka-online.de"><br>
  <input type=text name="realname" size="20" value="Name"><br>
  <input type=text name="email" size="20" value="Email"><br>
  <input type=text name="subject" size="20" value="Subjekt"><br>
  <textarea rows="2" name="message" cols="20"></textarea><br>
  <input type="submit" value="Weiter" name="Submit">
</form> 

<br /><br /><center><a href="kontakt.php#kontakt">nach oben</a></center>

<?php require_once('footer.php');?>
</div>
</body>
</html>
