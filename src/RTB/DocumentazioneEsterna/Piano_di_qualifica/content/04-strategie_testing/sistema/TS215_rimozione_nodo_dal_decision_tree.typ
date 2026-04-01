#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Rimozione nodo dal decision tree"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente possa eliminare un nodo del decision tree se quest'ultimo non ha figli uscenti
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"NI"

)



