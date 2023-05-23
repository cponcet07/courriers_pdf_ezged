<?php

// Récupérer les destinataires
$expediteurs_query = $pdo->query("SELECT CAP_CONTACT_LIB FROM cap_contact");
$expediteurs = $expediteurs_query->fetchAll(PDO::FETCH_ASSOC);

// Récupérer les expéditeurs
$destinataires_query = $pdo->query("SELECT V_SECUSR_MAIRIE_COLLECTIVITE_LOGIN FROM v_secusr_mairie_collectivite");
$destinataires = $destinataires_query->fetchAll(PDO::FETCH_ASSOC);

?>
<div class="container">
    <div class="row">
        <div class="col-md-6 form-group text-center">
            <div class="d-flex justify-content-center">
                <select class="form-control objet" id="expediteur" name="expediteur" onchange="verifierExpediteur()">
                    <option value="">Sélectionnez un expéditeur</option>
                    <?php foreach ($expediteurs as $expediteur) : ?>
                        <option value="<?= $expediteur['CAP_CONTACT_LIB'] ?>"><?= $expediteur['CAP_CONTACT_LIB'] ?></option>
                    <?php endforeach; ?>
                    <option value="nouvel_expediteur" style="font-weight:bold;">Ajouter un nouvel expéditeur</option>
                    <input type="text" class="form-control objet d-none" id="nouvel_expediteur" name="nouvel_expediteur" placeholder="Nom de l'expéditeur">
                </select>
            </div>
        </div>
        <div class="col-md-6 form-group text-center">
            <div class="d-flex justify-content-center">
                <input type="text" class="form-control objet" id="objet" name="objet" placeholder="Saisissez un objet">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 form-group text-center">
            <div class="d-flex justify-content-center">
                <select class="form-control objet" id="destinataire" name="destinataire">
                    <option value="">Sélectionnez un destinataire</option>
                    <?php foreach ($destinataires as $destinataire) : ?>
                        <option value="<?= $destinataire['V_SECUSR_MAIRIE_COLLECTIVITE_LOGIN'] ?>"><?= $destinataire['V_SECUSR_MAIRIE_COLLECTIVITE_LOGIN'] ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
        </div>
        <div class="col-md-6 form-group text-center">
            <div class="d-flex justify-content-center">
                <input type="text" class="form-control mail" id="mail" name="mail" placeholder="Saisissez le mail">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 form-group text-center">
            <div class="d-flex justify-content-center">
                <select class="form-control" id="modele" name="modele" style="width : 300px;">
                    <option value="">Sélectionnez un modèle de courrier</option>
                    <option value="fermeture_route">Demande de fermeture de route</option>
                    <!-- Ajoutez autant d'options que nécessaire pour vos modèles -->
                    </select>
            </div>
        </div>
        <div class="col-md-6 form-group text-center">
            <div class="d-flex justify-content-center">
                <input type="text" class="form-control tel" id="tel" name="tel" placeholder="Saisissez le N° de tel">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 form-group text-center">
            <div class="d-flex justify-content-center">
                <button type="button" class="btn btn-primary mb-3" onclick="ajouterInformations();chargerModele()">
                    <i class="fa fa-plus-circle fa-fw mr-2"></i>Ajouter les informations
                </button>
            </div>
        </div>
    </div>
</div>




<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


