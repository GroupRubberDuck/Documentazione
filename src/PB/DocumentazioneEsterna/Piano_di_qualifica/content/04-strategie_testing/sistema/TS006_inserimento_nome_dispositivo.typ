#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Inserimento nome dispositivo"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa inserire e salvare un nome per il nuovo dispositivo

Il nome del dispositivo deve rispettare il vincolo di lunghezza compresa tra 1 e 64 caratteri
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)



