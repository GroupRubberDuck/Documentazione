#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Modifica anagrafica requisito"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa modificare le informazioni anagrafiche del requisito in fase di modifica del modello
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



