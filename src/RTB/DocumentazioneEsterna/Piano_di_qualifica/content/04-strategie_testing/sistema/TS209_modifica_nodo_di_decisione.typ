#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Modifica nodo di decisione"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa modificare le informazioni di nodi di decisione già inseriti nello scheletro del decision tree
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



