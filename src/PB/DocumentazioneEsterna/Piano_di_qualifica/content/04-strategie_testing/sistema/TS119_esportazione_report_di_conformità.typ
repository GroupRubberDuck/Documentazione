#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Esportazione report di conformità"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa correttamente esportare i risultati della valutazione in formato strutturato
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



