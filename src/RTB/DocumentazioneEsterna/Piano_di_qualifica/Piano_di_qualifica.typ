/*
Bozza iniziale

Questa bozza vuole essere uno studio iniziale del documento dando un occhio alle sezioni che dovrebbe avere e al loro significato, vuole essere un punto di partenza per poi guidare l'autore nell'aggiunta di contenuti corretti.

Non è stato volutamente impaginato per mettere in risalto i contenuti e lasciare la struttura flessibile in attesa di miglioramenti. La forma verrà ad una forma più matura di questo documento.
*/

#let currentVersion1="-v0.0.1"
#let currentVersion2=(
  major:0,
  minor:1,
  patch:0,
)

#let versionNumber="-v"+currentVersion2.values().map(n=>{str(n)}).join(".")
// #let versionNumber=currentVersion1
#metadata(versionNumber)<versionNumber>






= Introduzione

== Scopo del documento
Lo scopo del documento è:
- certificare che il progetto rispetta elevati standard di qualità dell'ingegneria del software
- al suo interno ci sono il processo, gli obiettivi e le metriche di qualità -> *testing*
- il documento è rivolto a chi crea il prodotto, a chi lo usa e chi lo valuta.

In questo documento sono presenti:
- metriche di qualità
- strategie di testing
- cruscotto di valutazione della qualità

== Glossario
In questa parte viene specificato che i termini del glossario sono contrassegnati con G e che il loro significato è visibile nel documento dedicato.

== Metodo (Maturità e miglioramenti)
In questa parte viene specificato il metodo usato per redigere il documento, in molti casi è stato usato il metodo incrementale, utile per adattarsi ad esigenze mutevoli.

== Riferimenti
Questa parte contiene il materiale di riferimento esterno a questo documento.

=== Riferimenti normativi
- Norme di progetto
- Capitolato C1
- Regolamento progetto didattico

=== Riferimenti informativi
- Glossario
- Eventuali slide di lezione (da aggiungere)

= Piano di qualità
In questa sezione vengono descritti i parametri di qualità del processo e del prodotto.

In questa parte ci possono essere differenti soluzioni di realizzazione, in certi casi sono state scritte delle vere e proprie formule matematiche che calcolino la percentuale di requisiti soddisfatti, rendendo più tecnica tale valutazione peccando però in descrizione.
Per ciascun parametro viene associato un codice, poi vengono raggruppati in una tabella(CODICE, NOME, ACCETTABILE, PREFERIBILE).

== Qualità di processo
Monitora l'efficienza e l'andamento economico/temporale dello sviluppo rispetto a quanto pianificato
- Metriche economiche e temporali: Include il calcolo di Earned Value (EV), Actual Cost (AC), Planned Value (PV) ed Estimated at Completion (EAC).
- Varianza: analizza gli scostamenti di budget
- Indici di performance: valuta l'efficienza tramite CPI (Cost Performance Index) e SPI (Schedule Performance Index)

Vengono definite una serie di metriche calcolabili con formule matematiche, da definire quali metriche usare.

Risulta poi utile riassumere le metriche in una tabella(CODICE, NOME METRICA, VALORE ACCETTABILE, VALORE OTTIMALE), 

== Qualità di prodotto
Definisce le caratteristiche che il software e la documentazione devono avere. Questa parte può avere più sezioni, potrebbero essere:
- architettura
- documentazione
- software

=== Qualità dell'architettura
Vengono definite tutte le best practice che una buona architettura deve avere, per fare questa parte può essere utile vedere le slide di Cardin.

=== Qualità della documentazione
Questa parte è relativa ai documenti prodotti: quali metodologie vengono usate affinché un documento sia corretto in forma e contenuti

=== Qualità del software
Questa parte definisce quali siano i parametri per misurare la qualità di un buon prodotto software, ponendo anche un focus sulla soddisfazione del cliente.

= Controllo delle metriche - Cruscotto di Qualità
In questa sezione ogni metrica ha una sezione dedicata e viene calcolato il valore di tale metrica in un determinato sprint e commentato l'andamento di processo -> questa parte sarà un "diario di andamento" del progetto.

= Strategie di testing
Questa parte contiene *tutta la documentazione riguardante il testing* (i test possono arrivare ad essere centinaia).
Qui si usano metodologie di testing standard, dunque:
+ test di unità
+ test di integrazione
+ test di sistema
+ test di accettazione

= Miglioramenti
In questa sezione vi è un resoconto dei miglioramenti adottati durante il progetto, ci possono essere le decisioni prese durante le riunioni che hanno avuto un grande impatto positivo.
Questa parte richiede un *aggiornamento continuo* prevalentemente da parte dell'amministratore (se il miglioramento è nelle tecnologie per migliorare la produttività) e del responsabile (per la gestione dei ruoli).

