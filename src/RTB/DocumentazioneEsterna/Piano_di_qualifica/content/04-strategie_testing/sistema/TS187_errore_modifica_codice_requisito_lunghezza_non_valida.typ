#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore modifica codice requisito lunghezza non valida"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che il sistema blocchi l'operazione di modifica del codice associato al requisito e mostri un avviso se l'Utente non inserisce un codice di lunghezza compresa tra 4 e 10 caratteri
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



