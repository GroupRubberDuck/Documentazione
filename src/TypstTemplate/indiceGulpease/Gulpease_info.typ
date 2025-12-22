// ============================================================
// REPORT METODOLOGICO: CALCOLO INDICE DI GULPEASE
// ============================================================
#import "/src/config.typ":he,template_dir
#set heading(numbering:"A.1)") 
= Metodologia di Calcolo dell'Indice di Leggibilità (Gulpease)

Questo documento descrive l'algoritmo utilizzato per la valutazione automatica della leggibilità della documentazione di progetto tramite l'indice di Gulpease.

== La Formula

L'indice di Gulpease è una metrica tarata sulla lingua italiana che valuta la complessità del testo basandosi su due variabili linguistiche: la lunghezza delle parole e la lunghezza delle frasi.

La formula applicata è la seguente:

$ G = 89 + (300 times "Numero Frasi") / "Numero Parole" - (10 times "Numero Lettere") / "Numero Parole" $

Il risultato è un numero compreso tra 0 e 100, dove valori più alti indicano una maggiore leggibilità.

== Pipeline di Elaborazione

Il calcolo non viene effettuato sul file sorgente grezzo, ma segue una pipeline di *preprocessing* per garantire che la sintassi tecnica (Typst) non influenzi negativamente il punteggio.

+ *Estrazione:* Il contenuto del documento viene analizzato ricorsivamente, sfruttando la struttura del tipo *content*#footnote()[In typst è presente un sistema di tipi, il tipo content rappresenta un pezzo di contenuto del documento] di Typst .
+  *Filtraggio:* Vengono rimossi elementi non discorsivi e adattati elementi non nativamente convertibili in testo (vedi @gestione-degli-elementi-strutturali).
+  *Conteggio:* Il testo risultante viene analizzato per contare le variabili.

== Definizione delle Variabili

Per garantire coerenza, sono state adottate le seguenti definizioni rigorose:

=== Conteggio delle Parole ($N_p$)
Un'unità linguistica separata da spazi bianchi, apostrofi o caratteri di a capo.
- Vengono ignorate le stringhe vuote.
- I caratteri di punteggiatura attaccati alla parola non vengono contati come parte della lunghezza della parola stessa, ma non separano la parola (es. "progetto," conta come 1 parola).
- *Gestione Elisioni:* Le forme elise con apostrofo vengono conteggiate come due parole distinte (es. "l'analisi" = 2 parole).

=== Conteggio delle Lettere ($N_l$)
Vengono conteggiati esclusivamente i *caratteri alfanumerici* ($A-Z, a-z, 0-9$) e le vocali accentate.
- Punteggiatura, parentesi, spazi e simboli speciali vengono esclusi dal conteggio.
- _Motivazione:_ L'indice si basa sulla lunghezza semantica dei termini, non sull'ingombro tipografico.

=== Conteggio delle Frasi ($N_f$)
La definizione di "frase" è l'aspetto più critico in un contesto tecnico. Una frase è identificata come una sequenza di testo terminata da un 
+ *segno di interpunzione forte*.
  I separatori riconosciuti sono:
  - Punto fermo (`.`)
  - Punto interrogativo (`?`)
  - Punto esclamativo (`!`)
  - Punto e virgola (`;`)
+ *Terminatori Strutturali:*
  - Nei documenti tecnici, elementi come *titoli* ed *elenchi puntati* costituiscono unità semantiche complete anche in assenza di punteggiatura finale.
  - L'algoritmo considera il carattere di "ritorno a capo" (`newline`) come un terminatore di frase implicito.

#he(body:"Gestione degli elementi strutturali",level:2)

=== Elementi da sanificare
+ #[*Titoli e Liste*: \
Nei documenti tecnici, i titoli (`heading`) e gli elementi di liste puntate (`list item`) spesso non terminano con un punto. Se contati ingenuamente, verrebbero fusi con la frase successiva, creando "frasi mostro" che abbassano ingiustamente l'indice.
Il nostro algoritmo gestisce questo caso inserendo *separatori logici* (doppi a capo) durante l'estrazione. Questo garantisce che ogni punto elenco e ogni titolo venga computato come un'unità di senso distinta (e quindi, statisticamente, come una frase), preservando la correttezza del calcolo.
]
+ #[
*URL espliciti*: Gli indirizzi web (URL) privi di testo alternativo non vengono eliminati ma sostituiti dal token neutro "link". Questo preserva la struttura sintattica della frase e riflette il carico cognitivo reale del lettore

]
=== Elementi Esclusi dal Calcolo

Per evitare che il gergo tecnico o le strutture dati falsino l'indice, i seguenti elementi vengono *completamente rimossi* prima dell'analisi:

- *Blocchi di Codice (`raw`):* Il codice sorgente non segue le regole grammaticali italiane e le sue "parole" lunghe (es. `AbstractFactoryPattern`) penalizzerebbero l'indice senza motivo.
- *Tabelle (`table`):* Contengono spesso dati frammentati, date o numeri che, se contati come frasi brevi, alzerebbero artificialmente l'indice ("drogaggio" del punteggio).

- *Indici e Sommari (`outline`):* Elenchi di titoli che non costituiscono prosa discorsiva.

== Interpretazione dei Risultati

I risultati ottenuti devono essere interpretati secondo la scala standard Gulpease:

#align(center)[
  #table(
    columns: (auto, auto, 1fr),
    inset: 10pt,
    align: horizon,
    fill: (col, row) => if row == 0 { luma(230) } else { none },
    [*Valore*], [*Leggibilità*], [*Livello Scolastico Richiesto*],
    [< 40], [Difficile], [Diploma superiore / Universitario],
    [40 - 60], [Medio], [Scuola media superiore],
    [60 - 80], [Facile], [Scuola media inferiore],
    [> 80], [Molto Facile], [Licenza elementare],
  )
]

L'obiettivo per la documentazione di progetto è mantenere un indice *superiore a 40* (preferibilmente tra 50 e 70), garantendo un equilibrio tra tecnicismo necessario e chiarezza espositiva.

= Codice sorgente
Tutto il codice relativo al calcolo dell'indice di Gulpease è reso pubblico in una cartella dedicata all'interno del repository *Documentazione* al seguente path *#template_dir/indiceGulpease*
- *textExtractor.typ*: contiene la logica di estrazione in un formato di testo puro;
- *indiceGulpease.typ*: contiene la logica per il conteggio di lettere, frasi e parole;
- oltre ad alcune funzioni utili a mostrare il risultato della valutazione in un formato esteticamente piacevole.

I risultati sono stati confrontati con 2 calcolatori online:
+ #link("https://farfalla-project.org/readability_static/") 
+ #link("https://www.webandmultimedia.it/site/index.php") 

Per il confronto è stato usato il testo estratto tramite *textExtractor.typ*.


In generale:

Il calcolatore 1 ha valutato in modo più positivo il testo.
Il calcolatore 2 ha valutato in modo meno positivo il testo.






