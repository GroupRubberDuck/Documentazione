#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Valutazione nodo di decisione"

#let data=(

  nome:test-name,

  descrizione:[
    Verificare che l'Utente possa eseguire la valutazione di uno specifico nodo di decisione del decision tree
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



