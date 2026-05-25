#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Esportazione informazioni dispositivo"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa esportare i dati relativi a uno specifico dispositivo
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)



