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
    nome: "Inesperienza ",
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



  ==== Rischi personali
  #let contatoreR = counter("rischi personali")
  #let prefisso = "R.P."

  // ([#getCode(prefisso:prefisso,contatore:contatoreR)],[],[]),



  ==== Rischi organizzativi
  #let contatoreR = counter("rischi org")
  #let prefisso = "R.O."

  // ([#getCode(prefisso:prefisso,contatore:contatoreR)],[],[]),


  // == Analisi dei rischi
  //   Lista dei rischi ordinati per priorità, espressa in probabilità che accada e impatto sul progetto.
  // == Prevenzione e gestione dei rischi
  //   Strategie atte ad evitare, minimizzare o contenere i rischi