#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Modifica nome requisito"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa inserire e salvare un nuovo nome valido per il requisito in fase di modifica di esso.

Un nome è valido se ha una lunghezza compresa tra 1 e 64 caratteri
  
  
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



