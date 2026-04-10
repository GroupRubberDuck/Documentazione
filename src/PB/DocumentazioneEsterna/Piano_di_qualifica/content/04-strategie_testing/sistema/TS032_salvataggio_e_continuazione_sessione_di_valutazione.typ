#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Salvataggio e continuazione sessione di valutazione"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa salvare le modifiche inserite durante la valutazione mantendo attiva la sessione di valutazione
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



