<?php
// Inclusion de la connexion à la base de données
include 'connexion.php';

// Démarrer la session
session_start();

// Vérifier si le formulaire a été soumis
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Récupérer les données du formulaire
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Préparer la requête pour vérifier l'utilisateur
    $query = $pdo->prepare('
        SELECT * FROM _secusr 
        INNER JOIN courriers_specif_users ON _secusr.SECUSR_ID = courriers_specif_users.COURRIERS_SPECIF_USERS_SECUSR_ID 
        WHERE _secusr.SECUSR_LOGIN = :username AND courriers_specif_users.COURRIERS_SPECIF_USERS_PASSWORD = :password
    ');
    $query->execute([
        'username' => $username,
        'password' => $password,
    ]);
    $user = $query->fetch(PDO::FETCH_ASSOC);

    // Vérifier si l'utilisateur a été trouvé et est autorisé
    if ($user) {
        if($user['COURRIERS_SPECIF_USERS_AUTORISATION'] == 1) {
            // Définir une variable de session
            $_SESSION['user_logged_in'] = true;

            // Rediriger vers index.php
            header('Location: index.php');
            exit;
        } else {
            // Afficher un message d'erreur
            echo 'Mot de passe correct, mais vous n\'êtes pas autorisé';
        }
    } else {
        // Afficher un message d'erreur
        echo 'Nom d\'utilisateur ou mot de passe incorrect';
    }
}
?>





<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Formulaire de connexion</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="login.css">
  </head>
  <body>
  <div class="container">
  <div class="card">
    <h1 class="card-header text-center">Connexion</h1>
    <div class="card-body">
      <form method="POST" action="login.php">
        <div class="form-group">
          <label for="username">Nom d'utilisateur :</label>
          <input type="text" class="form-control opaque" id="username" name="username">
        </div>
        <div class="form-group">
          <label for="password">Mot de passe :</label>
          <div class="input-group">
            <input type="password" class="form-control opaque" id="password" name="password">
            <div class="input-group-append">
              <button type="button" class="btn btn-outline-secondary toggle-password" onclick="togglePasswordVisibility()" tabindex="-1">
                <i class="far fa-eye"></i>
              </button>
            </div>
          </div>
        </div>
        <button type="submit" class="btn btn-primary btn-block">Se connecter</button>
      </form>
    </div>
  </div>
</div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  </body>

</html>

<script>
  // La fonction togglePasswordVisibility() sera appelée lorsque l'utilisateur cliquera sur le bouton de bascule.
  function togglePasswordVisibility() {

    // Récupère l'élément input du mot de passe à partir de son ID.
    const passwordInput = document.getElementById("password");

    // Récupère le bouton de bascule en utilisant la classe CSS .toggle-password.
    const toggleButton = document.querySelector(".toggle-password");

    // Vérifie si le type d'entrée du mot de passe est actuellement défini sur "password".
    if (passwordInput.type === "password") {
      // Si oui, change le type d'entrée en "text" pour afficher le mot de passe.
      passwordInput.type = "text";

      // Modifie le contenu HTML du bouton pour afficher un oeil barré.
      toggleButton.innerHTML = '<i class="fa fa-eye-slash"></i>';
    } else {
      // Sinon, change le type d'entrée en "password" pour masquer le mot de passe.
      passwordInput.type = "password";

      // Modifie le contenu HTML du bouton pour afficher un oeil.
      toggleButton.innerHTML = '<i class="fa fa-eye"></i>';
    }
  }
</script>
