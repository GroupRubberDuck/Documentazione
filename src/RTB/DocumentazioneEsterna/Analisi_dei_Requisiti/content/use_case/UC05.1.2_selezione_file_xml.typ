#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Selezione file xml"
#let depth=3
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
         + L'utente ha selezionato la funzione di importazione file dal dispositivo.
        + L'utente ha selezionato un file .xml.],
    
    pre-condizioni:[
    - Il formato .xml è supportato dal sistema 
    - L'utente si trova nella sezione di inserimento file],
    
    post-condizioni:[
        - Il file .xml è stato correttamente selezionato e caricato nel sistema.],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
