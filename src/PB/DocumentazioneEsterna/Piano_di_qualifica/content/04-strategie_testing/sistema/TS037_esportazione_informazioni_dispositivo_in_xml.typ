#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Esportazione informazioni dispositivo in xml"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa esportare le informazioni relative al dispositivo in formato XML
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)



