import language_tool_python
import os
import glob
import re
import csv
from datetime import datetime

try:
    import pdfplumber
    PDF_SUPPORT = True
except ImportError:
    PDF_SUPPORT = False
    print("⚠️  pdfplumber non installato. Installa con: pip install pdfplumber")

FILES_FISSI = [
    "../../../Analisi_dei_Requisiti/Analisi_dei_requisiti.pdf",
    "../../../Piano_di_Progetto/Piano_di_progetto.pdf",
    "../../Piano_di_qualifica.pdf",
    "../../../..DocumentazioneInterna/Norme_progetto/Norme_progetto.pdf"
]

PATH_VERBALI_INTERNI = r"../../../DocumentazioneInterna/VerbaliInterni/*.pdf"
PATH_VERBALI_ESTERNI = r"C:\Users\User\Desktop\Documentazione\src\RTB\DocumentazioneEsterna\VerbaliEsterni\*.pdf"

CSV_OUTPUT = "12-correttezza_ortografica.csv"
TXT_OUTPUT = "12-elenco_errori.txt"

PAROLE_PERMESSE = {
    # Tecnico / IT
    "software", "hardware", "meeting", "sprint", "typst", "github",
    "scrum", "framework", "database", "backend", "frontend", "stakeholder",
    "milestone", "audit", "briefing", "ticket", "task", "baseline", "repo",
    "mpc", "rtb", "gulpease", "way", "working", "team", "output", "input",
    "test", "testing", "bug", "fix", "commit", "branch", "merge", "pull",
    "request", "issue", "issues", "release", "deploy", "build", "pipeline",
    "log", "login", "logout", "token", "api", "url", "http", "json", "yaml",
    "xml", "csv", "pdf", "config", "setup", "update", "upload", "download",
    "backup", "server", "client", "host", "cloud", "email", "online", "offline",
    "default", "status", "label", "tag", "link", "node", "root", "path", "file",
    "folder", "layout", "template", "style", "font", "color", "size",
    "width", "height", "margin", "padding", "header", "footer", "body",
    "index", "list", "table", "figure", "caption", "title", "subtitle",
    "abstract", "appendix", "glossary", "changelog", "roadmap", "review",
    "feedback", "report", "dashboard", "workflow", "checklist", "backlog",
    "feature", "use", "case", "user", "story", "acceptance", "criteria",
    "mock", "prototype", "wireframe", "diagram", "chart", "graph", "plot",
    "slide", "deck", "banner", "icon", "logo", "avatar", "badge",
    "proof", "concept", "experience", "strict", "doc", "python",
    "layered", "architecture", "decision", "tree", "patch", "major", "minor",
    "png", "src", "show", "heading", "headings", "level", "where", "fill",
    "left", "right", "place", "image", "page", "depth", "outline", "context",
    "pagebreak", "counter", "numbering", "underline", "align", "map",
    "join", "str", "values", "metadata", "datetime", "year", "month",
    "day", "version", "columns", "auto", "ref",
    "let", "set", "import", "text", "lang", "blue", "marker",
    "todo", "bluewind", "getcode", "utilitytable",
    "insertarabicnumberedpages", "insertromannumberedpages",
    "frontpage", "setuppagelayout", "registromodifiche",
    "statustab", "versionnumber", "currentversion", "doctype",
    "giornoriunione", "contatoredecisioni", "contatoetodo",
    "prefisso", "modifiche",
    "bold", "weight", "footnote", "dict", "at", "kind", "horizon",
    "cell", "stroke", "if", "acc", "pad", "supplement", "gutter",
    "target", "inset", "outset", "radius", "clip", "wrap",
    "top", "bottom", "start", "end", "center", "middle", "baseline",
    "read", "write", "open", "close", "run", "eval", "calc",
    "range", "array", "none", "true", "false", "and", "or",
    "not", "in", "return", "for", "while", "break", "continue",
    "white", "title", "caption", "header", "columns", "supplement", "kind",
    "tool", "recap", "vs", "asset", "assets", "pass", "fail",
    "yes", "no", "system", "textbox", "budget", "project",
    "mozilla", "flask", "javascript", "typescript", "telegram",
    "linux", "windows", "safari", "chrome", "angular", "react",
    "control", "mechanism", "access", "requirements", "product",
    "european", "standard", "applicable", "versionate", "plain",
    "of", "the", "to", "is", "are", "was", "were", "be", "been",
    "have", "has", "had", "do", "does", "did", "will", "would",
    "could", "should", "may", "might", "shall", "must", "can",
    "with", "from", "into", "onto", "upon", "within", "without",
    "sommerville", "en", "mvc",
    "parsing", "repository", "authentication", "automated", "verification",
    "technology", "hard", "coded", "cybersecurity", "compliance",
    "trigger", "size", "bold", "headings", "web", "based",
    "front", "end", "back", "not", "applicable", "pass",
    "proof", "concept", "report", "template", "client", "Authenticator", "authenticator"
    # Termini inglesi dominio (EVM, metriche, testing)
    "value", "earned", "planned", "actual", "cost", "estimate", "complete",
    "performance", "index", "schedule", "variance", "completion",
    "success", "rate", "coverage", "failure", "density", "statement",
    "branch", "cyclomatic", "complexity", "instability", "coefficient",
    "couplings", "smell", "smells", "response", "time", "error",
    "utilization", "memory", "cpu", "efficiency", "automiglioramento",
    "progress", "in", "lead", "governance", "pair", "debug",
    "incrementally", "incrementalmente", "best", "practices", "main",
    "actions", "effort", "form", "home", "admin", "authenticator"
    # Nomi propri accademici / proponente
    "vardanega", "cardin", "rubberduck",
    # Estensioni file / formati
    "crt", "csr", "pem", "key", "db", "vers",
    # Termini italiani tecnici non riconosciuti dal dizionario
    "postcondizioni", "sottocasi", "sottocaso", "precondizioni",
    "versionamento", "manutenibile", "ripianificare", "macroblocchi",
    "inaccuratezza", "ripriorizzazione", "automiglioramento",
    "autoallineati", "autoglossario", "autositi", "colleerrori",
    "apdisponibilità", "mantetorare", "progetintrodurre",
    # Nomi propri team
    "bettega", "testolin", "lorenzon", "draghici", "felician",
    "necsulescu", "zappia", "fiorese", "filippo", "guerra",
    "davide", "aldo", "ana", "maria", "tobia", "alessandro", "mario",
    "bluewind", "sommerville",
}

