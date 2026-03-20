#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione stato sospeso requisito"

#let data=(

  nome:test-name,

  descrizione:[

Verificare che l'Utente veda lo stato "Sospeso" quando tutti i requisiti da cui dipende il requisito corrente sono in stato NA
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



