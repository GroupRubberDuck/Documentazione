#import "/src/TypstTemplate/specificaTecnica/tabella-tecnologie.typ": tabella-tecnologie,
== Frontend <frontend>

#let frontend=(
  "Linguaggio di Programmazione":
    ([Javascript],[],[Linguaggio client-side universale.]),
  "Framework": 
    ([Vue],[],[Framework progressivo scelto per la sua curva di apprendimento morbida e la reattività eccellente. L'adozione della Composition API permette di scrivere logica modulare e facilmente riutilizzabile.]),
  "Dipendenze principali":
    (
            ([pinia],[],[Gestore dello stato (State Management) ufficiale e leggero per Vue.]),
            ([axios],[],[Client HTTP flessibile. Preferito alla Fetch API nativa per l'ergonomia nella gestione automatica del JSON, la gestione degli errori e l'uso degli interceptor per le chiamate verso le API di Flask.]),
            ([tailwindcss],[],[Framework CSS utility-first. Permette di stilare sia i template Jinja che i componenti Vue tramite classi utility, garantendo coerenza visiva e velocità di sviluppo.]),
    ),
  "Dynamic Testing":(
      ([vitest],[],[Framework di unit testing veloce e nativo per Vite. Utilizzato per validare la logica isolata]),
      ([vue-test-utils],[],[Libreria ufficiale affiancata a Vitest per montare e simulare le interazioni dell'utente (click, input) sulle singole isole Vue durante i test.]),
  ),
  "Static Testing":(
      ([eslint],[],[Linter opzionale per garantire standard di pulizia e coerenza nel codice JavaScript dei vari componenti Vue.]),
  ),
  "Sviluppo":(
      ([vite],[],[tool di build per minificare e raggruppare i file JS/CSS statici prima di servirli tramite la cartella 'static' di Flask.]),
  ),

)




#tabella-tecnologie(caption: "Frontend", 
cells:frontend
)
