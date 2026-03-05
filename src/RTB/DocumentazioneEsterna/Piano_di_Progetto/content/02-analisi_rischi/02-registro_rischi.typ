#import "/src/config.typ": template_dir
#import template_dir + "/utilityTable.typ": getCode
#import template_dir + "/PdP/tabellaRischi.typ": tabellaRischiTecnologici
#import template_dir + "/PdP/tabellaRischi.typ": tabellaRischiPersonali
#import template_dir + "/PdP/tabellaRischi.typ": tabellaRischiOrganizzativi

==== Rischi tecnologici
#let contatoreR = counter("rischi tec")
#contatoreR.update(1)
#let prefisso = "R.T."

//tabella sotto solo come esempio
#tabellaRischiTecnologici(
  codice: getCode(prefisso: prefisso, contatore: contatoreR),
  nome: "Comprensione errata della norma EN 18031",
  tipo: "Rischio di prodotto",
  descrizione: [La norma EN 18031 su cui si basa il progetto potrebbe essere interpretata in modo errato o incompleto dal team, portando allo sviluppo di funzionalità non conformi agli standard richiesti.],
  prevenzione: [La prevenzione richiede di dedicare tempo sufficiente allo studio approfondito della norma EN 18031 prima dell'inizio dello sviluppo, organizzando sessioni di analisi collettiva con tutto il team per condividere e allineare le interpretazioni.],
  mitigazione: [Nel caso si sospetti un'interpretazione errata, è essenziale effettuare immediatamente un controllo di conformità per limitare il lavoro da rifare. Sarà necessario rivedere sistematicamente tutte le componenti sviluppate sulla base dell'interpretazione errata e ripianificare le attività allocando tempo per le correzioni necessarie.],
  frequenza: "Media",
  pericolo: "Alta",
)

#tabellaRischiTecnologici(
  codice: getCode(prefisso: prefisso, contatore: contatoreR),
  nome: "Inesperienza con le tecnologie",
  tipo: "Rischio di progetto + Rischio di prodotto",
  descrizione: [L’utilizzo di tecnologie nuove o poco conosciute può rallentare significativamente il progetto, poiché richiede tempo per lo studio e la sperimentazione.],
  prevenzione: [Per prevenirlo si prevedono momenti iniziali di studio e la creazione di piccoli prototipi per acquisire familiarità. Il team può inoltre condividere materiali o esperienze per velocizzare l’apprendimento.],
  mitigazione: [Se la mancanza di conoscenza diventa un ostacolo, si potrebbe ricorre al supporto del team di Bluewind oppure scegliere soluzioni tecniche più semplici. Questo permetterebbe di evitare blocchi prolungati e mantenere una buona produttività.],
  frequenza: "Alta",
  pericolo: "Alta",
)

#tabellaRischiTecnologici(
  codice: getCode(prefisso: prefisso, contatore: contatoreR),
  nome: "Rischio tecnologico legato a errori nel codice",
  tipo: "Rischio di prodotto + Rischio di progetto",
  descrizione: [Rischio di malfunzionamenti o comportamenti inattesi dovuti a errori nel codice, come bug, logica errata o implementazioni incomplete. Questi problemi possono compromettere la funzionalità del software, rallentare lo sviluppo e aumentare i costi di correzione.],
  prevenzione: [Applicare pratiche di sviluppo sicuro e standardizzate, come code review, pair programming, test automatici e analisi statica del codice. Seguire linee guida per la scrittura di codice pulito, modulare e manutenibile. ],
  mitigazione: [In caso di errori critici, individuare rapidamente la causa tramite debug collaborativo e strumenti di tracciamento dei bug. Ripristinare versioni stabili se necessario e pianificare correzioni incrementalmente per ridurre l'impatto sul progetto complessivo.],
  frequenza: "Media",
  pericolo: "Alta",
)

==== Rischi personali

#let contatoreP = counter("rischi personali")
#contatoreP.update(1)
#let prefisso = "R.P."
#contatoreR.update(1)

#tabellaRischiPersonali(
  codice: getCode(prefisso: prefisso, contatore: contatoreR),
  nome: "Disponibilità variabile per impegni imprevisti",
  tipo: "Rischio di progetto",
  descrizione: [La disponibilità di un membro del team può ridursi improvvisamente a causa di eventi non pianificabili, come problemi di salute, emergenze personali o imprevisti esterni. Tali situazioni sono per natura imprevedibili e possono interrompere bruscamente la continuità del lavoro.],
  prevenzione: [Non essendo possibile anticipare questi eventi, è fondamentale mantenere una documentazione aggiornata e una comunicazione interna costante, così che ogni membro sia sempre al corrente dello stato dei lavori e possa subentrare rapidamente in caso di necessità.],
  mitigazione: [Quando un membro si rende improvvisamente indisponibile, le attività vengono riassegnate temporaneamente agli altri componenti del team. La documentazione continua garantisce che chi subentra possa riprendere il lavoro senza perdite significative di tempo.],
  frequenza: "Media",
  pericolo: "Elevata",
)


