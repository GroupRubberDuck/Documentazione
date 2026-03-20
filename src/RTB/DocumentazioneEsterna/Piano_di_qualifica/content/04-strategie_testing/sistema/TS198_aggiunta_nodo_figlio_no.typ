#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Aggiunta nodo figlio no"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa aggiungere un nodo figlio a un nodo di decisione creando la relazione di bivio decisionale NO nello scheletro del decision tree

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



