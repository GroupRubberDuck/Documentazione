#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/statusTab.typ": statusTab
#import template_dir + "/utilityTable.typ": getCode, utilityTable
#import template_dir + "/PdP/tabellaRischi.typ": tabellaRischiTecnologici
#import template_dir + "/PdP/tabellaRischi.typ": tabellaRischiPersonali
#import template_dir + "/PdP/tabellaRischi.typ": tabellaRischiOrganizzativi
#import template_dir + "/PdP/tabellaAtt.typ": tabellaAtt
#import glossario: dict
#set text(size: 13pt)
#set par(justify: true)




#set text(lang: "it")
#set heading(numbering: "1.1)")
#show ref: body => underline()[*#body*]
#show link: body => {
  set text(fill: blue)
  underline()[#body]
}


// 
//Info del documento 
// 
#let doc = "Piano di progetto"

#let currentVersion=(
  major:0,
  minor:4,
  patch:0,
)
//converte dizionario in stringa
#let versionNumber=currentVersion.values().map(n=>{str(n)}).join(".")
#metadata(versionNumber)<versionNumber>


#frontPageSenzaData(doc)

#insertRomanNumberedPagesSenzaData(PageTitle: "Stato del documento", documentType: doc)[
  #statusTab(
    stato: "In progress",
    versione: versionNumber,
    autori: ("Davide Lorenzon, Felician Mario Necsulescu, Ana Maria Draghici",),
    verificatori: ("Aldo Bettega, Ana Maria Draghici",),
    uso: "Esterno",
    destinatari: ("Prof. Tullio Vardanega", "Prof. Riccardo Cardin", "BlueWind srl"),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[


  #let header = ("Versione", "Data", "Descrizione", "Autore", "Revisore", "Validatore")
  #let modifiche = (
    ([0.1.0], [2025-11-12], [Davide Lorenzon], [Aldo Bettega], [Stesura iniziale e redazione Sprint 1]),    
    ([0.2.0], [2025-11-12], [Davide Lorenzon], [Aldo Bettega], [Layout per la pianificazione di lungo periodo.]),    
    ([0.2.1], [2025-12-10], [Davide Lorenzon], [Ana Maria\ Draghici], [Modificata la struttura del documento, organizzazione del progetto incluso nell'introduzione @orgProgetto, aggiunto preventivo iniziale @Preventivo. \  
    Pianificazione di breve e lungo periodo promosse a sezioni.]),    
    ([0.3.0], [2025-12-12], [Felician Mario\ Necsulescu], [Ana Maria\ Draghici], [Stesura analisi dei rischi @Analisi-dei-rischi. ] ),   
    ([0.4.0], [2025-12-14], [Ana Maria\ Draghici], [-], [Aggiunta @Pianificazione e completata scrittura Sprint 2] )
  )
  #registroModifiche(modifiche)
  // #utilityTable(modifiche,header:header,columns:(auto,auto,2fr,1fr,1fr,1.1fr))


]

