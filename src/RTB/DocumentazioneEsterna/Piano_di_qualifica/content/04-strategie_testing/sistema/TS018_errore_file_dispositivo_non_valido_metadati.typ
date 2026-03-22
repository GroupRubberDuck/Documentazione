#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore file dispositivo non valido metadati"

#let data=(

  nome:test-name,

  descrizione:[

    Verificare che l'Utente possa visualizzare un messaggio di errore se il file selezionato in fase di importazione ha una dimensione di 0 byte o maggiore di 10 MB
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



