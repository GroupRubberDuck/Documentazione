#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Inserimento domanda nodo di decisione"

#let data=(

  nome:test-name,

  descrizione:[
    Verificare che l'Utente possa inserire una domanda da associare al nodo
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