#insertRomanNumberedPagesSenzaData(PageTitle: "Indice", documentType: doc)[
  #outline(title: "Indice")

]#insertRomanNumberedPagesSenzaData(PageTitle: "Lista delle tabelle", documentType: doc)[
#outline(
  title: [Lista delle tabelle],
  target: figure.where(kind: table),
)

]
#insertRomanNumberedPagesSenzaData(PageTitle: "Lista delle immagini", documentType: doc)[
#outline(
  title: [Lista delle immagini],
  target: figure.where(kind: image),
)
]
#context counter(page).update(1)
#insertArabicNumberedPagesSenzaData(PageTitle: "Introduzione", documentType: doc)[
  = Introduzione
  == Scopo del documento
 Nell'ambito dei progetti di sviluppo software,
  al fine di garantire il raggiungimento di  obiettivi di efficacia ed efficienza,
  è fondamentale predisporre un documento che consenta alle parti interessate di allineare il
  proprio lavoro, coordinarsi e monitorare lo stato di avanzamento  lo stato del progetto.

  Tale documento definisce l'ambito del progetto e specifica quali sono le attività
  necessarie per il suo sviluppo. Inoltre, fornisce informazioni dettagliate sulle ore di lavoro dedicate a ciascuna attività e sui relativi costi. 

  In particolare, il documento analizza i seguenti temi:
  #pad(left: 1em)[ 
  - Analisi dei rischi
  - Pianificazione delle attività
  - Stima dei costi e delle risorse necessarie allo sviluppo del progetto
]
  == Scopo del prodotto
  Dal gennaio 2025 lo standard tecnico EN 18031 è stato inserito nella Gazzetta Ufficiale
  dell’Unione Europea. Questo comporta l'entrata in vigore di nuovi standard per un’ampia gamma di prodotti che utilizzano Wi-Fi, LTE, BlueTooth o dispositivi IoT wireless, obbligatori dal 1 agosto 2025.\

  Lo scopo del prodotto è sviluppare un sistema software che automatizzi e semplifichi il processo di verifica della conformità dei dispositivi radio allo standard tecnico EN 18031, norma armonizzata per la RED (Direttiva sulle apparecchiature radio 2014/53/UE). 

  Il sistema dovrà essere in grado di guidare gli utenti attraverso la valutazione dei requisiti normativi tramite decision tree interattivi, riducendo significativamente i tempi di verifica e minimizzando gli errori umani.
  La soluzione permetterà di importare documenti tecnici relativi ai dispositivi da analizzare, elaborare automaticamente i decision tree associati ai requisiti di sicurezza informatica della norma EN 18031, e generare output chiari sulla conformità (Not Applicable, Pass o Fail). Una dashboard interattiva consentirà agli utenti di visualizzare lo stato delle valutazioni, modificare i decision tree e gestire la documentazione in modo efficiente.


  == Miglioramenti del documento
  Il presente documento è soggetto a revisioni periodiche durante tutto il ciclo di vita del progetto. Le modifiche possono essere proposte da:

  - Team di sviluppo: in caso di ambiguità o necessità di chiarimenti tecnici
  - Azienda proponente: per integrazioni o modifiche ai requisiti

  Le modifiche sostanziali ai requisiti comportano l'incremento della versione principale (es. da 1.0.0 a 2.0.0), mentre chiarimenti incrementano la versione secondaria (es. da 1.0.0 a 1.1.0). La correzione ortografica o di parti errate relative ad una versione secondaria incrementerà la versione terziaria (es. da 1.1.0 a 1.1.1).\
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Riferimenti", documentType: doc)[

  = Riferimenti

  == Riferimenti normativi
  #pad(left: 1em)[
    - #inserisciLink(
        url: "https://github.com/GroupRubberDuck/Documentazione/output/RTB/DocumentazioneEsterna/Piano_di_progetto.pdf",
      )[Norme di Progetto];\
    - #inserisciLink(
        url: "https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T04.pdf",
      )[Slide del corso di Ingegneria del Software A.A. 2025/2026 - Regolamento del progetto didattico]; \
    - #inserisciLink(
        url: "https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf",
      )[Capitolato d'appalto C1 - Automated EN18031 Compliance Verification]; \
  ]
  == Riferimenti informativi
  #pad(left: 1em)[
    - #inserisciLink(
        url: "https://grouprubberduck.github.io/Documentazione/output/RTB/DocumentazioneInterna/Glossario.pdf",
      )[Glossario]; \
    - #inserisciLink(
        url: "https://www.math.unipd.it/~rcardin/swea/2022/Diagrammi%20Use%20Case.pdf",
      )[Diagrammi dei casi d'uso]; \
    - #inserisciLink(
        url: "https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T05.pdf",
      )[Slide del corso di Ingegneria del Software A.A. 2025/2026 - Analisi dei requisiti ];\
    - #inserisciLink(url: "https://grouprubberduck.github.io/Documentazione/output/")[Verbali interni]; \
    - #inserisciLink(url: "https://grouprubberduck.github.io/Documentazione/output/")[Verbali esterni]; \
  ]


]


#insertArabicNumberedPagesSenzaData(PageTitle: "Organizzazione del progetto", documentType: doc)[


]


#insertArabicNumberedPagesSenzaData(PageTitle: "Analisi dei rischi", documentType: doc)[
  = Analisi dei rischi <Analisi-dei-rischi>
