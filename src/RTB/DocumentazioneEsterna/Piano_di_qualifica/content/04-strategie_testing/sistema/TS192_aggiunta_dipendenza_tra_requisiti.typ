#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Aggiunta dipendenza tra requisiti"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa aggiungere un requisito valido alla lista delle dipendenze del requisito in fase di modifica del requisito.

Un requisito può essere aggiunto alla lista dipendenze del requisito corrente se è diverso dal requisito corrente e la nuova dipendenza non crea nel sistema una dipendenza circolare 
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



