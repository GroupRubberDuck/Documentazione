#import "/src/config.typ":template_dir
#import template_dir + "/utilityTable.typ": getCode
#import template_dir + "/PdP/tabellaRischi.typ": tabellaRischiTecnologici
#import template_dir + "/PdP/tabellaRischi.typ": tabellaRischiPersonali
#import template_dir + "/PdP/tabellaRischi.typ": tabellaRischiOrganizzativi
  === Tipi di rischi
  Si è deciso di catalogare i possibili rischi, in base alla loro natura e al loro impatto, nelle seguenti categorie non mutualmente esclusive:
  #pad(left: 1em)[ 
  - *Rischi di progetto* : Questi rischi possono influire sulla tabella di marcia o sulle risorse disponibili per il progetto. 
  - *Rischi di prodotto* : Questi rischi possono influire sulla qualità o sulle funzionalità del prodotto.

=== Struttura delle tabelle dei rischi 

Per facilitare l'identificazione dei rischi si è utilizzata una convenzione per classificarli secondo il seguente formato:  
#align(center)[
R[Tipo][Indice]]

dove:

*R* #sym.arrow indica che si tratta di un rischio

*Tipo* #sym.arrow rappresenta la categoria di un rischio, che può essere:

T = tecnologico

P = personale

O = organizzativo

*Indice* #sym.arrow numero progressivo che identifica univocamente il rischio all'interno della categoria
  
  ]

  === Registro dei rischi

  ==== Rischi tecnologici
  #let contatoreR = counter("rischi tec")
  #contatoreR.update(1)
  #let prefisso = "R.T."

//tabella sotto solo come esempio

  #tabellaRischiTecnologici(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Inesperienza con le tecnologie",
    tipo: "Rischio di progetto + Rischio di prodotto",
    descrizione: [-
    ],
    prevenzione: [-],
    mitigazione: [- 
    ],
    frequenza: "Alta",
    pericolo: "Elevata",
  )

  #tabellaRischiTecnologici(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Problemi critici",
    tipo: "",
    descrizione: [Rischio legato a integrazioni difficili e bug critici],
    prevenzione: [],
    mitigazione: [],
    frequenza: "",
    pericolo: "",
  )

  #tabellaRischiTecnologici(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Rischio tecnologico legato a errori nel codice",
    tipo: "",
    descrizione: [],
    prevenzione: [],
    mitigazione: [],
    frequenza: "",
    pericolo: "",
  )



  ==== Rischi personali
  
  #let contatoreP = counter("rischi personali")
  #contatoreP.update(1)
  #let prefisso = "R.P."
  #contatoreR.update(1)


  // ([#getCode(prefisso:prefisso,contatore:contatoreR)],[],[]),
  #tabellaRischiPersonali(

    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Disponibilità variabile dei membri del team o imprevisti di impegno",
    tipo: "",
    descrizione: [],
    prevenzione: [],
    mitigazione: [],
    frequenza: "",
    pericolo: "",
  )


    #tabellaRischiPersonali(

    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Rischio individuale dovuto ad altre attività",
    tipo: "",
    descrizione: [Rischio legato alla difficoltà a seguire contemporaneamente lezioni, progetti, studio e attività esterne all'ambiente universitario.],
    prevenzione: [],
    mitigazione: [],
    frequenza: "",
    pericolo: "",
  )




  ==== Rischi organizzativi
   #let contatoreO = counter("rischi organizzativi")
  #contatoreO.update(1)
  #let prefisso = "R.O."
  #contatoreR.update(1)

  #tabellaRischiOrganizzativi(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: " Pianificazione iniziale errata o ottimistica",
    tipo: "",
    descrizione: [Rischio organizzativo legato all'inesperienza nella stima delle attività necessarie e/o sottovalutazione della complessità effettiva del progetto.],
    prevenzione: [],
    mitigazione: [],
    frequenza: "Alta",
    pericolo: "Media",
  )

  #tabellaRischiOrganizzativi(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Sovrastima delle attività",
    tipo: "",
    descrizione: [Rischio legato alla sovrastima della complessità di un o più task e la conseguente inattività del team o di un suo membro. ],
    prevenzione: [],
    mitigazione: [Gli interessati segnalano l'avvenuto, prendono in carico altre issue arretrate di altri membri del gruppo],
    frequenza: "Media",
    pericolo: "Bassa",
  )
  #tabellaRischiOrganizzativi(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Mancanza di comunicazione e collaborazione",
    tipo: "",
    descrizione: [Rischi legati a compiti non assegnati chiaramente portano a sovrapposizioni o a task non coperti.],
    prevenzione: [],
    mitigazione: [],
    frequenza: "",
    pericolo: "",
  )


  #tabellaRischiOrganizzativi(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Scarsa definizione dei ruoli",
    tipo: "",
    descrizione: [Rischio legato a disordini, duplicazioni di file, conflitti Git o mancanza di tracciamento.],
    prevenzione: [],
    mitigazione: [],
    frequenza: "",
    pericolo: "",
  )


  #tabellaRischiOrganizzativi(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Strumenti di coordinamento usati in modo non efficace",
    tipo: "",
    descrizione: [],
    prevenzione: [],
    mitigazione: [],
    frequenza: "",
    pericolo: "",
  )


  #tabellaRischiOrganizzativi(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Inesperienza del team con progetti di grosse dimensioni",
    tipo: "",
    descrizione: [],
    prevenzione: [],
    mitigazione: [],
    frequenza: "",
    pericolo: "",
  )



  #tabellaRischiOrganizzativi(
    codice: getCode(prefisso: prefisso, contatore: contatoreO),
    nome: "Carenze di conoscenze nella gestione di progetti di questa portata",
    tipo: "Rischio di progetto + Rischio organizzativo",
    descrizione: [Limitata esperienza del team nella gestione di progetti complessi e di dimensioni superiori a quelli affrontati in precedenza. Questa mancanza può influire sulla capacità di coordinare attività, stimare correttamente tempi e risorse, e gestire un'architettura non monolitica composta da componenti eterogenei.
    ],
    prevenzione: [Introdurre momenti di formazione specifica sulla gestione di progetti complessi e sulle metodologie organizzative da adottare.
    Studiare casi reali e best pratice per migliorare la capacità di pianificazione e coordinamento. 
    Promuovere la condivisione interna della conoscenza tramite meeting periodici, retrospettive e documentazione condivisa. ],
    mitigazione: [Considerare che parte dell'impegno orario dovrà essere dedicato alla formazione tecnica individuale. Pianificare una possibile riorganizzazione delle attività, spostando quelle meno critiche ai periodi successivi qualora il supporto da parte del team non sia immediatamente disponibile. Valutare la disponibilità di Bluewind nel fornire supporto tecnico, mentoring o chiarimenti architetturali.
 
    ],
    frequenza: "Alta",
    pericolo: "Elevata",
  )


  // == Analisi dei rischi
  //   Lista dei rischi ordinati per priorità, espressa in probabilità che accada e impatto sul progetto.
  // == Prevenzione e gestione dei rischi
  //   Strategie atte ad evitare, minimizzare o contenere i rischi
  // 
  // 
  // 
