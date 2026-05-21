#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Annullamento modifica asset"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa annullare in qualsiasi momento la fase di modifica delle informazioni dell'asset e scartare le modifiche inserite
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)



