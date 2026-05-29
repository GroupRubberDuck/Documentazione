#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Nessuna risposta associata a nodo"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente visualizzi l'assenza di una risposta associata al nodo di decisione del decision tree

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)



