#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Salvataggio valutazione"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa salvare le modifiche apportate durante la valutazione del dispositivo
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)



