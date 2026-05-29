from pypdf import PdfReader, PdfWriter
import os

cartella_input = "input"
cartella_output = "output"
pagine_per_file = 20

os.makedirs(cartella_output, exist_ok=True)

pdf_processati = 0

for nome_file in os.listdir(cartella_input):
    
    if nome_file.lower().endswith(".pdf"):
        pdf_processati += 1
        
        input_path = os.path.join(cartella_input, nome_file)
        
        nome_base = os.path.splitext(nome_file)[0] 
        
        reader = PdfReader(input_path)
        totale_pagine = len(reader.pages)

        for i in range(0, totale_pagine, pagine_per_file):
            writer = PdfWriter()

            for j in range(i, min(i + pagine_per_file, totale_pagine)):
                writer.add_page(reader.pages[j])

            numero_parte = i // pagine_per_file + 1
            
            output_filename = f"{nome_base}_parte_{numero_parte}.pdf"
            output_path = os.path.join(cartella_output, output_filename)
            
            with open(output_path, "wb") as output_pdf:
                writer.write(output_pdf)
                
        print(f"  -> Creati {numero_parte} file per {nome_file}.")

if pdf_processati == 0:
    print(f"Nessun file PDF trovato nella cartella '{cartella_input}'.")
else:
    print(f"\nOperazione conclusa! Ho processato {pdf_processati} documento/i.")