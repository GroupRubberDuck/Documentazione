#import "/src/PB/DocumentazioneEsterna/Piano_di_Progetto/content/05-pianificazione_breve_periodo/sprints/sprint-1.typ" : sprint_data as s1
#import "/src/PB/DocumentazioneEsterna/Piano_di_Progetto/content/05-pianificazione_breve_periodo/sprints/sprint-2.typ" : sprint_data as s2
#import "/src/config.typ":template_dir
#import template_dir + "/PdP/sprint.typ": persone, ruoli

#import "/src/TypstTemplate/PdP/sprint.typ":draw_consuntivo_matrice


Come evidenziato dalla tabella precedente, relativa alle risorse rimanenti alla
fine dell’ultimo sprint, il gruppo termina la realizzazione di quanto necessario
per affrontare la Product Baseline con un saldo rimanente di *665 €*, spendendo
dunque un totale di *#str(11610-665) €*, sotto il budget inizialmente a disposizione pari
a *11.610 €*.



#let sprints=()

#for i in range(1,15){
  import "/src/PB/DocumentazioneEsterna/Piano_di_Progetto/content/05-pianificazione_breve_periodo/sprints/sprint-"+str(i)+".typ" : sprint_data 
  sprints.push(sprint_data.oreProduttive)
}

#let flat-data=sprints.flatten()

#let risultati=(:)

#for entry in flat-data{
  let person = entry.persona
  let ruolo = entry.ruolo.nome
  let ore = entry.oreEffettive
  
  let ruoli-persona = risultati.at(person, default: (:))

  // Preleviamo le ore attuali per quel ruolo (o 0 se non esiste)
  let ore-attuali = ruoli-persona.at(ruolo, default: 0)

  // Aggiorniamo le ore
  ruoli-persona.insert(ruolo, ore-attuali + ore)

  // Salviamo il dizionario aggiornato nel dizionario principale
  risultati.insert(person, ruoli-persona)
}

#for (key,entry) in risultati{
  let temp=(entry.values().sum())

  risultati.at(key).insert("tot",temp)
  
}


#let stile-tabella = (
  stroke: (x, y) => if y == 0 { (bottom: 0.7pt + black) } else { 1pt + black },
  align: (x, y) => if y == 0 { center + horizon } else if x > 0 { center } else { left },
  fill: (x, y) => if calc.odd(y) { luma(90%) } else { none }
)

#let header=("",..(ruoli.values().map(it=>{
  it.at("sigla")
})),"Tot")

#let celle-tabella=()

#for (key,it) in risultati{
  celle-tabella.push(
    (
    key,
    ruoli.keys().map(ruolo=>{
      str(it.at(ruolo))
    }),
    str(it.tot)
    )
    )
}


#let totale-ruoli=ruoli.keys().map(
  it=>{

    let temp=0
    risultati.values().map(
  ore=>{
    (ore.at(it))
  }
).sum()
  }
)


#celle-tabella.push(
  ("Totale",..(totale-ruoli.map(it=>{str(it)})),str(totale-ruoli.sum()))
)


// Creiamo la tabella usando lo spreading per stile e contenuto
#table(
  ..stile-tabella,
  table.header(
  ..header
  ),
  columns: (2fr,1fr,1fr,1fr,1fr,1fr,1fr,1fr,),
  ..(
    celle-tabella.flatten()
    )
)

// #ruoli



Nella tabella si evidenzia il contributo in termini di ore produttive portato da
ogni componente del gruppo e l'utilizzo complessivo di ore per ogni ruolo.