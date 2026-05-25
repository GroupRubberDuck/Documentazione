#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Eliminazione dispositivo diretta"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa eliminare un dispositivo registrato nel sistema senza effettuare un back up
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)



