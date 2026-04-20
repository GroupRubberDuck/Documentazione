#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Salvataggio modifica major"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa salvare sul sistema una serie di modifiche come nuovo modello, in modo da mantenere il supporto ai dispositivi finora creati

Le modifiche che causano la creazione di un nuovo modello sono aggiunta di requisiti, eliminazione di requisiti, modifica della struttura dei decision tree
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



