

<?php 
// Démarrer la session
session_start();

// Vérifier si l'utilisateur est connecté
if (!isset($_SESSION['user_logged_in'])) {
    // Rediriger vers connexion.php
    header('Location: login.php');
    exit;
}

// Inclusion de la connexion à la bdd
include 'connexion.php';

// Inclusion de la gestion du PDF final
include 'gestion_pdf.php';

?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Editeur de texte</title>
    </head>
    <body>
        <div class="d-flex justify-content-center">
            <h1 class="my-4">Créer un courrier</h1>
        </div>

        <?php
            // Inclusion des scripts + CSS
            include 'link.php';          

            // Inclusion du formulaire de contact
            include 'formulaire_contact.php';

            // Inclusion de la barre d'outils pour modifier le texte
            include 'toolbar.php';

            // Inclusion des 2 boutons pour la gestion des pdf + de la zone de saisie
            include 'pdf_zone.php';
        ?>
        
        <footer class="bg-light text-center py-3">
            <p>&copy; CAP BUREAUTIQUE</p>
        </footer>
    </body>
</html>
