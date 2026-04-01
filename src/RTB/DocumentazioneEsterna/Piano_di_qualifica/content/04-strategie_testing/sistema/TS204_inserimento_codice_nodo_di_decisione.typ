#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Inserimento codice nodo di decisione"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa inserire e salvare un codice univoco valido per il nuovo nodo di decisione.

Il codice è valido se ha una lunghezza compresa tra 4 e 10 caratteri

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



