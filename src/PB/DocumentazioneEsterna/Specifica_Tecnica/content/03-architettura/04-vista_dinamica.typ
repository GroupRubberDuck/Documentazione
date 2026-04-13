== Diagrammi di sequenza
La seguente sezione illustra il comportamento dinamico del sistema tramite diagrammi di sequenza, focalizzandosi sui casi d'uso di maggiore interesse. Questi modelli descrivono l'ordine cronologico dei messaggi scambiati tra gli attori esterni, i componenti infrastrutturali e il nucleo applicativo.

=== UC26, UC27 - Valutazione di un nodo e transizione di stato
#image("uml/png/Valutazione_e_transizione_stato_uc26-27.png");

Il seguente diagramma di sequenza illustra il flusso principale di interazione durante la valutazione di un dispositivo secondo la norma EN18031.
Il diagramma evidenzia il rigoroso attraversamento dei layer architettonici, dal Boundary (Vue.js) fino al driver di persistenza (PyMongo).

Degno di nota è l'isolamento del livello Domain: il frontend e gli adapter non conoscono le regole normative. 
È il Servizio applicativo che recupera lo stato, lo inietta nel Dominio, e si affida al calcolo di quest'ultimo. 
Tramite l'uso di un Alternative Sequence Fragment (alt), il diagramma modella il comportamento polimorfico del flusso: 
se la risposta porta a un nodo intermedio, il sistema salva il progresso e restituisce la domanda successiva; 
se la risposta raggiunge una foglia dell'albero normativo, il sistema calcola la conformità finale (Pass/Fail) e chiude lo stato della valutazione.

=== Importazione e validazione UC33.3

=== Esportazione in pdf UC30.1


// altri papabili: uc11, uc23

== Diagrammi di attività
