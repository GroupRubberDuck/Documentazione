#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Importazione modello da file"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa inserire un nuovo modello tramite la funzione di importazione di un file esterno.

I formati di file supportati sono JSON e XML
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



