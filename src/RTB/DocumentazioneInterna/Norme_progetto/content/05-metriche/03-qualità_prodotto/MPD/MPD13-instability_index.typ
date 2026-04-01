
#import "/src/config.typ":template_dir
#import "config/deps.typ" as deps
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica


#let nome-metrica="Instability Index"

#let dati=(
    codice:deps.get-MPD-code(nome-metrica),
    nome:nome-metrica,
    descrizione-breve:"Misura la resilienza di un modulo al cambiamento.",
    formula:[$
               "Instability index"="Ce" / ("Ce" + "Ca")
             $
             #terms(
              ([$"Ce"$],[Numero di classi esterne da cui il modulo dipende]),
              ([$"Ca"$],[Numero di classi esterne che dipendono dal modulo]),
             )
             ],
    interpretazione:[
      $I arrow 1$: può essere instabile, classe che ha molte dipendenze entranti, poche uscenti

      $I arrow 0$: deve essere stabile, classe che ha poche dipendenze entranti, molte uscenti

      - Valore accettabile: $I >= 0,70 or I <= 0,30$
      - Valore ottimo: $I >= 0,85 or I <= 0,15$
    

      Vanno evitate classi con $I arrow 0,5$, hanno molte dipendenze sia entrati che uscenti, sono un grave rischio nell'aggiornamento del sistema.
    ],
    //Da compilare una volta che si ha qualcosa di concreto da monitorare
    come-calcolo:none,
    accettabile: [$I>= 0.7 $\ $or $ \ $I<=0,30$],
    preferibile: [$I>= 0.85 $\ $or $\ $I<=0,15$],
)


#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)