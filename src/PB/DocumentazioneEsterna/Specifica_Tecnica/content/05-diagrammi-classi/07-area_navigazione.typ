

 /*/* Esecuzione della valutazione
    - gestione sessione: 11-14
    - monitoraggio dashboard: 17-18
    - navigazione e risposte: 23-29
 */

== Esecuzione valutazione

=== Gestione di sessione
#image("../uml/png/classe_sessione.png")

/*
UC11: Avvia valutazione dispositivo
UC12: Scarta modifiche valutazione
UC13: Salva valutazione
UC13.1: Salva e chiudi valutazione dispositivo
UC13.2: Salva e continua valutazione dispositivo
UC14: Errore salvataggio valutazione
*/

Il diagramma illustra il funzionamento del modulo Gestione Sessione. Il flusso si scompone in tre fasi principali:

1. Interazione Esterna (Inbound Adapter): Il `ValutazioneSessioneController` rappresenta il punto di contatto con l'utente. Riceve le richieste HTTP per avviare, salvare o scartare una valutazione. Per operazioni come l'avvio, impacchetta i dati in transito all'interno dell'oggetto `AvviaValutazioneDTO`.

2. Motore Applicativo (Business Logic): Le richieste attraversano la porta d'ingresso (`InterfaceSessioneUseCase`) e raggiungono il `SessioneService` che orchestra l'entità di dominio pura (`SessioneValutazione`), applica le regole architetturali e ne gestisce il ciclo di vita (tramite l'helper privato `cambiaStatoSessione`).

3. Persistenza dei Dati (Outbound Adapter): Quando il Service deve memorizzare o recuperare una sessione, non comunica mai direttamente con il database. Invia invece una richiesta alla porta d'uscita (`InterfaceSessioneRepository`). Il `MongoSessioneAdapter` implementa concretamente questa interfaccia, traducendo le richieste del Core in comandi fisici per il database MongoDB (`save`, `findById`, `deleteById`).

=== Gestione dashboard
#image("../uml/png/classe_dashboard.png")

/*UC17: Visualizza dashboard dispositivo
UC17.1: Visualizza dati dispositivo su dashboard.
UC17.2: Visualizza stato aggregato dispositivo.
UC17.3: Visualizza lista asset.
UC18: Visualizza dettaglio asset (inclusa la visualizzazione del nome, tipo, stato aggregato, descrizione e lista dei requisiti).*/

=== Gestione navigazione
#image("../uml/png/classe_navigazione.png")

/*UC23: Valuta asset.
UC24: Visualizza dettaglio requisito.
  Include la visualizzazione del codice, nome, descrizione, stato della valutazione (PASS, FAIL, NA, In corso, Sospeso), dipendenze, e del decision tree ad esso associato.
UC25: Visualizza dettaglio nododecisionale (inclusa la visualizzazione di domande e risposte pregresse).
UC26: Valuta nodo di decisione.
  UC26.1: Inserisci risposta nododecision tree.
    UC26.1.1: Seleziona Yes.
    UC26.1.2: Seleziona No.
UC27: Vai al nodosuccessivo (gestendo anche eccezioni come l'assenza di risposta o il raggiungimento di un nodo foglia).
UC28: Vai al nodoprecedente (gestendo l'eccezione del tentativo di risalire oltre il nodo root).
UC29: Inserisci giustificazione decision tree.*/
*/

== Valutazione Requisiti

#figure(
  image("../uml/png/Valutazione/RequirementsAndEvaluationSystem.png", width: 100%),
  caption: [Modulo di Valutazione Requisiti]
) <fig-valutazione>

Il diagramma illustra l'architettura del modulo dedicato alla valutazione dei requisiti di conformità di un Asset. Il modulo copre tre casi d'uso principali: il recupero dei requisiti tramite _GetRequirementService_, l'importazione di giustificazioni tramite _ImportJustificationService_ e la registrazione delle risposte di valutazione tramite _AnswerDeviceAnswerService_. 
\ Nei paragrafi seguenti vengono descritti in dettaglio i componenti introdotti specificamente per questo modulo.

=== AnswerDecisionNode

#figure(
  image("../uml/png/Valutazione/AnswerDecisionNode.png", width: 100%),
  caption: [Caso d'uso AnswerDecisionNode]
) <fig-answer-decision-node>

