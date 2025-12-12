#import "/src/config.typ":template_dir
#import template_dir + "/utilityTable.typ": getCode
#import template_dir + "/PdP/tabellaRischi.typ": tabellaRischiTecnologici
#import template_dir + "/PdP/tabellaRischi.typ": tabellaRischiPersonali
#import template_dir + "/PdP/tabellaRischi.typ": tabellaRischiOrganizzativi

  === Tipi di rischi
  La norma ISO 21502:2020, dedicata alla gestione dei progetti, specifica che la gestione dei rischi deve coprire tutte le incertezze che possono influenzare:
  #pad(left: 1em)[ 
  - gli obiettivi del progetto, in termini di tempi, costi, risorse e qualità dei processi;
  - gli output del progetto, quindi il prodotto/servizio realizzato e la sua capacità di soddisfare i requisiti.
  ]
  In coerenza con tali riferimenti, il progetto distingue due categorie principali di rischio non mutualmente esclusive:
  #pad(left: 1em)[ 
  - *Rischi di progetto* : Questi rischi possono influire sulla tabella di marcia o sulle risorse disponibili per il progetto. 
  - *Rischi di prodotto* : Questi rischi possono influire sulla qualità o sulle funzionalità del prodotto.

=== Struttura delle tabelle dei rischi 

Per facilitare l'identificazione dei rischi si è utilizzata una convenzione per classificarli secondo il seguente formato:  
#align(center)[
R[Tipo][Indice]]

dove:

*R* #sym.arrow indica che si tratta di un rischio

*Tipo* #sym.arrow rappresenta la categoria di un rischio, che può essere:

T = tecnologico

P = personale

O = organizzativo

*Indice* #sym.arrow numero progressivo che identifica univocamente il rischio all'interno della categoria
  
  ]

  === Registro dei rischi

  ==== Rischi tecnologici
  #let contatoreR = counter("rischi tec")
  #contatoreR.update(1)
  #let prefisso = "R.T."

