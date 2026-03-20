#import "/src/config.typ":template_dir
== Introduzione strategie di testing \ 
 I test sono organizzati in categorie: 
- i Test di Sistema (TS), che verificano il comportamento del sistema a livello di singolo caso d'uso;
- i Test di Accettazione (TA), che validano i flussi operativi macroscopici dal punto di vista dell'utente finale.

== Test di Sistema (TS) <test-sistema>
I test di sistema verificano in modo granulare ogni funzionalità del sistema, associando ciascun test a uno specifico caso d'uso. Lo stato NI (Non Implementato) indica che il test è definito ma non ancora eseguibile, in attesa dello sviluppo del PoC.
#show figure.where(kind: table): set block(breakable: true)

#include "sistema/_index.typ"



== Test di Accettazione (TA) <test-accettazione>
I test di accettazione verificano che il sistema soddisfi i requisiti dal punto di vista dell'utente, raggruppando i casi d'uso in flussi operativi completi e significativi. Ogni test rappresenta uno scenario d'uso realistico. Il superamento di questi test costituisce la condizione necessaria per il rilascio del prodotto.
#show figure.where(kind: table): set block(breakable: true)

#include "accettazione/_index.typ"


