#import "/src/config.typ":template_dir
#import template_dir + "/utilityTable.typ": getCode
#import template_dir + "/PdP/tabellaRischi.typ": tabellaRischi
  === Tipi di rischi
  Si è optato per catalogare i possibili rischi, in base alla loro natura e al loro impatto, nelle seguenti categorie non mutualmente esclusive:
  - Rischi di progetto \
    Tali rischi intaccano la tabella di marcia o le risorse disponibili per il progetto.
  - Rischi di prodotto \
    Tali rischi intaccano la qualità o le capacità del prodotto.

  - #strike()[Rischi legati al business] #footnote()[Data la natura del progetto, attualmente non si ritiene possibile l'insorgere di queste tipologie di rischi ] \
  Tali rischi intaccano l'organizzazione che ha sviluppato o commissionato il software.

  === Registro dei rischi

  ==== Rischi tecnologici
  #let contatoreR = counter("rischi tec")
  #contatoreR.update(1)
  #let prefisso = "R.T."

  #tabellaRischi(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Inesperienza con le tecnologie",
    tipo: "Rischio di progetto + Rischio di prodotto",
    descrizione: [Mancanza di esperienza da parte dei membri del gruppo in progetti di questa portata, con architettura non monolitica],
    prevenzione: [],
    mitigazione: [È necessario prevedere la possibilità che parte
      dell’impegno orario sarà dedicato alla formazione
      personale per l’uso di tale componente: è bene
      dunque valutare di spostare attività eventualmente
      di minore importanza al primo periodo successivo
      utile qualora altri componenti del gruppo non
      possano fornire supporto immediato. È necessario
      valutare anche la disponibilità di BlueWind al supporto.
    ],
    frequenza: "Alta",
    pericolo: "Elevata",
  )

  #tabellaRischi(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Problemi critici",
    tipo: "",
    descrizione: [Rischio legato a integrazioni difficili e bug critici],
    prevenzione: [],
    mitigazione: [],
    frequenza: "",
    pericolo: "",
  )

  #tabellaRischi(
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
  #let contatoreR = counter("rischi personali")
  #let prefisso = "R.P."
  #contatoreR.update(1)


  // ([#getCode(prefisso:prefisso,contatore:contatoreR)],[],[]),
  #tabellaRischi(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Disponibilità variabile dei membri del team o imprevisti di impegno",
    tipo: "",
    descrizione: [],
    prevenzione: [],
    mitigazione: [],
    frequenza: "",
    pericolo: "",
  )


  #tabellaRischi(
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
  #let contatoreR = counter("rischi org")
  #let prefisso = "R.O."
  #contatoreR.update(1)

  #tabellaRischi(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: " Pianificazione iniziale errata o ottimistica",
    tipo: "",
    descrizione: [Rischio organizzativo legato all'inesperienza nella stima delle attività necessarie e/o sottovalutazione della complessità effettiva del progetto.],
    prevenzione: [],
    mitigazione: [],
    frequenza: "Alta",
    pericolo: "Media",
  )

  #tabellaRischi(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Sovrastima delle attività",
    tipo: "",
    descrizione: [Rischio legato alla sovrastima della complessità di un o più task e la conseguente inattività del team o di un suo membro. ],
    prevenzione: [],
    mitigazione: [Gli interessati segnalano l'avvenuto, prendono in carico altre issue arretrate di altri membri del gruppo],
    frequenza: "Media",
    pericolo: "Bassa",
  )
  #tabellaRischi(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Mancanza di comunicazione e collaborazione",
    tipo: "",
    descrizione: [Rischi legati a compiti non assegnati chiaramente portano a sovrapposizioni o a task non coperti.],
    prevenzione: [],
    mitigazione: [],
    frequenza: "",
    pericolo: "",
  )


  #tabellaRischi(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Scarsa definizione dei ruoli",
    tipo: "",
    descrizione: [Rischio legato a disordini, duplicazioni di file, conflitti Git o mancanza di tracciamento.],
    prevenzione: [],
    mitigazione: [],
    frequenza: "",
    pericolo: "",
  )


  #tabellaRischi(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Strumenti di coordinamento usati in modo non efficace",
    tipo: "",
    descrizione: [],
    prevenzione: [],
    mitigazione: [],
    frequenza: "",
    pericolo: "",
  )


  #tabellaRischi(
    codice: getCode(prefisso: prefisso, contatore: contatoreR),
    nome: "Inesperienza del team con progetti di grosse dimensioni",
    tipo: "",
    descrizione: [],
    prevenzione: [],
    mitigazione: [],
    frequenza: "",
    pericolo: "",
  )



  // ([#getCode(prefisso:prefisso,contatore:contatoreR)],[],[]),


  // == Analisi dei rischi
  //   Lista dei rischi ordinati per priorità, espressa in probabilità che accada e impatto sul progetto.
  // == Prevenzione e gestione dei rischi
  //   Strategie atte ad evitare, minimizzare o contenere i rischi
  // 
  // 
  // 
Rischi organizzativi 
- Pianificazione iniziale errata o ottimistica -> la stima troppo breve dei tempi o sottovalutazione della complessità complessiva del progetto.
- Sovrastima delle attività -> le attività si sono svolte più velocemente di quanto ritenuto, allora i membri segnalano e si concentrano su altro
- Mancanza di comunicazione e collaborazione
- Scarsa definizione dei ruoli -> Compiti non assegnati chiaramente portano a sovrapposizioni o a task non coperti.
- Strumenti di coordinamento usati in modo non efficace (GitHub, Discord, Drive) -> Rischio di disordine, duplicazione file, conflitti Git o mancanza di tracciamento.
- Limitata esperienza del team nella gestione di progetti complessi e di dimensioni superiori rispetto a quelli affrontati in precedenza.

Rischi personali 
- Disponibilità variabile dei membri del team o imprevisti di impegno 
- Rischio individuale derivante a altre attività universitarie-> Difficoltà a seguire contemporaneamente lezioni, progetti e studio.



Rischi tecnologici :
- Problemi critici importanti -> integrazioni difficili e bug critici 
- Rischio tecnologico legato a errori nel codice
- Mancanza conoscenza delle tecnologie proposte