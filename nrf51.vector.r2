# forked from generalized cortexm0.vector.r2 and names added from vendor gcc_startup_nrf51.s 
# want a light touch in here, create functions as symbols so aa can find them
# meant to be run possibly multiple times for different addresses like
# . nrf51.vector.r2 @ 0x00018000
# You should set your entry0 to one of the reset handlers you find outside here like
# f entry0 @ sym.reset_handler_0x00018000
# todo check that were arm and 16 bits and maybe something about the address and exit early somehow?

#hack to store incoming address.. not sure how else
y 4

# debatably necessary
Cd 4 48

fs symbols

# store a var of the register were at, if gt 0 then flag it(minus 1 because thumb), increment 4
"(cortexm0.vector.annotate x,?=`pv4`;?+ f sym.$0 @ `??`-1; s+4)"

f VectorTable_`y~[0]`

f initial_sp_`y~[0]`; s+4
.(cortexm0.vector.annotate reset_handler_`y~[0]`)
.(cortexm0.vector.annotate nmi_handler_`y~[0]`)
.(cortexm0.vector.annotate hard_fault_handler_`y~[0]`)
.(cortexm0.vector.annotate mm_fault_handler_`y~[0]`)
.(cortexm0.vector.annotate bus_fault_handler_`y~[0]`)
.(cortexm0.vector.annotate usage_fault_handler_`y~[0]`)
.(cortexm0.vector.annotate reserved_1_address_`y~[0]`)
.(cortexm0.vector.annotate reserved_2_address_`y~[0]`)
.(cortexm0.vector.annotate reserved_3_address_`y~[0]`)
.(cortexm0.vector.annotate reserved_4_address_`y~[0]`)
.(cortexm0.vector.annotate svcall_handler_`y~[0]`)
.(cortexm0.vector.annotate reserved_5_address_`y~[0]`)
.(cortexm0.vector.annotate reserved_6_address_`y~[0]`)
.(cortexm0.vector.annotate pendsv_handler_`y~[0]`)
.(cortexm0.vector.annotate systick_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_power_clock_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_radio_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_uart0_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_spi0_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_spi1_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_5_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_gpiote_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_adc_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_timer0_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_timer1_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_timer2_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_rtc0_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_temp_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_rng_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_ecb_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_ccm_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_wdt_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_rtc1_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_qdec_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_lpcomp_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_swi0_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_swi1_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_swi2_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_swi3_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_swi4_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_swi5_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_26_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_27_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_28_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_29_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_30_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_31_handler_`y~[0]`)


#seek back to where we started
s `y~[0]`

fs *

?e stack top is `pv4`
