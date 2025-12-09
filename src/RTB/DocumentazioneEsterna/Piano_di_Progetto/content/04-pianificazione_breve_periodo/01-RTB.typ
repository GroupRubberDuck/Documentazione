// 
// Piano di Progetto 
// = Sezione 4 - Pianificazione di breve periodo
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
#let TODO=[  In questo primo periodo di avanzamento, gli sforzi del gruppo si concentreranno nello studio dei documento e altre attività di studio.
  Il fine di questa fase è la creazione di buone basi per svolgere in maniera efficacie ed efficiente le attività di sprint successivi.
  - Studio e prima redazione dei documenti#list(
    [Norme di Progetto],
    [Piano di Progetto],
    [Piano di Qualifica],
    [Analisi dei Requisiti],
    [Glossario],
    )  
  - Revisione delle pratiche di versionamento.
  - Revisione tracciamento delle modifiche. 
  - Revisione del sito web.
  - Studio degli strumenti offerti da GitHub, al fine di sfruttare le funzionalità utili della piattaforma.
  - Primo incontro con la proponente, *BlueWind*.
  - Ricerca di standard.
  - Raffinamento del workflow.  
  ]
#let rischiAttesi=[

]
#let rischiEffettivi=[

]
#let oreProduttive=(
  (persona:persone.DL,ruolo:ruoli.Responsabile,orePreviste:1,oreEffettive:1),
  (persona:persone.ALDO,ruolo:ruoli.Amministratore,orePreviste:1,oreEffettive:1),
  (persona:persone.ANA,ruolo:ruoli.Analista,orePreviste:1,oreEffettive:1),
  (persona:persone.FELIX,ruolo:ruoli.Analista,orePreviste:1,oreEffettive:1),
  (persona:persone.DT,ruolo:ruoli.Verificatore,orePreviste:1,oreEffettive:1),
  (persona:persone.FILIPPO,ruolo:ruoli.Amministratore,orePreviste:1,oreEffettive:1),
)

#let retrospettiva=[]
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
finePrevista:datetime(year: 2025,month: 12,day:07),
fineEffettiva:datetime(year: 2025,month: 12,day:7))



TODO=[  
  ]
rischiAttesi=[

]
rischiEffettivi=[

]
oreProduttive=(
  (persona:persone.DL,ruolo:ruoli.Verificatore,orePreviste:3,oreEffettive:4),
  (persona:persone.ALDO,ruolo:ruoli.Verificatore,orePreviste:3,oreEffettive:3),
  (persona:persone.ANA,ruolo:ruoli.Amministratore,orePreviste:2,oreEffettive:2),
  (persona:persone.FELIX,ruolo:ruoli.Analista,orePreviste:3,oreEffettive:3),
  (persona:persone.DT,ruolo:ruoli.Analista,orePreviste:2,oreEffettive:2),
  (persona:persone.FILIPPO,ruolo:ruoli.Responsabile,orePreviste:3,oreEffettive:3),
)

retrospettiva=[]

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
date=(inizio:datetime(year: 2025,month: 11,day:26),
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
