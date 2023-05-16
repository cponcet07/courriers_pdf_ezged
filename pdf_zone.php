

<!-- Formulaire pour générer le PDF -->
<div class="d-flex justify-content-center">
    <form method="post" action="" target="blank" id="generate-pdf-form">
        <input type="hidden" name="texte" id="texte-hidden">
        <button type="submit" name="generate" class="btn btn-success mb-3" onclick="prepareTextForPdf();" id="generate-pdf-btn" disabled>
            <i class="fas fa-download fa-fw mr-2"></i> Générer PDF
        </button>
        <button type="submit" name="previsu" class="btn btn-success mb-3" onclick="prepareTextForPdf();" id="generate-pdf-btn-previsu">
            <i class="far fa-eye"></i> Visualiser PDF
        </button>
    </form>
</div>

<!-- Zone d'édition de texte -->
<div class="row d-flex justify-content-center">
    <div class="custom-editable-text">
        <div id="info-table-container" class="border"></div>
        <div id="editable-text" class="border form-control" contentEditable="true"></div>
    </div>
</div>
