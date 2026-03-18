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

#he(body: "Issue per sprint", level: 2) 
#include "MPC/12-issue_per_sprint.typ"

#he(body: "Indice di Gulpease", level: 2)
#include "MPC/06-indice_gulpease.typ"

#he(body: "Budget Progress Bar", level: 2) 
#include "MPC/07-Budget_Progress_Bar.typ"

#he(body: "Time Efficiency", level: 2)
#include "MPC/08-time_efficiency.typ"

#he(body: "Correttezza Ortografica", level: 2)
#include "MPC/11-correttezza_ortografica.typ"


//#he(body: "Test Success Rate", level: 2)
#include "MPC/12-test_success_rate.typ"

//#he(body: "Code Coverage", level: 2)
#include "MPC/13-code_coverage.typ"


//#he(body: "Requisiti Obbligatori Soddisfatti", level: 2)
#include "MPD/01-requisiti_obbligatori_soddifatti.typ"

//#he(body: "Requisiti Desiderabili Soddisfatti", level: 2)
#include "MPD/02-requisiti_desiderabili_soddisfatti.typ"

//#he(body: "Requisiti Opzionali Soddisfatti", level: 2)
#include "MPD/03-requisiti_opzionali_soddifatti.typ"

//#he(body: "Failure Density", level: 2)
#include "MPD/04-failure_density.typ"

//#he(body: "Statement Coverage", level: 2)
#include "MPD/05-statement_coverage.typ"

//#he(body: "Branch Coverage", level: 2)
#include "MPD/06-branch_coverage.typ"

//#he(body: "User Error Rate", level: 2)
#include "MPD/07-user_error_rate.typ"

//#he(body: "Time to Complete Task", level: 2)
#include "MPD/08-time_to_complete_task.typ"

//#he(body: "Response Time", level: 2)
#include "MPD/09-response_time.typ"

//#he(body: "CPU Utilization", level: 2)
#include "MPD/10-CPU_utilization.typ"

//#he(body: "Memory Utilization", level: 2)
#include "MPD/11-memory_utilization.typ"

//#he(body: "Cyclomatic Complexity", level: 2)
#include "MPD/12-cyclomatic_complexity.typ"

//#he(body: "Instability Index", level: 2)
#include "MPD/13-instability_index.typ"

//#he(body: "Coefficient of Couplings", level: 2)
#include "MPD/14-coefficient_of_couplings.typ"

//#he(body: "Code Smell", level: 2)
#include "MPD/15-code_smell.typ"
