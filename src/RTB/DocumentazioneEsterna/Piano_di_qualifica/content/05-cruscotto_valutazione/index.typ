#import "/src/config.typ":template_dir,he, slugify


#he(body:"Planned Value",level:2)
#include "MPC/01-planned_value.typ"

#he(body:"Earned Value",level:2)
#include "MPC/02-earned_value.typ"

#he(body:"Actual Cost",level:2)
#include "MPC/03-actual_cost.typ"

#he(body:"Schedule Performance Index",level:2)
#include "MPC/04-schedule_performance_index.typ" 

#he(body:"Cost Performance Index",level:2)
#include "MPC/05-cost_performance_index.typ"

#he(body:"Estimate at Completion",level:2)
#include "MPC/06-estimate_at_completion.typ" 

#he(body:"to Complete Performance Index",level:2)
#include "MPC/07-to_complete_performance_index.typ" 

#he(body:"Estimate to Complete",level:2)
#include "MPC/08-estimate_to_complete.typ"

#he(body:"Requirements Stability",level:2)
#include "MPC/09-requirements_stability.typ"

#he(body:"Requirements Coverage",level:2)
#include "MPC/10-requirements_coverage.typ" 

#he(body:"Indice di Gulpease",level:2)
#include "MPC/11-indice_gulpease.typ"

#he(body:"Correttezza Ortografica",level:2)
#include "MPC/12-correttezza_ortografica.typ" 

#he(body:"Test Success Rate",level:2)
#include "MPC/13-test_success_rate.typ" 

#he(body:"Code Coverage",level:2)
#include "MPC/14-code_coverage.typ" 

#he(body:"Process Lead Time",level:2)
#include "MPC/15-process_lead_time.typ" 

#he(body:"Task Completion on Time",level:2)
#include "MPC/16-task_completion_on_time.typ"

#he(body:"Requisiti Obbligatori Soddisfatti",level:2)
#include "MPD/01-requisiti_obbligatori_soddifatti.typ" 

#he(body:"Requisiti Opzionali Soddisfatti",level:2)
#include "MPD/02-requisiti_opzionali_soddifatti.typ" 

#he(body:"Requisiti Desiderabili Soddisfatti",level:2)
#include "MPD/03-requisiti_desiderabili_soddisfatti.typ" 

#he(body:"Failure Density",level:2)
#include "MPD/04-failure_density.typ" 

#he(body:"Statement Coverage",level:2)
#include "MPD/05-statement_coverage.typ" 

#he(body:"Branch Coverage",level:2)
#include "MPD/06-branch_coverage.typ" 

#he(body:"User Error Rate",level:2)
#include "MPD/07-user_error_rate.typ" 

#he(body:"Time to Complete Task",level:2)
#include "MPD/08-time_to_complete_task.typ" 

#he(body:"Response Time",level:2)
#include "MPD/09-response_time.typ" 

#he(body:"CPU Utilization",level:2)
#include "MPD/10-CPU_utilization.typ" 

#he(body:"Memory Utilization",level:2)
#include "MPD/11-memory_utilization.typ" 

#he(body:"Cyclomatic Complexity",level:2)
#include "MPD/12-cyclomatic_complexity.typ" 

#he(body:"Modularity Index",level:2)
#include "MPD/13-modularity_index.typ" 

#he(body:"Coefficient of Couplings",level:2)
#include "MPD/14-coefficient_of_couplings.typ" 

#he(body:"Code Smell",level:2)
#include "MPD/15-code_smell.typ"