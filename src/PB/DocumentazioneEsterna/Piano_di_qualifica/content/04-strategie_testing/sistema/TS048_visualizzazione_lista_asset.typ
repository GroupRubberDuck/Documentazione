#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione lista asset"

#let data=(

  nome:test-name,

  descrizione:[
Verificare  che l'Utente possa visualizzare la lista degli asset associati al dispositivo
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)



