#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore dipendenza circolare"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che il sistema blocchi l'operazione di aggiunta alle dipendenze di un requisito e mostri un messaggio di errore se questa operazione crea una dipendenza circolare
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



