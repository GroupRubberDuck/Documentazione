// 
// Piano di Progetto 
// = Sezione 5 - Pianificazione di breve periodo
// == Sottosezione 1 - Requirements and Technology Baseline
// 
#import "/src/config.typ":template_dir
#import template_dir+"/PdP/sprint.typ":sprint,ruoli,persone,aggiornaResiduo, displayResiduo

// 
// Sprint 1
// 

#let date=(inizio:datetime(year: 2025,month: 11,day:10),
finePrevista:datetime(year: 2025,month: 11,day:25),
fineEffettiva:datetime(year: 2025,month: 11,day:25))

#let sprintcounter=counter("sprint")
#sprintcounter.update(1)
#let TODO=[  In questo primo periodo di avanzamento, le attività del gruppo si concentrano prevalentemente sullo studio, sull'analisi preliminare e sull'impostazione del lavoro.
L’obiettivo di questa fase è la creazione di basi solide per svolgere in modo efficace ed efficiente le attività previste negli sprint successivi.

  - Studio e prima redazione dei documenti di progetto: #list(
    [Norme di Progetto],
    [Piano di Progetto],
    [Piano di Qualifica],
    [Analisi dei Requisiti],
    [Glossario],
    )                                      
  - Revisione delle pratiche di versionamento.
  - Revisione delle modalità di tracciamento delle modifiche ai documenti. 
  - Revisione del sito web del progetto.
  - Studio degli strumenti offerti da GitHub, al fine di sfruttare le funzionalità utili della piattaforma.
  - Primo incontro con la proponente, *BlueWind*, per allineamento iniziale.
  - Ricerca e analisi degli standard di riferimento.
  - Definizione e raffinamento del workflow di lavoro.  
  ]
#let rischiAttesi=[
Per *lo Sprint 1*, essendo focalizzato su attività di studio e impostazione organizzativa, i principali rischi sono:

- *R.T.1 – Comprensione errata della norma EN 18031*: possibile interpretazione incompleta dello standard di riferimento.

- *R.T.2 – Inesperienza con le tecnologie*: uso di Typst, GitHub e workflow documentali potrebbe rallentare lo studio iniziale.

- *R.P.1 – Disponibilità variabile dei membri del team o imprevisti di impegno*: impegni esterni potrebbero ridurre il tempo dedicato allo studio.

- *R.O.1 – Pianificazione iniziale errata o ottimistica*: il gruppo potrebbe sottovalutare il carico di lavoro necessario per comprendere la documentazione e impostare i processi.


]
#let rischiEffettivi=[
Durante lo *Sprint 1* sono stati riscontrati i seguenti rischi, in linea con quanto previsto:

- *R.P.1 – Disponibilità variabile dei membri del team o imprevisti di impegno*:  alcuni membri hanno avuto meno tempo disponibile per impegni esterni. In risposta a ciò, è stato avviato un approfondimento volto a migliorare la definizione e la gestione delle issue, al fine di ottimizzare l’organizzazione del lavoro.

- *R.O.1 – Pianificazione iniziale errata o ottimistica*: alcune attività di studio e revisione documentale (Norme di Progetto e Analisi dei Requisiti) hanno richiesto più tempo del previsto. Per questo motivo, durante questo sprint il gruppo si è orientato principalmente verso attività di apprendimento e di comprensione della struttura e dei contenuti dei documenti.

Non sono invece emersi rischi tecnologici critici, come inizialmente ipotizzato, poiché lo Sprint 1 era focalizzato su attività preparatorie e di analisi e non prevedeva ancora lo sviluppo software.
]



#let oreProduttive=(
  (persona:persone.DL,ruolo:ruoli.Responsabile,orePreviste:1,oreEffettive:1),
  (persona:persone.ALDO,ruolo:ruoli.Amministratore,orePreviste:1,oreEffettive:1),
  (persona:persone.ANA,ruolo:ruoli.Analista,orePreviste:1,oreEffettive:1),
  (persona:persone.FELIX,ruolo:ruoli.Analista,orePreviste:1,oreEffettive:1),
  (persona:persone.DT,ruolo:ruoli.Verificatore,orePreviste:1,oreEffettive:1),
  (persona:persone.FILIPPO,ruolo:ruoli.Amministratore,orePreviste:1,oreEffettive:1),
)

#let retrospettiva=[
La Retrospettiva 1 ha rappresentato una *fase di avvio* del progetto. Durante questo sprint il gruppo si è concentrato principalmente sulla *definizione della struttura* dei documenti principali, nonché sull’individuazione delle *migliori pratiche* di versionamento e tracciamento delle modifiche. Le attività di studio e di documentazione previste sono state in larga parte completate.

