== Pattern MVVM nel Frontend
Il frontend adotta il pattern Model-View-ViewModel tramite la Composition API di Vue 3. Le responsabilità sono distribuite esplicitamente tra tre categorie differenti con una separazione netta tra logica e presentazione.

=== Model
Il Model rappresenta i dati dell'applicazione e le regole che li governano, indipendentemente da qualsiasi elemento visivo. Questa responsabilità è affidata a file di
schema come `assetFormFields.js` che definiscono i campi di un'entità, i loro valori iniziali e le regole di validazione come funzioni pure. Il Model non dipende da Vue, HTTP o dal DOM.

=== ViewModel
Il ViewModel è il layer intermedio che espone lo stato reattivo alla View e incapsula la logica applicativa. Nel progetto questa responsabilità è realizzata in due modi, in base alla complessità del modulo.
Per i flussi operativi standard (form di creazione e modifica) il ViewModel è implementato tramite composable. Il composable useFormModel riceve uno schema dal Model e gestisce lo stato reattivo dei campi, la validazione e l'integrazione degli errori provenienti dal server. I widget smart completano questo layer orchestrando la chiamata HTTP, la gestione della risposta e la navigazione.
Per i moduli ad alto tasso di interazione (come il widget di valutazione dei requisiti) il ViewModel è centralizzato in uno store Pinia, che coordina lo stato condiviso tra più componenti, la comunicazione con il backend e la logica di dominio frontend.

=== View
La View è responsabile esclusivamente del rendering. I componenti dumb ricevono dati tramite props ed emettono eventi senza contenere logica applicativa. Il binding bidirezionale con il ViewModel avviene tramite v-model.