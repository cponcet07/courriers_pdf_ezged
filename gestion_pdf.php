<?php
    // Inclure la bibliothèque TCPDF
    require_once('tcpdf/tcpdf.php');
    require_once('tcpdf/tcpdf_import.php');

    // Vérifier si l'utilisateur a soumis du texte
    if (isset($_POST['texte'])) {
        // Récupérer le texte soumis
        $texte = $_POST['texte'];

        // Ajouter des sauts de ligne pour que le tableau du formulaire s'affiche après l'entête
        $nombreDeSautsDeLigne = 7; //modifier cette valeur en fonction de la hauteur de l'entête
        for ($i = 0; $i < $nombreDeSautsDeLigne; $i++) {
            $texte = '<br>' . $texte;
        }

        // Générer un pdf
        $pdf = new TCPDF();
        $pdf->AddPage();
        $pdf->SetFont('times', '', 12);

        // Ajouter une image de fond
        $pdf->SetAutoPageBreak(false, 0); // Désactiver les sauts de page automatiques
        $pdf->Image('ressources/bg.jpg', 0, 0, $pdf->getPageWidth(), $pdf->getPageHeight(), '', '', '', false, 300, '', false, false, 0, false, false, false);

        $pdf->writeHTML($texte, true, false, true, false, '');

        // Choisir le dossier pour stocker les PDF générés sur le serveur
        if (isset($_POST['previsu'])) {
            $folder_path = 'D:\\nchp\\usr\\local\\nchp\\ezged\\www\\specif\\create_courriers\\previsu';
            

            // Enregistrer le fichier PDF sur le serveur
            $filename = 'exemple_' . rand(1000, 9999) . '.pdf';
            $full_path = $folder_path . $filename;
            $pdf->Output($full_path, 'F');

            // Ouvrir le fichier PDF dans le navigateur
            header('Content-Type: application/pdf');
            header('Content-Disposition: inline; filename="' . $filename . '"');
            header('Cache-Control: private, max-age=0, must-revalidate');
            header('Pragma: public');
            readfile($full_path);
        } else {
            $folder_path = 'D:\\Dossiers_Surveillances\\Courriers_Arrives\\previsu';

            // Enregistrer le fichier PDF sur le serveur
            $filename = 'exemple_' . rand(1000, 9999) . '.pdf';
            $full_path = $folder_path . $filename;
            $pdf->Output($full_path, 'F');
            
            // Afficher un message de confirmation
            echo '<div class="alert alert-success mt-4" role="alert">Le PDF a été généré avec succès !</div>';
        }
    }
?>