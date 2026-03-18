#import "/src/config.typ":template_dir
#import template_dir+"/diarioTemplate.typ": slides
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import template_dir + "/setUpPageLayout.typ": insertArabicNumberedPagesSenzaData


#insertArabicNumberedPagesSenzaData(PageTitle: "Dubbi", documentType: "Dubbi")[

// Dai file di report solo queste possono essere di interesse per un dialogo con cardin

- In UC6 è necessario aggiungere sotto UC per i tipi di errore (dimensione, formato errato)

- UC01.1 si può accorpare con il padre oppure è meglio mantenere modularità per dare spazio a possibili aggiunte

- Nei casi d’uso (ad esempio la postcondizione UC8: "L’utente ha modificato il sistema operativo del dispositivo"). non sarebbe meglio cambiare il soggetto e dire che sia il sistema a modificare?


]

#insertArabicNumberedPagesSenzaData(PageTitle: "Dubbi sui diagrammi di attività", documentType: "Dubbi")[

Per quanto riguarda i diagrammi di attività abbiamo i seguenti dubbi:
- Uso dei pin nel passaggio di dati \  #[
  - Ci sembrava opportuno per indicare che l'utente seleziona un elemento da una lista, ma poi questi dati vanno ulteriormente passati avanti?

  - Si possono passare dati attraverso i branch ?
]
- Uso corretto della sotto attività / #[
  durante la valutazione del dispositivo l'utente può valutare il singolo asset, questo scenario è molto complesso e a sua volta viene descritto con un diagramma di attività, il diagramma di sotto attività ci è sembrato adeguato, volevamo chiedere se è un errore
]
- Ammissibilità di una connessione diretta tra un nodo branch e merge \ #[
  - questo lo vorremmo fare per evitare di "sporcare" il diagramma con nodi che descrivono operazioni semplici che non hanno un caso d'uso associato.

  - Un nodo può essere sia branch che merge?
]

Di seguito riportiamo i diagrammi di attività prodotti



#figure(caption:"UC Valuta dispositivo")[
#image("/src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/content/use_case/diagrammi-attivita/images/valuta-dispositivo.drawio.png")
]

#figure(caption:"UC Valuta asset")[
#image("/src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/content/use_case/diagrammi-attivita/images/valuta-asset.drawio.png")
]

#figure(caption:"UC Modifica modello")[
#image("/src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/content/use_case/diagrammi-attivita/images/modifica-struttura-modello.drawio.png")
]



]