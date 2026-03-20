#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Navigazione nodo precedente"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa passare alla visualizzazione del nodo precedente 
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



