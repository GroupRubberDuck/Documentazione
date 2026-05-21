#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Reindirizzamento da nodo root"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che il sistema mostri un avviso e reindirizzi l'Utente alla visualizzazione del dettaglio del requisito
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)



