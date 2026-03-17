#import "config/deps.typ" as deps
#let req-name="Inserimento codice nodo di decisione"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter inserire il codice del nodo durante l'aggiunta di un nodo di decisione allo scheletro del decision tree.
  Il codice deve essere univoco e di lunghezza compresa tra 4 e 10 caratteri.
  ],
  fonti:(
    "Inserisci codice nodo decision tree",
  )
)