#include "content/03-analisi_rischi/index.typ"
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Suddivisione del lavoro", documentType: doc)[

]

 
#insertArabicNumberedPagesSenzaData(PageTitle: "Pianificazione di lungo periodo", documentType: doc)[



  // == Scomposizione del lavoro

  // Scomposizione delle attività di progetto e identificazione degli input e degli output di ogni attività.
  // Eventualmente separandole per "scope", processi primari, di supporto, organizzativi.
   #insertArabicNumberedPagesSenzaData(PageTitle: "Pianificazione", documentType: doc)[
  = Pianificazione <Pianificazione>

  La pianificazione del progetto si basa su un modello *iterativo e incrementale*, ispirato ai principi dell'approccio *Agile*, con l'obiettivo di garantire un monitoraggio continuo dell'avanzamento e una gestione efficace delle attività.
  
  Il lavoro del gruppo è organizzato in *sprint di durata bisettimanale*, scelti come compromesso ottimale tra capacità di pianificazione realistica e frequenza di verifica dei risultati ottenuti.

  Ogni sprint ha inizio con un *incontro di pianificazione*, durante il quale vengono definite le attività da svolgere, gli obiettivi da raggiungere e le priorità associate.
  Nel corso dello sprint è previsto inoltre un *incontro settimanale di allineamento* ("punto della situazione"), finalizzato a verificare lo stato delle attività in corso, individuare eventuali criticità e, se necessario, ricalibrare il carico di lavoro.
  
  Al termine di ogni sprint viene svolta una *retrospettiva*, che consente al gruppo di valutare il lavoro svolto, analizzare le difficioltà incontrate e individuare possibili miglioramenti del processo organizzativo.
  Contestualmente,  i ruoli vengono ruotati a ogni sprint , al fine di permettere a tutti i membri del gruppo di acquisire esperienza nelle diverse responsabilità previste e di individuare una distribuzione dei ruoli efficace e sostenibile nel tempo.
  
  Questo approccio consente di mantenere una visione chiara delle priorità, favorire l'adattamento alle esigenze del progetto e assicurare una progressione costante e controllata verso il raggiungimento degli obiettivi prefissati.

]
  #insertArabicNumberedPagesSenzaData(PageTitle: "Pianificazione di lungo periodo ", documentType: doc)[
  = Pianificazione di lungo periodo <Pianificazione_di_lungo_periodo>
  == Organizzazione del progetto <orgProgetto>
  === Ruoli
  #align(center)[
  #{
  show table.cell: set text(size: 11pt)
  table(
    columns: 3,
    align: horizon,
    table.header([*Ruolo*],[*Compiti*],[*Presenza*]),

    [Responsabile], "- Coordinamento piani e scadenze\n- Approvazione release\n- Comunicazione col committente\n- Uso efficiente delle risorse\n- Redazione documenti", [Tutto il progetto],

    [Amministratore], "- Garanzia efficienza strumenti\n- Gestione tecnologie di supporto\n- Verifica procedure secondo norme", [Tutto il progetto],

    [Verificatore], "- Testing e validazione\n- Controllo qualità deliverable\n- Conformità ai requisiti", [Tutto il progetto],

    [Analista], "- Analisi dei requisiti\n- Definizione bisogni del sistema\n- Redazione specifiche funzionali", [Fase iniziale],

    [Progettista], "- Progetta architettura sistema\n- Design e modellazione\n- Traduzione requisiti in struttura tecnica", [Dopo analisi],

    [Programmatore], "- Codifica software\n- Implementazione design\n- Sviluppo funzionalità", [Implementazione],
  )
}]
]


=== Preventivo <Preventivo>
Il gruppo di lavoro prevede di completare il progetto entro e non oltre il *30 aprile 2026*, nel rispetto di un  *budget complessivo pari a 11610€*.

Il dettaglio della pianificazione e del budget stimato è consultabile nel documento di candidatura disponibile al seguente link: 
#link("https://grouprubberduck.github.io/Documentazione/output/Candidatura/Dichiarazione_Impegni-v2.0.0.pdf")[
Dichiarazione degli Impegni – versione 2.0.0
]

Di seguito viene riportata la *tabella riepilogativa dei costi*, già inclusa nella *Dichiarazione degli Impegni*. La tabella rappresenta la stima economica elaborata in fase di candidatura e costituisce il riferimento principale per la pianificazione, il monitoraggio e il controllo dei costi lungo l'intero ciclo di vita del progetto.
  #let ruoli = (
    (nome: "Responsabile", costo: 30, oreIndividuali: 11),
    (nome: "Amministratore", costo: 20, oreIndividuali: 9),
    (nome: "Analista", costo: 25, oreIndividuali: 19),
    (nome: "Progettista", costo: 25, oreIndividuali: 17),
    (nome: "Programmatore", costo: 15, oreIndividuali: 17),
    (nome: "Verificatore", costo: 15, oreIndividuali: 18),
  )
  #let acc = (nome: "Totali", oreIndividualiTotali: 0, oreTotali: 0, placeholder: "", costoTot: 0)


  #let analisiImpegni = ()

  #for ruolo in ruoli {
    let oreTot = ruolo.at("oreIndividuali") * 6
    analisiImpegni.push((
      ruolo.at("nome"),
      str(ruolo.at("oreIndividuali")),
      str(oreTot),
      str(ruolo.at("costo")),
      str(ruolo.at("costo") * oreTot),
    ))

    acc.at("oreIndividualiTotali") += ruolo.at("oreIndividuali")
    acc.at("oreTotali") += oreTot
    acc.at("costoTot") += ruolo.at("costo") * oreTot

  }

  #analisiImpegni.push((
    acc.at("nome"),
    str(acc.at("oreIndividualiTotali")),
    str(acc.at("oreTotali")),
    acc.at("placeholder"),
    str(acc.at("costoTot")),
  ))
    #set table(
      stroke: (_, y) => if y == 7 { (top: 1.5pt) },
      // gutter: 0.2em,
      fill: (x, y) => if x == 0 or y == 0 { white },
    )


    #figure(
      caption: [Ripartizione oraria e dettaglio dei costi],
      kind: "Tabella",
      supplement: [Tabella],
    )[
      #utilityTable(
        header: ("Ruolo", "Ore individuali", "Ore Totali", "Costo (€/h)", "Costo totale (€)"),
        columns: (1fr,) * 5,
        analisiImpegni,
      )
    ]<tabella-ore>


  == Requirements and Technology Baseline

