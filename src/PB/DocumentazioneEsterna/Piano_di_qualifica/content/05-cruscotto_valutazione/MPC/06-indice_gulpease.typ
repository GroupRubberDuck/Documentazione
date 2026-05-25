#import "/src/config.typ": template_dir
#import template_dir + "/indiceGulpease/indiceGulpease.typ": display_gulpease

// gulpease si trova ed è incluso in PDQ, se inserisco solo il calcolo mostra in loop, perchè calcolo PDQ che però a sua volta è incluso in PDQ, la soluzione è calcolare in modo automatico fuori e mostrare in PDQ aggiornando manualmente

#let gulpease_data = (
  ("Norme di progetto",     62,  9703,  1122,  59786),
  ("Piano di progetto",     58,  6837,   657,  40795),
  ("Piano di qualifica",    51,  2508,   170,  14752),
  ("Analisi dei Requisiti", 88, 14610,  3004,  91069),
  ("Manuale Utente",        50,  2234,   156,  13470),
  ("Specifica Tecnica",     58, 18910,  2131, 122360),
)

#figure(
  {
    for (nome, valore, parole, frasi, lettere) in gulpease_data {
      display_gulpease((valore: valore, parole: parole, lettere: lettere, frasi: frasi), nomeDocumento: nome)
    }
  },
  caption: [Indice Gulpease per documento],
) <gulpease-table>

L'indice è stato calcolato sui documenti con struttura narrativa più estesa. Sono stati esclusi documenti come verbali e glossario, la cui natura sintetica non si presta a una valutazione significativa della leggibilità.

I valori ottenuti si attestano nella fascia accettabile per documentazione tecnica: la presenza di terminologia specialistica abbassa il punteggio rispetto a testi divulgativi. L'*Analisi dei Requisiti* raggiunge il valore più alto grazie a uno stile più discorsivo e frasi mediamente più brevi. Il *Manuale Utente*, pur destinato a un pubblico non tecnico, presenta un punteggio nella fascia media a causa dell'elevato numero di immagini che riducono la densità testuale analizzabile.

#pagebreak()