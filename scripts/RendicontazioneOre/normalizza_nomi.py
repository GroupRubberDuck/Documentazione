import sys
import re

replacements = [
    (r'aldobettega-unipd|aldobettega', 'Aldo'),
    (r'DraghiciAnaMaria|Ana Maria Draghici|AnaMariadraghici', 'Ana'),
    (r'FelicianNek', 'Felix'),
    (r'genos36|D-lore-unipd', 'Lorenzon'),
    (r'unluckypippo', 'Filippo'),
    (r'davbios', 'Testolin'),
    (r'_No response_|_No, response_', ''),
]

filename = sys.argv[1]

with open(filename, 'r') as f:
    content = f.read()

for pattern, replacement in replacements:
    content = re.sub(pattern, replacement, content, flags=re.IGNORECASE)

with open(filename, 'w') as f:
    f.write(content)