
Metodologia di Calcolo dell"Indice di Leggibilità (Gulpease)



Questo documento descrive l"algoritmo utilizzato per la valutazione automatica della leggibilità della documentazione di progetto tramite l"indice di Gulpease.

La Formula



L"indice di Gulpease è una metrica tarata sulla lingua italiana che valuta la complessità del testo basandosi su due variabili linguistiche: la lunghezza delle parole e la lunghezza delle frasi.

La formula applicata è la seguente:

G = 89 + − 

Il risultato è un numero compreso tra 0 e 100, dove valori più alti indicano una maggiore leggibilità.

Pipeline di Elaborazione



Il calcolo non viene effettuato sul file sorgente grezzo, ma segue una pipeline di preprocessing per garantire che la sintassi tecnica (Typst) non influenzi negativamente il punteggio.

Estrazione: Il contenuto del documento viene analizzato ricorsivamente, sfruttando la struttura del tipo contentIn typst è presente un sistema di tipi, il tipo content rappresenta un pezzo di contenuto del documento di Typst .
 Filtraggio: Vengono rimossi elementi non discorsivi e adattati elementi non nativamente convertibili in testo (vedi ).
 Conteggio: Il testo risultante viene analizzato per contare le variabili.


Definizione delle Variabili



Per garantire coerenza, sono state adottate le seguenti definizioni rigorose:

Conteggio delle Parole ( )

 Un"unità linguistica separata da spazi bianchi, apostrofi o caratteri di a capo. Vengono ignorate le stringhe vuote.
 I caratteri di punteggiatura attaccati alla parola non vengono contati come parte della lunghezza della parola stessa, ma non separano la parola (es. "progetto," conta come 1 parola).
 Gestione Elisioni: Le forme elise con apostrofo vengono conteggiate come due parole distinte (es. "l"analisi" = 2 parole).


Conteggio delle Lettere ( )

 Vengono conteggiati esclusivamente i caratteri alfanumerici (A−Z, a−z, 0−9) e le vocali accentate. Punteggiatura, parentesi, spazi e simboli speciali vengono esclusi dal conteggio.
 Motivazione: L"indice si basa sulla lunghezza semantica dei termini, non sull"ingombro tipografico.


Conteggio delle Frasi ( )

 La definizione di "frase" è l"aspetto più critico in un contesto tecnico. Una frase è identificata come una sequenza di testo terminata da un segno di interpunzione forte. I separatori riconosciuti sono: Punto fermo ()
 Punto interrogativo ()
 Punto esclamativo ()
 Punto e virgola ()

 Terminatori Strutturali: Nei documenti tecnici, elementi come titoli ed elenchi puntati costituiscono unità semantiche complete anche in assenza di punteggiatura finale.
 L"algoritmo considera il carattere di "ritorno a capo" () come un terminatore di frase implicito.



Gestione degli elementi strutturali

 

Titoli e Liste

 Nei documenti tecnici, i titoli () e gli elementi di liste puntate () spesso non terminano con un punto. Se contati ingenuamente, verrebbero fusi con la frase successiva, creando "frasi mostro" che abbassano ingiustamente l"indice. Il nostro algoritmo gestisce questo caso inserendo separatori logici (doppi a capo) durante l"estrazione. Questo garantisce che ogni punto elenco e ogni titolo venga computato come un"unità di senso distinta (e quindi, statisticamente, come una frase), preservando la correttezza del calcolo.

Elementi Esclusi dal Calcolo



Per evitare che il gergo tecnico o le strutture dati falsino l"indice, i seguenti elementi vengono completamente rimossi prima dell"analisi:

Blocchi di Codice (): Il codice sorgente non segue le regole grammaticali italiane e le sue "parole" lunghe (es. ) penalizzerebbero l"indice senza motivo.
 Tabelle (): Contengono spesso dati frammentati, date o numeri che, se contati come frasi brevi, alzerebbero artificialmente l"indice ("drogaggio" del punteggio).
 URL e Link: Vengono considerati solo i testi alternativi descrittivi, non l"URL sottostante.
 Indici e Sommari (): Elenchi di titoli che non costituiscono prosa discorsiva.


Interpretazione dei Risultati



I risultati ottenuti devono essere interpretati secondo la scala standard Gulpease:

 

L"obiettivo per la documentazione di progetto è mantenere un indice superiore a 40 (preferibilmente tra 50 e 70), garantendo un equilibrio tra tecnicismo necessario e chiarezza espositiva.

Codice sorgente

 Tutto il codice relativo al calcolo dell"indice di Gulpease è reso pubblico in una cartella dedicata all"interno del repository Documentazione al seguente path /src/TypstTemplate/indiceGulpease textExtractor.typ: contiene la logica di estrazione in un formato di testo puro;
 indiceGulpease.typ: contiene la logica per il conteggio di lettere, frasi e parole;
 oltre ad alcune funzioni utili a mostrare il risultato della valutazione in un formato esteticamente piacevole.
```
