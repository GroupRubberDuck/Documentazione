#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica
#import "/src/PB/DocumentazioneInterna/Norme_progetto/content/05-metriche/02-qualità_processo/MPC/config/deps.typ" as deps



#let nome-metrica="Planned Value"

#let dati=(
    codice:deps.get-MPC-code(nome-metrica),
    nome:nome-metrica,
    descrizione-breve:"Rappresenta il valore del lavoro che avrebbe dovuto essere completato entro una certa data, secondo il piano di progetto approvato.",
    formula:[$
  "PV"= "BAC" * "% di lavoro pianificata"
$
_BAC_ Sta per budget at completion

],
    interpretazione:[
      - Valore accettabile:$>= 0$
      - Valore ottimo:$<= "BAC"$

      Il Planned Value funge da punto di riferimento e indica qual è il valore monetario che si prevede di raggiungere entro una certa data. 
      
      Fornisce un termine di paragone col valore effettivo prodotto
    ],
    come-calcolo:"Si può rappresentare con il totale di ore produttive previste",

  accettabile: $>=0$, 
  preferibile: $<="BAC"$


)


#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)
