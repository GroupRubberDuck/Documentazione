#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore modifica nome modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare un messaggio di errore e che il sistema blocchi la modifica se l'Utente ha inserito un nuovo nome per il modello di lunghezza non compresa tra 1 e 32 caratteri
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



