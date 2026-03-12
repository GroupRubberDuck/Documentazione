// SUPPORTI

#let persone=(
  DL:"Davide Lorenzon",
  DT:"Davide Testolin",
  ANA:"Ana Maria Draghici",
  ALDO:"Aldo Bettega",
  FELIX:"Felician Mario Necsulescu",
  FILIPPO:"Filippo Guerra"
)

#let ruoli=(
  Responsabile:(costo:30,oreTotali:66,nome:"Responsabile", sigla:"Re"),
  Amministratore:(costo:20,oreTotali:54,nome:"Amministratore", sigla:"Am"),
  Analista:(costo:25,oreTotali:114,nome:"Analista", sigla:"An"),
  Progettista:(costo:25,oreTotali:102,nome:"Progettista", sigla:"Pg"),
  Programmatore:(costo:15,oreTotali:102,nome:"Programmatore", sigla:"Pr"),
  Verificatore:(costo:15,oreTotali:108,nome:"Verificatore", sigla:"Ve"),
)

// --- FUNZIONI DI SUPPORTO PER LE NUOVE MATRICI ---

#let draw_preventivo_matrice(oreProduttive, ruoli, caption_text) = {
  set table(
    stroke: (x, y) => if y == 0 { (bottom: 0.7pt + black) } else { 1pt + black },
    align: (x, y) => if y == 0 { center+horizon } else if x > 0 { center } else { left },
    fill: (x,y) => if calc.odd(y) { luma(90%) }
  )
  let membri = persone.values()
  let cols = (auto, ..ruoli.keys().map(x => 1fr), auto)
  
  let header = ([Persona], ..ruoli.values().map(r => r.sigla), [Totale])
  
  let righe = ()
  let totali_ruolo = ruoli.keys().map(x => 0)
  let totale_generale = 0

  for membro in membri {
    righe.push([#membro])
    let totale_persona = 0
    for (i, chiave) in ruoli.keys().enumerate() {
      let ore_list = oreProduttive.filter(item => item.persona == membro and item.ruolo.nome == chiave)
      let sum_prev = ore_list.map(item => item.orePreviste).sum(default: 0)
      if sum_prev > 0 {
        righe.push(str(sum_prev))
        totale_persona += sum_prev
        totali_ruolo.at(i) += sum_prev
        totale_generale += sum_prev
      } else { righe.push("0") }
    }
    righe.push([*#totale_persona*])
  }
  righe.push([*Totale*])
  for sum_ruolo in totali_ruolo { if sum_ruolo > 0 { righe.push([*#sum_ruolo*]) } else { righe.push("0") } }
  righe.push([*#totale_generale*])

  show table.cell.where(y:0): strong
  figure(caption: caption_text)[ #table(columns: cols, ..header, ..righe) ]
}

#let draw_consuntivo_matrice(oreProduttive, ruoli, caption_text) = {
  set table(
    stroke: (x, y) => if y == 0 { (bottom: 0.7pt + black) } else { 1pt + black },
    align: (x, y) => if y == 0 { center+horizon } else if x > 0 { center } else { left },
    fill: (x,y) => if calc.odd(y) { luma(90%) }
  )
  let membri = persone.values()
  let cols = (auto, ..ruoli.keys().map(x => 1fr), auto)
  
  let header = ([Persona], ..ruoli.values().map(r => r.sigla), [Totale])
  
  let righe = ()
  let totali_ruolo_eff = ruoli.keys().map(x => 0)
  let totali_ruolo_prev = ruoli.keys().map(x => 0)
  let totale_generale_eff = 0
  let totale_generale_prev = 0

  for membro in membri {
    righe.push([#membro])
    let totale_persona_eff = 0
    let totale_persona_prev = 0
    for (i, chiave) in ruoli.keys().enumerate() {
      let ore_list = oreProduttive.filter(item => item.persona == membro and item.ruolo.nome == chiave)
      let sum_eff = ore_list.map(item => item.oreEffettive).sum(default: 0)
      let sum_prev = ore_list.map(item => item.orePreviste).sum(default: 0)
      
      if sum_eff > 0 or sum_prev > 0 {
        let diff = sum_eff - sum_prev
        let diff_text = if diff > 0 { text(fill:red)[ (+#diff)] } else if diff < 0 { text(fill:blue)[ (#diff)] } else { "" }
        righe.push([#sum_eff#diff_text])
        totale_persona_eff += sum_eff
        totale_persona_prev += sum_prev
        totali_ruolo_eff.at(i) += sum_eff
        totali_ruolo_prev.at(i) += sum_prev
        totale_generale_eff += sum_eff
        totale_generale_prev += sum_prev
      } else { righe.push("0") }
    }
    let diff_tot = totale_persona_eff - totale_persona_prev
    let diff_tot_text = if diff_tot > 0 { text(fill:red)[ (+#diff_tot)] } else if diff_tot < 0 { text(fill:blue)[ (#diff_tot)] } else { "" }
    righe.push([*#totale_persona_eff#diff_tot_text*])
  }
  righe.push([*Totale*])
  for (i, sum_ruolo_eff) in totali_ruolo_eff.enumerate() {
    let sum_ruolo_prev = totali_ruolo_prev.at(i)
    if sum_ruolo_eff > 0 or sum_ruolo_prev > 0 {
      let diff = sum_ruolo_eff - sum_ruolo_prev
      let diff_text = if diff > 0 { text(fill:red)[ (+#diff)] } else if diff < 0 { text(fill:blue)[ (#diff)] } else { "" }
      righe.push([*#sum_ruolo_eff#diff_text*])
    } else { righe.push("0") }
  }
  let diff_gen = totale_generale_eff - totale_generale_prev
  let diff_gen_text = if diff_gen > 0 { text(fill:red)[ (+#diff_gen)] } else if diff_gen < 0 { text(fill:blue)[ (#diff_gen)] } else { "" }
  righe.push([*#totale_generale_eff#diff_gen_text*])

  show table.cell.where(y:0): strong
  figure(caption: caption_text)[ #table(columns: cols, ..header, ..righe) ]
}

// --- TEMPLATE PRINCIPALE ---

#let sprint(
  numeroSprint:content, 
  depth:3,
  timeline:(inizio:datetime,finePrevista:datetime,fineEffettiva:datetime),
  TODO:content,
  rischiAttesi:content,
  rischiEffettivi:content,
  oreProduttive:((persona:str,ruolo:str,orePreviste:int,oreEffettive:int),),
  retrospettiva:content,
  usaMatrice: false
)={
  let titolo= "Sprint "+numeroSprint
  heading(titolo,depth: depth)
  
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
  if usaMatrice {
    draw_preventivo_matrice(oreProduttive, ruoli, "Preventivo Sprint "+numeroSprint)
  } else {
    set table(
      stroke: (x, y) => if y == 0 { (bottom: 0.7pt + black) } else { 1pt + black },
      align: (x, y) => ( if y == 0 {center+horizon } else { left } ),
      fill:(x,y)=>{ if calc.odd(y){ luma(90%) } }
    )
    let preventivo=oreProduttive.map(item=>{ ([#item.persona],[#item.ruolo.nome],[#item.orePreviste]) })
    show table.cell.where(y:0):strong
    figure(caption:"Preventivo Sprint "+numeroSprint)[
      #table(columns: (1fr,1fr,auto),
      [Persona],[Ruolo],[Ore],
      ..(preventivo.flatten())
      )
    ]
  }

  heading("Consuntivo", depth: depth+1)
  if usaMatrice {
    draw_consuntivo_matrice(oreProduttive, ruoli, "Consuntivo Sprint "+numeroSprint)
  } else {
    set table(
      stroke: (x, y) => if y == 0 { (bottom: 0.7pt + black) } else { 1pt + black },
      align: (x, y) => ( if y == 0 {center+horizon } else { left } ),
      fill:(x,y)=>{ if calc.odd(y){ luma(90%) } }
    )
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
      ..(consuntivo.flatten())
      )
    ]
  }

  let oreConsumate=ruoli.keys().map(chiave=>{
    (chiave, oreProduttive.filter(item=>{item.ruolo.nome == chiave}).map(item=>{item.oreEffettive}).sum(default:0))
  }).to-dict()

  heading("Rischi incontrati", depth: depth+1)
  rischiEffettivi
  
  heading("Retrospettiva", depth: depth+1)
  retrospettiva
}


// --- AGGIORNAMENTO E DISPLAY DELLE RISORSE RIMANENTI ---

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
    depth:4,
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