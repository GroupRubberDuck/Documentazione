#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione nodo foglia modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare correttamente i nodi fogli dello scheletro di decision tree in fase di modifica del modello
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



