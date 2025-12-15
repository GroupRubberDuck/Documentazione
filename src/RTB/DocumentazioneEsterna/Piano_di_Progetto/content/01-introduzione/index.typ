#import "/src/config.typ":he,template_dir, inserisciLink
#import template_dir + "/utilityTable.typ": getCode, utilityTable

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

  == Organizzazione del progetto 
// valutare se lasciarlo qui 
  === Ruoli

  #list(
    [*Responsabile*:
      - Coordina l’elaborazione di piani e scadenze
      - Approva il rilascio di prodotti parziali o finali
      - Comunica con il committente
      - Garantisce che le risorse disponibili siano usate con efficienza
      - Si occupa della redazione di documenti
      - Presenza richiesta durante tutto l'arco del progetto
    ],

    [*Amministratore*:
      - Assicura l’efficienza di procedure, strumenti e tecnologie a supporto delle norme di progetto
      - Presenza richiesta durante tutto l'arco del progetto
    ],

    [*Analista*:
      - Svolge le attività di analisi dei requisiti
      - Figura essenziale nella fase iniziale del progetto
    ],

    [*Progettista*:
      - Si occupa di progettare un'architettura che soddisfi i requisiti stabiliti dall'analista
      - Svolge le attività di design e modellazione
      - Figura essenziale nella fase di progettazione (successiva all'analisi dei requisiti)
    ],

    [*Programmatore*:
      - Svolge le attività di codifica
      - Implementa le scelte prese dal progettista
      - Figura essenziale nella fase di implementazione
    ],
    [*Verificatore*:
      - Garantisce la qualità degli elementi sviluppati
      - Svolge le attività di testing e validazione
      - Presenza richiesta durante tutto l'arco del progetto
    ],
  )

// === Preventivo <Preventivo>
// In fase di candidatura, è stato approvato il seguente preventivo dei costi.

//   #let ruoli = (
//     (nome: "Responsabile", costo: 30, oreIndividuali: 11),
//     (nome: "Amministratore", costo: 20, oreIndividuali: 9),
//     (nome: "Analista", costo: 25, oreIndividuali: 19),
//     (nome: "Progettista", costo: 25, oreIndividuali: 17),
//     (nome: "Programmatore", costo: 15, oreIndividuali: 17),
//     (nome: "Verificatore", costo: 15, oreIndividuali: 18),
//   )
//   #let acc = (nome: "Totali", oreIndividualiTotali: 0, oreTotali: 0, placeholder: "", costoTot: 0)


//   #let analisiImpegni = ()

  // #for ruolo in ruoli {
  //   let oreTot = ruolo.at("oreIndividuali") * 6
  //   analisiImpegni.push((
  //     ruolo.at("nome"),
  //     str(ruolo.at("oreIndividuali")),
  //     str(oreTot),
  //     str(ruolo.at("costo")),
  //     str(ruolo.at("costo") * oreTot),
  //   ))

  //   acc.at("oreIndividualiTotali") += ruolo.at("oreIndividuali")
  //   acc.at("oreTotali") += oreTot
  //   acc.at("costoTot") += ruolo.at("costo") * oreTot

  // }

  // #analisiImpegni.push((
    // acc.at("nome"),
    // str(acc.at("oreIndividualiTotali")),
    // str(acc.at("oreTotali")),
    // acc.at("placeholder"),
    // str(acc.at("costoTot")),
  // ))
  //   #set table(
  //     stroke: (_, y) => if y == 7 { (top: 1.5pt) },
  //     // gutter: 0.2em,
  //     fill: (x, y) => if x == 0 or y == 0 { white },
  //   )


  //   #figure(
  //     caption: [Ripartizione oraria e dettaglio dei costi],
  //     kind: "Tabella",
  //     supplement: [Tabella],
  //   )[
  //     #utilityTable(
  //       header: ("Ruolo", "Ore individuali", "Ore Totali", "Costo (€/h)", "Costo totale (€)"),
  //       columns: (1fr,) * 5,
  //       analisiImpegni,
  //     )
  //   ]<tabella-ore>

  == Miglioramenti del documento
  Il presente documento è soggetto a revisioni periodiche durante tutto il ciclo di vita del progetto. Le modifiche possono essere proposte da:

  - Team di sviluppo: in caso di ambiguità o necessità di chiarimenti tecnici
  - Azienda proponente: per integrazioni o modifiche ai requisiti

  Le modifiche sostanziali ai requisiti comportano l'incremento della versione principale (es. da 1.0.0 a 2.0.0), mentre chiarimenti incrementano la versione secondaria (es. da 1.0.0 a 1.1.0). La correzione ortografica o di parti errate relative ad una versione secondaria incrementerà la versione terziaria (es. da 1.1.0 a 1.1.1).\


  == Riferimenti

  === Riferimenti normativi
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
  === Riferimenti informativi
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