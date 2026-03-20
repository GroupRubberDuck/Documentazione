#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore struttura modello non valida"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente visualizzi un messaggio di errore e che il sistema blocchi il processo di modifica se la struttura del modello non è valida, ovvero se vi sono decision tree con almeno un percorso decisionale che termina senza un nodo foglia
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



