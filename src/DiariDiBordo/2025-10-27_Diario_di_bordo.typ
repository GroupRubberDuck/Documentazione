#import "../TypstTemplate/frontPage.typ": frontPage
#import "../TypstTemplate/setUpPageLayout.typ": insertRomanNumberedPages, insertArabicNumberedPages

#let giornoDiario=datetime(year:2025, month:10 , day:27)

#let enfasi(doc)={
  align()[
    #set text(weight: "bold", size: 18pt)
    #doc
  ]
}
#set page(width:30cm,height:16cm)

#frontPage("Diario di Bordo 1",giornoDiario)
#set text(size:20pt)
// #insertRomanNumberedPages("Indice","Diario di bordo",giornoDiario)[
//   #outline(depth: 2, title: "Indice")
// ]
#context counter(page).update(1)


= Attività completate
#set list(marker: image("../Images/check.png", width: 0.8em))
- Creazione di nome e logo
- Scelta dei canali di comunicazione (whatsapp + discord)
- Creazione della mail
- Scelto come strumento di documentazione Typst
- Creazione template per documenti Typst
- Creazione della repo github
- Implementata su github la compilazione automatica dei typst doc
- Incontro e scrittura verbale con C8
- Incontro e scrittura verbale con C1
- Incontro e scrittura verbale con C7
- Fare una project board github
\ \ \


= Attività da completare
#set list(marker: image("../Images/clessidra.png", width: 0.7em))
- Incontro e scrittura verbale con C5
- Aggiornare il template typst
- Lettera di presentazione
- Valutazione di tutti i capitolati
- Preventivo degli impegni con dichiarazione del way of working
\ \ \

= Difficoltà incontrate
#set list(marker: [--])
- Scelta dei capitolati
\ \ \

= Dubbi
#set list(marker: [--])
- Modalità di acquisizione d'appalto
- Divisione oraria e preventivo