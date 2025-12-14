#import "../TypstTemplate/diarioTemplate.typ": slides
#import "/src/config.typ": *

#show: slides.with(
  numero: 6,
  data: "2025-12-15",
)

= Attività completate
#set list(marker: image(check_icon, width: 0.8em))
// questa sezione si può fare molto velocemente
- Incontro con l'azienda proponente per il chiarimento di alcuni dubbi sui requisiti funzionali del progetto e sulla gestione dei documenti dell'applicazione.
- Definite delle regole per la scomposizione di documenti in sottosezioni, così da semplificare la leggibilità e la manutenzione. 
//  questo è commentato perché non può stare sia nelle completate che nelle da completare
// - Studio approfondito della normativa EVS-EN 18031-1:2024 
- Creazione del glossario web.
- Gestione automatica del numero di versione 
  nel nome del documento per i file pdf

= Attività da completare
#set list(marker: image(clessidra_icon, width: 0.7em))
- Studio della normativa EVS-EN 18031-1:2024.
- Analisi dei requisiti.
- Studio e redazione degli altri documenti necessari.


= Dubbi
#set list(marker: image(question_mark_icon, width: 1em))
// commento per chi presenta: secondo noi le modalità con cui facciamo preventivo non sono ottime, abbiamo avviato un task di ricerca, ma comunque ritenevamo opportuno menzionarlo qui
- Come fare preventivo in modo efficace ed efficiente.
// commento per chi presenta: secondo noi le modalità con cui facciamo retrospettiva non sono ottime, abbiamo avviato un task di ricerca, ma comunque ritenevamo opportuno menzionarlo qui
- Come fare retrospettiva in modo efficace ed efficiente.



= Difficoltà incontrate
#set list(marker: image(question_mark_icon, width: 1em))
- Tendenza di alcuni membri del gruppo di prendersi all'ultimo nello svolgimento delle loro attività. 
// Vogliamo cercare di risolvere la questione internamente, nasconderlo non ha senso. In passato è successo che tullio si è incazzato molto perché veniva detto tutto ok, e invece c'erano problemi di questo tipo.