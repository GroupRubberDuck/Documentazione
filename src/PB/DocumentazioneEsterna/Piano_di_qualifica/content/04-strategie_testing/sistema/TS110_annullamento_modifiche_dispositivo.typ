#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Annullamento modifiche dispositivo"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa annullare il processo di modifica dei dati del dispositivo
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)



