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
#statusTab(stato:"Bozza",versione:"0.0.1", autori:("Davide Lorenzon",),
            verificatori:("",),uso:"Esterno",destinatari:("Professor Tullio Vardranega","Professor Riccardo Cardin","M31"))
]

#insertRomanNumberedPages_v2(PageTitle:"Registro modifiche",documentType:"Preventivo dei costi")[

#registroModifiche((
  ("0.0.1","28-10-2025","Stesura di una bozza del documento",("Davide Lorenzon"),"-"),
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

#let ruoli=(
(nome:"Responsabile", costo:30, oreIndividuali:1),
(nome:"Amministratore", costo:20, oreIndividuali:1),
(nome:"Analista", costo:25, oreIndividuali:1),
(nome:"Progettista", costo:25, oreIndividuali:1),
(nome:"Programmatore", costo:15, oreIndividuali:1),
(nome:"Verificatore", costo:15, oreIndividuali:1),
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
== Partizione oraria dei ruoli
  placeholder\[ il seguente paragrafo richiede un consulto con l'impresa prima di essere stilato\]

  #lorem(200)
== Assegnazione dei ruoli
I ruoli saranno assegnati/ricoperti a rotazione secondo le regole del progetto (esempio, ne più ne meno di un responsabile alla volta) e fino al consumo delle ore previste per quel ruolo in modo da ottenenere un'equa divisione dei compiti 


= Grafico degli impegni

questo è un grafico temporaneo, serve a mostrare che è possibile generare un grafico a torta
#cetz.canvas({
  let colors = gradient.linear(red, blue, green, yellow)

  chart.piechart(
    arrayPerPlot,
    value-key: 1,
    label-key: none,
    radius: 4,
    stroke: none,
    slice-style: colors,
    inner-radius: 0,
    outset: 3,
    inner-label: (content: (value, label) => [#text(white, str(value))], radius: 110%),
    outer-label: (content: "%", radius: 110%))
})


= Preventivo finale
  inserire un riassunto delle info precedenti
]



