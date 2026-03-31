#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica
#import "/src/RTB/DocumentazioneInterna/Norme_progetto/content/05-metriche/02-qualità_processo/MPC/config/deps.typ" as deps



#let nome-metrica="Earned Value"

#let dati=(
    codice:deps.get-MPC-code(nome-metrica),
    nome:nome-metrica,
    descrizione-breve:"Rappresenta il valore del lavoro completato rispetto 
    al budget previsto.
    
    Molto utile per monitorare l'andamento effettivo delle attività di progetto",
    formula:[$
  "EV"= "BAC" * "% di lavoro completata"
$
_BAC_ Sta per budget at completion

],
    interpretazione:[
      - Valore accettabile:$>= "PV"*0,75$
      - Valore ottimo:$>= "PV"$
    ],
    come-calcolo:"Si può rappresentare con il totale di ore produttive effettive",
  accettabile: $>="PV"*0.75$, 
  preferibile: $>="PV"$ 

)


#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)

