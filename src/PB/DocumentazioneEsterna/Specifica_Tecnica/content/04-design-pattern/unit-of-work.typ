#import "/src/TypstTemplate/specificaTecnica/design-pattern-presenter.typ": design-pattern-presenter

#let pattern=(
  pattern-name:"Unit of Work",
  descrizione:[
    La Unit of Work è un pattern architetturale che traccia tutte le modifiche effettuate durante un'operazione e le applica al sistema di persistenza in modo atomico. 
    \
    Se qualcosa va storto durante la scrittura, nessuna modifica parziale viene persistita.
  ],
  motivazione:[
    Una sessione di valutazione può coinvolgere decine di modifiche e risposte ai nodi dei decision tree, aggiornamenti di stato, giustificazioni. 

    Scrivere ogni modifica immediatamente su MongoDB esporrebbe il sistema a stati inconsistenti se l'utente abbandona la sessione a metà. 

    La Unit of Work garantisce che il documento persistito sia sempre in uno stato coerente.
  ],
  utilizzo:[
    Nel progetto, questo pattern regola il ciclo di sessione. Il `ValutazioneService` accumula e gestisce le modifiche di stato direttamente in memoria durante la navigazione. 

    Il documento su MongoDB non viene mai toccato o aggiornato durante i passaggi intermedi: la scrittura sul database avviene una sola volta, in modo atomico tramite il Repository, solo quando si raggiunge un nodo foglia o quando il progresso intermedio viene esplicitamente confermato.
  ],
)

#design-pattern-presenter(
  ..pattern
)

// ==== Unit of Work — ciclo di sessione

// *Introduzione*

// La Unit of Work è un pattern architetturale che traccia tutte le modifiche effettuate durante un'operazione e le applica al sistema di persistenza in modo atomico. 
// Se qualcosa va storto durante la scrittura, nessuna modifica parziale viene persistita.

// *Motivazioni dell'utilizzo*

// Una sessione di valutazione può coinvolgere decine di modifiche e risposte ai nodi dei
// decision tree, aggiornamenti di stato, giustificazioni. 

// Scrivere ogni modifica immediatamente su MongoDB esporrebbe il sistema a stati inconsistenti se l'utente abbandona la sessione a metà. 

// La Unit of Work garantisce che il documento persistito sia sempre in uno stato coerente.

// *Applicazione nel progetto*

// Il ciclo di sessione implementa questo pattern attraverso il flusso visibile nel
// diagramma di sequenza UC26/UC27. `ValutazioneService` aggiorna lo stato della
// valutazione in memoria e persiste il risultato solo al termine del flusso tramite
// `InterfaceValutazioneRepository`. Il documento su MongoDB non viene mai toccato durante
// la navigazione dei nodi intermedi --- viene scritto una sola volta, in modo atomico,
// quando la risposta porta a una foglia dell'albero decisionale o quando il progresso
// intermedio viene confermato.