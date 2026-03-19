#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Importazione modello file json"

#let data=(

  nome:test-name,

  descrizione:[

Verificare che l'utente possa inserire un nuovo modello tramite la funzione di importazione di un file JSON esterno
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



