<?php

// Simple Counter v1.0
// Für die korrekte Funktionsweise des Counters ist darauf zu
// achten, dass die entsprechenden Schreibrechte auf dem
// Webserver gesetzt sind.

// Counterdateiname
$datei="counter/counter.txt";

// Anzahl der führenden Nullen
$stellen = 7;

if(file_exists($datei)){
  // Falls die Datei existiert, wird sie ausgelesen und
  // der dort enthaltene Wert um Eins erhöht.
  $fp=fopen($datei,"r+");
  $zahl=fgets($fp,$stellen);
  $zahl++;
  rewind($fp);
  flock($fp,2);
  fputs($fp,$zahl,$stellen);
  flock($fp,3);
  fclose($fp);
}else{
  // Die Datei counter.txt existiert nicht, sie wird
  // neu angelegt und mit dem Wert 1 gefüllt.
  $fp=fopen($datei,"w");
  $zahl="1";
  fputs($fp,$zahl,$stellen);
  fclose($fp);
}

// Diese Funktion sorgt für die Formatierung
// in diesem Fall für die führenden Nullen
$zahl=sprintf("%0".$stellen."d",$zahl);

?>
