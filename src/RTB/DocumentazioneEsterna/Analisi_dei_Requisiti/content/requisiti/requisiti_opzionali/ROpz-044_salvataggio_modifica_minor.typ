#import "config/deps.typ" as deps

#let req-name="Salvataggio modifica minor"
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
    L'utente deve poter salvare le modifiche non significative apportate alla struttura dello standard.

    Le modifiche non significative comprendono modifiche a campi puramente testuali: quali descrizione dei requisiti, nomi dei requisiti, testo delle domande dei nodi decisionali dello scheletro del decision tree.

  ],
  // Per facilitare l'automazione, gli use case associati vanno riferiti solo per nome
  // La conversione in codice con label sarà effettuata in una fase successiva
  fonti:(
    "Salva modifica MINOR",
  )
)