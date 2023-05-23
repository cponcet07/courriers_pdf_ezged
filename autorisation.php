<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="icon" type="image/x-icon" href="ressources/logo.ico" />

<?php
require 'connexion.php';
// Démarrer la session
session_start();

// Vérifier si l'utilisateur est connecté
if (!isset($_SESSION['user_logged_in'])) {
    // Rediriger vers connexion.php
    header('Location: login.php');
    exit;
}
// Récupérer la liste des utilisateurs
$query = "SELECT secusr_id, secusr_login FROM _secusr";
$stmt = $pdo->prepare($query);
$stmt->execute();
$users = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Traiter le formulaire soumis
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $userId = $_POST["user"];
    $password = $_POST["password"];

    // Insérer le mot de passe et l'ID utilisateur dans la table courriers_specif_users
    $insertQuery = "INSERT INTO courriers_specif_users (COURRIERS_SPECIF_USERS_SECUSR_ID, COURRIERS_SPECIF_USERS_PASSWORD) VALUES (:userId, :password)";
    $insertStmt = $pdo->prepare($insertQuery);
    $insertStmt->bindParam(':userId', $userId);
    $insertStmt->bindParam(':password', $password);
    $insertStmt->execute();

    echo "Mot de passe ajouté avec succès.";
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Ajouter un mot de passe utilisateur</title>
</head>
<body style="margin-left : 20px;">
    <h1>Ajouter un mot de passe utilisateur</h1>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <label for="user">Utilisateur :</label>
        <select name="user" id="user">
            <?php foreach ($users as $user): ?>
                <option value="<?php echo $user["secusr_id"]; ?>"><?php echo $user["secusr_login"]; ?></option>
            <?php endforeach; ?>
        </select>

        <label for="password">Mot de passe :</label>
        <input type="password" name="password" id="password" required>

        <button type="submit" class="btn btn-danger">Ajouter</button>
    </form>
</body>
</html>

