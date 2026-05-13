== Diagramma di dominio<diagdom>
Il diagramma delle classi illustra il Modello di Dominio del nucleo applicativo. Progettato rispettando i principi del Domain-Driven Design e dell'Architettura Esagonale, il modello incapsula esclusivamente la logica di business pura, risultando del tutto agnostico rispetto ai dettagli infrastrutturali.

//#image("../uml/png/Modello_di_Dominio.png")

Per garantire coerenza logica e separazione delle responsabilità, le classi sono state logicamente organizzate in tre macro-package:

+ #[*Oggetti di Valutazione*
  
  Questo package modella le entità concrete sottoposte alla valutazione:

  - `Dispositivo`: mantiene lo stato globale dell'oggetto in esame e gestisce il ciclo di vita delle sue componenti.

  - `Asset`: rappresenta i singoli componenti fisici o logici (classificati tramite l'enumerazione `TipoAsset` in Security o Network) che costituiscono il dispositivo.

  La relazione tra `Dispositivo` e `Asset` è una composizione. La distruzione logica di un dispositivo all'interno del sistema comporta la distruzione dei relativi asset associati.
]
+ #[ *Modello Normativo*

  Questo package incapsula la struttura formale della norma di riferimento.

  - `ModelloStandard` e `Requisito`: Il ModelloStandard definisce l'anagrafica della norma e si compone di molteplici Requisiti. La relazione riflessiva su Requisito ("dipende da") permette di modellare i vincoli di dipendenza tra requisiti.

  - `DecisionTree`: la struttura dell'albero di valutazione è stata modellata sfruttando il Design Pattern Composite. La classe astratta NodoNormativo definisce il contratto base, che viene implementato polimorficamente da:

    - `NodoDecisionale`: nodi intermedi che incapsulano una domanda e definiscono una biforcazione logica (`YES/NO`) verso i nodi successivi.

    - `NodoFoglia`: nodi terminali del ramo decisionale che emettono un Verdetto di conformità (`PASS, FAIL, NA`) per l'albero a cui appartengono
]
+ #[ *Navigazione e Valutazione*

  Questo package funge da area di interazione tra l'entità fisica e la regola normativa.

  - `ValutazioneRequisito`:
    Agisce come Classe di Associazione tra uno specifico Asset e uno specifico Requisito. Questa scelta progettuale separa nettamente la definizione della norma dallo stato della valutazione corrente. Contiene una struttura dati (`mapRisposte`) fondamentale per memorizzare le risposte fornite dall'utente durante la navigazione del DecisionTree, garantendo la possibilità di sospendere e riprendere la compilazione.

  - `ReportConformita`: 
    È legato a `ValutazioneRequisito` tramite una relazione di aggregazione: il report colleziona le singole valutazioni per generare l'esito finale, ma una sua eventuale eliminazione o rigenerazione non invalida i dati delle valutazioni persistite nel sistema.

  Viene fatto utilizzo di enumerazioni (`TipoAsset`, `StatoValutazione`, `Verdetto`). Questa scelta impone vincoli di dominio stringenti, garantendo la type-safety ed evitando stati di valutazione non previsti dal capitolato.
]
  