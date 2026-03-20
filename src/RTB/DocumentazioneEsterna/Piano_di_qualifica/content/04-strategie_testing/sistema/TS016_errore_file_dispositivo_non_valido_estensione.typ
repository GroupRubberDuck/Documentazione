#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore file dispositivo non valido estensione"

#let data=(

  nome:test-name,

  descrizione:[
    Verificare che l'Utente possa visualizzare un messagio di errore se il file selezionato in fase di importazione ha un formato non supportato dal sistema
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



