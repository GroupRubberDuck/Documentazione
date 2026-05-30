#import "/src/config.typ": he, slugify, template_dir


#he(body: "Planned Value (PL) e Earned Value (EV) e Actual COST (AC) ", level: 2)
#include "MPC/01-pv_vs_ev_vs_ac.typ"

#he(body: "Indici di Performance: CPI e SPI", level: 2)
#include "MPC/02-cpi_vs_spi.typ"

#he(body: "Estimate at Completion", level: 2)
#include "MPC/03-estimate_at_completion.typ"

#he(body: "To Complete Performance Index", level: 2)
#include "MPC/04-to_complete_performance_index.typ"

#he(body: "Estimate to Complete", level: 2)
#include "MPC/05-estimate_to_complete.typ"

#he(body: "Indice di Gulpease", level: 2)
#include "MPC/06-indice_gulpease.typ"

#he(body: "Budget Progress Bar", level: 2) 
#include "MPC/07-Budget_Progress_Bar.typ"

#he(body: "Time Efficiency", level: 2)
#include "MPC/08-time_efficiency.typ"

#he(body: "Correttezza Ortografica", level: 2)
#include "MPC/11-correttezza_ortografica.typ"


#he(body: "Test Success Rate", level: 2)
#include "MPD/0-test_success.typ"

#he(body: "Requisiti soddisfatti", level: 2)
#include "MPD/01-requisiti_sodifatti.typ"

#he(body: "Failure Density", level: 2)
#include "MPD/04-failure_density.typ"

#he(body: "Statement Coverage", level: 2)
#include "MPD/05-statement_coverage.typ"

#he(body: "Branch Coverage", level: 2)
#include "MPD/06-branch_coverage.typ"

#he(body: "Efficienza", level: 2)
#include "MPD/07-efficienza.typ"

#he(body: "Cyclomatic Complexity", level: 2)
#include "MPD/12-cyclomatic_complexity.typ"

#he(body: "Code Smell", level: 2)
#include "MPD/15-code_smell.typ"
