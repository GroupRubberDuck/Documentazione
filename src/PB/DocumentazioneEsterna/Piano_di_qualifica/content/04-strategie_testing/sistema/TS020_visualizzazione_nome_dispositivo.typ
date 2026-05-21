#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione nome dispositivo"

#let data=(

  nome:test-name,

  descrizione:[
    Verificare che l'Utente possa visualizzare il nome del dispositivo durante la visualizzazione del dettaglio del dispositivo
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)



