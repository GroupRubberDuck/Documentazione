#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione codice nodo modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che durante la visualizzazione di un nodo di decisione dello scheletro del decision tree l'utente visualizzi correttamente il codice del singolo nodo di decisione in fase di modifica del modello
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



