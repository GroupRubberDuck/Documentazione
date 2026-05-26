== Pattern MVVM nel Frontend
Il frontend adotta il pattern Model-View-ViewModel tramite la
Composition API di Vue 3. La struttura del file .vue riflette
naturalmente questa separazione: il blocco \<script setup>
realizza il ViewModel, il blocco <template> dichiara il binding
tra ViewModel e View tramite il meccanismo di data binding del
framework. Il ViewModel non istanzia né invoca direttamente le
View — le conosce solo come destinatari di dati e sorgenti di
eventi.

Il pattern MVVM si applica ai widget che gestiscono stato
complesso. I widget che incapsulano una singola azione senza
stato interno (eliminazione, esportazione, gestione sessione)
seguono un pattern riconducibile al Command, descritto nella
sezione dedicata ai widget semplici.

=== Model

Il Model rappresenta i dati e le regole che li governano,
indipendentemente da qualsiasi elemento visivo.

Per i widget basati su form, il Model è composto dal composable
useFormModel e dalle definizioni di dominio (assetFormFields,
deviceFormFields). useFormModel gestisce lo stato reattivo dei
campi, la validazione client-side e l'integrazione degli errori
provenienti dal server. Le definizioni di dominio specificano
campi, valori iniziali e regole di validazione come funzioni
pure. La logica di business del Model non dipende dal framework
— utilizza la reattività di Vue esclusivamente come meccanismo
di notifica.


Per il modulo di valutazione dei requisiti, il Model è composto
da classi di dominio pure (DecisionNode, LeafNode, TreeStructure,
EvaluationEngine), prive di qualsiasi dipendenza da Vue, e dallo
store Pinia (DecisionTreeStore) che mantiene lo stato reattivo
della valutazione. Lo store incapsula lo stato dei dati e le
operazioni di dominio (calcolo del percorso attivo, gestione
delle risposte) ed è acceduto esclusivamente dal ViewModel.

=== ViewModel

Il ViewModel orchestra il collegamento tra Model e View: espone
lo stato reattivo, gestisce le azioni dell'utente e coordina la
comunicazione con il backend.

Per i widget basati su form, il ViewModel è il widget smart che
inizializza useFormModel con le definizioni di dominio, lo collega
alla View tramite props binding, e orchestra la chiamata HTTP di
creazione o modifica. La chiamata HTTP è contenuta direttamente
nel widget anziché in un API client dedicato: trattandosi di una
singola operazione (POST o PUT), l'introduzione di una classe
separata avrebbe aggiunto complessità senza beneficio. Il widget
resta comunque testabile in isolamento poiché l'URL dell'endpoint
non è hardcoded ma iniettato dal livello di integrazione tramite
props.

Per il modulo di valutazione dei requisiti, il ViewModel è il
RequirementEvaluationWidget, unico componente che accede allo
store. Calcola le proprietà derivate necessarie ai componenti
figli, le
passa come props e traduce gli eventi emessi dai figli in azioni
sullo store. La comunicazione con il backend è delegata a un
EvaluationApiClient dedicato, scelta motivata dalla presenza di
operazioni multiple (salvataggio risposte, salvataggio
giustificazione, recupero stato, recupero dettaglio) che avrebbero
appesantito il widget se gestite direttamente al suo interno.

=== View

La View è responsabile esclusivamente del rendering.
Ricevono dati tramite props ed emettono eventi senza contenere
logica applicativa né accedere direttamente allo stato
dell'applicazione. Il binding reattivo tra ViewModel e View è
gestito dal framework Vue tramite props e data binding
dichiarativo nel template.