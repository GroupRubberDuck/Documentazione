#let tag(label, color) = box(
  fill: color.lighten(80%),
  stroke: 0.5pt + color,
  radius: 3pt,
  inset: (x: 5pt, y: 2pt),
  text(size: 8pt, fill: color, weight: "bold")[#label]
)

#let Da-implementare=tag("Da implementare",color.green)
#let Da-non-implementare=tag("Non da implementare",color.red)
#let forse=tag("Da valutare pro e contro",color.gray)


= Data Transfer Object
In questo documento proseguono le riflessioni sulla vista logica e sull'architettura di alto livello dell'applicazione.

Durante lo scambio di informazioni deve essere  garantita la presenza di  specifici dati e che questi vengano correttamente scambiati, ovvero che chi esegue la richiesta riceva ciò che si aspetta.

I DTO facilitano la creazione di questo scambio di dati strutturato

== Cosa sono i DTO
Sono un pattern di progettazione, sono dei contenitori di dati puri, raccolgono le informazioni e possono essere scambiati facilmente.

Riducono oggetti ricchi di comportamento del core a rappresentazioni dati che possono facilmente essere lette dal browser

== Dove esistono
I DTO all'interno dell'architettura esagonale esistono solo al confine tra il browser e il web server Flask.

Servono solo a inviare e ricevere informazioni dal browser, l'adattatore Flask API si occupa di tradurre le informazioni del service in informazioni facilmente utilizzabili dal browser.

== DTO di Input e Output

=== Output
Sono i DTO con cui  il server risponde alle richieste del sistema frontend

=== Input 
Sono i DTO che il server riceve dal sistema front end

== DTO diversi per contesti diversi
Non c'è un unico enorme DTO perché appesantirebbe inutilmente la memoria utilizzata dal browser e il peso delle informazioni scambiate con le chiamate API

== Come Flask usa i DTO
- L'adattatore Flask utilizza Pydantic per validare il DTO ricevuto dal browser
- L'adattatore Flask estrae i dati da passare al service dal DTO
- L'esecuzione tra service e domain logic avviene normalmente, i DTO non esistono in questo contesto
- Il service ritorna i dati all'adattatore Flask
- L'adattatore flask converte i dati ricevuti in DTO appropriati
- L'adattatore Flask inoltra il nuovo DTO al browser

== DTO e Mongo
Nell'adattatore MongoDB non è necessaria la definizione di DTO in quanto l'adapter riceve un oggetto di dominio e gestisce la comunicazione con Mongo usando i driver appositi di Mongo

== Elenco DTO
I seguenti DTO sono i possibili DTO necessari, non saranno implementati tutti, visto che alcune parti delle pagine saranno generate lato serve da flask + jinja2.

Essendo elementi statici della pagina non serve definire un DTO concreto per comunicazioni che non avverranno, torna utile definirli a livello teorico per possibili estensioni future sia come esercizio di palestra alla definizione della vista dati su Mongo

=== Output DTO
#terms(
  ([Dispositivo Summary #Da-non-implementare] ,[
    Usato in: lista dispositivi 
    \ + dispositivo_id: str 
    \ + anagrafica: InfoDispositivoDTO 
    \ + esito: EsitoDispositivo 
    \ + modello_ref: RiferimentoModelloDTO
  ]),
  ([DispositivoDetailDTO #Da-non-implementare],[
    Usato in: dashboard dispositivo 
    \ + dispositivo_id: str 
    \ + anagrafica: InfoDispositivoDTO 
    \ + esito: EsitoDispositivo 
    \ + modello_ref: RiferimentoModelloDTO 
    \ + assets: list[AssetSummaryDTO] ← solo esito aggregato
  ]),
  ([InfoDispositivoDTO #Da-non-implementare],[
    \ + nome_dispositivo:str
    \ + nome_sistema_operativo:str
    \ + descrizione_dispositivo:str
  ]),
  ([AssetSummaryDTO #Da-non-implementare],[
    Usato in: DispositivoDetailDTO lista asset 
    \ + asset_id: str 
    \  + anagrafica: InfoAssetDTO 
    \ + esito: EsitoAsset
  ]),
  ([AssetDetailDTO #Da-non-implementare],[
    Usato in: pagina dedicata asset
    // \ + dispositivo_id: str 
    \ + asset_id: str 
    \ + anagrafica: InfoAssetDTO 
    \ + esito: EsitoAsset 
    \ + valutazioni: dict[str, ValutazioneDTO]
  ]),
  ([InfoAssetDTO],[
    
  ]),
  ([ValutazioneDTO #Da-implementare],[
    Usato in: AssetDetailDTO 
    // \ + asset_id: str
    \ + requisito_id: str 
    \ + risposte: dict[str, bool] 
    \ + giustificazione: str 
    \ + esito: EsitoNodo 
    \ + è_completa: bool
  ]),
  ([RequisitoSummaryDTO #Da-non-implementare],[
        Usato nelle pagine legate alla valutazione degli asset
    \ + requisito_id: str   
    \ + requisito_Anagrafica: InfoRequisitoDTO    
  ]),
  ([RequisitoDTO #Da-non-implementare],[
        Usato nelle pagine legate alla valutazione degli asset
    \ + requisito_id: str   
    \ + requisito_Anagrafica: InfoRequisitoDTO  
    \ + decision_tree: GraphicalDecisionTreeDTO
  
  ]),
  ([GraphicalDecisionTreeDTO #Da-implementare] ,[
    Root:NodoDecisioneDTOGrafico
  ]),
  ([NodoDecisioneDTOGrafico #Da-implementare],[
    \ + nodo_decisione_id: str
    \ + domanda: str
    \ + figlio_si:NodoDecisioneDTOGrafico |NodoFogliaDTOGrafico
    \ + figlio_no:NodoDecisioneDTOGrafico |NodoFogliaDTOGrafico
  ]),
  ([NodoFogliaDTOGrafico #Da-implementare],[
    tipo_Esito:Literal["pass","fail","Not applicable"]
  ]),
)

=== Input DTO
#terms(
  ([CreaDispositivoDTO #forse ],[
    Usato in: form creazione manuale 
    \ + anagrafica: InfoDispositivoDTO 
    \ + assets: list[CreaAssetDTO]
  ]),
  ([ModificaAnagraficaDTO  #forse],[
    Usato in: form modifica anagrafica 
    \ + nome: str 
    \ + os: str 
    \ + descrizione: str
  ]),
  ([CreaAssetDTO #forse],[
    Usato in: aggiungi asset in sessione 
    \ + anagrafica: InfoAssetDTO
  ]),
  ([ModificaAnagraficaAssetDTO #forse],[
    Usato in: form modifica asset 
    \ + nome: str 
    \ + descrizione: str 
    \ + tipo: Literal["security","network"]
  ]),
  ([RispostaNodoDTO #Da-implementare],[
    Usato in: click nodo DT in valutazione 
    \ + asset_id: str 
    \ + requisito_id: str 
    \ + nodo_id: str 
    \ + valore: bool
  ]),
  ([ModificaGiustificazioneDTO #forse],[
    Usato in: form giustificazione 
    \ + asset_id: str 
    \ + requisito_id: str 
    \ + testo: str
  ]),

)