Questa sezione spiega come installare correttamente la versione MVP del prodotto.

== Clonare il repository

+ Avviare il terminale
+ Spostarsi nella cartella in cui si desidera clonare il repository
+ Eseguire:
  ```sh
  git https://github.com/GroupRubberDuck/MVP.git
  ```

== Avvio
Una volta clonato il repository è necessario seguire i seguenti step per avviare l'applicazione:

+ Assicurarsi di avere Docker e Docker Compose installati
+ Aprire il terminale all'interno della cartella del repository precedentemente clonato
+ Impostare le variabili di ambiente richieste (`DB_USER` e `DB_PASSWORD`) per il database MongoDB, per esempio con:
  ```sh
  export DB_USER=mongo
  export DB_PASSWORD=passwordsegreta
  ```
+ Avviare l'applicazione eseguendo:
  ```sh
  docker compose up --build -d
  ```

== Spegnimento
Per fermare l'applicazione e i servizi ad essa connessi è sufficiente eseguire il seguente comando nella cartella del repository:
```sh
docker compose down
```

== Riavvio
Per riavviare l'applicazione e i servizi ad essa connessi invece è sufficiente eseguire:
```sh
docker compose down -v --remove-orphans && dоcker compose up -d --build
```