Il diagramma illustra l'architettura del modulo dedicato alla registrazione della risposta a un nodo decisionale durante la valutazione di conformità. 
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache.
- Per la definizione di _GetSessionPort_, vedere la sezione @GetSessionPort. \
- Per la definizione di _EvaluationSheet_, vedere la sezione @EvaluationSheet. 
- Per la definizione di  _SaveSessionPort_, vedere la sezione @SaveSessionPort. 

 

==== EvaluationDecisionNodeController
#figure(
  image("../uml/png/Valutazione/EvaluationDecisionNodeController.png", width: 40%),
  caption: [ EvaluationDecisionNodeController]
) 
*Descrizione*

_EvaluationDecisionNodeController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP di inserimento di una risposta a un nodo decisionale e le inoltra al livello applicativo.

*Attributi*

_EvaluationDecisionNodeController_ non definisce attributi propri.

*Metodi e funzioni*

- `+ insert_answer(req: Request): Response` — riceve la richiesta HTTP di inserimento della risposta, estrae i dati dal corpo della richiesta e li inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.



==== AnswerDecisionNodeUseCase
#figure(
  image("../uml/png/Valutazione/AnswerDecisionNodeUseCase.png", width: 40%),
  caption: [AnswerDecisionNodeUseCase]
) 
*Descrizione*

_AnswerDecisionNodeUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per la registrazione della risposta a un nodo decisionale. Viene implementata da _AnswerDecisionNodeService_ e utilizzata da _EvaluationDecisionNodeController_.

*Attributi*

_AnswerDecisionNodeUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ insert_answer(command: AnswerNodeCommand): void` — firma del metodo delegato all'esecuzione della logica di registrazione della risposta a partire dai dati contenuti nel comando.



==== AnswerNodeCommand
#figure(
  image("../uml/png/Valutazione/AnswerNodeCommand.png", width: 30%),
  caption: [AnswerNodeCommand]
)
*Descrizione*

_AnswerNodeCommand_ è il Command Object annotato come _Command DTO_ che veicola i dati necessari alla registrazione della risposta a un nodo decisionale dal controller al service.

*Attributi*

- `+ session_id: String` — identificativo della sessione di valutazione attiva.
- `+ asset_id: String` — identificativo dell'Asset oggetto di valutazione.
- `+ requirement_id: String` — identificativo del requisito a cui si sta rispondendo.
- `+ node_id: String` — identificativo del nodo decisionale.
- `+ answer: Boolean` — valore della risposta al nodo decisionale.

*Metodi e funzioni*

_AnswerNodeCommand_ non definisce metodi.

==== AnswerDecisionNodeService
#figure(
  image("../uml/png/Valutazione/AnswerDecisionNodeService.png", width: 50%),
  caption: [AnswerDecisionNodeService]
)
*Descrizione*

_AnswerDecisionNodeService_ è il service applicativo appartenente all'Application Core responsabile della logica di registrazione della risposta a un nodo decisionale. Implementa l'interfaccia _AnswerDecisionNodeUseCase_, recupera la sessione attiva tramite _GetSessionPort_, registra la risposta tramite _EvaluationSheet_ e persiste la sessione aggiornata tramite _SaveSessionPort_.

*Attributi*

_AnswerDecisionNodeService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ insert_answer(command: AnswerNodeCommand): void` — concretizza il contratto definito da _AnswerDecisionNodeUseCase_. Recupera la sessione attiva, individua il nodo decisionale corrispondente, registra la risposta e persiste la sessione aggiornata.
 

=== GetRequirement

#figure(
  image("../uml/png/Valutazione/GetRequirement.png", width: 100%),
  caption: [Caso d'uso GetRequirement]
) <fig-get-requirement>

Il diagramma illustra l'architettura del modulo dedicato al recupero di un requisito di conformità con il relativo albero decisionale e le dipendenze associate.
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache.
- Per la definizione di _GetSessionPort_, vedere la sezione @GetSessionPort. \
- Per la definizione di _EvaluationSheet_, vedere la sezione @EvaluationSheet. 
 

 


==== QueryEvaluationRequirementsController
#figure(
  image("../uml/png/Valutazione/QueryEvaluationRequirementsController.png", width: 35%),
  caption: [QueryEvaluationRequirementsController]
)
*Descrizione*

_QueryEvaluationRequirementsController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP di recupero di un requisito di conformità e le inoltra al livello applicativo.

*Attributi*

_QueryEvaluationRequirementsController_ non definisce attributi propri.

*Metodi e funzioni*

- `+ get_requirement(req: Request): Response` — riceve la richiesta HTTP di recupero di un requisito, estrae i parametri dalla richiesta e li inoltra al livello applicativo; restituisce una risposta HTTP con i dati del requisito.



