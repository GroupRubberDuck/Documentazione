#import "/src/config.typ": *
#import template_dir+"/frontPage.typ": frontPage, frontPageSenzaData
#import template_dir+"/setUpPageLayout.typ":*
#import template_dir+"/registroModifiche.typ":registroModifiche
#import template_dir+"/utilityTable.typ":utilityTable, getCode
#import template_dir+"/statusTab.typ":statusTab
#set text( size: 13pt)
#set heading(numbering: "1.a)")

#frontPageSenzaData([Lettera di Presentazione])

#insertRomanNumberedPagesSenzaData(PageTitle:"Stato del documento",documentType:"Lettera di presentazione")[
#statusTab(
  stato:"In progress",
  versione:"0.1.0",
  autori:("Aldo Bettega",), 
  verificatori: (""),
  uso:"Esterno",
  destinatari:("Professor Tullio Vardanega","Professor Riccardo Cardin"))
]

#insertRomanNumberedPagesSenzaData(PageTitle:"Registro modifiche",documentType:"Lettera di presentazione")[

#registroModifiche((
  ("0.1.0","2026-03-22","Aldo Bettega", "", "Stesura lettera di presentazione"),
))
]


#insertArabicNumberedPagesSenzaData(PageTitle:"Lettera di presentazione",documentType:"Lettera di presentazione")[

#enfasi[Lettera di presentazione del gruppo RubberDuck]
Egregi Professori Vardanega e Cardin,  \

Il gruppo *RubberDuck* desidera comunicare la propria intenzione a candidarsi alla revisione denominata Requirements and Technology Baseline per il capitolato


#align(center)[
*"EN18031 Compliance Verification"*
]

proposto dall'azienda Bluewind Srl.
La documentazione prodotta durante questa fase del progetto è consultabile all’interno della cartella ”src” la cui cartella è denominata ”RTB”, raggiungibile al seguente link:

#inserisciLink(url:"https://github.com/GroupRubberDuck")[github.com/GroupRubberDuck]

All’interno di questa sezione, oltre a questa lettera di presentazione è possibile trovare:

- La cartella Documentazione Interna che contiene il documento Norme di Progetto, insieme alla sottocartella Verbali Interni che raccoglie i verbali redatti durante le riunioni interne del gruppo

-  La cartella Documentazione Esterna che comprende il Piano di Qualifica, il
Piano di Progetto, l’Analisi dei Requisiti e il Glossario. In aggiunta, vi è la sottocartella Verbali Esterni che contiene i verbali degli incontri con la proponente.

Per agevolare la consultazione dei documenti, il gruppo si è munito di un sito web:

#inserisciLink(url:"https://grouprubberduck.github.io/Documentazione/")[grouprubberduck.github.io]

Viene inoltre reso disponibile il codice sorgente del Proof of Concept:

#inserisciLink(url:"https://github.com/GroupRubberDuck/PoC")[PoC]


#enfasi[Piano di lavoro]
Con la presente lettera desideriamo inoltre aggiornarVi sugli impegni presi, confermando il costo finale per la realizzazione del progetto di *11610 €* e allo stesso tempo ribadendo l’impegno preso in fase di candidatura di completare il progetto entro il *30 Aprile 2026*.


Cordiali saluti,\  

Il gruppo RubberDuck  
\
Componenti del gruppo: \ 
- Aldo Bettega [2101087]
- Davide Testolin [2079242]
- Filippo Guerra [2077681]
- Ana Maria Draghici [2101044]
- Felician Mario Necsulescu [2111935]
- Davide Lorenzon [2101075]
  ]






