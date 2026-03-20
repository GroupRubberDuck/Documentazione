#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Modifica codice nodo decision tree"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa modificare il codice del nodo di decisione con un nuovo codice univoco visualizzando

Il codice del nodo di decisione è valido se ha una lunghezza compresa tra 4 e 10 caratteri 
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



