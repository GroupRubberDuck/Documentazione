== Architettura Logica

=== Stile architetturale
L'architettura adottata per realizzare il prodotto è l'architettura esagonale. Questo tipo di architettura ha come obiettivo primario isolare la logica di business dal resto. Questo approccio garantisce un'elevata testabilità del sistema e rende il nucleo del software completamente agnostico rispetto ai dettagli implementativi (framework, database o interfacce).
Il sistema è strutturato in livelli concentrici, organizzati come segue:

#image("../../images/schema-archittettura-esagonale.webp", width: 80%)

- *Domain (Core)*: Rappresenta il nucleo centrale dell'applicazione. Contiene la logica di business pura ed è rigorosamente privo di dipendenze esterne.

- *Ports*: Costituiscono il punto di connessione tra il nucleo e il mondo esterno, permettendo una comunicazione strutturata senza creare accoppiamento. Si suddividono in Inbound Ports (definiscono i casi d'uso accessibili dall'esterno) e Outbound Ports (permettono al nucleo di definire interfacce per interagire con i servizi esterni).

- *Adapters*: Rappresentano lo strato più esterno e fungono da traduttori tra le tecnologie specifiche e il nucleo. Si suddividono in Driving Adapters (adattatori in entrata, che guidano l'applicazione ricevendo input e invocando le Inbound Ports) e Driven Adapters (adattatori in uscita, che vengono guidati dall'applicazione per interagire con l'infrastruttura esterna tramite le Outbound Ports).

Le motivazioni per le quali questa architettura è stata scelta sono le seguenti:
- *Testabilità*: l'assenza di dipendenze esterne nel livello di Dominio permette di scrivere Unit Test in puro Python in modo semplice e veloce. È possibile testare la logica di business isolatamente, iniettando mock o stub per simulare le interfacce, senza la necessità di avviare il server Flask o connettersi al database MongoDB.
- *Divisione del nucleo*: il nucleo dell'applicazione è totalmente disaccoppiato dall'infrastruttura. Essendo ignaro del livello di presentazione (l'interfaccia utente in Vue.js) e del livello di persistenza (il database NoSQL MongoDB), il sistema garantisce un'alta tolleranza ai cambiamenti. È possibile sostituire o aggiornare le tecnologie esterne senza dover alterare la logica di business.
- *Sviluppo parallelo*: la rigorosa definizione dei contratti di comunicazione (le Porte) nelle fasi iniziali di progettazione permette al team di procedere in parallelo. Frontend, backend e integrazione con il database possono essere sviluppati simultaneamente da membri diversi del gruppo, riducendo i colli di bottiglia.
- *Inversione delle dipendenze*: l'architettura applica rigorosamente questo principio: è il Dominio a dettare i contratti (le interfacce) a cui i servizi esterni devono sottostare, e non viceversa. In questo modo, il nucleo dell'applicazione mantiene il controllo assoluto del flusso ed è protetto dai potenziali effetti collaterali (side effects) derivanti dall'infrastruttura.

Contro di questa scelta architetturale:
- Ripida curva di apprendimento:l'architettura esagonale richiede una profonda comprensione dei principi SOLID, in particalare la Dependency Injection e usare questo pattern per la prima volta richede profondo studio. Questo rischio sarà mitigato da una precisa fase di progettazione che semplificherà la codifica.
- Elevato overhead iniziale: 

https://medium.com/fastned/when-and-when-not-to-use-hexagonal-architecture-c0850d643b3b
https://jdriven.com/blog/2022/10/Why-you-should-NOT-use-Hexagonal-architecture
https://medium.com/tom-tech/inside-vs-outside-a-practical-guide-to-hexagonal-architecture-c0557f00a984
https://www.arhohuttunen.com/hexagonal-architecture/


=== Diagramma dei package

#image("../../images/Diagramma_package.drawio.png")