//tabella sotto solo come esempio
#tabellaRischiTecnologici(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Comprensione errata della norma EN 18031",
    tipo: "Rischio di prodotto",
    descrizione: [La norma EN 18031 su cui si basa il progetto potrebbe essere interpretata in modo errato o incompleto dal team, portando allo sviluppo di funzionalità non conformi agli standard richiesti.],
    prevenzione: [La prevenzione richiede di dedicare tempo sufficiente allo studio approfondito della norma EN 18031 prima dell'inizio dello sviluppo, organizzando sessioni di analisi collettiva con tutto il team per condividere e allineare le interpretazioni.],
    mitigazione: [Nel caso si sospetti un'interpretazione errata, è essenziale effettuare immediatamente un controllo di conformità per limitare il lavoro da rifare. Sarà necessario rivedere sistematicamente tutte le componenti sviluppate sulla base dell'interpretazione errata e ripianificare le attività allocando tempo per le correzioni necessarie.],
    frequenza: "Media",
    pericolo: "Alta",
  )

  #tabellaRischiTecnologici(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Inesperienza con le tecnologie",
    tipo: "Rischio di progetto + Rischio di prodotto",
    descrizione: [L’utilizzo di tecnologie nuove o poco conosciute può rallentare significativamente il progetto, poiché richiede tempo per lo studio e la sperimentazione.],
    prevenzione: [Per prevenirlo si prevedono momenti iniziali di studio e la creazione di piccoli prototipi per acquisire familiarità. Il team può inoltre condividere materiali o esperienze per velocizzare l’apprendimento.],
    mitigazione: [Se la mancanza di conoscenza diventa un ostacolo, si potrebbe ricorre al supporto del team di Bluewind o si scelgono soluzioni tecniche più semplici. Questo permetterebbe di evitare blocchi prolungati e mantenere una buona produttività.],
    frequenza: "Alta",
    pericolo: "Alta",
  )

  #tabellaRischiTecnologici(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Problemi critici nel prodotto finale",
    tipo: "Rischio di prodotto",
    descrizione: [Rischio legato a integrazioni difficili e bug critici],
    prevenzione: [Test frequenti e integrazioni progressive aiutano a intercettare i problemi prima che diventino critici. È utile adottare una logica di sviluppo incrementale, che consente di individuare facilmente dove nasce un malfunzionamento. ],
    mitigazione: [Quando emerge un problema grave, si procede con sessioni di debug collaborativo e, se necessario, si torna a una versione stabile precedente. Questo permette di lavorare in un ambiente più sicuro e di risolvere i difetti senza compromettere il resto del progetto. L’obiettivo è contenere il danno e riprendere lo sviluppo rapidamente.],
    frequenza: "Media",
    pericolo: "Alto",
  )

 /* #tabellaRischiTecnologici(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Rischio tecnologico legato a errori nel codice",
    tipo: "",
    descrizione: [],
    prevenzione: [],
    mitigazione: [],
    frequenza: "",
    pericolo: "",
  )*/



  ==== Rischi personali
  
  #let contatoreP = counter("rischi personali")
  #contatoreP.update(1)
  #let prefisso = "R.P."
  #contatoreR.update(1)


  // ([#getCode(prefisso:prefisso,contatore:contatoreR)],[],[]),
  #tabellaRischiPersonali(

    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Disponibilità variabile dei membri del team o imprevisti di impegno",
    tipo: "Rischio di progetto",
    descrizione: [La disponibilità dei membri può cambiare in modo imprevisto per motivi personali o esterni, influenzando negativamente la continuità del lavoro. Alcuni periodi possono risultare particolarmente difficili da gestire a causa di impegni improvvisi.],
    prevenzione: [Un piano di lavoro flessibile e una distribuzione equilibrata delle attività aiutano a compensare eventuali variazioni. È utile prevedere margini organizzativi e mantenere una buona comunicazione interna, così da sapere in anticipo possibili periodi critici.],
    mitigazione: [Quando un membro riduce la propria disponibilità, le attività vengono riassegnate in modo temporaneo per garantire la continuità. La documentazione costante permette a chi subentra di recuperare rapidamente lo stato dei lavori.],
    frequenza: "Media",
    pericolo: "Elevata",
  )


    #tabellaRischiPersonali(

    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Rischio individuale dovuto ad altre attività universitarie",
    tipo: "Rischio di progetto",
    descrizione: [Rischio legato alla difficoltà a seguire contemporaneamente lezioni, progetti e studio.],
    prevenzione: [È utile pianificare in anticipo i periodi accademici più impegnativi, ad esempio la sessione d'esami invernale, considerando dunque possibili riduzioni temporanee della disponibilità. In questo modo si evitano sovrapposizioni troppo pesanti.],
    mitigazione: [Se un membro è in difficoltà, si può intervenire ridistribuendo temporaneamente alcuni compiti o posticipando scadenze interne meno urgenti. Anche un supporto reciproco tra membri può risultare molto utile.],
    frequenza: "Media",
    pericolo: "Elevata",
  )




  ==== Rischi organizzativi
   #let contatoreO = counter("rischi organizzativi")
  #contatoreO.update(1)
  #let prefisso = "R.O."
  #contatoreR.update(1)

  #tabellaRischiOrganizzativi(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: " Pianificazione iniziale errata o ottimistica",
    tipo: "Rischio di progetto",
    descrizione: [Rischio organizzativo legato all'inesperienza nella stima delle attività necessarie e/o sottovalutazione della complessità effettiva del progetto.],
    prevenzione: [Per prevenire questo rischio è importante effettuare una scomposizione delle attività in task più piccoli e stimabili con maggiore precisione, inoltre verificare più volte la validità delle stime attraverso confronti interni. Un’analisi approfondita all'inizio di ogni sprint aiuta a riconoscere eventuali punti critici prima che emergano. È inoltre utile mantenere un margine di sicurezza nelle tempistiche."],
    mitigazione: [Se emergono problemi legati a stime inadeguate, il piano viene riesaminato e ricalibrato, distribuendo nuovamente le responsabilità e ridefinendo le priorità. Le attività più critiche vengono gestite con maggiore attenzione e si può prevedere l’aggiunta di tempo extra.],
    frequenza: "Alta",
    pericolo: "Media",
  )

  #tabellaRischiOrganizzativi(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Sovrastima delle attività",
    tipo: "Rischio di progetto",
    descrizione: [Rischio legato alla sovrastima della complessità di un o più task e la conseguente inattività del team o di un suo membro. ],
    prevenzione: [Per prevenirlo è utile confrontare le stime con esperienze precedenti o con la percezione di più membri del team. Un sistema di revisione collettiva delle valutazioni aiuta a ridurre deviazioni significative. Inoltre, aggiornare le stime man mano che si acquisiscono nuove informazioni favorisce una migliore allineamento temporale.],
    mitigazione: [In caso di sovrastima, gli interessati segnalano l'avvenuto e si procede riorganizzando rapidamente il lavoro disponibile, assegnando loro nuove attività e mantenendo un flusso costante. Questo evita sprechi e periodi di inattività.],
    frequenza: "Media",
    pericolo: "Bassa",
  )
  #tabellaRischiOrganizzativi(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Mancanza di comunicazione e collaborazione",
    tipo: "Rischio di progetto",
    descrizione: [Rischi legati a compiti non assegnati chiaramente portano a sovrapposizioni o a task non coperti.],
    prevenzione: [È fondamentale stabilire momenti ricorrenti di confronto e utilizzare in modo rigoroso il canale di comunicazione scelto, ovvero Github. Una chiara definizione di come e dove condividere aggiornamenti riduce la possibilità di dispersione delle informazioni.],
    mitigazione: [Quando si notano segnali di scarsa comunicazione, si organizzano rapidamente incontri di allineamento per ristabilire una visione comune. La documentazione viene aggiornata e resa facilmente accessibile per garantire trasparenza.],
    frequenza: "Media",
    pericolo: "Alta",
  )


  /*#tabellaRischiOrganizzativi(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Scarsa definizione dei ruoli",
    tipo: "",
    descrizione: [Rischio legato a disordini, duplicazioni di file, conflitti Git o mancanza di tracciamento.],
    prevenzione: [],
    mitigazione: [],
    frequenza: "",
    pericolo: "",
  )*/


  #tabellaRischiOrganizzativi(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Strumenti di coordinamento usati in modo non efficace",
    tipo: "Rischio di progetto",
    descrizione: [Strumenti come GitHub, Discord o Drive vengono usati in modo disordinato, si rischia confusione nei file, difficoltà nel tracciamento delle attività e conflitti nella gestione del codice. La mancanza di un metodo condiviso porta rapidamente a caos organizzativo.],
    prevenzione: [Per evitarlo è essenziale definire linee guida d’uso e standard comuni, come convenzioni di naming e strutture chiare delle cartelle. La definizione di queste pratiche nel documento Norme di Progetto aiuta sicuramente a garantire che tutti usino gli strumenti correttamente. Il rispetto delle regole condivise favorisce un ambiente ordinato.],
    mitigazione: [Se l’inefficienza si manifesta, si procede con una riorganizzazione dei repository e dei documenti, eliminando materiali duplicati o inutili. Eventuali membri in difficoltà vengono supportati per migliorare l’utilizzo degli strumenti. ],
    frequenza: "Bassa",
    pericolo: "Media",
  )

