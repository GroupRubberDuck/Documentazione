#import "config/deps.typ" as deps

<<<<<<<< HEAD:src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/content/requisiti/requisiti_obbligatori/RObb052.1_valuta_asset.typ
#let req-name="Valuta asset"
========
#let req-name="Norme di progetto"
>>>>>>>> 95836b1a45764c8a6ff65a20148e2f06fcbc793b:src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/content/requisiti/requisiti_desiderabili/RQ-Obb002_norme_di_progetto.typ
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
    L'utente deve poter valutare i singoli asset di cui si compone il dispositivo.
  ],
  // Per facilitare l'automazione, gli use case associati vanno riferiti solo per nome
  // La conversione in codice con label sarà effettuata in una fase successiva
<<<<<<<< HEAD:src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/content/requisiti/requisiti_obbligatori/RObb052.1_valuta_asset.typ
  fonti:(
    "valuta asset",
  )
========
  fonti:[
    
  ]
>>>>>>>> 95836b1a45764c8a6ff65a20148e2f06fcbc793b:src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/content/requisiti/requisiti_desiderabili/RQ-Obb002_norme_di_progetto.typ
)