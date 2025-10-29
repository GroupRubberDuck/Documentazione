#import "/src/config.typ": *
#import template_dir+"/frontPage.typ": frontPage, frontPage_v2
#import template_dir+"/setUpPageLayout.typ":*
#import template_dir+"/registroModifiche.typ":registroModifiche
#import template_dir+"/utilityTable.typ":utilityTable, getCode
#import template_dir+"/statusTab.typ":statusTab
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3": chart
#set text(font: font_da_usare , size: 13pt)
// #set par(justify: true)
#set heading(numbering: "1.a)")

#frontPage_v2(title:[Preventivo dei costi e\ degli impegni orari])

#insertRomanNumberedPages_v2(PageTitle:"Stato del documento",documentType:"Preventivo dei costi")[
#statusTab(stato:"Bozza",versione:"0.1.0", autori:("Davide Lorenzon",),
            verificatori:("",),uso:"Esterno",destinatari:("Professor Tullio Vardranega","Professor Riccardo Cardin"))
]

#insertRomanNumberedPages_v2(PageTitle:"Registro modifiche",documentType:"Preventivo dei costi")[

#registroModifiche((
  ("0.0.1","28-10-2025","Stesura di una bozza della struttura del documento",("Davide Lorenzon"),"-"),
  ("0.1.0","29-10-2025","Stesura della bozza del documento",("Davide Lorenzon"),"-")
))
]

#insertRomanNumberedPages_v2(PageTitle:"Indice",documentType:"Preventivo dei costi")[
#outline(title: "Indice")
]

#context counter(page).update(1)

#insertArabicNumberedPages_v2(PageTitle:"Termine del progetto",documentType:"Preventivo dei costi")[
= Termine del progetto
Con il presente documento, il gruppo RubberDuck (gruppo n.14) rende nota la data prevista per il termine del progetto, il *30 Aprile 2026*.
Tale data è stata stabilità in accordo alle disponibilità dei membri del gruppo e basandosi sui risultati dell'analisi dell'impegno orario
]

#insertArabicNumberedPages_v2(PageTitle:"Analisi dell'impegno orario",documentType:"Preventivo dei costi")[
= Analisi dell'impegno orario

Dopo aver calcolato la disponibilità oraria media di impegno tra i componenti del gruppo,
abbiamo definito le ore effettive che possiamo dedicare al progetto. Successivamente, abbiamo elaborato il preventivo, stabilendo la suddivisione delle ore. \



#let ruoli=(
(nome:"Responsabile", costo:30, oreIndividuali:12),
(nome:"Amministratore", costo:20, oreIndividuali:9),
(nome:"Analista", costo:25, oreIndividuali:20),
(nome:"Progettista", costo:25, oreIndividuali:18),
(nome:"Programmatore", costo:15, oreIndividuali:16),
(nome:"Verificatore", costo:15, oreIndividuali:17),
)
#let acc=(nome:"Totali",oreIndividualiTotali:0,oreTotali:0, placeholder:"",costoTot:0)
#let arrayPerPlot=()
#let analisiImpegni=()

#for ruolo in ruoli{
  let oreTot=ruolo.at("oreIndividuali")*6
  analisiImpegni.push((ruolo.at("nome"),str(ruolo.at("oreIndividuali")),str(oreTot),str(ruolo.at("costo")),str(ruolo.at("costo")*oreTot)));

  acc.at("oreIndividualiTotali") += ruolo.at("oreIndividuali");
  acc.at("oreTotali") +=oreTot;
  acc.at("costoTot") +=ruolo.at("costo")*oreTot;

  arrayPerPlot.push((ruolo.at("nome"),ruolo.at("oreIndividuali")))

    
}

#analisiImpegni.push((acc.at("nome"),
                      str(acc.at("oreIndividualiTotali")),
                      str(acc.at("oreTotali")),
                      acc.at("placeholder"),
                      str(acc.at("costoTot")),
                      ))



#align(center)[

#set table(
  stroke: (_, y) => if y == 7 { (top:1.5pt) },
  // gutter: 0.2em,
  fill:(x, y)=>if x == 0 or y == 0 { white },
)


#figure(
  caption: [Ripartizione oraria e dettaglio dei costi], 
  kind:"Tabella", supplement: [Tabella]
)[
    #utilityTable(header:("Ruolo","Ore individuali", "Ore Totali", "Costo (€/h)","Costo totale (€)"),columns: (1fr,)*5,analisiImpegni)
]

]
\ \ \ \
*Vengono rispettati i vincoli del regolamento*:
- Costo totale minimo rispettato($#acc.at("costoTot")>10285,71$) 
- Ore produttive a persona comprese nell'intervallo ammesso ($#acc.at("oreIndividualiTotali")in [80,95]$)
== Partizione oraria dei ruoli
Data la natura del progetto abbiamo ritenuto opportuno dare importanza ai ruoli di analista e progettista essendo l'architettura (con riferimento anche ai requisiti non funzionali#footnote()[Scalabilità, test automatizzati e code coverage, monitoraggio, versionamento e DevOps] del sistema una delle parti più importanti del capitolato.

Le ore dedicate ai vari ruoli non saranno distribuite uniformemente nel tempo, ma rifletteranno le necessità del progetto e sono strettamente legate anche allo stato di avanzamento del progetto.
Ad esempio, nella prima fase del progetto si prevede che la gran parte delle ore sarà dedicata all'analisi 

== Assegnazione dei ruoli

I ruoli saranno assegnati/ricoperti a rotazione secondo le #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/PD1.pdf")[
  #text(blue)[#underline()[regole del progetto]]
  ] (esempio, ne più ne meno di un responsabile alla volta) e fino al consumo delle ore previste per quel ruolo in modo da ottenenere un'equa e corretta divisione dei compiti 


= Grafico degli impegni
Il seguente grafico esemplifica la divisione delle ore per ruolo
#figure(
  caption: [Percentuale di ore di lavoro produttive divise per ruolo ], 
  kind:"Grafico", supplement: [Grafico]
)[
#cetz.canvas({
  let colors = gradient.linear(red, blue, green, yellow)

  chart.piechart(
    arrayPerPlot,
    value-key: 1,
    label-key: 0,
    radius: 4,
    gap:0,
    stroke: 1pt,
    slice-style: colors,
    inner-radius: 0,
    outset: none,
    inner-label: (content: "%", radius: 110%),
    outer-label: (content:(value, label)=>[#label], radius: 140%)
    )
    })
]



= Preventivo finale
Il preventivo finale calcolato in base alle tariffe orarie dei ruoli e alle ore preventivate risulta di: e #acc.costoTot €.
In totale il monte ore preventivato è pari a #acc.oreTotali ore, divise in #acc.oreIndividualiTotali ore complessive per ciascun membro del gruppo.


]



