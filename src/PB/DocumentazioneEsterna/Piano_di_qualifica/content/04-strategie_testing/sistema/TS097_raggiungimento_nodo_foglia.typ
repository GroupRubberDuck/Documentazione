#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Raggiungimento nodo foglia"

#let data=(

  nome:test-name,

  descrizione:[
    Verificare che il sistema avvisi del completamento del decisione tree e reindirizzi al dettaglio del requisito, quando l'Utente cerca di navigare verso il nodo successore ma il nodo successore è un nodo foglia
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)



