#import "../TypstTemplate/diarioTemplate.typ": slides
#import "/src/config.typ": *

#show: slides.with(
  numero: 9,
  data: "2026-03-04",
)


= Attività completate
#set list(marker: image(check_icon, width: 0.8em))
- Sviluppo di automazioni a supporto della gestione del progetto: in particolare, sono stati implementati script per il calcolo automatico delle ore lavorate e dei commit per persona — utilizzati dal team come indicatori quantitativi per monitorare l'avanzamento — e script per la numerazione progressiva automatica dei casi d'uso e dei requisiti.
- La maggior parte dei documenti è stata revisionata accuratamente e portata a un buon livello di completezza. È stata inoltre richiesta formalmente una conferma sui casi d'uso al Professor Cardin, e avviato uno scambio con l'azienda proponente tramite Telegram per ottenere un riscontro ufficiale.
- Configurazione dell'ambiente di sviluppo per il PoC tramite Docker e Poetry. Sono state individuate e discusse le librerie necessarie allo sviluppo.

= Attività da completare
#set list(marker: image(clessidra_icon, width: 0.7em))
- Il documento Piano di Qualifica manca ancora della sezione relativa al testing di prodotto, il cui completamento è subordinato alla finalizzazione dei casi d'uso, attualmente in fase di chiusura.
- Pianificazione di un meeting su Zoom con BlueWind per aggiornare formalmente il proponente sui progressi raggiunti e raccogliere i feedback finali.
- Completamento della definizione dei casi d'uso, già in fase conclusiva, e continuazione della configurazione del PoC.

= Difficoltà incontrate
#set list(marker: image(danger_icon, width: 1em))
- Il gruppo ha dovuto gestire un rallentamento significativo dovuto alla sessione d'esami, che ha reso necessario uno slittamento della RTB. Parte dei componenti del team concilia il progetto con impegni lavorativi, il che ha contribuito a ridurre la disponibilità complessiva. Tuttavia, al termine della sessione, il ritmo di lavoro ha subito una forte accelerazione. Si prevede di concludere le attività rimanenti in tempi brevi.


