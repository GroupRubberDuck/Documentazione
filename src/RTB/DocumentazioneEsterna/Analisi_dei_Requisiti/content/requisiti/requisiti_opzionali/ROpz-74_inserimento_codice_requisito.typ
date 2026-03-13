#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Inserimento codice requisito")
    #label(deps.slugify("Inserimento codice requisito"))
    ],

  descrizione:[
  L'Utente deve poter inserire il codice del requisito durante la creazione di un nuovo requisito.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Inserisci codice requisito")
  ]
)