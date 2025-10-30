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
#statusTab(stato:"Bozza",versione:"0.1", autori:("Ana Maria Draghici",),
            verificatori:("",),uso:"Esterno",destinatari:("Professor Tullio Vardranega","Professor Riccardo Cardin"))
]

#insertRomanNumberedPagesSenzaData(PageTitle:"Registro modifiche",documentType:"Lettera di presentazione")[

#registroModifiche((
  ("0.1","28-10-2025","Stesura bozza della lettera di presentazione",("Ana Maria Draghici"),""),
  ("1.0","29-10-2025","Revisione e approvazione",(""),"-")
))
]


#insertArabicNumberedPagesSenzaData(PageTitle:"Lettera di presentazione",documentType:"Lettera di presentazione")[

#enfasi[Lettera di presentazione del gruppo RubberDuck]
Egregio Prof. Vardanega,\  
Egregio Prof. Cardin,  \
Alla cortese attenzione dei referenti di *M31 S.r.l.*,


Il gruppo *RubberDuck* desidera comunicare la propria intenzione a candidarsi e impegnarsi nella realizzazione del *capitolato C7, proposto dall’azienda **M31 S.r.l.* e denominato:


#align(center)[
*"Sistema di acquisizione dati da sensori"*
]

Dopo un'attenta discussione tra i membri del gruppo e un incontro formativo con l'azienda, che si è dimostrata disponibile e aperta nel chiarire i nostri dubbi, abbiamo ritenuto che il capitolato rappresenti un'importante opportunità di crescita, ricca di sfide stimolanti e di valore formativo.

#enfasi[Piano di lavoro]
Il gruppo *RubberDuck* dichiara una disponibilità media al progetto e comunica il proprio impegno a completarne la realizzazione entro il *30 Aprile 2026*, con un costo stimato pari a *11910 €* .

Per maggiori informazioni sul gruppo e sulla documentazione prodotta, è possibile consultare il nostro repository pubblico :  #align(center)[

#inserisciLink(url:"https://github.com/GroupRubberDuck")[github.com/GroupRubberDuck]

]
 
dove sono presenti:

 – la presente Lettera di presentazione; \ 
  – il Preventivo dei costi e la ripartizione delle ore;  \
  – lo studio dei singoli capitolati e la motivazione della scelta;  \
  – i verbali esterni, inclusi l’ #inserisciLink(url:"https://grouprubberduck.github.io/Documentazione/output/DocumentazioneEsterna/2025-10-23_Verbale_incontro_M31.pdf")[incontro formativo con M31 S.r.l.];  \
  – i verbali interni di avanzamento e coordinamento del gruppo.



Cordiali saluti,  

Il gruppo RubberDuck  \
Università degli Studi di Padova  


Componenti del gruppo: \ 
- Aldo Bettega [2101087]
- Davide Testolin, [2079242]
- Filippo Guerra [2077681]
- Ana Maria Draghici, [2101044]
- Felician Mario Necsulescu [2111935]
- Davide Lorenzon [2101075]
  ]






