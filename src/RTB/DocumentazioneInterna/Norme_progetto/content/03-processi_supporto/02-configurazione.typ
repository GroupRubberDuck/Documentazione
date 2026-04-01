== *Processo di Gestione delle Configurazioni* <configurazione>

=== Introduzione
Il processo di Gestione delle Configurazioni ha lo scopo di garantire la corretta identificazione, controllo, monitoraggio e aggiornamento di tutti gli elementi del progetto, siano essi documenti, codice, deliverable o altri artefatti di progetto. \
Questo processo assicura coerenza, tracciabilità e qualità lungo tutto il ciclo di vita del progetto, supportando le attività dei processi primari (sviluppo, fornitura) e riducendo rischi di incongruenze o perdita di informazioni.

=== Scopo del processo

Il processo di gestione delle configurazioni mira a:

+ Garantire la *tracciabilità completa delle modifiche* apportate a documenti, codice e artefatti.

+ *Controllare e gestire le versioni* in modo chiaro e uniforme.

+ Fornire un *registro delle modifiche* consultabile da tutti i membri del gruppo.

+ *Supportare la revisione, approvazione e validazione* dei deliverable.

+ *Ridurre ambiguità e conflitti* dovuti a modifiche non controllate.

=== Attività del processo
Le principali attività della Gestione delle Configurazioni includono:

+ Identificazione degli elementi di configurazione.
+ Applicazione del codice di versione X.Y.Z (stabile, feature, patch).
+ Aggiornamento automatico della versione in tutti i documenti tramite Typst/GitHub.
+ Inserimento di ogni modifica nel Registro delle Modifiche, comprensivo di: data, autore, verificatore, descrizione e nuova versione.
+ Verifica delle modifiche da parte dei revisori.
+ Approvazione e rilascio di versioni stabili.
+ Conservazione dei documenti e del codice in repository centralizzati.
+ Backup per garantire sicurezza e recuperabilità dei dati.

=== Procedure operative

==== Codice di versione

Ogni modifica apportata a un documento genera automaticamente una nuova versione, identificata tramite un codice nel formato:

#align(center, block[
  #set align(left)
  *X.Y.Z*
])

dove ciascuna componente rappresenta uno stato diverso del processo di validazione:

#pad(left: 1em)[
- *X – Versione stabile approvata*  \ Indica l’ultima versione ufficialmente approvata dal Responsabile.  
  Il suo incremento segnala una revisione sostanziale o una modifica di grande rilievo.  
  L’incremento di X comporta l’azzeramento automatico di Y e Z.

- *Y – Feature*  \
  Rappresenta l’ultima approvazione da parte di un Verificatore.  
  Il suo incremento indica l’introduzione o modifica di una nuova funzionalità o sezione del documento.  
  L’incremento di Y comporta l’azzeramento di Z.

- *Z – Patch*  \ Indica l’ultima modifica di dettaglio verificata (correzioni minori, refusi, aggiustamenti formali).  
  L’incremento di Z rappresenta cambiamenti minori.
]

===== Regole di incremento

#pad(left: 1em)[
+  Ogni approvazione genera un incremento della cifra di versione stabile.  
+ Nel versionamento X.Y.Z, maggiore è il cambiamento, più significativa è la cifra che viene incrementata: X ha un peso maggiore di Y, e Y maggiore di Z
+ L’incremento di una cifra comporta sempre l’azzeramento delle cifre alla sua destra, mantenendo coerenza nella progressione delle versioni.
]

==== Versionamento automatico tramite Typst

Il processo di gestione delle configurazioni utilizza uno snippet Typst per gestire automaticamente la versione corrente del documento e collegarla ai metadati. Lo snippet è il seguente:
 #block(
  fill: rgb("#f9f9f9"), // Colore di sfondo (grigio chiaro)
  stroke: 1pt + black, // Bordo nero da 1 punto
  inset: 10pt          
)[ #set raw(lang: "typ")
  `#let versionNumber=currentVersion.values().map(n=>{str(n)}).join(".")
#metadata(versionNumber)<versionNumber>
#let doc="Norme di Progetto"
#let versionNumber=currentVersion.values().map(n=>{str(n)}).join(".")`]

- Converte le componenti numeriche della versione (X, Y, Z) in stringhe e le unisce nel formato X.Y.Z. Il risultato viene salvato nella variabile versionNumber, che rappresenta la versione corrente del documento.
- Inserisce la versione corrente nei metadati del documento.

- Permette di rendere il numero di versione accessibile in tutto il documento, per esempio in header, footer o tabella del registro modifiche, senza doverlo aggiornare manualmente.
- Definisce il nome del documento come variabile, utile per riferimenti automatici all’interno del registro modifiche o per generare link e riferimenti interni.

==== Registro modifiche

Il registro modifiche è la tabella principale presente in ogni documento  che tiene traccia della versione, degli autori, dei verificatori e delle modifiche effettuate. Ogni voce del registro include:

+ *Vers.* – Versione corrente del documento (X.Y.Z);

+ *Data* – Data di aggiornamento della versione;

+ *Autore* – Persona che ha redatto o modificato il documento;

+ *Verificatore* – Persona che ha revisionato o approvato la modifica;

+ *Descrizione* – Sintesi delle modifiche apportate.

#align(center)[
#{
  show table.cell: set text(size: 10pt)
  table(
    columns: 5,
    align: horizon,
    table.header([*Vers.*],[*Data*],[*Autore*],[*Verificatore*],[*Descrizione*]),

    [0.9.0], [2026-01-10],[Nome di chi ha modificato],[Nome di chi ha verificato],[Stesura Sezione 4.2, Gestione dell’infrastruttura]
  )
}

]

==== Formato nome dei verbali
 Al fine di avere ordine cronologico all'interno della cartella dei verbali, è stato deciso di adottare il seguente standard per la nomina dei verbali. Di questi documenti interessa data e versione, dunque saranno nel formato: \ YYYY-MM-DD_Verbale-vX.Y.Z.typ

=== Strumenti principali utilizzati

Per la gestione delle configurazioni, delle versioni e della documentazione il gruppo utilizza i seguenti strumenti:

- *Typst*: compilazione dei documenti, template riutilizzabili, gestione dei metadati e preview istantanea.

- *GitHub*: repository centralizzato, controllo versioni, gestione issue e collaborazione asincrona.

- *GitHub Actions*: compilazione automatica dei documenti in PDF e aggiornamento della versione corrente.

- *Registro delle Modifiche* (integrato nei documenti tramite Typst): tiene traccia di autori, verificatori, date e descrizione di ogni modifica.