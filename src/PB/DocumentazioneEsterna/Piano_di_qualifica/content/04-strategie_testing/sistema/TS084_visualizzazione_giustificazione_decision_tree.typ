#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione giustificazione decision tree"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare la giustificazione associata al decision tree
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)



