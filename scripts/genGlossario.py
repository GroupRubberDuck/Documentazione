#!/bin/python3
# Accetta json output di `typst query` da stdin e lo trasforma nel glossario HTML
import re
import json
import fileinput

# Estrae il testo dall'oggetto ritornato da `typst query`.
# Supporta text, sequence, item, smartquote e space.
def extract_text(el):
    result = ''
    if el['func'] == 'text':
        result = el['text']
    elif el['func'] == 'sequence':
        for eel in el['children']:
            text = extract_text(eel)
            if text != None:
                result += text
    elif el['func'] == 'item':
        result = '<li>' + extract_text(el['body']) + '</li>'
    elif el['func'] == 'smartquote':
        result = '\''
    else:
        result = None

    return result

def main():
    st_data = json.loads(fileinput.input().readline())
    print("""<html class="scroll-smooth">

<head>
  <meta charset="UTF-8">
  <meta lang="it">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description"
    content="Gruppo RubberDuck, progetto di Ingegneria del Software, Università di Padova, A.A. 2025-2026 ">
  <title>RubberDuck</title>
  <link rel="icon" href="website/images/logo.png" type="image/x-icon">
  <link href="website/style.css" rel="stylesheet">
</head>

<body class="bg-container text-white" onload="loaded()">
<h1 class="title-glossario">Glossario</h1>
<section class="glossario">
<dl>""")
    letter = ''
    for key in sorted(st_data.keys()):
        if letter != key[0].upper():
            letter = key[0].upper()
            print('\t<h2>%s</h2>' % letter)
        print('\t<dt>%s</dt>' % key)
        text = extract_text(st_data[key])

        list_start = text.find('<li>')
        if list_start >= 0:
          list_end = text.rfind('</li>') + 5
          text = text[:list_start] + '<ul>' + text[list_start:list_end] + '</ul>' + text[list_end:]
        print('\t<dd>%s</dd>' % text)
    print("""</dl>
    </section>
    <footer class="bg-primary text-secondary">
    <div class="flex justify-between p-6">
      <div class="mb-6 md:mb-0">
          <a href="https://grouprubberduck.github.io/Documentazione/" class="flex items-center">
            <img src="website/images/logo.png" class="h-8 me-3" alt="RubberDuck" />
            <span class="self-center text-2xl font-semibold whitespace-nowrap">RubberDuck</span>
          </a>
        </div>
        <span class="text-sm sm:text-center text-secondary">
          <a href="https://grouprubberduck.github.io/Dcoumentazione/" class="hover:underline">RubberDuck</a> &copy;
          Copyright - All Rights Reserved.
        </span>
      </div>
  </footer>
    </body>
</html>""")

if __name__ == '__main__':
    main()