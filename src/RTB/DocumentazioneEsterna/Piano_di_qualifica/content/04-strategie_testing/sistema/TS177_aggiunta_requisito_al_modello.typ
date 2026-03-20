#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Aggiunta requisito al modello"

#let data=(

  nome:test-name,

  descrizione:[
Verifica che l'utente possa aggiungere un requisito al modello in fase di modifica di esso
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