==== GetRequirementUseCase
#figure(
  image("../uml/png/Valutazione/GetRequirementUseCase.png", width: 50%),
  caption: [GetRequirementUseCase]
)
*Descrizione*

_GetRequirementUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per il recupero di un requisito di conformità. Viene implementata da _GetRequirementService_ e utilizzata da _QueryEvaluationRequirementsController_.

*Attributi*

_GetRequirementUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ get_requirement(query: GetRequirementQuery): RequirementResponse` — firma del metodo delegato al recupero del requisito corrispondente ai parametri forniti.



==== GetRequirementCommand
#figure(
  image("../uml/png/Valutazione/GetRequirementCommand.png", width: 30%),
  caption: [GetRequirementCommand]
)
*Descrizione*

_GetRequirementCommand_ è il Query Object che veicola i parametri necessari al recupero di un requisito dal controller al service.

*Attributi*

- `+ session_id: String` — identificativo della sessione di valutazione attiva.
- `+ asset_id: String` — identificativo dell'Asset oggetto di valutazione.
- `+ requirement_id: String` — identificativo del requisito da recuperare.

*Metodi e funzioni*

_GetRequirementCommand_ non definisce metodi.



==== GetRequirementService
#figure(
  image("../uml/png/Valutazione/GetRequirementService.png", width: 60%),
  caption: [GetRequirementService]
)
*Descrizione*

_GetRequirementService_ è il service applicativo appartenente all'Application Core responsabile del recupero di un requisito di conformità. Implementa l'interfaccia _GetRequirementUseCase_, legge i parametri dal _GetRequirementCommand_, recupera la sessione attiva tramite _GetSessionPort_ e costruisce il DTO _RequirementResponse_ tramite _EvaluationSheet_.

*Attributi*

_GetRequirementService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ get_requirement(query: GetRequirementQuery): RequirementResponse` — concretizza il contratto definito da _GetRequirementUseCase_. Recupera la sessione attiva, individua il requisito richiesto tramite _EvaluationSheet_ e ne costruisce la rappresentazione _RequirementResponse_.



==== RequirementResponse
#figure(
  image("../uml/png/Valutazione/RequirementResponse.png", width: 40%),
  caption: [RequirementResponse]
)
*Descrizione*

_RequirementResponse_ è il Data Transfer Object che veicola la rappresentazione completa di un requisito di conformità verso il livello di presentazione, includendo il suo stato di valutazione, l'albero decisionale associato e le dipendenze con altri requisiti.

*Attributi*

- `+ requirement_code: String` — codice identificativo del requisito.
- `+ requirement_name: String` — nome del requisito.
- `+ justification: String` — giustificazione associata al requisito.
- `+ evaluation_state: EvaluationState` — stato di valutazione del requisito.
- `+ dependency_list: List<DependencyResponse>` — lista delle dipendenze con altri requisiti.
- `+ decision_tree: DecisionTreeResponse` — albero decisionale associato al requisito.

*Metodi e funzioni*

_RequirementResponse_ non definisce metodi.



==== DecisionTreeResponse
#figure(
  image("../uml/png/Valutazione/DecisionTreeResponse.png", width: 30%),
  caption: [DecisionTreeResponse]
)
*Descrizione*

_DecisionTreeResponse_ è il Data Transfer Object che rappresenta l'albero decisionale associato a un requisito, strutturato a partire dal nodo radice.

*Attributi*

- `+ root_node: NodeResponse` — nodo radice dell'albero decisionale.

*Metodi e funzioni*

_DecisionTreeResponse_ non definisce metodi.



==== NodeResponse
#figure(
  image("../uml/png/Valutazione/NodeResponse.png", width: 30%),
  caption: [NodeResponse]
)
*Descrizione*

_NodeResponse_ è il Data Transfer Object che rappresenta un singolo nodo dell'albero decisionale, con il testo della domanda, la risposta fornita dall'utente e lo stato di valutazione associato.

*Attributi*

- `+ node_id: String` — identificativo univoco del nodo.
- `+ type: NodeType` — tipo del nodo nell'albero decisionale.
- `+ question_text: String` — testo della domanda associata al nodo.
- `+ user_answer: Boolean` — risposta fornita dall'utente per questo nodo.
- `+ evaluation_state: EvaluationState` — stato di valutazione del nodo.

*Metodi e funzioni*

_NodeResponse_ non definisce metodi.


