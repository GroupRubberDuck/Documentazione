#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Salvataggio modifica minor"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa salvare modifiche di bassa importanza senza creare un nuovo modello. 
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



