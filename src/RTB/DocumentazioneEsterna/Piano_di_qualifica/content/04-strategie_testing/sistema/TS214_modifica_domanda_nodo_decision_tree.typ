#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Modifica domanda nodo decision tree"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa modifcare e salvare una domanda
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



