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
