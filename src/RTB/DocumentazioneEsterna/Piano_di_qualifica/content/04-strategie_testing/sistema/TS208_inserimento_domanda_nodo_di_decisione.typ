#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Inserimento domanda nodo di decisione"

#let data=(

  nome:test-name,

  descrizione:[

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



