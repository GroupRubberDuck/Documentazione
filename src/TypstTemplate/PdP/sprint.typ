// SUPPORTI

#let persone=(
  DL:"Davide Lorenzon",
  DT:"Davide Testolin",
  ANA:"Ana Maria Draghici",
  ALDO:"Aldo Bettega",
  FELIX:"Felician Mario Necsulescu",
  FILIPPO:"Filippo Guerra"
)
// #let ruoli=(
//   RESP:(nome:"Responsabile",costo:30,oreTotali:66,),
//   AMM:(nome:"Amministratore",costo:20,oreTotali:54,),
//   AN:(nome:"Analista",costo:25,oreTotali:114,),
//   PLAN:(nome:"Progettista",costo:25,oreTotali:102,),
//   COD:(nome:"Programmatore",costo:15,oreTotali:102,),
//   VER:(nome:"Verificatore",costo:15,oreTotali:108,),
// )
#let ruoli=(
  Responsabile:(costo:30,oreTotali:66,nome:"Responsabile"),
  Amministratore:(costo:20,oreTotali:54,nome:"Amministratore"),
  Analista:(costo:25,oreTotali:114,nome:"Analista"),
  Progettista:(costo:25,oreTotali:102,nome:"Progettista"),
  Programmatore:(costo:15,oreTotali:102,nome:"Programmatore"),
  Verificatore:(costo:15,oreTotali:108,nome:"Verificatore"),
)

// #{ruoli.Responsabile.oreTotali=1}

// TEMPLATE
// #set heading(numbering: "1.")
#let sprint(
  // test:duration,
  numeroSprint:content, 
  depth:4,
  timeline:(inizio:datetime,finePrevista:datetime,fineEffettiva:datetime),
  TODO:content,
  rischiAttesi:content,
  rischiEffettivi:content,
  oreProduttive:((persona:str,ruolo:str,orePreviste:int,oreEffettive:int),),
  retrospettiva:content,

  )={
let titolo= "Sprint "+numeroSprint
heading(titolo,depth: depth)
// recap della timeline dello sprint
let ritardo=(timeline.fineEffettiva - timeline.finePrevista).days()
  grid( columns: 2, inset:0.7em,
    [Inizio:],timeline.inizio.display(),
    [Fine prevista:],timeline.finePrevista.display(),
    [Fine reale:],timeline.fineEffettiva.display(),
    [Giorni di ritardo:],{

      text(str(ritardo),fill: if ritardo>0 { red }else if ritardo< 0{blue}  else {black})
    },
    )

heading("Attività da svolgere", depth: depth+1)

TODO

heading("Rischi attesi", depth: depth+1)

rischiAttesi

heading("Preventivo", depth: depth+1)
set table(
  stroke: (x, y) => if y == 0 {
    (bottom: 0.7pt + black)
  }
  else{
    1pt + black
  },
  align: (x, y) => (
    if y == 0 {center+horizon }
    else { left }
  ),
  fill:(x,y)=>{
    if calc.odd(y){
      luma(90%)
    }
  }
)

let preventivo=oreProduttive.map(item=>{
  ([#item.persona],[#item.ruolo.nome],[#item.orePreviste])
})


let consuntivo=oreProduttive.map(item=>{
  ([#item.persona],[#item.ruolo.nome],[
    #item.oreEffettive
    #let temp=item.oreEffettive - item.orePreviste 
    #if temp>0 {
      text(fill:red,"(+"+str(temp)+")")
    } else if temp < 0{
        text(fill:blue,"("+str(temp)+")")
    }
    
    ])

    
})

  show table.cell.where(y:0):strong
  figure(caption:"Consuntivo Sprint "+numeroSprint)[
  #table(columns: (1fr,1fr,auto),
  [Persona],[Ruolo],[Ore],
  ..(preventivo.flatten())
  )]




heading("Consuntivo", depth: depth+1)

  figure(caption:"Preventivo Sprint "+numeroSprint)[
  #table(columns: (1fr,1fr,auto),
  [Persona],[Ruolo],[Ore],
  ..(consuntivo.flatten())
  )]


//   oreProduttive:((persona:str,ruolo:str,orePreviste:int,oreEffettive:int),),

let oreConsumate=ruoli.keys().map(chiave=>{
  (chiave, oreProduttive.filter(item=>{item.ruolo.nome == chiave}).map(item=>{item.oreEffettive}).sum(default:0))
}).to-dict()



heading("Rischi incontrati", depth: depth+1)

rischiEffettivi
heading("Retrospettiva", depth: depth+1)
retrospettiva

}



// // TEST
// #let date=(inizio:datetime(year: 2025,month: 11,day:10),
// finePrevista:datetime(year: 2025,month: 11,day:25),
// fineEffettiva:datetime(year: 2025,month: 11,day:25))


