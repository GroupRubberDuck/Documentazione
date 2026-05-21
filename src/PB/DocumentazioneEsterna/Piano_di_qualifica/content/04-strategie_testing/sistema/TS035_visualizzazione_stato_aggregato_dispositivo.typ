#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Visualizzazione stato aggregato dispositivo"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che il sistema calcoli correttamente lo stato aggregato rappresentativo della valutazione del dispositivo e che l'Utente lo possa visualizzare 
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"Pass"

)



