#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore eliminazione nodo root"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che il sistema blocchi l'eliminazione del nodo e mostri un messaggio di avviso se l'Utente tenta di eliminare il nodo root dello scheletro del decision tree
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



