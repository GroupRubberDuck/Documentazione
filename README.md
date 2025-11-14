# RubberDuck - Gruppo 14
**Corso di Ingegneria del Software (2025-2026) - Università degli Studi di Padova**

Questo repository raccoglie tutta la documentazione e gli strumenti del gruppo **RubberDuck**, dedicata alle attività del progetto del corso di Ingegneria del Software.

---

## Diario di bordo e attività correlate
La repository contiene tutte le informazioni relative alle attività del **diario di bordo** e documenti affini, tra cui:

- Verbali interni ed esterni  
- Presentazioni delle lezioni di aggiornamento sul progetto  
- Documentazione di candidatura e valutazioni dei capitolati  

Questa sezione permette di tenere traccia di tutte le attività e comunicazioni del gruppo durante lo sviluppo del progetto.

---

## 📂 Struttura della repository
La repository è organizzata in cartelle principali per raccogliere la documentazione prodotta e gli strumenti necessari alla generazione del **sito web del progetto**:

- **`scripts/`**: script per automatizzare la generazione e l’aggiornamento dei documenti Typst.  
- **`src/`**: sorgenti principali
  - **`assets/`**: risorse statiche di supporto (immagini, font, ecc.)  
  - **`Candidatura/`**: documenti di questa fase
    - `DocumentazioneEsterna/` → verbali con le aziende  
    - `DocumentazioneInterna/` → verbali del gruppo  
    - `AltriDocumenti/` → Dichiarazione degli impegni, Lettera di presentazione, Valutazione dei capitolati  
  - **`DiariDiBordo/`**: presentazioni usate a lezione per mostrare l’andamento del progetto  
  - **`Glossario/`**: definizioni del dominio del progetto  
  - **`PB/`** (Product Baseline): documenti necessari a questa fase  
  - **`RTB/`** (Requirements and Technology Baseline):
    - `DocumentazioneEsterna/` → verbali esterni, Analisi dei requisiti, Piano di progetto e Piano di qualifica  
    - `DocumentazioneInterna/` → verbali interni, Dichiarazione di Way of Working e Glossario  
- **`config.typ`**: file di configurazione generale per i documenti Typst  
- **`website/`**: file necessari per la generazione del sito web della documentazione  

---

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
