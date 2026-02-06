
#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPC-02",
    nome:"Earned Value",
    descrizione-breve:"Rappresenta il valore del lavoro completato rispetto 
    al budget previsto rispetto al budget totale previsto.
    
    Molto utile per monitorare l'andamento effettivo di progetto",
    formula:[$
  "EV"= "BAC" * "% di lavoro completata"
$
_BAC_ Sta per budget at completion

],
    interpretazione:[
      - Valore accettabile:$>= "PV"*0,75$
      - Valore ottimo:$<= "PV"$
    ],
    come-calcolo:"Si può rappresentare con il totale di ore produttive effettive"


)




