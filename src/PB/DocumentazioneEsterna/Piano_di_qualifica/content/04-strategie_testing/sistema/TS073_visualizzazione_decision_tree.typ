#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione decision tree"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa visualizzare il decision tree associato a un requisito durante la visualizzazione nel dettaglio
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)



