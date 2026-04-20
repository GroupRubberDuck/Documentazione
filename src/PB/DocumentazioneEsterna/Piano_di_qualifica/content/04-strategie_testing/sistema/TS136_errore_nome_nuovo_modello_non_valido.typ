#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore nome nuovo modello non valido"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che il sistema blocchi l'inserimento e mostri un messaggio di errore appropriato se il nome inserito non è compreso tra 1 e 32 caratteri
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