Tuttavia, il gruppo ha riscontrato alcune difficoltà, in particolare nella *stima dei tempi* e nella *definizione delle task*. Inoltre, la comunicazione interna non risultava ancora pienamente strutturata. Le attività di mitigazione dei rischi adottate sono state valutate come mediamente efficaci: trattandosi di una fase iniziale del progetto, non è stato possibile ottenere risultati pienamente consolidati, che si prevede emergeranno nei prossimi sprint. 

Alla luce di queste considerazioni, il gruppo ha deciso che nel prossimo sprint si lavorerà in modo mirato sul *miglioramento della pianificazione*, sulla *scomposizione delle attività* e sul *rafforzamento della comunicazione interna*. Questi aspetti rappresentano infatti aree di miglioramento su cui il gruppo deve migliorare.

Di conseguenza, nel prossimo sprint si prevede un maggiore impegno nelle *attività di verifica*, dato che il metodo di lavoro non è ancora completamente strutturato, e nel ruolo di amministratore. Parallelamente, continueranno le attività principali di analisi e studio.
]
#sprint(
  numeroSprint: "1",
  timeline:date,
  TODO: TODO,
  rischiAttesi: rischiAttesi,
  rischiEffettivi: rischiEffettivi,
  oreProduttive: oreProduttive,
  retrospettiva:retrospettiva
  )

#let sprintResiduo=aggiornaResiduo(
    old:ruoli.keys().map(
      chiave=>{
        (str(chiave),ruoli.at(chiave).oreTotali)
      }
    ).to-dict(),
  oreProduttive:oreProduttive,
)
#displayResiduo(
  residuo:sprintResiduo.new, 
    oreConsumate:sprintResiduo.oreConsumate,
    numeroSprint: "1",
  )


#sprintcounter.step()

#pagebreak()


// 
// Sprint 2
// 
#{
date=(inizio:datetime(year: 2025,month: 11,day:26),
finePrevista:datetime(year: 2025,month: 12,day:08),
fineEffettiva:datetime(year: 2025,month: 12,day:8))



TODO=[  Durante questo sprint il gruppo ha deciso di  concentrare la maggior parte delle proprie energie sull’*analisi dei requisiti e la definizione dei casi d’uso*. 

In particolare il gruppo si concentra su: 
- Aggiornare e completare le Norme di Progetto (processi primari/ di supporto /organizzativi/ best practices).

- Aggiornare il Glossario con automazioni per marcatura termini.

- Revisionare internamente i casi d’uso e i requisiti.

- Aggiornare e verificare il Piano di Progetto.

- Aprire issue per aggiornamento sito web, gestire versionamento e file.

- Migliorare gestione interna con template issue e automazioni.
  ]
rischiAttesi=[
- *R.T.1 – Comprensione errata della norma EN 18031*: possibile interpretazione incompleta dei requisiti.

- *R.T.2 – Inesperienza con le tecnologie*: possibili ritardi nello studio dei casi d’uso e nella produzione della documentazione.

- *R.P.1 – Disponibilità variabile dei membri del team o imprevisti di impegno*: assenze o imprevisti potrebbero rallentare le attività.

- *R.O.3 – Mancanza di comunicazione e collaborazione*: compiti poco chiari e ritardi nella scomposizione dei casi d’uso.
]
rischiEffettivi=[
- *R.T.1 – Comprensione errata della norma EN 18031*: il gruppo ha avuto difficoltà a interpretare correttamente i requisiti; durante l’incontro periodico con l’azienda sono stati quindi posti chiarimenti specifici in merito.

- *R.O.3 – Mancanza di comunicazione e collaborazione*: inizialmente task poco chiari; il gruppo ha introdotto un issue template per rendere le attività più precise e brevi incontri informali interni.

- *R.T.2 – Inesperienza con le tecnologie*: alcuni membri poco familiari con software e gestione documentale; mitigato tramite automatizzazioni, tabelle ripetibili e scomposizione dei file dai membri più esperti.

]
oreProduttive=(
  (persona:persone.DL,ruolo:ruoli.Verificatore,orePreviste:3,oreEffettive:4),
  (persona:persone.ALDO,ruolo:ruoli.Verificatore,orePreviste:3,oreEffettive:3),
  (persona:persone.ANA,ruolo:ruoli.Amministratore,orePreviste:2,oreEffettive:2),
  (persona:persone.FELIX,ruolo:ruoli.Analista,orePreviste:3,oreEffettive:3),
  (persona:persone.DT,ruolo:ruoli.Analista,orePreviste:2,oreEffettive:2),
  (persona:persone.FILIPPO,ruolo:ruoli.Responsabile,orePreviste:3,oreEffettive:3),
)

