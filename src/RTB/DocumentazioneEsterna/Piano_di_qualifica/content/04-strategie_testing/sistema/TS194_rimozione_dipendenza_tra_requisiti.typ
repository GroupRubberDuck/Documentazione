#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Rimozione dipendenza tra requisiti"

#let data=(

  nome:test-name,

  descrizione:[
    Verificare che l'Utente possa rimuovere una dipendenza dal requisito in fase di modifica del requisito
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



