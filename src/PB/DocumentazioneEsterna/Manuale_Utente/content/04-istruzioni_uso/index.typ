Al primo avvio l'applicazione mostra la pagina di dashboard, con la lista dei dispositivi caricati nel sistema e i pulsanti per poter importare o inserire manualmente un nuovo dispositivo.

#figure(
  image("../../screenshot/schermata_devices.png"),
  caption: [Schermata Dashboard],
)

È possibile importare o inserire nuovi dispositivi anche se nel sistema sono già presenti dei dispositivi tornando alla dashboard attraverso il link "Dispositivi" in alto a sinistra.

== Inserimento di un dispositivo

È possibile creare un nuovo dispositivo inserendone le caratteristiche, quali nome, sistema operativo e descrizione.

Queste caratteristiche saranno comunque modificabili in seguito.

#figure(
  image("../../screenshot/schermata_creazione_device.png", width: 60%),
  caption: [Schermata di creazione di un nuovo dispositivo],
)

== Importazione di un dispositivo

È possibile inoltre importare un dispositivo all'interno del sistema, che sia stato precedentemente esportato in uno dei formati disponibili tra JSON, XML o CSV.

#figure(
  image("../../screenshot/schermata_caricamento_device.png"),
  caption: [Schermata di caricamento del dispositivo],
)

== Inizio di una nuova sessione di valutazione

Una volta caricati i dispositivi nel sistema è possibile avviare una nuova sessione di valutazione.

Cliccando sul pulsante "Dettagli Dispositivo" si verrà reindirizzati alla pagina del dettaglio del dispositivo, in cui si potrà modificare, eliminare o esportare il dispositivo attraverso gli appositi pulsanti.

Da questa pagina è inoltre possibile iniziare la sessione di valutazione del dispositivo, cliccando sul pulsante "Avvia Valutazione"

#figure(
  image("../../screenshot/schermata_dettagli_device.png"),
  caption: [Schermata di creazione di un nuovo dispositivo],
)

== Sessione di valutazione

Una volta avviata la sessione di valutazione si verrà reindirizzati nella pagina di valutazione del dispositivo, da cui è possibile:
- Aggiungere, valutare o modificare gli asset del dispositivo
- Salvare la sessione
- Chiudere la sessione
- Generare il report in formato PDF, con lo stato attuale di valutazione del dispositivo e dei sui asset

#figure(
  image("../../screenshot/schermata_valutazione_device.png"),
  caption: [Schermata di creazione di valutazione del dispositivo],
)

=== Aggiunta asset

Per aggiungere nuovi asset manualmente è necessario cliccare il pulsante "$plus$ Aggiungi asset" e inserire le caratteristiche dell'asset, quali nome, tipologia e descrizione.

#figure(
  image("../../screenshot/schermata_creazione_asset.png", width: 60%),
  caption: [Schermata di creazione di un nuovo asset],
)

Una volta salvato l'asset è possibile procedere con la valutazione dei requisiti.

== Dettaglio asset

Cliccando sul pulsante "Valuta" nella lista degli asset è possibile visualizzare la schermata riassuntiva dell'asset, da cui poi è possibile valutare l'asset per ogni requisito cliccando i link "Vai al requisito $arrow.r$"

#figure(
  image("../../screenshot/schermata_dettaglio_asset.png", width: 60%),
  caption: [Schermata riassuntiva dell'asset],
)

== Valutazione di un Requisito tramite Decision Tree

Dopo aver cliccato "Vai al requisito $arrow.r$", si viene reindirizzati alla pagina di dettaglio del requisito, da cui è possibile eseguire la valutazione interattiva tramite il Decision Tree.\
La pagina è composta da tre aree principali :
  - *Intestazione del requisito* : mostra l'identificativo (es. REQ-001), il nome, la descrizione normativa, il target di applicazione e l'eventuale lista di dipendenze da altri requisiti. Ogni dipendenza è cliccabile per navigare direttamente al requisito collegato.\ È inoltre presente un badge che indica lo stato corrente della valutazione (Pending, Pass, Fail, N.A.)
  - *Canvas del Decision Tree* : Visualizzazione grafica dell' albero decisionale del requisito.\ L'albero è interattivo ed è possibile cliccare su un nodo attivo (evidenziato in azzurro) per visualizzare la domanda nel pannello laterale.
  - *Pannello laterale delle domande* : Questo pannello mostra il testo completo della domanda relativa al nodo selezionato, due pulsanti di risposta (Yes, No) e i pulsanti di navigazione per spostarsi lungo il percorso già risposto.\ Sotto di esso è presente un campo di testo Justification in cui è possibile inserire una nota giustificativa a supporto della valutazione eseguita e salvarla attraverso l'apposito pulsante. Il campo è opzionale. 


#figure(
  image("../../screenshot/schermata_valutazione_requisito.png", width: 100%),
  caption: [Schermata di valutazione del Requisito],
)\

Una volta raggiunto un nodo foglia, il pannello laterale mostra il risultato della valutazione (Pass, Fail o Not Applicable) e un link «Torna alla lista Requisiti» per tornare alla schermata riassuntiva dell'asset.

#figure(
  image("../../screenshot/schermata_fine_valutazione_requisito.png", width: 40%),
  caption: [Schermata di valutazione del Requisito],
)