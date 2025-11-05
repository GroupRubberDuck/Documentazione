#import "/src/config.typ": *
#import template_dir+"/frontPage.typ": frontPage, frontPageSenzaData
#import template_dir+"/setUpPageLayout.typ":*
#import template_dir+"/registroModifiche.typ":registroModifiche
#import template_dir+"/utilityTable.typ":utilityTable, getCode
#import template_dir+"/statusTab.typ":statusTab
#set text( size: 13pt)
#set heading(numbering: "1.a)")

#frontPageSenzaData([Lettera di Presentazione])

#insertRomanNumberedPagesSenzaData(PageTitle:"Stato del documento",documentType:"Lettera di presentazione")[
#statusTab(
  stato:"Validato",
  versione:"2.0",
  autori:("Ana Maria Draghici",), 
  revisori: ("Aldo Bettega",),
  verificatori:("Filippo Guerra",),
  uso:"Esterno",
  destinatari:("Professor Tullio Vardanega","Professor Riccardo Cardin"))
]

#insertRomanNumberedPagesSenzaData(PageTitle:"Registro modifiche",documentType:"Lettera di presentazione")[

#registroModifiche((
  ("1.0","28-10-2025","Stesura lettera di presentazione", "Ana Maria Draghici", "Davide Testolin", "-"),
  ("2.0","04-11-2025","Ristesura per nuova candidatura", "Ana Maria Draghici", "Aldo Bettega", "-")
))
]


#insertArabicNumberedPagesSenzaData(PageTitle:"Lettera di presentazione",documentType:"Lettera di presentazione")[

#enfasi[Lettera di presentazione del gruppo RubberDuck]
Egregi Professori Vardanega e Cardin,  \
Alla cortese attenzione dei referenti di *Bluewind S.r.l*,


Il gruppo *RubberDuck* desidera comunicare la propria intenzione a candidarsi e impegnarsi nella realizzazione del *capitolato C1, proposto dall’azienda **Bluewind S.r.l.* e denominato:


#align(center)[
*"EN18031 Compliance Verification"*
]

L’azienda si è dimostrata disponibile e professionale, favorendo un dialogo chiaro e costruttivo. Il capitolato è stato scelto poiché rappresenta un’opportunità concreta di crescita tecnica e formativa, offrendo la possibilità di sviluppare soluzioni reali nel campo della verifica di conformità dei dispositivi radio. Il progetto risulta coerente con le competenze attuali e con gli interessi del gruppo, garantendo un livello di sfida stimolante ma adeguato alle sue capacità.

#enfasi[Piano di lavoro]
Il gruppo *RubberDuck* dichiara una disponibilità media al progetto e comunica il proprio impegno a completarne la realizzazione entro il *30 Aprile 2026*, con un costo stimato pari a *11610 €*.
Ciascun membro del gruppo si impegna a dedicare un totale di *91* ore produttive al progetto per un totale di 546 ore complessive.
Ulteriori informazioni sull'impegno orario sono disponibili nel documento della dichiarazione di impegni.

Per maggiori informazioni sul gruppo e sulla documentazione prodotta, è possibile consultare il nostro repository pubblico :  #align(center)[

#inserisciLink(url:"https://github.com/GroupRubberDuck")[github.com/GroupRubberDuck]

]
 
dove sono presenti:

 – questa Lettera di presentazione; \ 
  – #inserisciLink(url:"https://grouprubberduck.github.io/Documentazione/output/Candidatura/2025-10-28_Dichiarazione_Impegni.pdf")[la Dichiarazione degli impegni];  \
  – #inserisciLink(url:"https://grouprubberduck.github.io/Documentazione/output/Candidatura/2025-10-29_Valutazione_Capitolati.pdf")[la Valutazione dei capitolati];  \
  – i verbali esterni, inclusi l’ #inserisciLink(url:"https://grouprubberduck.github.io/Documentazione/output/Candidatura/DocumentazioneEsterna/2025-10-23_Verbale_incontro_Bluewind.pdf")[incontro formativo con Bluewind S.r.l. ];  \
  – i verbali interni di avanzamento e coordinamento del gruppo.



Cordiali saluti,\  

Il gruppo RubberDuck  
\
Componenti del gruppo: \ 
- Aldo Bettega [2101087]
- Davide Testolin [2079242]Sampled Values
- Filippo Guerra [2077681]
- Ana Maria Draghici [2101044]
- Felician Mario Necsulescu [2111935]
- Davide Lorenzon [2101075]
  ]






