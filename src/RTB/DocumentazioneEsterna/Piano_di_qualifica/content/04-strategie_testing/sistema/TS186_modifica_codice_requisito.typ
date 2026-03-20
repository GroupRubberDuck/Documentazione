#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Modifica codice requisito"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa inserire e salvare un nuovo codice univoco valido da associare al requisito

Un codice è valido se ha una lunghezza compresa tra 4 e 10 caratteri
  ], 

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