#tabellaRischiPersonali(
  codice: getCode(prefisso: prefisso, contatore: contatoreR),
  nome: "Disponibilità variabile per impegni pianificati",
  tipo: "Rischio di progetto",
  descrizione: [La disponibilità di un membro del team può ridursi in modo prevedibile a causa di impegni noti in anticipo, come scadenze accademiche, sessioni d'esame, periodi lavorativi intensi o altri impegni personali già programmati. Pur essendo anticipabili, questi periodi possono sovrapporsi alle attività di progetto se non gestiti con sufficiente anticipo.],
  prevenzione: [È importante che ogni membro comunichi per tempo i propri periodi di minore disponibilità, così da poter adeguare la pianificazione delle attività, evitare sovrapposizioni critiche e distribuire il carico di lavoro in modo equilibrato nelle settimane precedenti.],
  mitigazione: [Se nonostante la pianificazione un membro non riesce a rispettare le scadenze concordate, è possibile ridistribuire temporaneamente alcune attività, rivedere le priorità del periodo o fornire supporto collaborativo per limitare i rallentamenti nello sviluppo del progetto.],
  frequenza: "Media",
  pericolo: "Elevata",
)



==== Rischi organizzativi
#let contatoreO = counter("rischi organizzativi")
#contatoreO.update(1)
#let prefisso = "R.O."
#contatoreR.update(1)

#tabellaRischiOrganizzativi(
  codice: getCode(prefisso: prefisso, contatore: contatoreR),
  nome: " Pianificazione iniziale errata o ottimistica",
  tipo: "Rischio di progetto",
  descrizione: [Rischio organizzativo legato all'inesperienza nella stima delle attività o alla sottovalutazione della complessità reale del progetto, con conseguente rischio di pianificazioni irrealistiche e difficoltà nel rispettare scadenze e carichi di lavoro.],
  prevenzione: [Per prevenire questo rischio è utile scomporre il lavoro in task più piccoli e facilmente stimabili, verificare periodicamente la correttezza delle stime tramite confronti interni e condurre un’analisi approfondita all'inizio di ogni sprint per individuare tempestivamente possibili criticità. Inoltre, mantenere un adeguato margine di sicurezza nelle tempistiche consente di gestire eventuali imprevisti senza compromettere il piano complessivo.],
  mitigazione: [Se emergono problemi dovuti a stime non accurate, il piano viene riesaminato e ricalibrato, ridefinendo priorità, ridistribuendo responsabilità e riorganizzando le attività critiche. All’occorrenza, può essere previsto tempo aggiuntivo per garantire la continuità e la sostenibilità del progetto.],
  frequenza: "Alta",
  pericolo: "Media",
)

#tabellaRischiOrganizzativi(
  codice: getCode(prefisso: prefisso, contatore: contatoreR),
  nome: "Sovrastima delle attività",
  tipo: "Rischio di progetto",
  descrizione: [Rischio legato alla sovrastima della complessità di uno o più task, con la conseguente possibilità che un membro del team rimanga inattivo o sottoutilizzato. ],
  prevenzione: [Per prevenire questo rischio è utile confrontare le stime con esperienze passate, o consolidarle tramite il contributo di più membri del team. Un processo di revisione collettiva delle valutazioni aiuta a ridurre scostamenti significativi. Inoltre, aggiornare le stime man mano che emergono nuove informazioni consente un migliore allineamento temporale.],
  mitigazione: [In caso di sovrastima, il team segnala tempestivamente la situazione e riorganizza il lavoro, assegnando nuove attività disponibili ai membri coinvolti per mantenere un flusso operativo costante ed evitare periodi di inattività.],
  frequenza: "Media",
  pericolo: "Bassa",
)
#tabellaRischiOrganizzativi(
  codice: getCode(prefisso: prefisso, contatore: contatoreR),
  nome: "Mancanza di comunicazione e collaborazione",
  tipo: "Rischio di progetto",
  descrizione: [Rischio legato a una comunicazione inefficace o alla mancata condivisione delle informazioni, che può portare a compiti non assegnati chiaramente, sovrapposizioni nel lavoro o task non coperti.],
  prevenzione: [È fondamentale definire momenti ricorrenti di confronto e utilizzare in modo rigoroso il canale di comunicazione stabilito, ovvero GitHub. Una chiara struttura per la condivisione degli aggiornamenti riduce la dispersione delle informazioni e garantisce maggiore coordinamento tra i membri del team.],
  mitigazione: [Quando emergono segnali di scarsa comunicazione, è utile organizzare tempestivamente incontri di allineamento per ristabilire una visione comune. La documentazione viene aggiornata e resa facilmente accessibile per favorire trasparenza e continuità operativa.],
  frequenza: "Media",
  pericolo: "Alta",
)

#tabellaRischiOrganizzativi(
  codice: getCode(prefisso: prefisso, contatore: contatoreR),
  nome: "Utilizzo inefficace degli strumenti di coordinamento",
  tipo: "Rischio di progetto",
  descrizione: [Rischio legato a un uso disordinato o incoerente degli strumenti di coordinamento — come GitHub, Discord o Drive — che può generare confusione nei file, difficoltà nel tracciamento delle attività e conflitti nella gestione del codice. L’assenza di metodi condivisi favorisce rapidamente il caos organizzativo.],
  prevenzione: [Per prevenire il rischio è essenziale stabilire linee guida e standard comuni per l’utilizzo degli strumenti, come convenzioni di naming e strutture chiare delle cartelle. Formalizzare queste pratiche nelle Norme di Progetto garantisce uniformità e ordine, favorendo un ambiente di lavoro strutturato e comprensibile per tutti.],
  mitigazione: [Se emergono inefficienze, è utile procedere a una riorganizzazione dei repository e dei documenti, eliminando duplicati o materiali obsoleti. I membri che mostrano difficoltà vengono supportati tramite chiarimenti o formazione mirata, così da ristabilire un utilizzo corretto degli strumenti.],
  frequenza: "Bassa",
  pericolo: "Media",
)







