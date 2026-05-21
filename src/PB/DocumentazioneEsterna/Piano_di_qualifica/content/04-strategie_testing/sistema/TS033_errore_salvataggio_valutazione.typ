#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore salvataggio valutazione"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa vedere un messaggio di avviso se durante il salvataggio dei dati si verificano problemi tecnici che impediscono il corretto salvataggio dei dati 
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)



