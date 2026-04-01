#import "/src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/Analisi_dei_requisiti.typ":versionNumber as adr
#import "/src/RTB/DocumentazioneEsterna/Piano_di_Progetto/Piano_di_progetto.typ":versionNumber as pdp
#import "/src/RTB/DocumentazioneEsterna/Piano_di_qualifica/Piano_di_qualifica.typ":versionNumber as pdq
#import "/src/RTB/DocumentazioneInterna/Norme_progetto/Norme_progetto.typ":versionNumber as ndp


#let statoAvanzamento="RTB"


#let urls=(
    "adr":"https://grouprubberduck.github.io/Documentazione/output/"+statoAvanzamento+"/DocumentazioneEsterna/Analisi_dei_Requisiti/Analisi_dei_requisiti-v"+adr+".pdf", 
    "pdp":"https://grouprubberduck.github.io/Documentazione/output/"+statoAvanzamento+"/DocumentazioneEsterna/Piano_di_Progetto/Piano_di_progetto-v"+pdp+".pdf", 
    "pdq":"https://grouprubberduck.github.io/Documentazione/output/"+statoAvanzamento+"/DocumentazioneEsterna/Piano_di_qualifica/Piano_di_qualifica-v"+pdq+".pdf",
    "ndp":"https://grouprubberduck.github.io/Documentazione/output/"+statoAvanzamento+"/DocumentazioneInterna/Norme_progetto/Norme_progetto-v"+ndp+".pdf",
    "gloss":"https://grouprubberduck.github.io/Documentazione/output/"+statoAvanzamento+"/DocumentazioneInterna/Glossario.pdf"
)


// #for url in urls.values(){
// link(url)[#url \  \  ]
// }

