#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore modifica domanda vuota"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che il sistema blocchi l'operazione di modifica della domanda se l'utente cancella la domanda senza inserirne una nuova
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



