#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Inserimento nome asset"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente inserisca e salvi  un nome valido durante l'aggiunta di un asset
(ovvero un nome di lunghezza compresa tra 1 e 32 caratteri)
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)



