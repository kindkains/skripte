<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="content-type" content="text/html;
charset=ISO-8859-1" />
<title>Gästebuch - Inka Spirit Germany</title>
<link href="../config.css" rel="stylesheet" type="text/css" />
<link rel="SHORTCUT ICON" href="http://www.inka-online.de/favicon.ico">

<meta name="description" content="Schamane in Neuwied, Schamanismus, seelenr&uuml;ckholung, Schamanische Heilsitzungen in Neuwied. Ich behandle nach einer uralten Inka Energiemedizin, welche k&ouml;rper, Geist und Seele heilt." />
<meta name="author" content="Sandro Isoletta" />
<meta name="keywords" content="Schamane, Schamanismus, elizabeth jenkins, anden, peru, qero, heiler, shamanic, Neuwied, gratis buch, download, seminar, vortrag, mediale heilreise, heilreise, seelenr&uuml;ckholung, soul retrieval, ausbildung, seminare, Schamanismus, inka, heilung, chakra, chakras, chakren, Energiemedizin, Koblenz, shaman, shamanic healing, sandro isoletta, alberto villoldo, martin brune, shamanic-healing, heilsitzung, aura, behandlung, geist, k&ouml;rper, seele, angst, depression, schmerzen, priester, besetzungen" />

</head>
<body background="../../../bilder/inka/hintergrund.gif" text="#990000" link="#0000CC" vlink="#000066" alink="#000000">
<body id="gaestebuch">
<div id="kopf">
<?php include("java.sdk");?>

<h1><a name="gaestebuch"></a>Gästebuch</h1>

<p>Lassen Sie doch einen lieben Gruß in meinem Gästebuch da!</p>
</div>



<div id="inhalt">
<h2>Gästebuch</h2>
</div>
<?php include("menu.inka.php");

// ACHTUNG!!! Damit das Gästebuch funktionieren kann,
// muss das Verzeichnis in dem das Gästebuch liegt 
// mit "chmod 777" für jeden les- und schreibbar gemacht werden.
// Sonst kann nicht darauf zugegriffen werden.

// Wo das Gästebuch abgelegt ist
$pfad = "../gaestebuch/gaestebuch.html";

if ($_POST["name"] && $_POST["kommentar"] && $_POST["email"]) {
// Einträge vorhanden, kann ins Gästebuch schreiben
    if (!($fp = fopen($pfad, "a"))) {
        echo "Fehler beim Öffnen des Gästebuches!"; exit;
    }

    echo "<A HREF=\"$pfad\">Gästebuch ansehen</A><P>";

    $eintrag = "
    <B>Absender</B>:    " . htmlspecialchars($_POST["name"])      . "<BR>
    <B>E-mail</B>:      " . htmlspecialchars($_POST["email"])     . "<BR>
    <B>Homepage</B>:    " . htmlspecialchars($_POST["home"])      . "<BR>
    <B>Gesendet am</B>: " . date("d. F Y H:i")                    . "<BR>
    <B>von Adresse</B>: " . $REMOTE_HOST . "/" . $REMOTE_ADDR     . "<P>
    <B>Beitrag</B>:<BR> " . htmlspecialchars($_POST["kommentar"]) . "<P>
	<br /><br />
	-------------------------------------------------------------------------
	<br /><br />
    ";

    if (!($ok = fwrite($fp, $eintrag, strlen($eintrag)))) {
        echo "<B>Fehler beim Beschreiben des Gästebuchs!</B>";
        exit;
    }
    fclose($fp);
    // Nachricht an den User nach 
    // Abschicken des Formulars:
    echo "<B>Vielen Dank für Ihren Eintrag.</B><P>";
    echo "</BODY>";
    echo "</HTML>";
    exit;
}

if ($_POST["ausgefuellt"]) {
    // Wenn der Name nicht ausgefüllt wurde:
    if (!$_POST["name"]) {
        echo "<font color=\"#FF0000\">Bitte geben Sie Ihren Namen ein!</font><BR>";
    }
    // Wenn die EMail-Adresse fehlt:
    if (!$_POST["email"]) {
        echo "<font color=\"#FF0000\">Bitte geben Sie Ihre EMail-Adresse ein!</font><BR>";
    }
    // Wenn das Kommentarfeld nicht ausgefüllt wurde:
    if (!$_POST["kommentar"]) {
        echo "<font color=\"#FF0000\">Bitte geben Sie ein Kommentar ein!</font><BR>";
    }
}

?>

<!-- das Formular mit den Eingabefelden -->
<B>Hier können Sie sich im Gästebuch verewigen</B>
<P>
<FORM ACTION="gaestebuch.php" METHOD="POST">
 <INPUT TYPE="HIDDEN" NAME="ausgefuellt" VALUE="1">

<!-- Texteingabefeld für den Namen -->
<B>Name* (zwingend erforderlich)</B><BR>
<INPUT TYPE="TEXT" NAME="name" SIZE="40">
<P>

<!-- Texteingabefeld für die Email-Adresse -->
<B>E-mail* (zwingend erforderlich)</B><BR>
<INPUT TYPE="TEXT" NAME="email" SIZE="40">
<P>

<!-- Texteingabefeld die Homepage -->
<B>Homepage (wenn vorhanden)</B><BR>
<INPUT TYPE="TEXT" NAME="home" SIZE="40">
<P>

<!-- Textarea für Kommentare -->
<B>Kommentar</B><BR>
<TEXTAREA ROWS="8" COLS="37" NAME="kommentar" WRAP="SOFT"></TEXTAREA>
<P>
<INPUT TYPE="SUBMIT" VALUE="Abschicken">
<INPUT TYPE="RESET" VALUE="Zurücksetzen">

</FORM>
<br /><br />
<br /><br /><center><a href="gaestebuch.php#gaestebuch">nach oben</a></center><br /><br /><br />
<?php require_once('footer.php');?>
</BODY>
</HTML>
