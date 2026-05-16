=== GetRequirement

#figure(
  image("../uml/png/GetRequirementEvaluationDetail/GetRequirementEvaluationDetail.png", width: 120%),
  caption: [Caso d'uso GetRequirement]
) <fig-get-requirement>

Il diagramma illustra l'architettura del modulo dedicato al recupero di un requisito di conformità con il relativo albero decisionale e le dipendenze associate.
- Per la definizione di _InMemoryEvaluationSessionCache_, vedere la sezione @InMemoryEvaluationSessionCache.
- Per la definizione di _GetEvaluationSessionPort_, vedere la sezione @GetEvaluationSessionPort. \
- Per la definizione di _EvaluationEngine_, vedere la sezione @EvaluationEngine
- Per la definizione di _RequirementEvaluationDetail_, vedere la sezione @RequirementEvaluationDetail

 
==== FlaskRequirementEvaluationDetailController
#figure(
  image("../uml/png/GetRequirementEvaluationDetail/FlaskRequirementEvaluationDetailController.png", width: 35%),
  caption: [FlaskRequirementEvaluationDetailController]
)
*Descrizione*

_FlaskRequirementEvaluationDetailController_ è il controller Flask appartenente all'Inbound Adapter che riceve le richieste HTTP di recupero di un requisito di conformità e le inoltra al livello applicativo.

*Attributi*

- `- get_requirement_ev_detail_use_case: GetRequirementEvaluationDetailUseCase` — inbound port usata per recuperare l'oggetto _RequirementEvaluationDetail_

*Metodi e funzioni*

- `+ get_requirement_evaluation_detail(req: Request): Response` — endpoint GET che restituisce l'intera pagina HTML con il dettaglio completo del requisito valutato.

- `+ get_requirement_evaluation_json(req: Request): Response` — endpoint GET che restituisce il dettaglio completo della valutazione del requisito in formato JSON.

- `+ get_requirement_evaluation_state(req: Request): Response` — endpoint GET leggero che restituisce esclusivamente lo stato attuale di valutazione in formato JSON.


==== GetRequirementEvaluationDetailUseCase
#figure(
  image("../uml/png/GetRequirementEvaluationDetail/GetRequirementEvaluationDetailUseCase.png", width: 60%),
  caption: [GetRequirementEvaluationDetailUseCase]
)
*Descrizione*

_GetRequirementEvaluationDetailUseCase_ è l'interfaccia (Inbound Port) che definisce il contratto per il recupero di un requisito di conformità. Viene implementata da _GetRequirementEvaluationService_ e utilizzata da _FlaskRequirementEvaluationDetailController_.

*Attributi*

_GetRequirementEvaluationDetailUseCase_ non definisce attributi.

*Metodi e funzioni*
#set par(justify: false)
- `+ get_evaluation_detail(command: GetRequirementEvaluationDetailCommand): RequirementResponse` — firma del metodo delegato al recupero del requisito corrispondente ai parametri incapsulati nel comando fornito in input.


==== GetRequirementEvaluationDetailCommand
#figure(
  image("../uml/png/GetRequirementEvaluationDetail/GetRequirementEvaluationDetailCommand.png", width: 60%),
  caption: [GetRequirementEvaluationDetailCommand]
)
*Descrizione*

_GetRequirementEvaluationDetailCommand_ è l'oggetto  che veicola i parametri necessari al recupero di un requisito dal controller al service.

*Attributi*

- `+ requirement_id: String` — identificativo del requisito da recuperare.
- `+ asset_id: String` — identificativo dell'asset oggetto di valutazione.
- `+ device_id: String` — identificativo del dispositivo contenente l'asset.
- `+ session_id: String` — identificativo della sessione di valutazione attiva.

*Metodi e funzioni*

_GetRequirementEvaluationDetailCommand_ non definisce metodi.


==== GetRequirementEvaluationDetailService
#figure(
  image("../uml/png/GetRequirementEvaluationDetail/GetRequirementEvaluationDetailService.png", width: 70%),
  caption: [GetRequirementEvaluationDetailService]
)
*Descrizione*

_GetRequirementEvaluationDetailService_ è il service applicativo appartenente all'Application Core responsabile del recupero del dettaglio di valutazione di un singolo requisito. Implementa l'interfaccia _GetRequirementEvaluationDetailUseCase_, legge i parametri dal _GetRequirementEvaluationDetailCommand_, recupera la sessione attiva tramite _GetEvaluationSessionPort_, esegue la valutazione tramite l'_EvaluationEngine_ e costruisce un _RequirementEvaluationDetail_.

*Attributi*

- `get_evaluation_session_port: GetEvaluationSessionPort`
- `evaluation_engine: EvaluationEngine`

*Metodi e funzioni*
#set par(justify: false)
- `+ get_evaluation_detail(command: GetRequirementEvaluationDetailCommand): RequirementEvaluationDetail` — concretizza il contratto definito da _GetRequirementEvaluationDetailUseCase_. Recupera la sessione attiva, individua il requisito richiesto utilizzando i parametri incapsulati nel comando e ne costruisce la relativa rappresentazione sotto forma di _RequirementEvaluationDetail_.



