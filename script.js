// Fonction pour récupérer l'élément parent de la sélection de texte
function getSelectionParentElement() {
  var parentEl = null, sel;
  if (window.getSelection) {
    sel = window.getSelection();
    if (sel.rangeCount) {
      parentEl = sel.getRangeAt(0).commonAncestorContainer;
      if (parentEl.nodeType != 1) {
        parentEl = parentEl.parentNode;
      }
    }
  } else if ((sel = document.selection) && sel.type != "Control") {
    parentEl = sel.createRange().parentElement();
  }
  return parentEl;
}
// Fonction pour ajouter des balises HTML autour de la sélection de texte
function surroundSelection(tagName, styleAttribute) {
  var sel = window.getSelection();
  if (sel.rangeCount) {
    var range = sel.getRangeAt(0).cloneRange();
    // Parcourir tous les éléments qui se trouvent dans la sélection
    var startContainer = range.startContainer;
    var endContainer = range.endContainer;
    var startOffset = range.startOffset;
    var endOffset = range.endOffset;
    var currentNode = startContainer;
    while (currentNode !== null) {
      if (currentNode.nodeType === Node.ELEMENT_NODE) {
        if (range.intersectsNode(currentNode)) {
          var subRange = range.cloneRange();
          subRange.selectNode(currentNode);
          var parentEl = getSelectionParentElement(subRange);
          
          // Ajouter la balise autour de l'élément
          var wrapper = document.createElement(tagName);
          if (styleAttribute) {
            wrapper.setAttribute('style', styleAttribute);
          }
          subRange.surroundContents(wrapper);
          
          // Réinitialiser la sélection
          range.setStart(startContainer, startOffset);
          range.setEnd(endContainer, endOffset);
          sel.removeAllRanges();
          sel.addRange(range);
        }
      }
      currentNode = getNextNode(currentNode);
    }
  }
}
// Fonction pour récupérer le prochain noeud dans l'ordre de parcours en profondeur
function getNextNode(node) {
  if (node.firstChild) {
    return node.firstChild;
  }
  while (node) {
    if (node.nextSibling) {
      return node.nextSibling;
    }
    node = node.parentNode;
  }
  return null;
}
// Fonction pour appliquer le style "gras" au texte sélectionné
function bold() {
  surroundSelection('strong');
}
// Fonction pour appliquer le style "souligné" au texte sélectionné
function underline() {
  surroundSelection('span', 'text-decoration: underline;');
}
// Fonction pour appliquer le style "italique" au texte sélectionné
function italic() {
  surroundSelection('em');
}
// Fonction pour changer la taille de la police du texte sélectionné
function changeFontSize() {
  var fontSizeSelect = document.getElementById("fontSize");
  var fontSize = fontSizeSelect.value;
  var sel = window.getSelection();
  if (sel.rangeCount) {
    var range = sel.getRangeAt(0).cloneRange();
    var selectedText = range.toString();
    if (selectedText.length) {
      document.execCommand("fontSize", false, "7"); // Utilisez une taille de police temporaire (7)
      var parentElements = document.getElementsByTagName("font");
      for (var i = 0; i < parentElements.length; i++) {
        if (parentElements[i].size == "7") {
          parentElements[i].style.fontSize = fontSize + "px";
          parentElements[i].removeAttribute("size");
          parentElements[i].removeAttribute("face");
        }
      }
    } else {
      var parentElement = getSelectionParentElement();
      if (parentElement && parentElement.style.fontSize) {
        parentElement.style.fontSize = fontSize + "px";
      } else {
        surroundSelection('span', 'font-size: ' + fontSize + 'px;');
      }
    }
  }
}
// Fonction pour aligner le texte à gauche ou au centre
function align(type) {
  surroundSelection('div', 'text-align: ' + type + ';');
}
// Fonction pour préparer le texte pour le PDF
function prepareTextForPdf() {
  var editableText = document.getElementById("editable-text");
  var infoTableContainer = document.getElementById("info-table-container");
  var hiddenInput = document.getElementById("texte-hidden");
  var clonedEditableText = editableText.cloneNode(true);

  // Copier le contenu du conteneur 'info-table-container' et l'ajouter à 'clonedEditableText'
  var clonedInfoTableContainer = infoTableContainer.cloneNode(true);
  clonedEditableText.insertBefore(clonedInfoTableContainer, clonedEditableText.firstChild);

  var paragraphs = clonedEditableText.getElementsByTagName("p");

  for (var i = 0; i < paragraphs.length; i++) {
    var currentStyle = paragraphs[i].getAttribute("style") || "";
    paragraphs[i].setAttribute("style", currentStyle );
  }
  hiddenInput.value = clonedEditableText.innerHTML;
}
// Fonction pour changer la couleur du texte
function changeTextColor() {
  var color = document.getElementById("text-color").value;
  surroundSelection('span', 'color: ' + color + ';');
}
// Ajouter un écouteur d'événements pour détecter les modifications de texte
document.addEventListener("DOMContentLoaded", function() {
    const generatePdfBtn = document.getElementById('generate-pdf-btn');
    const editableText = document.getElementById('editable-text');
    
    editableText.addEventListener('input', () => {
      if (editableText.innerText.trim() === '') {
        generatePdfBtn.disabled = true;
      } else {
        generatePdfBtn.disabled = false;
      }
    });
  });  
