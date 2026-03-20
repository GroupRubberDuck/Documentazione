#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore file dispositivo non valido struttura"

#let data=(

  nome:test-name,

  descrizione:[

    Verificare che l'Utente possa visualizzare un messaggio di errore se il file selezionato in fase di importazione ha una struttura interna non interpretabile dal sistema
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



