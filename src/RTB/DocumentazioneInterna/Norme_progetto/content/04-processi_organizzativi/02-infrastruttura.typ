#import "/src/config.typ":he

Questo processo stabilisce e mantiene le infrastrutture che supportano gli altri processi.

#he(body:"Attività previste",level:3)

+ Implementazione del processo;
+ Creazione;
+ Manutenzione.

Tutte i task legati alle attività di creazione e manutenzione sono di competenza dell'amministratore.

#he(body:"Implementazione del processo",level:3)
Data la necessità di facilitare il lavoro del gruppo, in particolare la comunicazione asincrona, sono stati adottati diversi strumenti:

#terms(separator: ": ",
  ([Discord],[Piattaforma per videoconferenze e messaggistica usata dal gruppo per le riunioni interne da remoto.]),
  ([Zoom],[Piattaforma per videoconferenze usata per le riuninone daq remoto con *BlueWind*.]),
  ([WhatsApp],[App di messaggistica istantanea usata per le comunicazioni interne asincrone, tramite un gruppo dedicato alle attività di progetto.]),
  ([Telegram],[App di messaggistica istantanea usata per le comunicazioni asincrone con la proponente, *BlueWind*.]),
  ([Typst],[Linguaggio di markup usato per la creazione dei documenti. \ La compilazione è stata automatizzata tramite script. ]),
  ([Tinymist Typst],[Estensione di Visual Studio Code per il supporto alla sintassi di Typst e per le funzionalità di live-preview:]),
  ([Script bash],[Sono state implementate diverse automazioni eseguite da GitHub action, il gruppo ha preferito, ove possibile, usare script bash in quanto richiedono solo un terminale linux per eseguire.]),
  ([Git],[Distributed version control system impiegato dal gruppo nello sviluppo di codice e documenti.]),
  ([GitHub],[#upper("è") una piattaforma basata su cloud che consente agli sviluppatori di archiviare, gestire e collaborare sul codice sorgente dei loro progetti. \ È strettamente legato a Git. \ Offre molte funzionalità utili alle attività di progetto.]),
  ([Google docs],[Editor online per documenti condivisi, usato dal gruppo per le attività di brainstorming asincrono.]),
  ([Google sheets],[Editor online per fogli di calcolo condivisi, usato dal gruppo per tracciamento di dati.]),
  ([Google drive],[Sistema di file sharing usato per condividere risorse utili oppure ad uso esclusivo del team.]),
)


#he(body:"Creazione",level:3)
In questa sezione viene documentato come sono stati creati e configurati gli strumenti significativi.

#show figure: set block(breakable: true)
#figure(caption: "Strumenti utilizzati", kind:table)[
#show grid.cell.where(x:0):cell=>{strong(cell)}

#grid(
  grid.vline(x:1, stroke:(luma(20%))),
  columns: (auto, 0pt ,1fr),align: left, gutter: (2em,1em) ,
  [Typst],[],[L'ambiente di lavoro typst è stato personalizzato. \ 
  Typst offre la possibilità di definire dei template che vengono usati in maniera analoga alle chiamate di funzione di un normale linguaggio di programmazione.\
  I template più usati svolgono le seguenti funzioni:
  #terms(separator:[: \ ], hanging-indent: 0em ,spacing:1.5em,
  ([Impaginazione],[Permette di impostare facilmente il contenuto di header e footer. \
  Contiene inoltre le regole di stile comuni a tutti i documenti #footnote()[Ad esempio, i link non sono di colore blu e sottolineati di default. Imponendo questa regola stilistica all'interno del template, questa viene ereditata dal contenuto della pagina.]]),
  ([Tabelle],[Sono stati predisposti dei template per la creazione semplificata di tabelle.]),
  ([Sprint],[Il riassunto degli sprint è un'attività ripetitiva, tramite template vengono effettuati tutti i calcoli necessari e viene predisposto il layout in cui inserire il contenuto.]),
  ([Marcatura automatica dei termine del Glossario],[Però va abilitata modificando un apposito flag booleano; se lasciata sempre attiva impatta negativamente le funzionalità di live preview. ]),
  ([Separazione tra contenuto e layout del glossario],[I termini del glossario e le relative definizioni sono definite su un file a parte come dizionario. \ Questo permette di automatizzare l'ordinamento e di generare visualizzazioni facilmente personalizzabili (sia in formato pdf che in formato html)]),
  )
  ],


  [Git],[],[ L'intero progetto è usa Git per il versionamento. \
          Sono stati creati 2 branch principali: \
          - *Main*, per il rilascio;
          - *Develop*, per lo svolgimento delle attività di progetto.
          #upper("è") stato predisposto un .gitignore per evitare la pubblicazione di file indesiderati.
          ],
  [GitHub],[],[#upper("è") stata creata un #link("https://github.com/GroupRubberDuck")[GitHub Organization] per le attività di progetto e un #link("https://github.com/GroupRubberDuck/Documentazione")[repository] per la documentazione.
  
  #terms(
    separator:[: \ ],
    ([GitHub Actions],[Sono state configurate delle GitHub Actions per la compilazione automatica dei file Typst e aggiornamento automatico del sito web. \
    ]),
    ([GitHub Pages],[#upper("è") stata attivata la funzionalità GitHubPages per l'hosting del sito web.]),
    ([GitHub Issue tracking system],[Il gruppo ha deciso di avvalersi dell'issue tracking system offerto da GitHub, vedi di più alla #ref(label("issue-tracking-system---guida-operativa"))]),
  )
  ],
  [Strumenti di \ comunicazione],[],[
    Nessuno degli strumenti di comunicazione ha richiesto operazioni significative durante la creazione.
  ],
  [Strumenti \ Google],[],[#upper("è") stata creata una mail apposita per le attività relative al progetto. \ 
  Drive e Docs non richiedono particolari operazioni se non il caricamento del materiale.
  Sheets invece richiede operazioni più complesse per implementare gli indicatori desiderati.
  ],


)

]

#he(body:"Manutenzione",level:3)
Nell'ambito del progetto è necessario mantenere aggiornata l'infrastruttura.
Le operazioni di manutenzione possono essere di vario tipo.
- In base alla frequenza:
  - Ordinaria, ovvero l'aggiornamento periodico legato alla normale attività di progetto;
  - Non ordinaria, ovvero aggiunte, modifiche e cancellazioni legate a cause non ordinarie. 



#he(body:"Issue tracking System - Guida Operativa",level:4)
L'*Issue Tracking System* è lo strumento utilizzato dal nostro team di sviluppo per tracciare in maniera efficiente tutte le issue da svolgere e il loro stato di completamento.
Il sistema è accessibile a tutti i membri del gruppo attraverso la repository GitHub, dove è disponibile un *template di issue condiviso e centrale*, in modo da evitare incongruenze o confusione.

// stati dell'issue -> quando si avrà immagine del workflow
==== Creazione e struttura di un issue
Task ordinario.
A seguito di riunioni interne o esterne, il gruppo decide le attività su cui concentrarsi. 
L'*amministratore* ha il compito di creare le issue nel sistema utilizzando un apposito *template*.

Ogni nuova issue deve includere:

+ *Assegnatario/i* \ Generalmente è preferibile assegnare la issue a una sola persona. Tuttavia, per attività di formazione o esercitazioni ("palestra") si possono assegnare più persone o l'intero gruppo. 

+ *Descrizione*\ Una spiegazione dettagliata e specifica delle azioni da svolgere.

+ *Scopo*\ Indica cosa ci si aspetta di ottenere al termine dell'issue e dove andrà documentato il risultato (ad esempio, in quale documento o sezione del repository).

+ *Autore*\ La persona che deve svolgere la issue.
+ *Verificatore*\ La persona incaricata di verificare che la issue sia stata risolta correttamente, in base alla Definition of Done. Il verificatore, a meno di eccezioni straordinarie, è diversa dall'autore.

+ *Label (ambito/destinazione)*\ #[
  Questa classificazione consente di organizzare le issue in base al loro ambito o posizione all’interno del progetto: 
- Analisi dei requisiti 
- Piano di progetto 
- Piano di qualifica 
- Norme progetto
- Verbale
- Diario di bordo
- Glossario 
- Generale -> attività che non rientrano nei documenti sopra: studio di materiale aziendale, lavori sul sito web, gestione repository, attività varie fuori dai documenti principali.

*Nota* \
Le label potrebbero cambiare durante le attività di progetto, label superflue verranno eliminate, verranno aggiunte nuove label o potrebbero cambiare nome.
L'utilità principale delle label è di semplificare la ricerca di issue legati a uno specifico task.

]
+ *Tipo di issue (Type)*\ #[
Permette di distinguere la natura delle attività e dei task:
- Palestra -> ore formative non rendicontate, attività di ricerca o di studio 
- Produttivo -> ore rendicontate con risultati concreti, come la scrittura di documenti da presentare  
- Bug -> errori o malfunzionamenti nel codice;
- Correzione -> interventi su documenti o materiali già prodotti per migliorarli, aggiornarli o correggere inesattezze; 

#link("https://docs.github.com/en/issues/tracking-your-work-with-issues/using-issues/managing-issue-types-in-an-organization")[Tracking-your-work-with-issue-Guide]
 ]
+ *Priorità : Bassa, Media, Alta * \ #[
Questa suddivisione ha due scopi:
- ragionare sull'importanza della issue che si sta scrivendo
- comunicare all'assegnatario con quale tempestività dovrà svolgere la issue
]
+ *Dimensione : ExtraSmall, Small, Medium, Large * \ Serve per stimare la mole di lavoro necessaria per portare a termine quella issue.
+ *Data di scadenza*\ Normalmente coincide con la fine dello sprint di riferimento. 

===== Flusso operativo

+ L’amministratore crea una nuova issue tramite il template.
+ Si assegnano autore/i e verificatore/i.
+ Si compilano descrizione, scopo, label, type, priorità, dimensione, scadenza. 
+ La issue viene inserita nello stato iniziale Backlog e segue il flusso fino a Done.

#he(body:"Project board",level:5)
Le issue vengono inserite in un'apposita project board per riflettere meglio il quadro generale.

#he(body:"Milestone",level:5)
Le milestone sono una parte fondamentale nella pianificazione di lungo periodo. \

#upper("è") compito dell'amministratore assegnare gli issue alla milestone. 
Deve anche tenere le milestone aggiornate in caso di cambiamenti.


#he(body:"GitHub Actions",level:4)
Le GitHub Actions sono configurabili e modificabili tramite file YML. \
Sono salvate nella cartella #underline(".github/workflows").


#he(body:"Script e automazioni",level:4)
Il mantenimento degli script è compito dell'amministratore.

Questo avviene quando viene deciso di introdurre una nuova automazione, un'automazione diventa obsoleta o un'automazione è errata.

Le automazioni strettamente legate alla redazione di documenti Typst sono salvate in un'apposita cartella 
Le automazioni strettamente legate alla redazione di documenti Typst, i template, sono salvate in un'apposita cartella #underline("src/TypstTemplate") all'interno del repository #link("https://github.com/GroupRubberDuck/Documentazione")[Documentazione]. \
Script a scopo generale sono salvati nella cartella #underline("scripts").


#he(body:"Discord",level:4)
Le uniche operazioni degne di nota per la piattaforma Discord sono la creazione di nuovi canali e la moderazione di bassa entità.

#he(body:"Strumenti Google",level:4)
Di seguito sono esposte le attività e i task relative agli strumenti Google.
#terms(separator: [: \ ],
([Google drive],[Eliminazione di file obsoleti e creazione di file.]),
([Google docs],[Dove opportuno predisporre l'opportuno layout per il documento.]),
([Google Sheets],[Implementare le metriche stabilite tramite le funzionalità dei fogli di calcolo.]),


)
