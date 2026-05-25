
#import "/src/TypstTemplate/PdQ/test-parser/test-json-parser.typ": parse-test-file
#import "/src/TypstTemplate/PdQ/tabella_test.typ": test-table


#test-table(
  prefix: "TI-B_",
  num-padding: 3,

parse-test-file(json("/src/PB/DocumentazioneEsterna/Piano_di_qualifica/content/04-strategie_testing/report/risultati_test.json"),target:"Integrazione",),
  
)