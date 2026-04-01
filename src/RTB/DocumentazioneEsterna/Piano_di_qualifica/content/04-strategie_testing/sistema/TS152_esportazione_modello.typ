#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Esportazione modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa scaricare un file contenente le informazioni strutturali del modello
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



