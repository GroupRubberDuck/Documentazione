#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Modifica nome dispositivo"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente abbia inserito un nome valido per il dispositivo in fase di modifica
(ovvero un nome di lunghezza compresa tra 1 e 64 caratteri)

  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)



