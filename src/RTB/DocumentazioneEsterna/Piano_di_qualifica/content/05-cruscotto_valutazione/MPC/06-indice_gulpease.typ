#import "/src/config.typ": template_dir
#import template_dir + "/indiceGulpease/indiceGulpease.typ": display_gulpease

//gulpease si trova ed è incluso in PDQ, se inserisco solo il calcolo mostra in loop, perchè calcolo PDQ che però a sua volta è incluso in PDQ, la soluzione è calcolare in modo automatico furoi e mostrare in PDQ aggiornando manualmente

#let gulpease_data = (
  ("Norme di progetto",     62, 9703, 1122, 59786),
  ("Piano di progetto",     58, 3997,  386, 23702),
  ("Piano di qualifica",    51, 1740,  133, 10069),
  ("Analisi dei Requisiti", 89, 6122,  703, 37689),
)

#figure(
  block(
    for (nome, valore, parole, frasi, lettere) in gulpease_data {
      display_gulpease((valore: valore, parole: parole, lettere: lettere, frasi: frasi), nomeDocumento: nome)
    }
  ),
  caption: [Indice Gulpease per documento],
) <gulpease-table>

L'indice è stato calcolato sui documenti con struttura narrativa più estesa, ovvero *Norme di Progetto, Piano di Progetto, Piano di Qualifica e Analisi dei Requisiti*. \ Sono stati esclusi documenti come verbali e glossario, la cui natura sintetica e a impatto immediato non si presta a una valutazione significativa della leggibilità.\ \ I valori ottenuti si attestano nella fascia accettabile per documentazione tecnica: la presenza di terminologia specialistica abbassa il punteggio rispetto a testi divulgativi. Le *Norme di Progetto* e *l'Analisi dei Requisiti* raggiungono il valore più alto, grazie a uno stile più discorsivo.
#pagebreak()