retrospettiva=[
Durante lo *Sprint 2* il gruppo ha proseguito lo studio volto a migliorare l’efficacia della comunicazione e della gestione delle issue, emerse come criticità nello sprint precedente. A tal fine è stato introdotto un *issue template condiviso* che sta funzionando in modo soddisfacente, poiché consente di definire in maniera chiara gli scopi specifici delle attività. Il gruppo prevede quindi di mantenere l’attuale template, ritenendolo efficace.

Parallelamente è stato portato avanti lo studio del materiale fornito dall’azienda e si è lavorato al miglioramento della documentazione principale, in particolare il *Piano di Progetto*, le *Norme di Progetto* e l'*Analisi dei requisiti*. Tuttavia, sono emerse difficoltà nella *definizione dei casi d’uso* e nella redazione del *documento di Analisi dei requisiti*. Per questo motivo il gruppo ha deciso di adottare inizialmente una visione ad *alto livello* (a macro-blocchi), rimandando un maggiore dettaglio ai prossimi sprint.

Le principali criticità organizzative hanno riguardato il *coordinamento nella stesura dei casi d’uso* e lo *studio condiviso del materiale*. In particolare, il gruppo ha riscontrato difficoltà nel conciliare lo studio con la redazione degli altri documenti. Per mitigare tali problemi sono stati proposti *brevi incontri informali*, finalizzati alla suddivisione dello studio e alla creazione di momenti strutturati di confronto interno.

Rispetto allo Sprint 1, *le attività di mitigazione dei rischi* sono risultate complessivamente più efficaci, anche se il gruppo ritiene che sia possibile un ulteriore miglioramento. Le mitigazioni adottate dovranno quindi essere testate anche negli sprint successivi per valutarne concretamente l’efficacia.

Alla luce di quanto emerso, nel *prossimo sprint* le attività principali saranno incentrate su una *definizione più accurata dei casi d’uso*; di conseguenza, i ruoli maggiormente coinvolti saranno quelli di Analista e Verificatore.]

}
#sprint(
  numeroSprint: "2",
  timeline:date,
  TODO: TODO,
  rischiAttesi: rischiAttesi,
  rischiEffettivi: rischiEffettivi,
  oreProduttive: oreProduttive,
  retrospettiva:retrospettiva
  )


#let sprintResiduo=aggiornaResiduo(
    old:sprintResiduo.new,
  oreProduttive:oreProduttive,
)
#displayResiduo(
  residuo:sprintResiduo.new, 
    oreConsumate:sprintResiduo.oreConsumate,
  numeroSprint: "2",
  )


#pagebreak()


// 
// Sprint 3 
// 
#{
date=(inizio:datetime(year: 2025,month: 12,day:09),
finePrevista:datetime(year: 2025,month: 12,day:07),
fineEffettiva:datetime(year: 2025,month: 12,day:7))



TODO=[  
  ]
rischiAttesi=[

]
rischiEffettivi=[

]
oreProduttive=(
  (persona:persone.DL,ruolo:ruoli.Amministratore,orePreviste:3,oreEffettive:4),
  (persona:persone.ALDO,ruolo:ruoli.Analista,orePreviste:3,oreEffettive:3),
  (persona:persone.ANA,ruolo:ruoli.Verificatore,orePreviste:2,oreEffettive:2),
  (persona:persone.FELIX,ruolo:ruoli.Responsabile,orePreviste:3,oreEffettive:3),
  (persona:persone.DT,ruolo:ruoli.Verificatore,orePreviste:2,oreEffettive:2),
  (persona:persone.FILIPPO,ruolo:ruoli.Analista,orePreviste:3,oreEffettive:3),
)

retrospettiva=[]

}
#sprint(
  numeroSprint: "3",
  timeline:date,
  TODO: TODO,
  rischiAttesi: rischiAttesi,
  rischiEffettivi: rischiEffettivi,
  oreProduttive: oreProduttive,
  retrospettiva:retrospettiva
  )


#let sprintResiduo=aggiornaResiduo(
    old:sprintResiduo.new,
  oreProduttive:oreProduttive,
)
#displayResiduo(
  residuo:sprintResiduo.new, 
    oreConsumate:sprintResiduo.oreConsumate,
  numeroSprint: "3",
  )
