#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Importazione dispositivo da file"

#let data=(

  nome:test-name,

  descrizione:[
Verifica che l'Utente possa inserire un nuovo dispositivo nel sistema tramite importazione di un file esterno
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



