#import "/src/TypstTemplate/specificaTecnica/design-pattern-presenter.typ": design-pattern-presenter


#let pattern=(
  pattern-name:"Adapter",
  descrizione:[

L'Adapter è un pattern strutturale che traduce l'interfaccia di un componente esterno
nell'interfaccia che il sistema si aspetta. 

Permette a due componenti incompatibili di
collaborare senza che nessuno dei due debba cambiare la propria interfaccia.


    ],
  motivazione:[
    Il dominio definisce le proprie interfacce in termini di concetti di business. 

    Tramite l'uso sistematico di porte e adapter è possibile ridurre l'accoppiamento permettendo l'aggiornamento parallelo dei sistemi e lasciando all'adapter il compito di tradurre le nuove interfacce

  ],
  utilizzo:[
    Al fine di implementare correttamente l'architettura esagonale nel sistema backend, il pattern adapter è stato usato in modo sistematico per gestire le comunicazioni verso servizi esterni.

    Gli utilizzi principali sono nella comunicazione col database e con i servizi di interpretazione e generazione di file

    // Non è stato implementato il pattern adapter nella sua classica versione con composizione perché non è stato fatto uso di interfacce immutabili, perciò l'introduzione di un'ulteriore classe nel mezzo non avrebbe portato vantaggi sufficienti
  ],
)

#design-pattern-presenter(
  ..pattern
)

