#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione domanda nodo modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che durante la visualizzazione di un nodo di decisione dello scheletro del decision tree l'utente visualizzi correttamente la domanda associata al singolo nodo di decisione in fase di modifica del modello

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



