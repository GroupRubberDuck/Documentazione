#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore modifica nome asset non valido"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che il sistema mostri un messaggio di errore e blocchi l'operazione di modifica del nome dell'asset qualora questo non abbia una lunghezza compresa tra 1 e 32 caratteri
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)



