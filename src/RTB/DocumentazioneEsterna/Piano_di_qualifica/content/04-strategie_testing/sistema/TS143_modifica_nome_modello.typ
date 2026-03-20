#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Modifica nome modello"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'utente possa modificare e salvare un nome di lunghezza compresa tra i 1 e 32 caratteri 
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



