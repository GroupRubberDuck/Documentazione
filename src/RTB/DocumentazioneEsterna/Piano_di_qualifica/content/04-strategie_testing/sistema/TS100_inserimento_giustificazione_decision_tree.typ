#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Inserimento giustificazione decision tree"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa inserire una giustificazione al percorso decisionale all'interno del decision tree
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



