#import "/src/config.typ":template_dir,inserisciLink

== Scopo del documento
Il presente documento ha l'obiettivo di descrivere in dettaglio l'architettura del prodotto software, fornendo una visione chiara e strutturata delle sue componenti, delle relative responsabilità e delle loro interazioni all'interno del sistema.
La Specifica Tecnica funge da riferimento principale per la fase di progettazione e codifica, garantendo coerenza con i requisiti analizzati e consolidando la maturità architetturale del prodotto.

Nello specifico, questo documento si propone di:

- Definire l'architettura logica del prodotto, illustrando i design pattern adottati e l'organizzazione dei moduli;

- Esporre l'architettura di deployment, delineando la distribuzione delle componenti nell'ambiente di esecuzione;

- Giustificare le scelte tecnologiche, evidenziando come queste favoriscano la scalabilità, la testabilità e la qualità del codice;

- Fornire una guida solida per facilitare la comprensione, l'estensione e la manutenzione futura del prodotto.

== Scopo del prodotto
Il prodotto si prefigge di automatizzare e digitalizzare il processo di verifica della conformità alla normativa EN 18031, sostituendo le attuali procedure manuali, spesso onerose e soggette a errore umano, con una soluzione software interattiva.

Il sistema è progettato per guidare l'utente attraverso l'esecuzione di alberi decisionali (Decision Tree) complessi, permettendo la valutazione sistematica dei requisiti di sicurezza per dispositivi IoT e la generazione di esiti certi (Pass, Fail, N.A.).
L'integrazione di funzionalità per l'importazione di dati strutturati e una dashboard di monitoraggio in tempo reale mira a garantire la massima tracciabilità del processo, ottimizzando i tempi operativi della proponente e assicurando un elevato standard di affidabilità e manutenibilità dei risultati ottenuti.

== Glossario

Per garantire precisione terminologica senza appesantire la lettura, in questo documento i termini tecnici presenti nel Glossario sono segnalati con un pedice “G”, ad esempio: #pad(left: 1em)[

  *termine#sub("G")*: indica che il termine è definito nel Glossario e può essere consultato per chiarimenti.
]

Questo metodo consente di mantenere il testo chiaro e tecnicamente corretto, permettendo al lettore di riferirsi al Glossario solo quando necessario, senza interrompere il flusso della lettura.

== Riferimenti
=== Riferimenti normativi
#pad(left: 1em)[
  - #inserisciLink(url:"https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[Capitolato d'appalto C1 - Automated EN18031 Compliance Verification di BlueWind Srl] \ _Ultima consultazione: 8 aprile 2026;_ \
  - #inserisciLink(url:"https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/PD1.pdf")[Regolamento del progetto] \ _Ultima consultazione: 8 aprile 2026;_ \
  - #inserisciLink(url:"https://www.iso.org/standard/63712.html")[Standard ISO/IEC/IEEE 12207:2017] \ _Ultima consultazione: 10 gennaio 2026;_ \
  - #inserisciLink(url:"https://en.wikipedia.org/wiki/ISO/IEC_9126")[Standard ISO/IEC 9126] \ _Ultima consultazione: 10 gennaio 2026;_ \
]

=== Riferimenti informativi
#pad(left: 1em)[
  - #inserisciLink(url:"https://grouprubberduck.github.io/Documentazione/output/RTB/DocumentazioneInterna/Glossario.pdf")[Glossario del gruppo] \ _Ultima consultazione: 8 aprile 2026;_\
  - #inserisciLink(url:"https://galileodiscovery.unipd.it/discovery/fulldisplay?docid=alma9938989417806046&context=L&vid=39UPD_INST:VU1&lang=it&search_scope=catalogo_no_external&adaptor=Local%20Search%20Engine&tab=Everything&query=title,contains,Software%20Engineering,AND&query=creator,contains,Ian%20Sommerville,AND&mode=advanced")[Software Engineering, Ian Sommerville] \ _Ultima consultazione: 10 gennaio 2026;_ \
  - #inserisciLink(url:"https://grouprubberduck.github.io/Documentazione/")[Documentazione del gruppo GroupRubberDuck] \ _Ultima consultazione: 8 aprile 2026;_ \
]
