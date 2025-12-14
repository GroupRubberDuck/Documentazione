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

- *R.P.1 – Disponibilità variabile dei membri del team o imprevisti di impegno*:  alcuni membri hanno avuto meno tempo disponibile per impegni esterni, rallentando lo studio di alcuni documenti.

- *R.O.1 – Pianificazione iniziale errata o ottimistica*: alcune attività di studio e revisione documentale (Norme di Progetto e Analisi dei Requisiti) hanno richiesto più tempo del previsto.

Non sono emersi rischi tecnologici critici, in quanto lo sprint era focalizzato su attività preparatorie e di analisi, senza sviluppo software.
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
  Sprint 1 ha rappresentato una *fase di avvio*. Il gruppo ha incontrato difficoltà nella definizione di task e stima dei tempi, e la comunicazione interna non era ancora pienamente strutturata. Nonostante ciò, le attività di studio e documentazione principali sono state completate. 
  
  Il primo incontro con BlueWind ha fornito indicazioni utili. 
  
  Il gruppo ha deciso di migliorare la pianificazione, la scomposizione delle attività e la comunicazione interna.
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
- Aggiornare e completare le Norme di Progetto (processi primari/ di supporto /organizzativi/ best pratices).

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
- *R.T.1 – Comprensione errata della norma EN 18031*: il gruppo ha avuto difficoltà a interpretare correttamente i requisiti; è stato organizzato un incontro con l’azienda per chiarimenti.

- *R.O.3 – Mancanza di comunicazione e collaborazione*: inizialmente task poco chiari; il gruppo ha introdotto un issue template per rendere le attività più precise.

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
Nello Sprint 2 il gruppo ha riscontrato difficoltà nella *definizione dei casi d’uso*. Per questo motivo è stata adottata una visione iniziale a *macroblocchi*, da dettagliare nei prossimi sprint.

È stato svolto lo studio del materiale fornito e migliorata la documentazione principale (Piano di Progetto, Norme di Progetto).

Le principali criticità organizzative riguardano il *coordinamento nella stesura dei casi d’uso* e lo *studio condiviso del materiale*.
Per risolverle, il gruppo ha proposto brevi incontri informali per suddividere lo studio e creare momenti di confronto interno.]

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
