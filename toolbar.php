
<div class="d-flex justify-content-center">
    <h3 class="my-4">Barre d'outils</h3>
</div>
<!-- Boutons pour modifier le texte -->
<div class="d-flex justify-content-center">
    <div class="btn-toolbar mb-3" role="toolbar">
        <button class="btn btn-primary mr-2" onclick="bold()" title="Gras">
            <i class="fas fa-bold"></i>
        </button>
        <button class="btn btn-primary mr-2" onclick="italic()" title="Italique">
            <i class="fas fa-italic"></i>
        </button>
        <button class="btn btn-primary mr-2" onclick="underline()" title="Souligné">
            <i class="fas fa-underline"></i>
        </button>
        <button class="btn btn-primary mr-2" onclick="$('#image-input').click()" title="Insérer une image">
            <i class="fas fa-image"></i>
        </button>
        <input type="file" id="image-input" accept="image/*" style="display:none;" onchange="insertImage()">

        <div class="input-group mr-2">
            <div class="input-group-prepend">
                <label class="input-group-text" for="fontSize">Taille :</label>
            </div>
            <select class="custom-select" id="fontSize" onchange="changeFontSize()">
                <option value="8">8</option>
                <option value="10">10</option>
                <option value="12">12</option>
                <option value="14">14</option>
                <option value="18">18</option>
                <option value="24">24</option>
                <option value="36">36</option>
            </select>
        </div>
        <button class="btn btn-primary mr-2" onclick="align('left')" title="Aligner à gauche">
            <i class="fas fa-align-left"></i>
        </button>
        <button class="btn btn-primary mr-2" onclick="align('center')" title="Centrer">
            <i class="fas fa-align-center"></i>
        </button>
        <button class="btn btn-primary mr-2" onclick="align('right')" title="Aligner à droite">
            <i class="fas fa-align-right"></i>
        </button>
        <input type="color" id="text-color" onchange="changeTextColor()" class="mr-2">
    </div>
</div>
