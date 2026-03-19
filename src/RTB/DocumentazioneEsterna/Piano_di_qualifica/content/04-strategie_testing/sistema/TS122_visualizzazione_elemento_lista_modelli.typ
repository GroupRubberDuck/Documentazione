#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione elemento lista modelli"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare le informazioni generali di ogni modello nella lista dei modelli
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



