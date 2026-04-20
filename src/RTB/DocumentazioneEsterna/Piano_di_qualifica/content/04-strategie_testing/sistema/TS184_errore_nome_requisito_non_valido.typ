#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore nome requisito non valido"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che il sistema blocchi l'operazione e mostri un messaggio di errore se l'Utente ha inserito un nome di lunghezza non compresa tra 1 e 64 caratteri
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