/*
  #tabellaRischiOrganizzativi(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Carenze di conoscenze nella gestione di progetti di questa portata",
    tipo: "Rischio di progetto",
    descrizione: [Limitata esperienza del team nella gestione di progetti complessi e di dimensioni superiori a quelli affrontati in precedenza. Questa mancanza può influire sulla capacità di coordinare attività e gestire un'architettura non monolitica composta da componenti eterogenei.
    ],
    prevenzione: [Introdurre momenti di formazione specifica sulla gestione di progetti complessi e sulle metodologie organizzative da adottare.
    Studiare casi reali e best pratice per migliorare la capacità di pianificazione e coordinamento. Promuovere la condivisione interna della conoscenza tramite meeting periodici, retrospettive e documentazione condivisa.],
    mitigazione: [Considerare che parte dell'impegno orario dovrà essere dedicato alla formazione tecnica individuale. Pianificare una possibile riorganizzazione delle attività, spostando quelle meno critiche ai periodi successivi qualora il supporto da parte del team non sia immediatamente disponibile. Valutare la disponibilità di Bluewind nel fornire supporto tecnico, mentoring o chiarimenti architetturali.
    ],
    frequenza: "Alta",
    pericolo: "Alta",
  )*/


  // == Analisi dei rischi
  //   Lista dei rischi ordinati per priorità, espressa in probabilità che accada e impatto sul progetto.
  // == Prevenzione e gestione dei rischi
  //   Strategie atte ad evitare, minimizzare o contenere i rischi
  // 
  // 
  // 
