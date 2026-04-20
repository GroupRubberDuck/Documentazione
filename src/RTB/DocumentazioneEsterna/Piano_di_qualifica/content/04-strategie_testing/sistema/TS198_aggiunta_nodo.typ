#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Aggiunta nodo"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa aggiungere correttamente un nodo allo scheletro del decision tree
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



