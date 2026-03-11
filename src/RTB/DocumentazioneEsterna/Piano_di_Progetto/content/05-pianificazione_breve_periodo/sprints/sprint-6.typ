#import "/src/config.typ": template_dir
#import template_dir + "/PdP/sprint.typ": persone, ruoli

#let sprint_data = (
  numero: "6",
  usaMatrice: true,
  timeline: (
    inizio: datetime(year: 2026, month: 02, day: 19),
    finePrevista: datetime(year: 2026, month: 03, day: 04),
    fineEffettiva: datetime(year: 2026, month: 03, day: 04),
  ),
  TODO: [
    Le attività dello sprint hanno interessato tre ambiti distinti, sviluppati in modo coordinato:

    - Analisi dei Requisiti (AdR): ultimazione di tutti i casi d'uso e apertura della fase di redazione dei requisiti funzionali, classificati per priorità (Obbligatori, Desiderabili, Opzionali) in coerenza con il capitolato BlueWind.

    - Proof of Concept (PoC): suddivisione delle pagine da implementare tra i membri (Import, Decision Tree, Report), verifica dell'esportazione PDF e valutazione architetturale sul database, con orientamento verso MongoDB per la sua compatibilità nativa con strutture dati ad albero in formato BSON.

    - Piano di Qualifica (PdQ): impostazione di una prima bozza delle strategie di testing, articolata in test di sistema (un test per caso d'uso), test di accettazione e tabella di tracciamento test-requisiti.

  ],
  rischiAttesi: [
    - *R.T.2 – Inesperienza con le tecnologie (Alta frequenza, Alta pericolosità)*: L'avanzamento del PoC richiede l'adozione e il consolidamento di tecnologie ancora non del tutto familiari al gruppo, con il rischio di rallentamenti dovuti alla curva di apprendimento.
    - *R.O.1 – Pianificazione iniziale errata o ottimistica (Alta frequenza, Media pericolosità)*: Il recupero delle attività slittate dallo sprint precedente potrebbe portare a stime non conservative del carico di lavoro effettivo.
  ],
  rischiEffettivi: [
    Nel corso dello Sprint 6 nessuno dei rischi attesi si è manifestato in modo rilevante. Il ripristino della piena operatività del gruppo ha consentito di recuperare le attività in sospeso e di mantenere un ritmo di avanzamento regolare su tutti i fronti.
  ],
  oreProduttive: (
    (persona: persone.ALDO, ruolo: ruoli.Analista, orePreviste: 4, oreEffettive: 4),
    (persona: persone.ALDO, ruolo: ruoli.Verificatore, orePreviste: 1, oreEffettive: 1),
    (persona: persone.ANA, ruolo: ruoli.Responsabile, orePreviste: 4, oreEffettive: 4),
    (persona: persone.ANA, ruolo: ruoli.Amministratore, orePreviste: 2, oreEffettive: 2),
    (persona: persone.FELIX, ruolo: ruoli.Analista, orePreviste: 3, oreEffettive: 3),
    (persona: persone.FILIPPO, ruolo: ruoli.Analista, orePreviste: 2, oreEffettive: 2),
    (persona: persone.FILIPPO, ruolo: ruoli.Programmatore, orePreviste: 2, oreEffettive: 2),
    (persona: persone.DL, ruolo: ruoli.Analista, orePreviste: 7, oreEffettive: 7),
    (persona: persone.DT, ruolo: ruoli.Analista, orePreviste: 3, oreEffettive: 3),
    (persona: persone.DT, ruolo: ruoli.Programmatore, orePreviste: 2, oreEffettive: 2),
  ),
  retrospettiva: [
    - *Stato di avanzamento:*
      La fase di modellazione dei casi d'uso è stata portata a termine e si è dato avvio alla classificazione strutturata dei requisiti funzionali. Sul fronte tecnico, il PoC ha raggiunto risultati concreti: l'esportazione PDF è stata verificata con successo e la discussione sull'architettura dati ha portato a preferire MongoDB, che si adatta meglio alla struttura ad albero nidificata dei Decision Tree senza richiedere complesse query JOIN.

    - *Aspetti positivi:*
      Il workflow di verifica ridefinito a fine Sprint 5 ha trovato piena applicazione. In precedenza tutti i documenti dovevano passare per una fase di approvazione esplicita prima di essere pubblicati sul branch develop, generando rallentamenti. Con la nuova distinzione, i verbali continuano a richiedere un'approvazione formale prima della pubblicazione, mentre piccole modifiche (minor) ad altri documenti — come PdP, PdQ e Norme — possono essere spostate direttamente in "done" dal verificatore senza attendere un'approvazione aggiuntiva. Questo ha ridotto i tempi di integrazione e reso il flusso di lavoro più fluido.

    - *Problemi riscontrati:*
      La conduzione parallela di analisi e sviluppo ha richiesto un raccordo continuo per prevenire disallineamenti tra i requisiti definiti e le decisioni architetturali del PoC.

    - *Interventi pianificati:*
      Per il prossimo sprint il gruppo si prefigge di:
      - Portare i requisiti funzionali a uno stato stabile e definitivo.
      - Completare il PoC, finalizzando le pagine assegnate e confermando la migrazione a MongoDB.
      - Redigere la tabella di tracciamento test-requisiti nell'ambito del Piano di Qualifica.
  ],
)
