#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Eliminazione dispositivo con backup json"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa eliminare un dispositivo e scaricare un back up in formato JSON prima dell'eliminazione definitiva

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)