In questa fase iniziale del progetto, le attività sono principalmente orientate all'*analisi dei requisiti* e all'*analisi dei rischi*, con l'obiettivo di definire una baseline solida e condivisa su cui fondare le fasi successive.

Di seguito vengono riportati i documenti richiesti per questa fase.
Ogni documento è suddiviso nelle sezioni che lo compongono, con l'indicazione degli sprint a cui sono associati. Questo approccio permette di avere una *visione d'insieme delle attività*, stimare il lavoro complessivo e suddividerlo successivamente in singoli sprint, seguendo le *buone pratiche dello sviluppo agile*.   


  #let attivitaADR=(
      "Studio della struttura del documento",
      [_Sprint 1_],
      "Completato", 
      "Redazione dell'introduzione",
      [_Sprint 1_],
      "Completato",
      "Definizione dei casi d'uso: requisiti obbligatori",
      [_Sprint 2_],
      "Completato",
      "Definizione dei casi d'uso: requisiti non obbligatori;",
      [_Sprint 3_],
      "Da definire",
       "Raffinazione dei casi d'uso",
      [_Sprint 3_],
      "Da definire",
      "Requisiti",
      [_Sprint _],
      "Da definire",
  ) 
#figure(caption:"RTB-Analisi dei Requisiti")[
#tabellaAtt(titolo:"Analisi dei Requisiti",attivita:attivitaADR)
]

  #let attivitaPP=(
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
      [Studio dei metodi \ pianificazione],
      [_Sprint 3_],
      "In corso",
      [Pianificazione di \ lungo periodo],
      [_Sprint 3_],
      "Completato",
      [Pianificazione di \ breve periodo],
      [_Tutti sprint_],
      "In corso",
  ) 
#figure(caption:"RTB-Piano di Progetto")[
#tabellaAtt(titolo:"Piano di Progetto",attivita:attivitaPP)
]

  #let attivitaPP=(
      "Studio della struttura del documento",
      [_Sprint 1_],
      "Completato", 
      "Redazione dell'introduzione",
      [_Sprint 3_],
      "In corso",
      "Soglie delle misurazioni",
      [_Sprint 3_],
      "In corso",
      "Automiglioramento",
      [_Sprint 1_],
      "Da definire",
      "Metodi di testing",
      [_Sprint 1_],
      "Da definire",
      "Cruscotto di valutazione",
      [_Sprint 1_],
      "Da definire",
  ) 
#figure(caption:"RTB-Piano di Qualifica")[
#tabellaAtt(titolo:"Piano di Qualifica",attivita:attivitaPP)
]


  #let attivitaNP=(
      "Studio della struttura del documento",
      [_Sprint 1_],
      "Completato", 
      "Redazione dell'introduzione",
      [_Sprint 1_],
      "Completato",
      "Studio dei processi di di ciclo di vita primari",
      [_Sprint 3_],
      "In corso",
      "Studio dei processi di di ciclo di vita di supporto",
      [_Sprint 2_],
      "Compleato",
      "Studio dei processi di di ciclo di vita organizzativi",
      [_Sprint 2_],
      "Completato",
      "Studio delle best pratices o altro materiale ritenuto importante",
      [_Tutti sprint_],
      "In corso",
  ) 
#figure(caption:"RTB-Norme di Progetto")[
#tabellaAtt(titolo:"Norme di Progetto",attivita:attivitaNP)
]

  #let attivitaGL=(
      "Aggiornamento del glossario",
      [_Tutti gli sprint_],
      "In corso", 
  ) 
#figure(caption:"RTB-Glossario")[
#tabellaAtt(titolo:"Glossario",attivita:attivitaGL)
]


  #let attivitaPoC=(
      "Python 3x",
      [_Sprint 1_],
      "Da definire", 
       "Flask",
      [_Sprint 1_],
      "Da definire", 
       "Docker",
      [_Sprint 1_],
      "Da definire",
  ) 
#figure(caption:"RTB-Proof of Concept")[
#tabellaAtt(titolo:"Proof of Concept",attivita:attivitaPoC)
]



  === Product Baseline
La redazione di questo paragrafo sarà effettuato in seguito al superamento della Requirements and Technology Baseline(RTB).
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Pianificazione di breve periodo", documentType: doc)[
  = Pianificazione di breve periodo 
  #include "content/05-pianificazione_breve_periodo/index.typ"
]

