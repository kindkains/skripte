<?php

// Aufgabe: BMI-Rechner

// Der BMI berechnet sich aus dem Körpergewicht [kg] dividiert durch das Quadrat der Körpergröße [m2]. Die Formel lautet:
// BMI = Körpergewicht : (Körpergröße in m)2. Die Einheit des BMI ist demnach kg/m2.
// Dies bedeutet, eine Person mit einer Körpergröße von 160 cm und einem Körpergewicht von 60 kg hat einen BMI von 23,4
// [60 : (1,6 m)2 = 23,4].

$gr = 1.71;
$gew = 95;

$ergebnis= $gew / ($gr*$gr);

echo "Der BMI beträgt: ";
echo $ergebnis;

?>
