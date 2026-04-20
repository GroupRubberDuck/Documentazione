#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# usa il commando: python update_glossario.py --typ "C:\Users\User\Desktop\Documentazione\src\RTB\DocumentazioneInterna\dizionario.typ" --html "C:\Users\User\Desktop\Documentazione\glossario.html"
"""
update_glossario.py
-------------------
Legge dizionario.typ (dict + abbr) e li UNISCE ai termini già presenti
in glossario.html. I termini del .typ sovrascrivono quelli esistenti
con lo stesso nome; quelli già nel glossario ma non nel .typ vengono mantenuti.

Uso:
    python update_glossario.py --typ PATH_TYP --html PATH_HTML
"""

import re
import argparse
from pathlib import Path


# ── parser Typst dict ────────────────────────────────────────────────────────

def parse_typst_dict(source: str, var_name: str) -> dict[str, str]:
    pattern = re.compile(rf'#let\s+{re.escape(var_name)}\s*=\s*\(', re.DOTALL)
    m = pattern.search(source)
    if not m:
        raise ValueError(f"Variabile '{var_name}' non trovata nel file .typ")

    start = m.end()
    depth, i = 1, start
    while i < len(source) and depth > 0:
        if source[i] == '(':
            depth += 1
        elif source[i] == ')':
            depth -= 1
        i += 1
    block = source[start:i - 1]

    result = {}
    entry_re = re.compile(
        r'(?:"([^"]+)"|([A-Za-z][A-Za-z0-9_-]*))\s*:\s*(\[[^\]]*\]|"[^"]*")',
        re.DOTALL
    )
    for em in entry_re.finditer(block):
        key = (em.group(1) or em.group(2)).strip()
        raw_val = em.group(3).strip()

        if raw_val.startswith('['):
            # Prova a estrarre stringhe tra virgolette
            strings = re.findall(r'"([^"]*)"', raw_val)
            if strings:
                value = ' '.join(s.strip() for s in strings if s.strip())
            else:
                # Testo grezzo nel content block Typst
                inner = raw_val[1:-1]
                inner = re.sub(r'\s*-\s+', ' ', inner)
                inner = re.sub(r'\s+', ' ', inner).strip()
                value = inner
        else:
            value = raw_val.strip('"').strip()

        if value:
            result[key] = value
    return result


# ── parser Typst abbr ────────────────────────────────────────────────────────

def parse_typst_abbr(source: str, var_name: str = 'abbr') -> dict[str, str]:
    pattern = re.compile(rf'#let\s+{re.escape(var_name)}\s*=\s*\(', re.DOTALL)
    m = pattern.search(source)
    if not m:
        raise ValueError(f"Variabile '{var_name}' non trovata nel file .typ")

    start = m.end()
    depth, i = 1, start
    while i < len(source) and depth > 0:
        if source[i] == '(':
            depth += 1
        elif source[i] == ')':
            depth -= 1
        i += 1
    block = source[start:i - 1]

    result = {}
    entry_re = re.compile(r'"?([A-Za-z][A-Za-z0-9]*)"?\s*:\s*"([^"]*)"')
    for em in entry_re.finditer(block):
        result[em.group(1).strip()] = em.group(2).strip()
    return result


# ── parser termini esistenti dall'HTML ──────────────────────────────────────

def parse_existing_terms(html: str) -> list[dict]:
    pattern = re.compile(r'const terms\s*=\s*\[(.*?)\];', re.DOTALL)
    m = pattern.search(html)
    if not m:
        return []

    block = m.group(1)
    existing = []
    obj_re = re.compile(r'\{([^}]+)\}')
    for om in obj_re.finditer(block):
        obj_str = om.group(1)
        term_m = re.search(r'term:\s*"((?:[^"\\]|\\.)*)"', obj_str)
        def_m  = re.search(r'def:\s*"((?:[^"\\]|\\.)*)"', obj_str)
        abbr_m = re.search(r'abbr:\s*(true|false)', obj_str)
        if term_m and def_m:
            existing.append({
                'term': term_m.group(1),
                'def':  def_m.group(1),
                'abbr': abbr_m.group(1) == 'true' if abbr_m else False
            })
    return existing


