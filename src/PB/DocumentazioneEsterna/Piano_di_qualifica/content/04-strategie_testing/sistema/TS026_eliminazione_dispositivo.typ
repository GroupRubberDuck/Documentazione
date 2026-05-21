#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Eliminazione dispositivo"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa eliminare un dispositivo registrato nel sistema
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)



