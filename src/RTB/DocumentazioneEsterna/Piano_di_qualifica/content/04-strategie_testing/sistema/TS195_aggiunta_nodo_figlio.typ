#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Aggiunta nodo figlio"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa aggiungere un nodo figlio a uno specifico nodo di decisione nello scheletro del decision tree in fase di modifica del requisito 
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



