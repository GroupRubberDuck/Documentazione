#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Inserimento nome requisito"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa inserire e salvare un nome valido da associare al requisito

Un nome è valido se ha una lunghezza compresa tra 1 e 64 caratteri
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



