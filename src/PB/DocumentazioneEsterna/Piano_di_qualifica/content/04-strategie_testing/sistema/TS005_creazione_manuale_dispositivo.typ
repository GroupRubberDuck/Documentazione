#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Creazione manuale dispositivo"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa aggiungere e inserire manualmente le informazioni associate al nuovo dispositivo 
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)



