#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Scarto modifiche modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa annullare in qualsiasi momento il processo di modifica e che il sistema scarti le informazioni finora inserite
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



