#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Inserimento sistema operativo dispositivo"

#let data=(

  nome:test-name,

  descrizione:[
    Verificare che l'Utente possa inserire e salvare il nome di un sistema operativo da associare al dispositivo
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)



