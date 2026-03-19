#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione elemento lista dispositivi"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente, consultando la lista dei dispositivi registrati, visualizzi per ciascun elemento le relative informazioni generali
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



