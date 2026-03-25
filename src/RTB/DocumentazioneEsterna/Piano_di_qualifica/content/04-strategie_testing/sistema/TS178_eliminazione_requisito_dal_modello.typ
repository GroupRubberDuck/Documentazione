#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Eliminazione requisito dal modello"

#let data=(

  nome:test-name,

  descrizione:[
    Verificare che l'Utente possa eliminare un requisito dal modello in fase di modifica di esso
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



