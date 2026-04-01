#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore domanda vuota"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che il sistema mostri un avviso e blocchi l'aggiunta del nodo allo scheletro del decision tree se l'Utente prova a procedere senza aver inserito il testo di una domanda  
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