function verifierExpediteur() {
    var selectExpediteur = document.getElementById('expediteur');
    var nouvelExpediteur = document.getElementById('nouvel_expediteur');
    
    if (selectExpediteur.value === 'nouvel_expediteur') {
        nouvelExpediteur.classList.remove('d-none');
    } else {
        nouvelExpediteur.classList.add('d-none');
    }
}
function ajouterInformations() {
  // Créer un tableau HTML
  var table = $('<table></table>').addClass('info-table');
  // Récupérer le nom de l'expéditeur sélectionné
  var expediteur = $('#expediteur').val();     
  // Vérifier si l'expéditeur est 'nouvel_expediteur'
  if (expediteur === 'nouvel_expediteur') {
      expediteur = $('#nouvel_expediteur').val();
  }


  // Ajouter l'expéditeur au tableau
  if (expediteur) {
      table.append('<tr><td style="white-space: nowrap;"><strong>Expediteur :</strong></td><td>' + expediteur + '</td></tr>');
  }
  // Récupérer le nom du destinataire sélectionné
  var destinataire = $('#destinataire').val();
  // Ajouter le destinataire au tableau
  if (destinataire) {
      table.append('<tr><td style="white-space: nowrap;"><strong>Destinataire :</strong></td><td>' + destinataire + '</td></tr>');
  } 
  // Récupérer l'email saisi
  var mail = $('#mail').val();
  // Ajouter l'email au tableau
  if (mail) {
      table.append('<tr><td style="white-space: nowrap;"><strong>Email :</strong></td><td>' + mail + '</td></tr>');
  }
  // Récupérer le tel saisi
  var tel = $('#tel').val();
  // Ajouter le tel au tableau
  if (tel) {
      table.append('<tr><td style="white-space: nowrap;"><strong>N° Tel :</strong></td><td>' + tel + '</td></tr>');
  } 
  // Récupérer l'objet saisi
  var objet = $('#objet').val();
  // Ajouter l'objet au tableau
  if (objet) {
      table.append('<tr><td style="white-space: nowrap;"><strong>Objet :</strong></td><td>' + objet + '</td></tr>');
  }
  // Créer un div pour encapsuler le tableau
  var divTable = $('<div></div>').addClass('info-table-container');
  // Ajouter le tableau au div
  divTable.append(table);
  // Ajouter le div à la zone d'information
  $('#info-table-container').html(divTable); // Utilisez .html() pour remplacer le contenu précédent
  // Désactiver l'édition de la zone de texte du tableau uniquement
  divTable.attr('contenteditable', 'false');
}

function insertImage() {
  var file = document.getElementById('image-input').files[0];
  var reader = new FileReader();
  reader.onloadend = function() {
    var img = document.createElement('img');
    img.src = reader.result;
    img.style.maxWidth = '100%';
    var editableText = document.getElementById('editable-text');
    editableText.focus();
    var sel = window.getSelection();
    var range;
    if (sel.getRangeAt && sel.rangeCount) {
      range = sel.getRangeAt(0);
      range.deleteContents();
      var el = document.createElement("div");
      el.innerHTML = img.outerHTML;
      var frag = document.createDocumentFragment(), node, lastNode;
      while ((node = el.firstChild)) {
        lastNode = frag.appendChild(node);
      }
      range.insertNode(frag);
    }
  };
  if (file) {
    reader.readAsDataURL(file);
  }
}
// Récupérer le bouton de prévisualisation
var previewButton = document.getElementById("preview-pdf-btn");
// Ajouter l'événement onclick pour ouvrir la nouvelle fenêtre
previewButton.onclick = function() {
    window.open("<?php echo $full_path_preview; ?>");
};

document.getElementById('generate-pdf-form').addEventListener('submit', function(event) {
  event.preventDefault();
  let form = event.target;

  // Vérifie si le bouton "Visualiser" a été cliqué
  if (form.previsu) {
      // Récupérer le contenu de la zone de texte et l'envoyer au serveur
      document.getElementById('texte-hidden').value = document.getElementById('editable-text').innerHTML;

      let formData = new FormData(form);
      let xhr = new XMLHttpRequest();

      xhr.onreadystatechange = function() {
          if (this.readyState === 4 && this.status === 200) {
              let pdfPath = this.responseText;
              window.open(pdfPath, '_blank');
          }
      };

      xhr.open('POST', '', true);
      xhr.send(formData);
  } else {
      form.submit();
  }
});


