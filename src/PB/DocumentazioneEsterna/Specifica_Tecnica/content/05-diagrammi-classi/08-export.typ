/*== Generazione Report <report-generator>
Per realizzare la funzione di generazione del report di valutazione come file scaricabile rispettando i principi dell'architettura esagonale si è deciso di modellare il sistema mettendo in evidenza l'ambito di competenza delle varie classi.


#figure(caption:"Diagramma delle classi - Importazione Modello")[
  #image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/uml/png/Generate_Report.png")
]


Le classi dell'inbound adapter gestiscono l'invio del file dati in uscita usando le funzionalità di Flask.

L'Inbound Port è un'interfaccia funzionale che espone un metodo che accetta come parametri un id del modello su cui eseguire la valutazione e ritorna il file di report generato come una classe della libreria standard

La porta è implementata da un Service che realizza la logica applicativa.

Il service si avvale di una classe di Dominio apposita: reportDTO, questa scelta è stata presa in quanto è stato ritenuto più appropriato l'uso di un oggetto privo di comportamento   durante il processo di importazione ed esportazione

La generazione del file di report è gestita come servizio esterno con una porta dedicata e implementata da una classe esterna, non viene usato un factory in quanto è da supportare la generazione di una solo forma di report. 
*/