import collections

# 1. Definisci i tuoi dati grezzi (qui puoi incollare i dati estratti dai vari sprint)
# Formato: (persona, ruolo, ore_previste, ore_effettive)
dati_grezzi = [
    ("ALDO", "Amministratore", 2, 2),
    ("ANA", "Programmatore", 12, 12),
    ("ALDO", "Amministratore", 1, 3), # Esempio di riga successiva da sommare
    # ... aggiungi qui tutti gli altri record ...
]

# 2. Crea un dizionario per accumulare le somme
somme = collections.defaultdict(lambda: {"previste": 0, "effettive": 0})

for persona, ruolo, previste, effettive in dati_grezzi:
    somme[(persona, ruolo)]["previste"] += previste
    somme[(persona, ruolo)]["effettive"] += effettive

# 3. Genera l'output formattato per Typst
print("oreProduttive: (")
for (persona, ruolo), ore in somme.items():
    print(f"  (persona: persone.{persona}, ruolo: ruoli.{ruolo}, orePreviste: {ore['previste']}, oreEffettive: {ore['effettive']}),")
print(")")