==== DependencyResponse
#figure(
  image("../uml/png/Valutazione/DependencyResponse.png", width: 35%),
  caption: [DependencyResponse]
)
*Descrizione*

_DependencyResponse_ è il Data Transfer Object che rappresenta la dipendenza di un requisito da un altro, includendo il codice del requisito dipendente e il suo stato di valutazione.

*Attributi*

- `+ requirement_code: String` — codice del requisito da cui dipende il requisito corrente.
- `+ stato_valutazione: EvaluationState` — stato di valutazione del requisito dipendente.

*Metodi e funzioni*

_DependencyResponse_ non definisce metodi.


=== InsertJustification

#figure(
  image("../uml/png/Valutazione/InsertJustification.png", width: 100%),
  caption: [Caso d'uso InsertJustification]
) <fig-insert-justification>

Il diagramma illustra l'architettura del modulo dedicato all'inserimento di una giustificazione testuale per un requisito di conformità durante la sessione di valutazione. 
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache.
- Per la definizione di _GetSessionPort_, vedere la sezione @GetSessionPort. \
- Per la definizione di _EvaluationSheet_, vedere la sezione @EvaluationSheet. 
- Per la definizione di  _SaveSessionPort_, vedere la sezione @SaveSessionPort. 

Di seguito vengono documentati i componenti introdotti specificamente per questo caso d'uso.


==== EvaluationJustificationController
#figure(
  image("../uml/png/Valutazione/EvaluationJustificationController.png", width: 40%),
  caption: [EvaluationJustificationController]
)
*Descrizione*

_EvaluationJustificationController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP di inserimento di una giustificazione per un requisito e le inoltra al livello applicativo.

*Attributi*

_EvaluationJustificationController_ non definisce attributi propri.

*Metodi e funzioni*

- `+ insert_justification(req: Request): Response` — riceve la richiesta HTTP di inserimento della giustificazione, estrae i dati dal corpo della richiesta e li inoltra al livello applicativo; restituisce una risposta HTTP con l'esito dell'operazione.



==== InsertJustificationUseCase
#figure(
  image("../uml/png/Valutazione/InsertJustificationUseCase.png", width: 40%),
  caption: [InsertJustificationUseCase]
)
*Descrizione*

_InsertJustificationUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per l'inserimento di una giustificazione testuale associata a un requisito di conformità. Viene implementata da _EvaluationJustificationService_ e utilizzata da _EvaluationJustificationController_.

*Attributi*

_InsertJustificationUseCase_ non definisce attributi.

*Metodi e funzioni*

- `+ insert_justification(command: InsertJustificationCommand): void` — firma del metodo delegato all'esecuzione della logica di inserimento della giustificazione a partire dai dati contenuti nel comando.



==== InsertJustificationCommand
#figure(
  image("../uml/png/Valutazione/InsertJustificationCommand.png", width: 30%),
  caption: [InsertJustificationCommand]
)
*Descrizione*

_InsertJustificationCommand_ è il Command Object che veicola i dati necessari all'inserimento di una giustificazione dal controller al service.

*Attributi*

- `+ session_id: String` — identificativo della sessione di valutazione attiva.
- `+ asset_id: String` — identificativo dell'Asset oggetto di valutazione.
- `+ requirement_id: String` — identificativo del requisito a cui si associa la giustificazione.
- `+ node_id: String` — identificativo del nodo decisionale correlato.
- `+ justification: String` — testo della giustificazione da inserire.

*Metodi e funzioni*

_InsertJustificationCommand_ non definisce metodi.



==== EvaluationJustificationService
#figure(
  image("../uml/png/Valutazione/EvaluationJustificationService.png", width: 30%),
  caption: [EvaluationJustificationService]
)
*Descrizione*

_EvaluationJustificationService_ è il service applicativo appartenente all'Application Core responsabile della logica di inserimento di una giustificazione per un requisito di conformità. Implementa l'interfaccia _InsertJustificationUseCase_, recupera la sessione attiva tramite _GetSessionPort_, registra la giustificazione tramite _EvaluationSheet_ e persiste la sessione aggiornata tramite _SaveSessionPort_.

*Attributi*

_EvaluationJustificationService_ non definisce attributi propri.

*Metodi e funzioni*

- `+ insert_justification(command: InsertJustificationCommand): void` — concretizza il contratto definito da _InsertJustificationUseCase_. Recupera la sessione attiva, individua il requisito corrispondente, registra la giustificazione tramite _EvaluationSheet_ e persiste la sessione aggiornata.
