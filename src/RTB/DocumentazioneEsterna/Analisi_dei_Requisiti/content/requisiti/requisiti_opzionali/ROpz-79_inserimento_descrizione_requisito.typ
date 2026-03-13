#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Inserimento descrizione requisito")
    #label(deps.slugify("Inserimento descrizione requisito"))
    ],

  descrizione:[
  L'Utente deve poter inserire la descrizione del requisito durante la creazione di un nuovo requisito.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Inserisci descrizione requisito")
  ]
)