# Regole di FORMATO: maiuscola, punteggiatura
# → accettate solo se contesto NON è Typst
RULE_ID_FORMATO = {
    "UPPERCASE_SENTENCE_START":     "Frase che inizia con lettera minuscola",
    "DOUBLE_PUNCTUATION":           "Punteggiatura doppia",
    "IT_EUFONICO":                  "Uso errato della d eufonica",
}

# Regole ORTOGRAFICHE: vanno ai filtri standard con whitelist
RULE_ID_ORTOGRAFIA = {
    "MORFOLOGIK_RULE_IT_IT": "Probabile errore ortografico",
}

# Tutte le regole con label leggibile (usato da tipo_errore())
RULE_ID_LABEL = {**RULE_ID_FORMATO, **RULE_ID_ORTOGRAFIA}

# Regole da ignorare sempre (spazi, parentesi, punteggiatura posizionale)
RULE_ID_DA_SALTARE = {
    "IT_SIMPLE_REPLACE",
    # Spazi multipli / ripetuti
    "WHITESPACE_RULE",
    "MULTIPLE_SPACES",
    "REPEATED_WHITESPACE_RULE",
    # Spazio prima/dopo punteggiatura (tutti i possibili ID)
    "COMMA_PARENTHESIS_WHITESPACE",
    "SPACE_BEFORE_PUNCTUATION",
    "IT_SPACE_BEFORE_PUNCTUATION",
    "PUNCTUATION_SPACE",
    "SPACE_AFTER_PUNCTUATION_MARK",
    "IT_COLON_SPACE",
    "IT_SEMICOLON_SPACE",
    "COLON_SPACE",
    "SEMICOLON_SPACE",
    "FR_COLON_WHITESPACE",          # a volte LanguageTool usa regole FR su IT
    "COLON_WHITESPACE",
    "SEMICOLON_WHITESPACE",
    # Parentesi e bracket non chiusi
    "IT_UNPAIRED_BRACKETS",
    "UNPAIRED_BRACKETS",
    "UNLIKELY_OPENING_PUNCTUATION",
    # Fine paragrafo / punteggiatura mancante
    "PUNCTUATION_PARAGRAPH_END",
    # Puntini di sospensione (negli indici PDF appaiono come ....)
    "UNPAIRED_BRACKETS",
    "TYPOGRAPHIC_QUOTES",
    "TOO_LONG_SENTENCE",
    "PUNTO_SOSPENSIVO",
    "IT_PUNTO_SOSPENSIVO",
    # Parole ripetute (artefatto PDF da colonne affiancate)
    "ITALIAN_WORD_REPEAT_RULE",
    "WORD_REPEAT_RULE",
    "IT_WORD_REPEAT",
}

