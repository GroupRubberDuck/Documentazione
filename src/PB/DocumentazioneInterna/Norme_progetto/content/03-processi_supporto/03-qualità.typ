#import "/src/config.typ":he
== *Processo di Accertamento della Qualità* <qualità>
=== Introduzione

Il processo di Accertamento Qualità ha il compito di verificare che documenti, deliverable e processi siano conformi agli standard, alle procedure e alle metriche definite dal progetto.
Tale processo accompagna l’intero ciclo di vita del progetto e fornisce un controllo continuo sulla qualità del lavoro svolto.

=== Scopo del processo

Assicurare che il lavoro del team sia:

- *Corretto e coerente* con le specifiche definite;

- *Conforme agli standard e alle metriche* di qualità stabilite;

- *Tracciabile e verificabile*;

- Adeguatamente *preparato per le successive attività* di Qualifica.

=== Attività del processo

- Revisione della documentazione e dei deliverable;

- Verifica del rispetto delle Norme di Progetto e degli standard adottati;

- Individuazione e segnalazione di eventuali non conformità;

- Raccolta e archiviazione delle evidenze di controllo.
=== Procedure operative

==== Scrittura dei commit  <commit>
 I commit devono avere un *tipo* ed una *descrizione*:
- Il *tipo* indica qual è l’obiettivo del commit (ad esempio `feat`, `fix`, `docs`, ecc.); 
 
- La *descrizione* aiuta il lettore a comprendere meglio quali cambiamenti sono stati effettuati.

Le regole generali sono:
- Iniziare il commit con il tipo seguito da `:`  
- Lasciare uno spazio tra tipo e descrizione  
- Iniziare la descrizione con lettera maiuscola  
- Limitare la descrizione a massimo 50 caratteri  
- Indicare alla fine del commit la issue a cui ci si sta riferendo

#block(
  fill: rgb("#f9f9f9"),
  stroke: 1pt + black,
  inset: 10pt
)[
git commit -m #"\""tipo: descrizione. Issue \#1 #"\""
]

Nel caso sia necessario modificare un commit (ad esempio in caso di errori) si utilizza il seguente comando#footnote[ #upper("è") consigliato l'utilizzo del comando per modificare commit in locale prima di fare push nella repository condivisa.  
#upper("è") preferibile astenersi dal modificare commit che sono già stati resi pubblici.]:

#block(
  fill: rgb("#f9f9f9"),
  stroke: 1pt + black,
  inset: 10pt
)[
git commit \-\-amend
]



=== Strumenti

- *Typst* → Calcolo automatico di alcune metriche principali (es. indice Gulpease) tramite script Typst;

- *GitHub* → repository condiviso, issue tracking e versionamento delle modifiche.

- *Automazioni* → script e workflow per calcolare metriche di qualità, generare report automatici, notificare approvazioni.


=== Metriche

Le metriche relative all’Accertamento Qualità sono riportate nella sezione @qualità1 “Metriche di Qualità”  del documento, con valori accettabili e ottimali. 


Oppure consultare il seguente documento per approfondimenti : #link("https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/Piano_di_qualifica/Piano_di_qualifica-v1.0.0.pdf")[Piano di Qualifica (PdQ)].
