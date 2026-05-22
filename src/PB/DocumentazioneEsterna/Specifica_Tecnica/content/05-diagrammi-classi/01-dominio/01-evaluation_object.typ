=== Device <Device>

#figure(
  image("../uml/png/Dominio/Device.png", width: 80%),
  caption: [Device],
) <fig-device>

*Descrizione*

_Device_ è l'entità centrale del dominio che rappresenta il Dispositivo oggetto della valutazione di conformità. È associata alla classe _Asset_ con una relazione di composizione avente cardinalità `0..*`.

*Attributi*

- `- id: String` — identificativo univoco del Dispositivo.
- `- standard_id: String` — identificativo dello standard di conformità associato al dispositivo.
- `- name: String` — nome del Dispositivo.
- `- os: String` — sistema operativo del Dispositivo.
- `- description: String` — descrizione testuale del Dispositivo.
- `- assets: Map<String, Asset>` — mappa degli asset associati al Dispositivo, indicizzati per il loro identificativo.

*Metodi*

- `+ create(device_id: String, standard_id: String, name: String, os: String, description: String, assets: List<Asset>): Device` — metodo per la creazione e istanziazione di un nuovo oggetto Dispositivo.
- `+ get_asset(asset_id: String): Asset` — recupera l'Asset corrispondente all'identificativo fornito.
- `+ update_info(name: String, os: String, description: String): void` — aggiorna le informazioni anagrafiche del Dispositivo (nome, sistema operativo e descrizione).
- `+ add_asset(asset: Asset): void` — aggiunge un nuovo _Asset_ alla mappa del Dispositivo.
- `+ remove_asset(asset_id: String): void` — rimuove l'_Asset_ identificato da `asset_id` dalla mappa del Dispositivo.
- `+ update_asset(asset: Asset): void` — aggiorna un _Asset_ esistente


=== Asset <Asset>

#figure(
  image("../uml/png/Dominio/Asset.png", width: 60%),
  caption: [Asset]
) <fig-asset-domain>

*Descrizione*

_Asset_ è l'entità di dominio che rappresenta un asset oggetto di valutazione di conformità all'interno di una sessione.

*Attributi*

- `- asset_id: String` — identificativo univoco dell'Asset.
- `- asset_anagraphic: AssetAnagraphic` — oggetto che incapsula i dati anagrafici dell'asset.
- `- asset_proprieties: AssetProperties` — oggetto che incapsula le proprietà dell'asset.

*Metodi*

- `+ set_node_choice(requirement_id: String, node_id: String, value: Bool): void` — imposta o aggiorna la scelta (risposta) effettuata per un determinato nodo decisionale relativo a un requisito.
- `+ set_justification(requirement_id: String,  value: Bool): void` — imposta la giustificazione per un determinato requisito. 
- `+ update_anagraphic(name: String, type: AssetType, description: String): void` — aggiorna le informazioni anagrafiche dell'asset (nome, tipologia e descrizione), delegando l'aggiornamento all'istanza interna di _AssetAnagraphic_.


=== AssetAnagraphic <AssetAnagraphic>
#figure(
  image("../uml/png/Dominio/AssetAnagraphic.png", width: 30%),
  caption: [AssetAnagraphic]
) <fig-asset-domain>
*Descrizione*

_AssetAnagraphic_ è l'entità delegata all'incapsulamento delle informazioni anagrafiche e dei metadati di base di un generico asset. 

*Attributi*

- `- name: String` --- stringa di testo che rappresenta il nome identificativo dell'asset.
- `- type: AssetType` --- attributo che definisce la tipologia o la categoria di appartenenza dell'asset.
- `- description: String` --- stringa di testo destinata a contenere una descrizione estesa, note o dettagli aggiuntivi riguardanti le caratteristiche fisiche o logiche dell'asset.

*Metodi*

_AssetAnagraphic_ definisce dei semplici getter, qui omessi per poca rilevanza.


=== AssetProperties <AssetProperties>

#figure(
  image("../uml/png/Dominio/AssetProperties.png", width: 70%),
  caption: [AssetProperties]
) <fig-asset-proprieties-domain>

*Descrizione*

_AssetProperties_ è l'entità delegata alla gestione dello stato valutativo e delle proprietà specifiche di un asset. Presenta una relazione di composizione con la classe _AssetEvidence_ con cardinalità `1..*`, gestendone il ciclo di vita all'interno di una lista.

*Attributi*

- `+ asset_evidence_list: List<AssetEvidence>` — struttura dati che incapsula e gestisce l'elenco delle evidenze (scelte e giustificazioni) associate all'asset.

*Metodi*

- `+ set_node_choice(requirement_id: String, node_id: String, value: Bool): void` — imposta o aggiorna la scelta (risposta) effettuata per un determinato nodo decisionale relativo a un requisito.
- `+ set_justification(requirement_id: String, value: Bool): void` — imposta o aggiorna la giustificazione testuale per un determinato nodo di un requisito.
- `+ get_evidence(requirement_id: String): AssetEvidence | void` — recupera l'oggetto _AssetEvidence_ associato a un determinato identificativo di requisito. Restituisce l'evidenza se presente, altrimenti `void` (nessun valore/null).


=== AssetType <AssetType>

#figure(
  image("../uml/png/Dominio/AssetType.png", width: 30%),
  caption: [AssetType]
) <fig-asset-type-domain>

*Descrizione*

_AssetType_ è l'enumerazione che definisce le categorie o le tipologie logiche di appartenenza di un determinato Asset all'interno del dominio valutativo.

*Attributi*

- `- SECURITY: String` — valore enumerato che identifica un asset di tipo sicurezza ("security").
- `- NETWORK: String` — valore enumerato che identifica un asset di tipo rete ("network").

*Metodi*

_AssetType_ non definisce metodi.


=== AssetEvidence <AssetEvidence>

#figure(
  image("../uml/png/Dominio/AssetEvidence.png", width: 60%),
  caption: [AssetEvidence]
) <fig-asset-evidence-domain>

*Descrizione*

_AssetEvidence_ è un Value Object immutabile che incapsula in modo sicuro le evidenze di valutazione associate a un singolo requisito, comprendendo le risposte fornite ai nodi decisionali e l'eventuale giustificazione testuale. Essendo immutabile, ogni modifica genera una nuova istanza.

*Attributi*

- `- requirement_id: String` — identificativo univoco del requisito a cui le evidenze fanno riferimento.
- `- node_choices: Map<String, Bool>` — mappa immutabile che associa l'identificativo di un nodo decisionale alla risposta booleana fornita.
- `- justification: String` — stringa di testo contenente la giustificazione opzionale per la valutazione del requisito.

*Metodi*

- `+ with_node_choice(node_id: String, value: Bool): AssetEvidence` — crea e restituisce una nuova istanza dell'oggetto contenente la mappa delle risposte aggiornata con il nuovo valore per il nodo specificato.
- `+ with_justification(justification: String): AssetEvidence` — crea e restituisce una nuova istanza dell'oggetto aggiornata con il testo della giustificazione fornito.