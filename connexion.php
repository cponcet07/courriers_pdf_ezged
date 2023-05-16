<?php

// Connexion à la base de données
$host = "localhost";
$username = "root";
$password = "root";
$dbname = "nchp_ezged";

try {
    // Créer l'objet PDO pour la connexion
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    // Définir le mode d'erreur PDO à Exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    echo "Erreur : " . $e->getMessage();
}

?>