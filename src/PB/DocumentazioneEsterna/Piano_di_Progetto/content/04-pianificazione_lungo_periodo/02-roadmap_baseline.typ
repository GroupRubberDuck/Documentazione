#import "/src/config.typ": template_dir
#import template_dir + "/PdP/tabellaAtt.typ": tabellaAtt



Di seguito vengono riportati i documenti richiesti per questa fase.
Ogni documento è suddiviso nelle sezioni che lo compongono, con l'indicazione degli sprint a cui sono associati. Questo approccio permette di avere una *visione d'insieme delle attività*, stimare il lavoro complessivo e suddividerlo successivamente in singoli sprint, seguendo le *buone pratiche dello sviluppo Agile*.


#let attivitaADR = (
  "Studio della struttura del documento",
  [_Sprint 1_],
  "Completato",
  "Stesura dell'introduzione e descrizione generale del documento",
  [_Sprint 1_],
  "Completato",
  "Definizione dei primi casi d'uso",
  [_Sprint 2_],
  "Completato",
  "Revisione dei casi d’uso dopo in seguito di una più attenta lettura dello standard e riunioni con BlueWind",
  [_Sprint 3_],
  "Completato",
  "Definizione preliminare delle funzionalità e redazione delle matrici di tracciamento tra funzionalità e casi d’uso",
  [_Sprint 3_],
  "Completato",
  "Completamento dei casi d'uso e dei diagrammi UML",
  [_Sprint 4_],
  "Completato",
  "Definizione preliminare dei requisiti funzionali",
  [_Sprint 6_],
  "Completato",
  "Completamento dei requisiti funzionali e non funzionali",
  [_Sprint 7_],
  "Completato",
)
#figure(caption: "RTB-Analisi dei Requisiti")[
  #tabellaAtt(titolo: "Analisi dei Requisiti", attivita: attivitaADR)
]

#let attivitaPdP = (
  "Studio della struttura del documento",
  [_Sprint 1_],
  "Completato",
  "Redazione dell'introduzione",
  [_Sprint 1_],
  "Completato",
  [Studio dei metodi \ di retrospettiva],
  [_Sprint 2_],
  "Completato",
  [Analisi e gestione \ dei rischi],
  [_Sprint 3_],
  "Completato",
  [Studio dei metodi \ di pianificazione],
  [_Sprint 3_],
  "Completato",
  [Pianificazione di \ lungo periodo],
  [_Sprint 3_],
  "Completato",
  [Pianificazione di \ breve periodo],
  [_Tutti gli sprint_],
  "In corso",
)
#figure(caption: "RTB-Piano di Progetto")[
  #tabellaAtt(titolo: "Piano di Progetto", attivita: attivitaPdP)
]

#let attivitaPdQ = (
  "Studio della struttura del documento",
  [_Sprint 1_],
  "Completato",
  "Redazione dell'introduzione",
  [_Sprint 3_],
  "Completato",
  "Stesura delle metriche per la qualità del prodotto e del processo",
  [_Sprint 3_],
  "Completato",
  "Cruscotto di valutazione",
  [_Sprint 5_],
  "Completato",
  "Definizione iniziale delle strategie di testing",
  [_Sprint 6_],
  "Completato",
)
#figure(caption: "RTB-Piano di Qualifica")[
  #tabellaAtt(titolo: "Piano di Qualifica", attivita: attivitaPdQ)
]


#let attivitaNP = (
  "Studio della struttura del documento",
  [_Sprint 1_],
  "Completato",
  "Redazione dell'introduzione",
  [_Sprint 1_],
  "Completato",
  "Studio dei processi di ciclo di vita di supporto",
  [_Sprint 2_],
  "Completato",
  "Studio dei processi di ciclo di vita organizzativi",
  [_Sprint 2_],
  "Completato",
  "Stesura dei processi di ciclo di vita organizzativi",
  [_Sprint 3_],
  "Completato",
  "Studio dei processi di ciclo di vita primari",
  [_Sprint 2, Sprint 3_],
  "Completato",
  "Stesura dei processi di ciclo di vita primari",
  [_Sprint 4_],
  "Completato",
  "Stesura dei processi di ciclo di vita di supporto",
  [_Sprint 4_],
  "Compleato",
  "Stesura delle metriche",
  [_Sprint 4_],
  "Completato",
  "Studio delle best practices o altro materiale ritenuto importante",
  [_Tutti sprint_],
  "In corso",
)
#figure(caption: "RTB-Norme di Progetto")[
  #tabellaAtt(titolo: "Norme di Progetto", attivita: attivitaNP)
]

#let attivitaGL = (
  "Aggiornamento del glossario",
  [_Tutti gli sprint_],
  "In corso",
  "Integrazione glossario web",
  [_Sprint 3_],
  "Completato",
)
#figure(caption: "RTB-Glossario")[
  #tabellaAtt(titolo: "Glossario", attivita: attivitaGL)
]


#let attivitaPoC = (
  "Setup dell'ambiente di sviluppo",
  [_Sprint 5_],
  "Completato",
  "Flask",
  [_Sprint 6_],
  "Completato",
  "Docker",
  [_Sprint 6_],
  "Completato",
  "D3JS",
  [_Sprint 6_],
  "Completato",
  "Pydantic",
  [_Sprint 6_],
  "Completato",
  "MongoDB",
  [_Sprint 7_],
  "Completato",
  "Vue.js",
  [_Sprint 8_],
  "Completato",
)
#figure(caption: "RTB-Proof of Concept")[
  #tabellaAtt(titolo: "Proof of Concept", attivita: attivitaPoC)
]



=== Product Baseline
La redazione di questo paragrafo sarà effettuata in seguito al superamento della Requirements and Technology Baseline (RTB).
