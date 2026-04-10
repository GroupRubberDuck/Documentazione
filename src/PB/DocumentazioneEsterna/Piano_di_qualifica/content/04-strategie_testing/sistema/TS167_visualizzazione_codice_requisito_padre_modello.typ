#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione codice requisito padre modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che durante la visualizzazione di un nodo di decisione dello scheletro del decision tree l'utente visualizzi correttamente il codice del requisito a cui il decision tree è associato  in fase di modifica del modello
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



