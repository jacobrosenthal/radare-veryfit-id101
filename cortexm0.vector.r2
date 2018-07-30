
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
.(cortexm0.vector.annotate irq_0_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_1_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_2_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_3_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_4_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_5_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_6_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_7_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_8_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_9_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_10_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_11_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_12_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_13_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_14_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_15_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_16_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_17_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_18_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_19_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_20_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_21_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_22_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_23_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_24_handler_`y~[0]`)
.(cortexm0.vector.annotate irq_25_handler_`y~[0]`)
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
