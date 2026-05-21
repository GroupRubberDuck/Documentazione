#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Scarto modifiche valutazione"

#let data=(

  nome:test-name,

  descrizione:[
 Verificare che l'Utente possa chiudere la valutazione senza salvare le informazioni inserite dall'ultimo salvataggio 
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)



