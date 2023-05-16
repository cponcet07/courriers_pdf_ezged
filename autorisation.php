<?php
require 'connexion.php';

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
<body>
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

        <button type="submit">Ajouter</button>
    </form>
</body>
</html>
