#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Esportazione modello in xml"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa scaricare un file in formato XML contente le informazioni strutturali del modello

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