PATTERN_CONTESTO_TYPST = re.compile(
    r'#\w+'
    r'|prefisso|contatore'
    r'|\w+\.\w+\('
    r'|template_dir|images_dir'
    r'|persone\.\w+|ruolo\.'
    r'|\blet\b|\bset\b|\bimport\b'
    r'|\bfill\b.*\bblue\b'
    r'|\bstroke\b|\btable\b\s*\('
    r'|stato:\s*,'
    r'|versione:\s*,'
    r'|autori:\s*,'
    r'|verificatori:\s*,'
    r'|uso:\s*,'
    r'|destinatari:\s*,'
    r'|major:\s*[,\s]'
    r'|minor:\s*[,\s]'
    r'|patch:\s*[,\s]'
    r'|header:\s*,'
    r'|columns:\s*[,\*]'
    r'|kind:\s*,'
    r'|supplement:\s*'
    r'|\[\s*_Sprint'
    r'|\[\s*_Tutti'
    r'|\.push\b|\.at\b'
    r'|acc\.'
    r'|figure\.where'
    r'|converte dizionario'
    r'|\],\s*\[\s*'
    r'|\],\s*\)'
    r'|\[\s*-\s*\]'
    r'|\[\s*VE\.'
    r'|//converte'
    r'|//\s*#\)'
    r'|\)\s*\]\s*\)'         # pattern ) ] ) tipico fine tabelle verbali
    r'|AUM-\]'               # riferimento AUM nei doc
    r'|\bsec-\w+'            # ancora sec- labels
    r'|\*Ora\s+\w+\*'        # campi *Ora inizio* / *Ora fine* nei verbali
    r'|\*\w[\w\s]*\*\s*:'    # qualsiasi campo bold seguito da : nei verbali
)

def è_formalismo_typst(parola: str) -> bool:
    patterns = [
        r'^#\w+', r'^@\w+', r'^\w+\(',
        r'^[A-Z]{2,}$', r'^\d+[\.\d]*$', r'^v\d+',
        r'.*[_\-/\\].*', r'^[a-z]+[A-Z]', r'.*\d+.*',
        r'^[A-Z][a-z]+[A-Z]',
    ]
    return any(re.match(p, parola) for p in patterns)

def è_parola_inglese(parola: str) -> bool:
    pattern_inglesi = [
        r'.*th$', r'^th.*', r'.*ck$',
        r'.*sh\w*', r'.*wh\w*', r'.*ph\w*', r'.*wr\w*',
        r'.*[aeiou]{0,1}y$', r'.*ing$', r'.*tion$',
        r'.*ness$', r'.*ment$', r'.*ble$', r'.*ly$',
        r'.*er$', r'.*ed$', r'.*ism$', r'.*ist$',
        r'.*ize$', r'.*ise$', r'.*ful$', r'.*less$',
        r'.*ward$', r'.*ware$', r'.*work$',
    ]
    return any(re.match(p, parola.lower()) for p in pattern_inglesi)

def leggi_testo(percorso: str) -> str:
    """Legge il testo da un file .pdf o .typ/.txt."""
    ext = os.path.splitext(percorso)[1].lower()
    if ext == ".pdf":
        if not PDF_SUPPORT:
            raise ImportError("pdfplumber non installato. Esegui: pip install pdfplumber")
        testo_pagine = []
        with pdfplumber.open(percorso) as pdf:
            for pagina in pdf.pages:
                testo = pagina.extract_text()
                if testo:
                    testo_pagine.append(testo)
        return "\n".join(testo_pagine)
    else:
        with open(percorso, "r", encoding="utf-8") as f:
            return f.read()

def pulisci_testo_pdf(testo: str) -> str:
    """Pulisce il testo estratto da PDF: rimuove sillabazione, puntini indice, artefatti."""
    # Rimuovi trattino di sillabazione soft (U+00AD) e ricongiunge la parola
    testo = re.sub(u'\u00ad\\s*\n\\s*', '', testo)
    testo = re.sub(u'\u00ad', '', testo)
    # Ricongiunge parole spezzate con trattino esplicito a fine riga
    testo = re.sub(r'-\s*\n\s*([a-z\xe0-\xff])', r'\1', testo)
    # Rimuove righe che sono solo puntini (indici/sommari: "..... 9")
    testo = re.sub(r'\.{4,}[^\n]*', '', testo)
    # Rimuove sequenze di sole cifre (numeri di pagina isolati)
    testo = re.sub(r'^\s*\d+\s*$', '', testo, flags=re.MULTILINE)
    # Rimuove token isolati di 1-3 char che sono residui di sillabazione da tabelle
    # (es. "nente." "vono" "dex" "sk" "gle" "ra" che appaiono da soli su riga)
    testo = re.sub(r'^\s*[a-z\xe0-\xff]{1,5}\.?\s*$', '', testo, flags=re.MULTILINE|re.IGNORECASE)
    # Rimuove righe vuote multiple
    testo = re.sub(r'\n{3,}', '\n\n', testo)
    return testo


