# DiarioDiBordo

Repository del gruppo RubberDuck, gruppo 14 di Ingegneria del software anno 2025-2026 presso l'università degli studi di Padova.

Questa repository è dedicata :

- alle attività del diario di bordo e affini.
- alla documentazione del progetto


## Struttura della repo

La repository raccoglie tutta la documentazione prodotta dal gruppo e gli strumenti necessari per generare il sito web del progetto.

- La cartella scripts contiene gli script che automatizzano la generazione e l’aggiornamento dei documenti Typst.
- La cartella src raccoglie i sorgenti principali:
    - in assets sono presenti risorse statiche di supporto (immagini e font)
    - in Candidatura sono presenti i documenti di questa fase, suddivisi in:
        - DocumentazioneEsterna: verbali con le aziende
        - DocumentazioneInterna: verbali del gruppo
        - Altri documenti: Dichiarazione degli impegni, Lettera di presentazione e Valutazione dei capitolati
    - in DiariDiBordo ci sono le presentazioni usate a lezione per esporre l'andamento di progetto
    - in Glossario sono presenti le definizioni del dominio del progetto
    - in PB (Product Baseline) ci saranno i documenti necessari a questa fase 
    - in RTB (Requirements and Technology Baseline) è presente la documentazione necessaria per fase:
        - DocumentazioneEsterna: verbali esterni, Analisi dei requisiti, Piano di progetto e piano di qualifica
        - DocumentazioneInterna: verbali interni, Dichiarazione di way of working e Glossario
    - config.typ è un file di configurazine generale per i documenti typst
- La cartella website sono presenti i file necessari al sito web di documentazione

# Componenti del gruppo

| Cognome    | Nome           | Matricola |
| :--------- | :------------- | :-------- |
| Bettega    | Aldo           | 2101087   |
| Testolin   | Davide         | 2079242   |
| Guerra     | Filippo        | 2077681   |
| Draghici   | Ana Maria      | 2101044   |
| Necsulescu | Felician Mario | 2111935   |
| Lorenzon   | Davide         | 2101075   |


### Sviluppo website

Per la compilazione è necessario avere [Tailwind CLI](https://tailwindcss.com/docs/installation/tailwind-cli) installato ed eserguire il seguente comando:

```sh
npx @tailwindcss/cli -i website/input.css -o website/style.css
```
