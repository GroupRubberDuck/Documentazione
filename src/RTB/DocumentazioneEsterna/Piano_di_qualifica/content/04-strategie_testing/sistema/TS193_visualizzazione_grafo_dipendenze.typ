#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione grafo dipendenze"

#let data=(

  nome:test-name,

  descrizione:[
  Verificare che il sistema generi correttamente i grafi delle dipendenze del requisito
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



