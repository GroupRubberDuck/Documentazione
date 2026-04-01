#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Avvio sessione di valutazione"

#let data=(

  nome:test-name,

  descrizione:[
    Verificare che l'Utente possa avviare una sessione di valutazione relativa a uno specifico dispositivo
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



