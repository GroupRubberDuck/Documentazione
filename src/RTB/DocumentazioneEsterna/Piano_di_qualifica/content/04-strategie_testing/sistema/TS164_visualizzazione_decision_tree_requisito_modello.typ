#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione decision tree requisito modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa visualizzare lo scheletro del decision tree durante la visualizzazione del dettaglio del requisito in fase di modifica del modello 
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



