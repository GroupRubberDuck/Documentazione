#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione lista dipendenze requisito"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare la lista delle dipendenze del requisito
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)