def pulisci_testo_typst(testo: str) -> str:
    testo = re.sub(r'```[\s\S]*?```', '', testo)
    testo = re.sub(r'`[^`]*`', '', testo)
    testo = re.sub(r'^\s*#.*$', '', testo, flags=re.MULTILINE)
    testo = re.sub(r'@\w+', '', testo)
    testo = re.sub(r'"[^"]*\.[a-z]{2,4}"', '', testo)
    testo = re.sub(r'\b[a-z]+(?:[A-Z][a-z]*)+\b', '', testo)
    testo = re.sub(r'\b[A-Z][a-z]+(?:[A-Z][a-z]*)+\b', '', testo)
    testo = re.sub(r'\b\d+[\d\.]*\b', '', testo)
    testo = re.sub(r'"[^"]*"', '', testo)
    testo = re.sub(r'\([^)]*\)', '', testo)
    testo = re.sub(r'\[#[^\]]*\]', '', testo)
    testo = re.sub(r'^\s*[,\[\]\s]+$', '', testo, flags=re.MULTILINE)
    testo = re.sub(r'\b\w+\s*:\s*,', '', testo)
    testo = re.sub(r'//.*$', '', testo, flags=re.MULTILINE)
    return testo

def è_parola_permessa(parola_originale: str) -> bool:
    """Controlla se una parola (o qualsiasi sua parte) è in whitelist."""
    parti = re.findall(r"[a-zA-ZàèéìòùÀÈÉÌÒÙ]+", parola_originale)
    for parte in parti:
        p = parte.lower()
        if p in PAROLE_PERMESSE:
            return True
        if è_formalismo_typst(parte):
            return True
        if è_parola_inglese(p):
            return True
        if parte.isupper() and len(parte) >= 2:
            return True
    return False

def filtra_errori(matches):
    errori_finali = []
    for m in matches:

        # DEBUG: stampa rule_id per errori di spazio/punteggiatura non ancora filtrati
        if any(x in m.message for x in ["spazio", "punto e virgola", "due punti", "virgola"]):
            if m.rule_id not in RULE_ID_DA_SALTARE:
                print(f"  [DEBUG rule_id non filtrato] id={m.rule_id!r} msg={m.message!r}")

        # 1. Salta sempre
        if m.rule_id in RULE_ID_DA_SALTARE:
            continue

        # 2. Regole di FORMATO (maiuscola, punteggiatura, eufonica)
        #    → accetta solo se il contesto NON è Typst
        if m.rule_id in RULE_ID_FORMATO:
            if not PATTERN_CONTESTO_TYPST.search(m.context):
                errori_finali.append(m)
            continue

        # 2b. Catch-all: salta qualsiasi errore di spazio prima/dopo punteggiatura
        #     (copre tutti i possibili rule ID di LanguageTool per questo tipo)
        if any(x in m.message.lower() for x in [
            "spazio prima", "spazio dopo", "inserire lo spazio",
            "non inserire", "spazio prima del punto", "spazio prima dei due"
        ]):
            continue

        # 3. Regole ORTOGRAFICHE (MORFOLOGIK) e qualsiasi altra regola
        #    → passa per whitelist e filtri
        parola = m.matched_text

        # Salta se la parola (o le sue parti) è in whitelist
        if è_parola_permessa(parola):
            continue

        # Salta formalismi Typst interi (es. sec-intro, web-based con trattino)
        if è_formalismo_typst(parola):
            continue

        errori_finali.append(m)

    return errori_finali

def tipo_errore(m) -> str:
    return RULE_ID_LABEL.get(m.rule_id, "Errore ortografico")

print("Inizializzazione LanguageTool...")
tool = language_tool_python.LanguageTool('it-IT')

