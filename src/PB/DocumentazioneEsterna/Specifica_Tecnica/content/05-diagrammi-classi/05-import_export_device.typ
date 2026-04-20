== Importazione ed Esportazione Dispositivi <import-export-device>

Per realizzare le funzioni di importazione ed esportazione dei dispositivi tramite file esterno rispettando i principi dell'architettura esagonale si è deciso di modellare il sistema mettendo in evidenza l'ambito di competenza delle varie classi.

=== Importazione Dispositivo
#figure(caption:"Diagramma delle classi - Importazione Dispositivo")[
  #image("../uml/png/Import_Device.png")
]
Le classi dell'inbound adapter gestiscono la ricezione del file dati in ingresso usando le funzionalità di Flask.

L'Inbound Port è un'interfaccia funzionale che espone un metodo che accetta il file come parametro un oggetto di una classe della libreria  Python standard 

La porta è implementata da un Service che realizza la logica applicativa.

Il service si avvale di una classe di Dominio apposita: DeviceFileDTO, questa scelta è stata presa in quanto è stato ritenuto più appropriato l'uso di un oggetto privo di comportamento   durante il processo di importazione ed esportazione

Per gestire la conversione da DTO a oggetti di dominio si usa una classe utility che converte il DTO in un oggetto di dominio che può essere inoltrato al sistema di permanenza

Vi sono altri servizi definiti esternamente tramite le outbound ports device file importer e device file importer factory, il factory serve a non dare al service la responsabilità di creazione dell'importer appropriato al formato di file caricato.

L'importer è implementato tramite un template method le cui implementazioni concrete sono create dal factory


=== Esportazione dispositivo

#figure(caption:"Diagramma delle classi - Esportazione Dispositivo")[
  #image("../uml/png/Export_Device.png")
]

Le classi dell'inbound adapter gestiscono l'invio del file dati in uscita usando le funzionalità di Flask.

L'Inbound Port è un'interfaccia funzionale che espone un metodo che accetta come parametri un id del dispositivo da esportare e come tipo di ritorno una classe della libreria standard 

La porta è implementata da un Service che realizza la logica applicativa.

Il service si avvale di una classe di Dominio apposita: DeviceFileDTO, questa scelta è stata presa in quanto è stato ritenuto più appropriato l'uso di un oggetto privo di comportamento   durante il processo di importazione ed esportazione


Vi sono servizi definiti esternamente tramite le outbound ports device file exporter e device file exporter factory, il factory serve a non dare al service la responsabilità di creazione dell'exporter appropriato al formato di file richiesto.

L'exporter è implementato tramite un template method le cui implementazioni concrete sono create dal factory




=== Classi Condivise

Essendo importazione ed esportazione 2 processi strettamente collegati, è stato ritenuto accettabile mantenere una classe condivisa di DTO, in quanto i dati necessari sono gli stessi sia durante il processo di importazione sia di esportazione
