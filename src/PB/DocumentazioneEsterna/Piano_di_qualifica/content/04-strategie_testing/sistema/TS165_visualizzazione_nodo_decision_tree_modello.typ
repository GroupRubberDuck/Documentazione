#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione nodo decision tree modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa visualizzare ogni nodo dello scheletro del decision tree in fase di modifica del modello
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



