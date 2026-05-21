#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore modifica nome dispositivo non valido"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare un messaggio di errore se inserisce un nome non valido

(ovvero un nome di lunghezza non compresa tra 1 e 64 caratteri)
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)



