Questa sezione spiega come installare e avviare correttamente la versione MVP del prodotto.

== Clonare il Repository

+ Aprire il terminale e spostarsi nella cartella in cui si desidera clonare il repository.
+ Eseguire:
```sh
  git clone https://github.com/GroupRubberDuck/MVP.git
```
+ Spostarsi nella cartella del repository appena clonato:
```sh
  cd MVP
```

== Avvio

L'applicazione richiede *Docker* e *Docker Compose* installati e in esecuzione in background sul proprio sistema prima di procedere.

1.  Impostare le variabili di ambiente richieste (`DB_USER` e `DB_PASSWORD`) per il database MongoDB, per esempio con:
  ```sh
  export DB_USER=mongo
  export DB_PASSWORD=passwordsegreta
  ```

2. Avviare l'applicazione eseguendo:
```sh
  docker compose up --build -d
```
Una volta completato l'avvio, aprire un browser e collegarsi all'indirizzo #link("http://localhost:8080").

== Spegnimento

Per fermare l'applicazione e tutti i servizi ad essa connessi, eseguire nella cartella del repository:
```sh
docker compose down
```

== Riavvio

Per riavviare completamente l'applicazione, rimuovendo i volumi e i container orfani:
```sh
docker compose down -v --remove-orphans && docker compose up --build -d
```
