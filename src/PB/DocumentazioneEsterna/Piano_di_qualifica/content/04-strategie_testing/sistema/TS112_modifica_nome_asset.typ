#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Modifica nome asset"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa inserire correttamente un nuovo nome da associare all'asset
  
Il nome deve avere una lunghezza compresa tra 1 e 32 caratteri
  ],


  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)