def analizza():
    data_log = datetime.now().strftime("%Y-%m-%d %H:%M")
    files = [f for f in FILES_FISSI if os.path.exists(f)]
    files.extend(glob.glob(PATH_VERBALI_INTERNI))
    files.extend(glob.glob(PATH_VERBALI_ESTERNI))

    risultati = []
    print(f"\n--- Inizio analisi su {len(files)} documenti ---\n")

    for percorso in files:
        nome_file = os.path.basename(percorso)
        try:
            testo_raw = leggi_testo(percorso)
            # Per i PDF il testo è già pulito; pulisci_testo_typst è no-op su testo piano
            testo = pulisci_testo_typst(testo_raw) if percorso.endswith(('.typ', '.txt')) else pulisci_testo_pdf(testo_raw)
            matches = tool.check(testo)
            errori_finali = filtra_errori(matches)
            parole_segnalate = [
                m.matched_text.lower().strip(".,;:()[]{}<>\"'")
                for m in errori_finali
            ]

            n_errori = len(errori_finali)
            n_parole = len(testo_raw.split())
            indice = max(0, 100 - (n_errori / n_parole * 100)) if n_parole > 0 else 100

            print(f"✅ {nome_file.ljust(30)} | Errori: {str(n_errori).ljust(4)} | Qualità: {round(indice, 2)}%")
            if 0 < n_errori < 15:
                print(f"   👉 Esempi trovati: {list(set(parole_segnalate))[:10]}")

            risultati.append([data_log, nome_file, n_errori, f"{round(indice, 2)}%"])

        except Exception as e:
            print(f"❌ Errore su {nome_file}: {e}")

    file_nuovo = not os.path.exists(CSV_OUTPUT)
    with open(CSV_OUTPUT, "a", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        if file_nuovo:
            writer.writerow(["Data", "Documento", "Numero_Errori", "Indice_Correttezza"])
        writer.writerows(risultati)

def elenca_errori():
    files = [f for f in FILES_FISSI if os.path.exists(f)]
    files.extend(glob.glob(PATH_VERBALI_INTERNI))
    files.extend(glob.glob(PATH_VERBALI_ESTERNI))

    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M")
    righe = []
    righe.append(f"REPORT ERRORI ORTOGRAFICI - {timestamp}\n")
    righe.append(f"Analisi su {len(files)} documenti\n")
    righe.append("=" * 60 + "\n")

    totale_globale = 0

    for percorso in files:
        nome_file = os.path.basename(percorso)
        try:
            testo_raw = leggi_testo(percorso)
            # Per i PDF il testo è già pulito; pulisci_testo_typst è no-op su testo piano
            testo = pulisci_testo_typst(testo_raw) if percorso.endswith(('.typ', '.txt')) else pulisci_testo_pdf(testo_raw)
            matches = tool.check(testo)
            errori_finali = filtra_errori(matches)
            totale_globale += len(errori_finali)

            righe.append(f"\n{'=' * 60}\n")
            righe.append(f" ERRORI TROVATI IN: {nome_file} ({len(errori_finali)} errori)\n")
            righe.append(f"{'=' * 60}\n")

            if not errori_finali:
                righe.append("  ✅ Nessun errore rilevato.\n")
            else:
                for i, m in enumerate(errori_finali, 1):
                    righe.append(f"\n  [{i}] Tipo:        {tipo_errore(m)}\n")
                    righe.append(f"       Parola:      '{m.matched_text}'\n")
                    righe.append(f"       Motivazione: {m.message}\n")
                    righe.append(f"       Contesto:    ...{m.context}...\n")

        except Exception as e:
            righe.append(f"\n❌ Errore su {nome_file}: {e}\n")

    righe.append(f"\n{'=' * 60}\n")
    righe.append(f" TOTALE ERRORI SU TUTTI I DOCUMENTI: {totale_globale}\n")
    righe.append(f"{'=' * 60}\n")

    with open(TXT_OUTPUT, "w", encoding="utf-8") as f:
        f.writelines(righe)

    print(f"\n📄 Report salvato in: {os.path.abspath(TXT_OUTPUT)}")
    print(f"   Totale errori trovati: {totale_globale}")

if __name__ == "__main__":
    print("Scegli modalità:")
    print("  1 - Analisi rapida + salvataggio CSV")
    print("  2 - Elenco dettagliato errori → file TXT")
    scelta = input("Scelta (1/2): ").strip()

    if scelta == "1":
        analizza()
        print(f"\n📊 Dati salvati in {os.path.abspath(CSV_OUTPUT)}")
    elif scelta == "2":
        elenca_errori()
    else:
        print("Scelta non valida.")