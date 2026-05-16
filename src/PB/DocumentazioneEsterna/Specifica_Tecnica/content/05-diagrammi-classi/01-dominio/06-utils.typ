=== ExportedFile <ExportedFile>

#figure(
  image("../uml/png/Dominio/ExportedFile.png", width: 30%),
  caption: [ExportedFile]
) <fig-exported-file-domain>

*Descrizione*

_ExportedFile_ è un oggetto immutabile (`@dataclass(frozen=True)`) utilizzato per incapsulare in un'unica struttura il contenuto binario e i metadati di un file pronto per l'esportazione o il download.

*Attributi*

- `+ content: IO<bytes>` — stream binario contenente i dati grezzi del file da esportare.
- `+ filename: String` — nome del file, comprensivo della relativa estensione.
- `+ media_type: String` — tipo di media o formato MIME (ad esempio, "application/pdf" o "application/json") associato al file.

*Metodi e funzioni*

_ExportedFile_ non definisce metodi.

=== DeviceSummary <DeviceSummary>

#figure(
  image("../uml/png/Dominio/DeviceSummary.png", width: 30%),
  caption: [DeviceSummary]
) <fig-device-summary-domain>

*Descrizione*

_DeviceSummary_ è un oggetto immutabile (`@dataclass(frozen=True)`) utilizzato per incapsulare e trasportare una vista sintetica e leggera delle informazioni anagrafiche di un dispositivo. È progettato per fornire i dati essenziali senza esporre l'intera struttura complessa o gli asset associati, risultando ideale per le operazioni di visualizzazione o per la generazione di elenchi.

*Attributi*

- `+ device_id: String` — identificativo univoco del dispositivo.
- `+ name: String` — nome assegnato al dispositivo.
- `+ os: String` — sistema operativo in uso sul dispositivo.
- `+ description: String` — breve descrizione testuale del dispositivo.
- `+ compliance_standard_id: String` — identificativo dello standard di conformità a cui il dispositivo fa riferimento.

*Metodi e funzioni*

_DeviceSummary_ non definisce metodi.