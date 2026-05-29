#import "/src/TypstTemplate/specificaTecnica/design-pattern-presenter.typ": design-pattern-presenter

#let pattern=(
  pattern-name: "Factory",
  descrizione: [
    Il pattern Factory è un pattern creazionale che astrae il processo di creazione degli oggetti. 
    
    Delega a un componente specifico la responsabilità di creare oggetti complessi, restituendoli attraverso un'interfaccia comune.
  ],
  motivazione: [
    In un'architettura esagonale, i layer di dominio devono dipendere da interfacce (Porte) e mai da implementazioni concrete.
    \
    Se un service dovesse istanziare direttamente le proprie dipendenze, finirebbe per accoppiarsi a librerie o tecnologie esterne. 
    \
    Il Factory risolve questo problema incapsulando la conoscenza di "come" e "quale" oggetto concreto creare.
  ],
  utilizzo: [
    Nel progetto il pattern è applicato a due livelli distinti:
    + *Application Factory:* A livello di framework, la funzione `create_app()` di Flask agisce come macro-factory, assemblando l'applicazione e le sue dipendenze principali all'avvio.
    + *Domain/Service Factory:* A livello applicativo, vengono utilizzate factory specifiche per costruire a runtime le implementazioni corrette di alcune interfacce che richiedono una selezione basata sulle azioni dell'utente (creare il FileExporter corrispondente al formato richiesto dall'utente), restituendo ai service oggetti pronti all'uso che rispettano l'interfaccia attesa.
  ],
)

#design-pattern-presenter(
  ..pattern
)
// ==== Factory

// *Introduzione*

// Il Factory è un pattern creazionale che centralizza la costruzione di oggetti complessi
// in un unico punto, evitando che i componenti si costruiscano le dipendenze da soli.

// *Motivazioni dell'utilizzo*

// In un'architettura esagonale tutti i layer devono comunicare attraverso interfacce, non
// attraverso implementazioni concrete. Se ogni componente si costruisse le proprie
// dipendenze, il dominio finirebbe per conoscere MongoDB, Flask e le librerie esterne,
// violando la regola fondamentale dell'architettura. Il Factory risolve questo problema
// concentrando tutta la conoscenza delle implementazioni concrete in un solo posto.

// *Applicazione nel progetto*

// `create_app()` è l'unico punto del sistema in cui le implementazioni concrete vengono
// istanziate e collegate. Crea i repository MongoDB, gli adapter di import ed export, li
// inietta nei service applicativi `DispositivoService`, `AssetService` e
// `ValutazioneService`, e registra i Blueprint Flask. Nessun altro modulo conosce
// `MongoDispositivoAdapter`, `MongoAssetAdapter` o `MongoValutazioneAdapter` direttamente
// --- riceve solo oggetti già configurati attraverso le interfacce delle porte.

