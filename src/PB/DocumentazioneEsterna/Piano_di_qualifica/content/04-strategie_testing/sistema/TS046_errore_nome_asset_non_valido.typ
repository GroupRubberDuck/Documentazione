#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore nome asset non valido"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare un messaggio di avviso se inserisce un nome per l'asset non valido
(ovvero non compreso tra 1 e 32 caratteri)
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



