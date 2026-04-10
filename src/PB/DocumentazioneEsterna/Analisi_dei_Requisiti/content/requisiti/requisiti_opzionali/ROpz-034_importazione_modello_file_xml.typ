#import "config/deps.typ" as deps
#let req-name="Importazione modello file xml"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter importare un modello tramite un file in formato XML.
  ],
  fonti:(
    "Importa modello file XML",
    )
)