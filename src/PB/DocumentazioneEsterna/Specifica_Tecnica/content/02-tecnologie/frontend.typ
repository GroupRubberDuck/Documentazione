#import "/src/TypstTemplate/specificaTecnica/tabella-tecnologie.typ": tabella-tecnologie,
#pagebreak()
== Frontend <frontend>

#let frontend=(
  "Linguaggio di Programmazione":
    ([JavaScript],[],[Linguaggio client-side universale.]),
  "Framework Principale": 
    ([Vue.js],[],[Framework progressivo con una curva di apprendimento morbida e un'ottima implementazione della reattività. L'adozione della Composition API permette di scrivere logica modulare e riutilizzabile.]),
  "Dipendenze principali":
    (
      ([pinia],[],[Gestore dello stato ufficiale e leggero per Vue.]),
      ([axios],[],[Client HTTP flessibile. Preferito alla Fetch API nativa per l'ergonomia nella gestione automatica del JSON, la gestione degli errori e l'uso degli interceptor per le chiamate verso le API di Flask.]),
      ([tailwindcss],[],[Framework CSS utility-first per un'agile stilizzazione dell'interfaccia.]),
    ),
  "Dynamic Testing":
    (
      ([vitest],[],[Framework di unit testing veloce e nativo per Vite. Utilizzato per validare la logica isolata dei componenti.]),
      ([vue-test-utils],[],[Libreria ufficiale affiancata a Vitest per montare e simulare le interazioni dell'utente sulle singole isole Vue durante i test.]),
    ),
  "Static Testing":
    (
      ([eslint],[],[Linter per garantire standard di pulizia e coerenza nel codice JavaScript dei vari componenti Vue.]),
    ),
  "Sviluppo":
    (
      ([vite],[],[Tool di build per minificare e raggruppare i file JS/CSS corrispondenti ai componenti Vue, ottimizzandoli per la produzione.]),
    ),
)




#tabella-tecnologie(caption: "Frontend", 
cells:frontend
)
