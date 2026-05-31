#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPage, frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/utilityTable.typ": getCode, utilityTable
#import template_dir + "/statusTab.typ": statusTab
#set text(size: 13pt)
#set heading(numbering: "1.a)")

#frontPageSenzaData([Lettera di Presentazione])

#insertRomanNumberedPagesSenzaData(
  PageTitle: "Stato del documento",
  documentType: "Lettera di presentazione",
  gloss-flag: false,
)[
  #statusTab(
    stato: "Approvato",
    versione: "2.0.0",
    autori: ("Aldo Bettega",),
    verificatori: ("Davide Lorenzon",),
    uso: "Esterno",
    destinatari: ("Professor Tullio Vardanega", "Professor Riccardo Cardin"),
  )
]

#insertRomanNumberedPagesSenzaData(
  PageTitle: "Registro modifiche",
  documentType: "Lettera di presentazione",
  gloss-flag: false,
)[

  #registroModifiche((
    ("0.1.0", "2026-03-22", "Aldo Bettega", "Davide Lorenzon", "Stesura lettera di presentazione"),
    ("1.0.0", "2026-03-22", "Davide Testolin", "Davide Lorenzon", "Approvazione"),
    ("1.1.0", "2026-04-01", "Aldo Bettega", "Davide Lorenzon", "Modifica data di consegna e aggiornamento link"),
    ("1.2.0", "2026-05-22", "Davide Lorenzon", "Aldo Bettega", "Aggiornamento per la consegna PB"),
    ("2.0.0", "2026-05-25", "Filippo Guerra", "Filippo Guerra", "Approvazione")
  ))
]


#insertArabicNumberedPagesSenzaData(
  PageTitle: "Lettera di presentazione",
  documentType: "Lettera di presentazione",
  gloss-flag: false,
)[

  #enfasi[Lettera di presentazione del gruppo RubberDuck]
  Egregi Professori Vardanega e Cardin,  \

  Il gruppo *RubberDuck* desidera comunicare la propria intenzione di candidarsi alla revisione denominata Product Baseline per il capitolato


  #align(center)[
    *"EN18031 Compliance Verification"*
  ]

  proposto dall'azienda Bluewind Srl.

  La documentazione prodotta durante questa fase del progetto è gestita tramite apposito repository: \
    #inserisciLink(url: "https://github.com/GroupRubberDuck/Documentazione")[https://github.com/GroupRubberDuck/Documentazione]

  Per facilitare la consultazione, tali documenti sono resi disponibili anche tramite l'apposito sito web: \    #inserisciLink(url: "https://grouprubberduck.github.io/Documentazione/")[https://grouprubberduck.github.io/Documentazione/]

  Tramite esso sono consultabili:
  - Il Piano di Qualifica \
    #inserisciLink(
      url: "https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/Piano_di_qualifica/Piano_di_qualifica-v2.0.0.pdf",
    )[https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/Piano_di_qualifica/Piano_di_qualifica-v2.0.0.pdf]
  - Il Piano di Progetto \
    #inserisciLink(
      url: "https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/Piano_di_Progetto/Piano_di_progetto-v2.0.0.pdf",
    )[https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/Piano_di_Progetto/Piano_di_progetto-v2.0.0.pdf]
  - L'Analisi dei Requisiti \
    #inserisciLink(
      url: "https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/Analisi_dei_Requisiti/Analisi_dei_requisiti-v2.0.0.pdf",
    )[https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/Analisi_dei_Requisiti/Analisi_dei_requisiti-v2.0.0.pdf]
  - Il Glossario \
    #inserisciLink(
      url: "https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneInterna/Glossario-v2.0.0.pdf",
    )[https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneInterna/Glossario-v2.0.0.pdf]
  - La Specifica Tecnica \
    #inserisciLink(
      url: "https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/Specifica_Tecnica/Specifica_Tecnica-v1.0.0.pdf",
    )[https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/Specifica_Tecnica/Specifica_Tecnica-v1.0.0.pdf]
  - Il Manuale Utente \
    #inserisciLink(
      url: "https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/Manuale_Utente/Manuale_Utente-v1.0.0.pdf",
    )[https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/Manuale_Utente/Manuale_Utente-v1.0.0.pdf]
  - Le Norme di Progetto \
    #inserisciLink(
      url: "https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneInterna/Norme_progetto/Norme_progetto-v2.0.0.pdf",
    )[https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneInterna/Norme_progetto/Norme_progetto-v2.0.0.pdf]


  Oltre a Verbali Interni e Verbali Esterni.

  Il codice dell'MVP è pubblicato nell'apposito repository: \
    #inserisciLink(url: "https://github.com/GroupRubberDuck/MVP")[https://github.com/GroupRubberDuck/MVP]

  L'approvazione da parte dell'impresa proponente è documentata nel Verbale Esterno del 2026-05-18 consultabile al seguente link: #inserisciLink(url:"https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/VerbaliEsterni/2026-05-18_Verbale-v1.0.0.pdf")[https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/VerbaliEsterni/2026-05-18_Verbale-v1.0.0.pdf]

  #enfasi[Piano di lavoro]
  Con la presente lettera desideriamo inoltre aggiornarvi sul costo effettivo del progetto, esso ammonta *10.945 €* contro gli *11.610 €* stimati, con un risparmio di * #str(11610 - 10945)* €. 
  
  A seguito di una revisione della pianificazione, la data di consegna finale è stata ricalcolata al *30 Maggio*, comportando una ulteriore proroga rispetto alla scadenza inizialmente prevista.

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






