#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Esportazione report di conformità"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa correttamente esportare i risultati della valutazione nella forma di report di conformità 
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



