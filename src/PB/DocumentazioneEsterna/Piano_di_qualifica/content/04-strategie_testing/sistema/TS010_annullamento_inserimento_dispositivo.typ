#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Annullamento inserimento dispositivo"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente, in qualsiasi momento durante la compilazione, possa annullare l'operazione scartando i dati inseriti e ritornando alla schermata precedente
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)



