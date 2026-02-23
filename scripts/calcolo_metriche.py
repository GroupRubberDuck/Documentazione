#!/bin/bash python3
# Questo script viene utilizzato per generare il codice Typst dei grafici delle metriche del 
# cruscotto di valutazione nel Piano di Qualifica. Leggendo il file Typst per la pianificazione
# degli sprint dell'RTB e' in grado di generare i vari valori richiesti, calcolati come spiegato
# in `src/RTB/DocumentazioneEsterna/Piano_di_qualifica/data/calcolo_valori.md``
import re
import json

tariffario = {
    "Responsabile": 30, 
    "Amministratore": 20, 
    "Analista": 25,
    "Progettista": 25, 
    "Programmatore": 15, 
    "Verificatore": 15
}

def calcola_metriche_sprint(file_sprint: str, bac: int) -> list:
    content = ''
    with open(file_sprint, 'r') as f:
        content = f.read()
        
    blocks = re.findall(r"oreProduttive\s*=\s*\((.*?)\)\n", content, re.DOTALL)
    
    sprints = []
    pv, ev, ac = 0, 0, 0
    for i, block in enumerate(blocks, 1):
        entries = re.findall(r"\((.*?)\)", block)
        
        values = []
        for entry in entries:
            ruolo_match = re.search(r"ruolo:\s*ruoli\.(\w+)", entry).group(1)
            ore_prev_match = re.search(r"orePreviste:\s*(\d+)", entry).group(1)
            ore_eff_match = re.search(r"oreEffettive:\s*(\d+)", entry).group(1)
            
            ore_prev = int(ore_prev_match)
            ore_eff = int(ore_eff_match)
            costo = tariffario[ruolo_match]
            
            pv += ore_prev * costo
            ev += min(ore_prev, ore_eff) * costo
            ac += ore_eff * costo
            
        cpi = ev / ac
        sprints.append({
            'sprint': i,
            'values': {
                'pv': pv,
                'ev': ev,
                'ac': ac,
                'cpi': round(cpi * 1000) / 1000,
                'spi': round(ev / pv * 1000) / 1000,
                'bac': bac,
                'etc': round((bac - ev) / cpi),
                'eac': round(bac / cpi * 1000) / 1000,
            }
        })
        
    return sprints

metriche = calcola_metriche_sprint('src/RTB/DocumentazioneEsterna/Piano_di_Progetto/content/04-pianificazione_breve_periodo/01-RTB.typ', 11610)

labels = '(%s)' % ', '.join(['"Sprint %s"' % m['sprint'] for m in metriche])
print(f'''#grafico-multi-linea(
  (
    x-labels: {labels},
    PV: ({', '.join([str(m['values']['pv']) for m in metriche])}),
    EV: ({', '.join([str(m['values']['ev']) for m in metriche])}),
    series-names: ("PV", "EV"),
  ),
  "Grafico a linee delle metriche EV e PV",
)\n''')

print(f'''#grafico-multi-linea(
  (
    x-labels: {labels},
    ETC: ({', '.join([str(m['values']['etc']) for m in metriche])}),
    AC: ({', '.join([str(m['values']['ac']) for m in metriche])}),
    EAC: ({', '.join([str(m['values']['eac']) for m in metriche])}),
    series-names: ("ETC", "AC", "EAC"),
  ),
  "Grafico a linee delle metriche ETC e AC",
)\n''')


print(f'''#grafico-multi-linea(
  (
    x-labels: {labels},
    CPI: ({', '.join([str(m['values']['cpi']) for m in metriche])}),
    SPI: ({', '.join([str(m['values']['spi']) for m in metriche])}),
    series-names: ("CPI", "SPI"),
  ),
  "Grafico a linee delle metriche CPI e SPI",
)\n''')