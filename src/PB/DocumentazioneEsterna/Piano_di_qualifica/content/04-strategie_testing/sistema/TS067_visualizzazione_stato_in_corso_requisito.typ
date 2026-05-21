#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione stato in corso requisito"

#let data=(

  nome:test-name,

  descrizione:[

Verificare che l'Utente veda lo stato "In corso" quando il percorso nel decision tree non è stato ancora completato
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)



