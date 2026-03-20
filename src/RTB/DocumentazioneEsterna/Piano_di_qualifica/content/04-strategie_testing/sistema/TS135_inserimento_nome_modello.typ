#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Inserimento nome modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa inserire un nome valido da associare al modello durante la fase di creazione

Il nome deve avere una lunghezza compresa tra 1 e 32 caratteri
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



