#import "config/deps.typ" as deps

#let req-name="Salvataggio modifica major"
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
    L'utente deve poter salvare le modifiche significative apportate alla struttura dello standard senza invalidare le valutazioni del dispositivo già associate.

    Le modifiche significative comprendono operazioni di creazione di nuovi requisiti, eliminazione di requisiti e modifica dello scheletro di un qualsiasi decision tree, modifiche ai codici identificativi dei requisiti e dei nodi dei decision tree.
  ],
  // Per facilitare l'automazione, gli use case associati vanno riferiti solo per nome
  // La conversione in codice con label sarà effettuata in una fase successiva
  fonti:(
    "Salva modifica major",
  )
)