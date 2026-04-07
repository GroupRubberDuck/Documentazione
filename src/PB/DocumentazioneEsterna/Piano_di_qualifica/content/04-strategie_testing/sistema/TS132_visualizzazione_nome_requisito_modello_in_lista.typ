#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione nome requisito modello in lista"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare il nome associato a ogni elemento della lista dei requisiti previsti da uno specifico modello 

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



