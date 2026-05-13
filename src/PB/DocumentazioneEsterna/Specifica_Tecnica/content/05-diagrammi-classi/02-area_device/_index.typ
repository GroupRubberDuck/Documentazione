== Device <classe_disp>

#block(breakable: false)[
  === WriteDeviceModule
  #figure(
    image("../uml/png/CreateDevice/WriteDeviceModule.png", width: 100%),
    caption: [ Modulo di scrittura Dispositivi],
  ) <fig-write-device-module>

  Il diagramma offre una visione d'insieme del modulo di scrittura per la gestione dei Dispositivi, mostrando come i tre casi d'uso — _CreateDevice_, _SaveDevice_ e _DeleteDevice_ — condividano gli stessi componenti infrastrutturali (_FlaskWriteDeviceController_ e _MongoDeviceAdapter_) pur introducendo ciascuno le proprie interfacce e service dedicati. I componenti sono descritti in dettaglio nelle sezioni seguenti.
]

#include "01-create_device.typ"
#include "02-delete_device.typ"
#include "03-update_device.typ"

=== ReadDeviceModule <ReadDeviceModule>


#figure(
  image("../uml/png/GetDeviceDetail/QueryDeviceModule.png", width: 100%),
  caption: [Modulo di lettura Dispositivi],
) <fig-read-device-module>

Il diagramma illustra l'architettura del modulo di lettura per la gestione dei Dispositivi, coprendo le operazioni di recupero del dettaglio di un singolo Dispositivo e della lista sintetica di tutti i Dispositivi registrati.

- Per la definizione di _Device_, vedere la sezione @Device. \
- Per la definizione di _MongoDeviceAdapter_, vedere la sezione @MongoDeviceAdapter.
- Per la definizione di _FindDevicePort_, vedere la sezione @FindDevicePort.

Di seguito vengono documentati esclusivamente i componenti introdotti specificamente per questo modulo.

#include "04-get_device_detail.typ"
#include "05-get_device_list.typ"
#include "06-get_device_evaluation_detail.typ"