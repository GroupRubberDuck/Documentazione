#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}


#let test-name="Visualizzazione lista dispositivi"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente visualizzi correttamente la lista contenente tutti i dispositivi attualmente registrati nel sistema  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)
#data.requisito-riferimento


