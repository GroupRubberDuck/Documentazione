#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPage, frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/utilityTable.typ": getCode, utilityTable
#import template_dir + "/statusTab.typ": statusTab
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3": chart
#set text(size: 13pt)
// #set par(justify: true)
#set heading(numbering: "1.1)")


#frontPageSenzaData([Dichiarazione del Way of Working])

#insertRomanNumberedPagesSenzaData(PageTitle: "Stato del documento", documentType: "Dichiarazione del Way of Working")[
  #statusTab(
    stato: "In review",
    versione: "1.1",
    autori: ("Davide Lorenzon",),
    verificatori: ("Davide Testolin",),
    uso: "Esterno",
    destinatari: ("Professor Tullio Vardranega", "Professor Riccardo Cardin"),
  )
]

#insertRomanNumberedPagesSenzaData("Registro Modifiche","Verbale interno" )[


#let header=("Versione","Data","Descrizione","Autore","Revisore","Validatore")
#let modifiche=(

  ([1.0],[""],[Stesura del verbale],[Davide Lorenzon],[-],[-]),
  
).rev()

#utilityTable(modifiche,header:header,columns:(auto,auto,2fr,1fr,1fr,1.1fr))




// #registroModifiche((

//   ([1.0],[#giornoRiunione.display()],[Stesura del verbale],[Davide Lorenzon],[-]),
  
// ))
]
