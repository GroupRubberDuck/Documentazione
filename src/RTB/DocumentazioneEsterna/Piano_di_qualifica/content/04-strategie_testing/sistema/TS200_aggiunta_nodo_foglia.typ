#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Aggiunta nodo foglia"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa aggiungere correttamente un nodo foglia allo scheletro del decision tree
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



