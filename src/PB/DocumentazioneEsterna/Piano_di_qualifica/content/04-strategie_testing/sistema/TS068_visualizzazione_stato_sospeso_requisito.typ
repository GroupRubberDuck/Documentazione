#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione stato sospeso requisito"

#let data=(

  nome:test-name,

  descrizione:[

Verificare che l'Utente veda lo stato In corso quando la valutazione di una dipendenza è fallita o non è stata completata.
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



