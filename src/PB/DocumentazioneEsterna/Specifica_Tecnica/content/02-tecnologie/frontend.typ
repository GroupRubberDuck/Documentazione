#import "/src/TypstTemplate/specificaTecnica/tabella-tecnologie.typ": tabella-tecnologie,
#pagebreak()
== Frontend <frontend>

#let frontend=(
  "Linguaggio di Programmazione":
    ([JavaScript],[ES2020],[Linguaggio client-side universale.]),
  "Framework Principale": 
    ([Vue.js],[3.5.32],[Framework progressivo con una curva di apprendimento morbida e un'ottima implementazione della reattività. L'adozione della Composition API permette di scrivere logica modulare e riutilizzabile.]),
  "Dipendenze principali":
    (
      ([pinia],[3.0.4],[Gestore dello stato ufficiale e leggero per Vue.]),
      ([tailwindcss],[],[Framework CSS utility-first per un'agile stilizzazione dell'interfaccia.]),
      ([D3],[7.9.0],[Libreria usata per i calcoli grafici.]),

    ),
  "Dynamic Testing":
    (
      ([vitest],[4.1.X],[Framework di unit testing veloce e nativo per Vite. Utilizzato per validare la logica isolata dei componenti.]),
      ([vue-test-utils],[2.4.X],[Libreria ufficiale affiancata a Vitest per montare e simulare le interazioni dell'utente sulle singole isole Vue durante i test.]),
      ([JSDOM],[29.1.X],[ Permette a Vitest di simulare il DOM di un browser direttamente all'interno del terminale Node.js, rendendo i test leggeri e veloci.]),
      ([Vitest Coverage V8],[4.1.X],[Motore per la misurazione della Code Coverage. Fornisce metriche precise su linee, branch e funzioni testate.]),
            ([],[],[]),
                  ([],[],[]),
    ),
  "Sviluppo":
    (
      ([vite],[8.0.X],[Tool di build per minificare e raggruppare i file JS/CSS corrispondenti ai componenti Vue, ottimizzandoli per la produzione.]),

    ),
)




#tabella-tecnologie(caption: "Frontend", 
cells:frontend
)
