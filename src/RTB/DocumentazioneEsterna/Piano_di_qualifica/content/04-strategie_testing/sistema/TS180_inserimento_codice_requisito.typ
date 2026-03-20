#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Inserimento codice requisito"

#let data=(

  nome:test-name,

  descrizione:[
    Verificare che l'utente inserire e salvare un codice univoco valido da associare al requisito in fase di modifica del modello.

    Un codice del requisito è valido se ha una lunghezza compresa tra 4 e 10 caratteri
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



