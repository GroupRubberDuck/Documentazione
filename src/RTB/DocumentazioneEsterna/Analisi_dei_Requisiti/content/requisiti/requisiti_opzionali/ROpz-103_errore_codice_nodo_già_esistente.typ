#import "config/deps.typ" as deps

#let req-name="Errore codice nodo già esistente"
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo quando il codice inserito per il nodo è già associato a un altro nodo del decision tree.

  ],
  // Per facilitare l'automazione, gli use case associati vanno riferiti solo per nome
  // La conversione in codice con label sarà effettuata in una fase successiva
  fonti:(
      "Errore codice nodo già esistente",
    )
)