#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Eliminazione dispositivo con backup xml"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa eliminare un dispositivo e scaricare un back up in formato XML prima dell'eliminazione definitiva

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



