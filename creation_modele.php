<link rel="icon" type="image/x-icon" href="ressources/logo.ico" />

<?php
// Démarrer la session
session_start();

// Vérifier si l'utilisateur est connecté
if (!isset($_SESSION['user_logged_in'])) {
    // Rediriger vers connexion.php
    header('Location: login.php');
    exit;
}
// Connexion à la base de données
include 'connexion.php';

// Variable pour stocker le message de réussite
$message = '';

// Vérification de la soumission du formulaire
if($_SERVER['REQUEST_METHOD'] == 'POST') {
    $libelle_modele = $_POST['libelle_modele'];
    $contenu_modele = $_POST['contenu_modele'];

    // Insertion dans la base de données
    $sql = "INSERT INTO modele_courriers_specif (MODELE_COURRIERS_SPECIF_LIB, MODELE_COURRIERS_SPECIF_CONTENT) VALUES (?, ?)";
    $stmt= $pdo->prepare($sql);
    $result = $stmt->execute([$libelle_modele, $contenu_modele]);

    if($result) {
        $message = "Le modèle a été créé avec succès !";
    } else {
        $message = "Une erreur s'est produite lors de la création du modèle.";
    }
}

?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Création de modèle de courrier</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Création de modèle de courrier</h1>

    <?php if($message): ?>
        <div class="alert alert-success">
            <?= $message ?>
        </div>
    <?php endif; ?>

    <form method="POST" action="">
        <div class="form-group">
            <label for="libelle_modele">Nom du modèle :</label>
            <input type="text" class="form-control" id="libelle_modele" name="libelle_modele" required>
        </div>

        <div class="form-group">
            <label for="contenu_modele">Contenu du modèle :</label>
            <textarea class="form-control" id="contenu_modele" name="contenu_modele" rows="10" required></textarea>
        </div>

        <button type="submit" class="btn btn-primary">Créer le modèle</button>
    </form>
</div>
</body>
</html>
