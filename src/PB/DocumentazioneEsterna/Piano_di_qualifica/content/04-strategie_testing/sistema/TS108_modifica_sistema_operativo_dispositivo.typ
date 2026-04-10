#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Modifica sistema operativo dispositivo"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa modificare il nome del sistema operativo associato al dispositivo
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



