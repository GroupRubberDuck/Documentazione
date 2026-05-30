#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Selezione file da importare"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente selezioni un file valido durante l'importazione \
(ovvero un file la cui estensione è supportata dal sistema, la cui dimensione non sia 0 e non sia maggiore di 10 MB e la struttura interna sia interpretabile dal sistema )
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)



