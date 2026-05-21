#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione stato fail requisito"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che l'Utente veda lo stato FAIL quando il percorso nel decision tree termina in un nodo FAIL
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)