// #let oreSprint=persone.values().map(it=>{
// (persona:it,ruolo:"Responsabile",orePreviste:10,oreEffettive:1)
// })

// #for i in range(0,10){
// sprint(contatore:counter(page),timeline: date,TODO: [TODO \ #lorem(50)],rischiAttesi: [rischiAttesi \ #lorem(50)], rischiEffettivi: [rischi effettivi \ #lorem(50)],oreProduttive: oreSprint,retrospettiva: lorem(20))
// }



#let aggiornaResiduo(
    old:( 
      ruoli.Responsabile.nome:int,
      ruoli.Amministratore.nome:int,
      ruoli.Analista.nome:int,
      ruoli.Progettista.nome:int,
      ruoli.Programmatore.nome:int,
      ruoli.Verificatore.nome:int,
    ),
  oreProduttive:((persona:str,ruolo:str,orePreviste:int,oreEffettive:int),),
)={


let oreConsumate=ruoli.keys().map(chiave=>{

  (str(chiave), 
  oreProduttive.filter(
    item=>{item.ruolo.nome == chiave}
    ).map(
      item=>{item.oreEffettive}
      ).sum(default:0))
}
).to-dict()


return("new":ruoli.keys().map(
  chiave=>{
  (str(chiave),(old.at(str(chiave)) - oreConsumate.at(chiave)))
}
).to-dict(),
"oreConsumate":oreConsumate
  )




}

#let displayResiduo(
      residuo:( 
      ruoli.Responsabile.nome:int,
      ruoli.Amministratore.nome:int,
      ruoli.Analista.nome:int,
      ruoli.Progettista.nome:int,
      ruoli.Programmatore.nome:int,
      ruoli.Verificatore.nome:int,
    ),
    oreConsumate:( 
      ruoli.Responsabile.nome:int,
      ruoli.Amministratore.nome:int,
      ruoli.Analista.nome:int,
      ruoli.Progettista.nome:int,
      ruoli.Programmatore.nome:int,
      ruoli.Verificatore.nome:int,
    ),
    numeroSprint: content,
    depth:5,
  )={




let toDisplay=ruoli.keys().map(
  chiave=>{
    (
      str(chiave),
      str(ruoli.at(chiave).costo)+"€",
      str(oreConsumate.at(chiave)),
      str((ruoli.at(chiave).costo)*(oreConsumate.at(chiave)))+"€",
      [#str(residuo.at(chiave)) #if oreConsumate.at(chiave)>0{
        text(fill:red)[(-#oreConsumate.at(chiave))]
      }
      ],
      [#str(residuo.at(chiave)*(ruoli.at(chiave).costo))€
      #if oreConsumate.at(chiave)>0{
        text(fill:red)[(-#{oreConsumate.at(chiave)*(ruoli.at(chiave).costo)}€)]
      }],
      )
  }
)

let sommaCosti=ruoli.keys().map(chiave=>{
oreConsumate.at(chiave)*ruoli.at(chiave).costo
}).sum(default:0)

let oreTotaliconsumate=oreConsumate.values().sum(default :0)


let budgetResiduoTotale=ruoli.keys().map(chiave=>{
  residuo.at(chiave)*(ruoli.at(chiave).costo)
}).sum(default:0)
let totali =("Totale","-",
str(oreTotaliconsumate),
str(oreConsumate.keys().map(
  chiave=>{
    (ruoli.at(chiave).costo)*(oreConsumate.at(chiave))
  }
).sum(default:0))+"€",

[#str(ruoli.keys().map(chiave=>{
residuo.at(chiave)
}).sum(default:0)) #text(fill:red)[(-#oreTotaliconsumate)]],

[   #budgetResiduoTotale€ #text("(-"+str(sommaCosti)+"€)",fill:red)]
)
toDisplay.push(totali)
heading(depth:depth)[Risorse rimanenti]
  show table.cell.where(y:0):strong
set table(
  stroke: (x, y) => if y == 0 {
    (bottom: 0.7pt + black)
  }
  else{
    1pt + black
  },
  align: (x, y) => (
    if y == 0 {center+horizon }
    else { left }
  ),
  fill:(x,y)=>{
    if calc.odd(y){
      luma(90%)
    }
  }
)

figure(caption:"Risorse rimaste dopo lo Sprint "+numeroSprint)[
  #table(columns:(1fr,auto,auto,auto,auto,1fr,),
  [Ruolo],[Costo \ unitario],[Ore  \ consumate],[Costo \ complessivo],[Ore \ residue],[Budget \ residuo],
  ..(toDisplay.flatten())
  )]

}