# ── merge ────────────────────────────────────────────────────────────────────

def merge_terms(
    existing: list[dict],
    terms_dict: dict[str, str],
    abbr_dict: dict[str, str]
) -> list[dict]:
    # Indicizza esistenti (case-insensitive)
    merged: dict[str, dict] = {}
    for t in existing:
        merged[t['term'].lower()] = {
            'term': t['term'],
            'def':  t['def'],
            'abbr': t['abbr']
        }

    # Aggiungi/sovrascrivi con termini dal dict Typst
    for term, definition in terms_dict.items():
        key = term.lower()
        merged[key] = {
            'term': term,
            'def':  definition,
            'abbr': merged.get(key, {}).get('abbr', False)
        }

    # Aggiungi/sovrascrivi con abbreviazioni dal abbr Typst
    for sigla, expansion in abbr_dict.items():
        key = sigla.lower()
        merged[key] = {
            'term': sigla,
            'def':  expansion,
            'abbr': True
        }

    result = list(merged.values())
    result.sort(key=lambda x: x['term'].lower())
    return result


# ── genera blocco JS ─────────────────────────────────────────────────────────

def generate_js_block(terms: list[dict]) -> str:
    lines = ['const terms = [']
    for t in terms:
        term_esc = t['term'].replace('\\', '\\\\').replace('"', '\\"')
        def_esc  = t['def'].replace('\\', '\\\\').replace('"', '\\"')
        if t['abbr']:
            lines.append(f'  {{ term: "{term_esc}", def: "{def_esc}", abbr: true }},')
        else:
            lines.append(f'  {{ term: "{term_esc}", def: "{def_esc}" }},')
    lines.append('];')
    return '\n'.join(lines)


# ── iniezione HTML ────────────────────────────────────────────────────────────

def inject_into_html(html: str, js_block: str) -> str:
    pattern = re.compile(r'const terms\s*=\s*\[.*?\];', re.DOTALL)
    if not pattern.search(html):
        raise ValueError("Blocco 'const terms = [...]' non trovato in glossario.html")
    return pattern.sub(js_block, html, count=1)


# ── main ──────────────────────────────────────────────────────────────────────

def main():
    parser = argparse.ArgumentParser(description='Aggiorna glossario.html da dizionario.typ')
    parser.add_argument('--typ',  required=True, help='Percorso al file .typ')
    parser.add_argument('--html', required=True, help='Percorso al file HTML')
    args = parser.parse_args()

    typ_path  = Path(args.typ)
    html_path = Path(args.html)

    if not typ_path.exists():
        raise FileNotFoundError(f"File Typst non trovato: {typ_path}")
    if not html_path.exists():
        raise FileNotFoundError(f"File HTML non trovato: {html_path}")

    print(f"📖  Lettura {typ_path} …")
    source = typ_path.read_text(encoding='utf-8')

    print("🔍  Parsing dizionario termini …")
    terms_dict = parse_typst_dict(source, 'dict')
    print(f"    → {len(terms_dict)} termini trovati")

    print("🔍  Parsing abbreviazioni …")
    abbr_dict = parse_typst_abbr(source, 'abbr')
    print(f"    → {len(abbr_dict)} abbreviazioni trovate")

    print(f"📖  Lettura {html_path} …")
    html = html_path.read_text(encoding='utf-8')

    print("🔍  Parsing termini esistenti nel glossario …")
    existing = parse_existing_terms(html)
    print(f"    → {len(existing)} termini esistenti nel glossario")

    print("🔀  Merge in corso …")
    merged = merge_terms(existing, terms_dict, abbr_dict)

    js_block = generate_js_block(merged)

    print(f"💉  Iniezione in {html_path} …")
    html_updated = inject_into_html(html, js_block)
    html_path.write_text(html_updated, encoding='utf-8')

    print(f"\n✅  Fatto!")
    print(f"    • Termini dal .typ:          {len(terms_dict)}")
    print(f"    • Abbreviazioni dal .typ:    {len(abbr_dict)}")
    print(f"    • Termini già nel glossario: {len(existing)}")
    print(f"    • Totale voci finali:        {len(merged)}")


if __name__ == '__main__':
    main()