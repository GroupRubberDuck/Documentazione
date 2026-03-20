#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Avvio modifica struttura modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa avviare il processo di modifica della struttura di un modello
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



