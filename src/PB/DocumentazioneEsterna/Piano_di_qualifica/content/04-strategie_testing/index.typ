#import "/src/config.typ":template_dir
== Introduzione alle strategie di testing

Il processo di verifica e validazione del software prevede l'utilizzo di diverse tipologie di test, ciascuna con uno scopo specifico all'interno del ciclo di sviluppo. \ 
Le tipologie di test previste sono:

- Test di Unità;
- Test di Integrazione;
- Test di Sistema;
- Test di Regressione;
- Test di Accettazione.

Per la revisione RTB, il gruppo ha scelto di documentare esclusivamente i Test di Sistema e i Test di Accettazione.\
Le restanti tipologie saranno definite e condotte nell'ambito delle attività di sviluppo previste per la Product Baseline (PB).

== Test di Sistema (TS) <test-sistema>
I test di sistema verificano in modo granulare ogni funzionalità del sistema, associando ciascun test a uno specifico caso d'uso. Lo stato NI (Non Implementato) indica che il test è definito ma non ancora eseguibile, in attesa dello sviluppo del PoC.
#show figure.where(kind: table): set block(breakable: true)

#include "sistema/_index.typ"



== Test di Accettazione (TA) <test-accettazione>
I test di accettazione verificano che il sistema soddisfi i requisiti dal punto di vista dell'utente, raggruppando i casi d'uso in flussi operativi completi e significativi. Ogni test rappresenta uno scenario d'uso realistico. Il superamento di questi test costituisce la condizione necessaria per il rilascio del prodotto.
#show figure.where(kind: table): set block(breakable: true)

#include "accettazione/_index.typ"
== Test di Regressione
I Test di Regressione hanno lo scopo di rilevare eventuali anomalie introdotte durante lo sviluppo di nuove funzionalità. A tal fine, il gruppo adotterà un approccio di *integrazione continua*: ogni commit sul repository avvierà automaticamente l'esecuzione della suite di test, garantendo un controllo costante sulla stabilità del codice prima dell'integrazione nel branch principale. \ Le suite di test di unità e di integrazione saranno definite e configurate nell'ambito delle attività di sviluppo previste per la Product Baseline (PB).
\ \ \ 
== Test di Unità
I Test di Unità verificano il corretto funzionamento delle singole unità software in isolamento, assicurando che ciascun componente si comporti come previsto indipendentemente dal resto del sistema. La loro definizione è demandata alle attività previste per la Product Baseline (PB).
=== Test di Unità Backend

#include "unita/backend/index.typ"

=== Test di Unità Frontend
Essendo generalmente usato l'approccio Server Side Rendering i test relativi al Frontend sono relativamente pochi rispetto a quelli di Backend 

== Test di Integrazione
I Test di Integrazione verificano il corretto funzionamento delle interazioni tra i diversi componenti o moduli del sistema, assicurando che le interfacce tra essi si comportino come atteso. La loro definizione è demandata alle attività previste per la Product Baseline (PB).

=== Test di Integrazione Backend

#include "integrazione/backend/index.typ"

