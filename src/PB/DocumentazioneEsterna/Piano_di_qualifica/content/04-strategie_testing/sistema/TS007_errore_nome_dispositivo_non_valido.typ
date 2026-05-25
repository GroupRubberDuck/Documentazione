#import "config/deps.typ" as deps

#let get-req-code= nome=>{deps.requisiti.at(deps.slugify(nome))}



#let test-name="Errore nome dispositivo non valido"

#let data=(

  nome:test-name,

  descrizione:[
Verificare che il sistema blocchi il salvataggio e mostri un messaggio di errore qualora l'Utente tenti di confermare la creazione di un dispositivo con un nome dispositivo non valido

    (ovvero che non rispetta il vincolo di lunghezza compresa tra 1 e 64 caratteri)
  ],

  requisito-riferimento:get-req-code(
    test-name
  ),

  stato:"passed"

)



