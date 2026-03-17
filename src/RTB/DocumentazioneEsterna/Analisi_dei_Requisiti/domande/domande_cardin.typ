#import "/src/config.typ":template_dir
#import template_dir+"/diarioTemplate.typ": slides
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import template_dir + "/setUpPageLayout.typ": insertArabicNumberedPagesSenzaData


#insertArabicNumberedPagesSenzaData(PageTitle: "Dubbi", documentType: "Dubbi")[

// Dai file di report solo queste possono essere di interesse per un dialogo con cardin

- In UC6 è necessario aggiungere sotto UC per i tipi di errore (dimensione, formato errato)

- UC01.1 si può accorpare con il padre oppure è meglio mantenere modularità per dare spazio a possibili aggiunte

- Nei casi d’uso (ad esempio la psotcondizione UC8: "L’utente ha modificato il sistema operativo del dispositivo"). non sarebbe meglio cambiare il soggetto e dire che sia il sistema a modificare?

]