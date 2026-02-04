#import "/src/config.typ":template_dir,he, slugify
#import "@preview/lilaq:0.5.0" as lq
#import "@preview/cetz-plot:0.1.3"


L'indice di gulpease è usato per valutare la leggibilità di un testo.

Valuta il grado di istruzione necessario alla comprensione del contenuto.

*Formula*:
$
  "IG"= 89 + (300*("numero di frasi") - 10*("numero di lettere"))/ "numero di parole" 
$


*Interpretazione*:
- Inferiore a 80 sono difficili da leggere per chi ha la licenza elementare;
- Inferiore a 60 sono difficili da leggere per chi ha la licenza media;
- Inferiore a 40 sono difficili da leggere per chi ha un diploma superiore.

In considerazione di questo, il gruppo fissa come soglia accettabile un valore compreso tra 60 e 80.

Il valore ottimale è superiore a 80.

*Calcolo*: \
Per il calcolo il gruppo ha sviluppato una propria automazione sfruttando le funzionalità di Typst.
Questo permette una forte integrazione e analisi di dettaglio più fine.

Per maggiori dettagli è stato stilato un report consultabile in appendice (
  // #ref(label(slugify(("Metodologia di Calcolo dell'Indice di Gulpease")))))

*Monitoraggio*:

da studiare come usare il package lilaq per il plot dei diagrammi

#let infoDocumenti=(
  "norme di progetto":
    (
      sprint3:60,
      sprint4:70,

      ),
  "piano di progetto":(
    sprint3:61,
  ),  
  "piano di qualifica":(
    sprint3:56,
  ),
  "analisi dei requisiti":(
    sprint3:59,
    sprint4:70,
  )
)





