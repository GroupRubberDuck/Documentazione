#import "/src/config.typ": *
#import template_dir+"/frontPage.typ": frontPage, frontPageSenzaData
#import template_dir+"/setUpPageLayout.typ":*
#import template_dir+"/registroModifiche.typ":registroModifiche
#import template_dir+"/utilityTable.typ":utilityTable, getCode
#import template_dir+"/statusTab.typ":statusTab
#set text( size: 13pt)
// #set par(justify: true)
#set heading(numbering: "1.a)")

#frontPageSenzaData([Lettera di Presentazione])

#insertRomanNumberedPagesSenzaData(PageTitle:"Stato del documento",documentType:"Lettera di presentazione")[
#statusTab(stato:"In revisione",versione:"1.1", autori:("Ana Maria Draghici",),
            verificatori:("",),uso:"Esterno",destinatari:("Professor Tullio Vardranega","Professor Riccardo Cardin"))
]

#insertRomanNumberedPagesSenzaData(PageTitle:"Registro modifiche",documentType:"Lettera di presentazione")[

#registroModifiche((
  ("0.1","28-10-2025","Stesura bozza della lettera di presentazione",("Ana Maria Draghici"),"-"),
  ("1.0","28-10-2025","Revisione e approvazione ",("Davide Testolin"),"-"),
  ("1.1","04-11-2025","Ristesura lettera di presentazione in seguito a una discussione interna del gruppo TD.4.1",("Ana Maria Draghici"),"-"),
  ("2.0","-","Revisione e approvazione ",("-"),"-"),

))
]


#insertArabicNumberedPagesSenzaData(PageTitle:"Lettera di presentazione",documentType:"Lettera di presentazione")[

#enfasi[Lettera di presentazione del gruppo RubberDuck]
Egregio Prof. Vardanega,\  
Egregio Prof. Cardin,  \
Alla cortese attenzione dei referenti di *Bluewind S.r.l*,


Il gruppo *RubberDuck* desidera comunicare la propria intenzione a candidarsi e impegnarsi nella realizzazione del *capitolato C1, proposto dall’azienda **Bluewind S.r.l.* e denominato:


#align(center)[
*"EN18031 Compliance Verification"*
]

L’azienda si è dimostrata disponibile e professionale, favorendo un dialogo chiaro e costruttivo. Il capitolato è stato scelto poiché rappresenta un’opportunità concreta di crescita tecnica e formativa, offrendo la possibilità di sviluppare soluzioni reali nel campo della verifica di conformità dei dispositivi radio. Il progetto risulta coerente con le competenze attuali e con gli interessi del gruppo, garantendo un livello di sfida stimolante ma adeguato alle sue capacità.

#enfasi[Piano di lavoro]
Il gruppo *RubberDuck* dichiara una disponibilità media al progetto e comunica il proprio impegno a completarne la realizzazione entro il *30 Aprile 2026*, con un costo stimato pari a *11910 €* .

Per maggiori informazioni sul gruppo e sulla documentazione prodotta, è possibile consultare il nostro repository pubblico :  #align(center)[

#inserisciLink(url:"https://github.com/GroupRubberDuck")[github.com/GroupRubberDuck]

]
 
dove sono presenti:

 – la presente Lettera di presentazione; \ 
  – il Preventivo dei costi e la ripartizione delle ore;  \
  – lo studio dei singoli capitolati e la motivazione della scelta;  \
  – i verbali esterni, inclusi l’ #inserisciLink(url:"https://grouprubberduck.github.io/Documentazione/output/Candidatura/DocumentazioneEsterna/2025-10-23_Verbale_incontro_Bluewind.pdf")[incontro formativo con Bluewind S.r.l. ];  \
  – i verbali interni di avanzamento e coordinamento del gruppo.



Cordiali saluti,\  

Il gruppo RubberDuck  
\
Componenti del gruppo: \ 
- Aldo Bettega [2101087]
- Davide Testolin [2079242]
- Filippo Guerra [2077681]
- Ana Maria Draghici [2101044]
- Felician Mario Necsulescu [2111935]
- Davide Lorenzon [2101075]
  ]






