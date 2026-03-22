#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore modello esistente"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che se l'Utente tenti di importare un modello già esistente nel sistema, venga visualizzato un messaggio di avviso e che il sistema blocchi l'importazione venga bloccata
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



