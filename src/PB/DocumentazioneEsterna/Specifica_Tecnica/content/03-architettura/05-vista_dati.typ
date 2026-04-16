== Schema dati <vista-dati>
In questa sezione viene illustrato lo schema dati che il database MongoDB dovrà rispettare.

Essendo MongoDB un database NoSQL orientato ai documenti, adotta intrinsecamente una natura _schema-flexible_. Per questo motivo, per descriverne la struttura non è idoneo utilizzare un classico diagramma Entity-Relationship, tipico dei database relazionali.

Poiché non esiste uno standard universale e univoco per la modellazione visiva dei database NoSQL, per la stesura di questa documentazione si è scelto di adottare una rappresentazione ispirata al formalismo di *Hackolade*, uno degli standard industriali più apprezzati per questo scopo (consultabile al seguente link: #link("https://hackolade.com/schemas/Yelp_Challenge_dataset_documentation.html")).

Sono state individuate due collection principali:
- Dispositivi
- Modelli

=== Schema Dati Dispositivo
La rappresentazione di un dispositivo all'interno del database contiene le seguenti informazioni:
- Dati anagrafici e tecnici del dispositivo.
- Riferimento al modello standard associato.
- Lista degli asset analizzati, contenente:
  - Dati descrittivi dell'asset.
  - Valutazioni specifiche (risposte) in merito ai requisiti.

Le informazioni relative alla struttura ad albero del modello non vengono duplicate all'interno del documento del dispositivo. Questa scelta progettuale evita una ridondanza significativa e garantisce un database più leggero e performante.

#figure(caption:"Schema dati dispositivo")[
  #image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/images/schema_dati_dispositivo.drawio.png")
]

=== Schema dati Modello
La rappresentazione di un modello standard sul database funge da _template_ di sola lettura e contiene le seguenti informazioni:
- Informazioni generali e versione del modello.
- Lista dei requisiti da verificare, contenente:
  - Descrizioni normative e target del requisito.
  - Struttura e logica dell'albero decisionale (nodi e percorsi).

#figure(caption:"Schema dati modello")[
  #image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/images/schema_dati_modello.drawio.png")
]