#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione stato aggregato asset"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che il sistema calcoli correttamente lo stato dell'asset l'Utente possa visualizzare lo stato aggregato dell'asset durante la visualizzazione della lista degli asset 

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)



