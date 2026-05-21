#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione dashboard dispositivo"

#let data=(

  nome:test-name,

  descrizione:[
L'Utente deve poter visualizzare la dashboard riepilogativa della valutazione del dispositivo
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)



