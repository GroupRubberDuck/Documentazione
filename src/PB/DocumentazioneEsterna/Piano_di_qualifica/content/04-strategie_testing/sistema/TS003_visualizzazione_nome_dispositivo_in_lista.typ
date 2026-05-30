#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione nome dispositivo in lista"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente, consultando la lista dei dispositivi registrati, visualizzi correttamente il nome associato a ogni singolo elemento
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)



