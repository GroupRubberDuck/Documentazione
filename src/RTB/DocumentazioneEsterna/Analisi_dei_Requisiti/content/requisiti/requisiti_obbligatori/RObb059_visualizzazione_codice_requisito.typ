#import "config/deps.typ" as deps
#let req-name="Visualizzazione codice requisito"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il codice del requisito sia nella lista che nel dettaglio.
  ],
  fonti:(

    "Visualizza codice requisito da lista requisiti",
    "Visualizza codice requisito",
    )
)