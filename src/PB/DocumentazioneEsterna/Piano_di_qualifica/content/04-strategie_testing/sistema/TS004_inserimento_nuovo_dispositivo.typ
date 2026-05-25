#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Inserimento nuovo dispositivo"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa inserire e registrare nuovi dispositivi nel sistema 
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)



