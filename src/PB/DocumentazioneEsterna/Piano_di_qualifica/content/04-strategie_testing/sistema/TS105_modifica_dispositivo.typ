#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Modifica dispositivo"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa modificare le informazioni del dispositivo

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)



