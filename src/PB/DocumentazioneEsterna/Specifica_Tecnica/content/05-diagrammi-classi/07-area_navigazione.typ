

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