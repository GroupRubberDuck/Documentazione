#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Inserimento nome requisito")
    #label(deps.slugify("Inserimento nome requisito"))
    ],

  descrizione:[
  L'Utente deve poter inserire il nome del requisito durante la creazione di un nuovo requisito.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Inserisci nome requisito")
  ]
)