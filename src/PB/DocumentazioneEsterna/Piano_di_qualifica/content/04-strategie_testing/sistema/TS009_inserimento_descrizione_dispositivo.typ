#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Inserimento descrizione dispositivo"

#let data=(

  nome:test-name,

  descrizione:[
    Verificare che l'Utente possa inserire e salvare una descrizione da associare al dispositivo
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)



