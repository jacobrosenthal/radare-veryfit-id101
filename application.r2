# r2 -i application.r2 --
# based mainly on this talk https://novom.ru/en/watch/oXSx0Qo2Upk
# https://rada.re/get/r2snow.pdf
# http://radare.org/get/r2snow.zip and load.r2 in here

# configure the CPU for the project
e asm.arch = arm
e asm.cpu = cortex
e asm.bits = 16

# we dont have the softdevice etc, but that stuff starts at 0x0
e bin.baddr = 0x0

# note all on and om commands are 'in order' so the priority ends up stacking correctly
on malloc://0x100000 0xe0000000 rw-
omn 0xe0000000 cortex

on malloc://0x80000 0x50000000 rw-
omn 0x50000000 gpio

on malloc://0x80000 0x40000000 rw-
omn 0x40000000 io

on malloc://0xAA0 0x20007560 rwx
omn 0x20007560 stack_dummy

on malloc://0x2000 0x20000000 rwx
omn 0x20000000 softdevice_ram

# found these lying around, including
on uicr-sizecorrected.bin 0x10001000 r--
omn 0x10001000 uicr

on ficr-sizecorrected.bin 0x10000000 r--
omn 0x10000000 ficr

# empty sections for stuff were missing
on malloc://0x5000 0x3B000 r-x
omn 0x3B000 boot

on application.bin 0x00018000 r-x
omn 0x00018000 app

on malloc://0x17000 0x1000 r-x
omn 0x1000 softdevice

on malloc://0x1000 0x0 r-x
omn 0x0 mbr

# Show offsets in disasm prefixed with section/map name Default is false
e asm.section.sub = true

# I made a thing that brings in nrf51 register names
. nrf51.flags.r2

# I made a thing to label nrf51 vector functions
. nrf51.vector.r2 @ 0x00018000

# that script created this function, lets make it our entry0
f entry0 @ sym.reset_handler_0x00018000

# initialize esil vm for the app
# TODO do I need to set esil.stack.x if I give the values directly to aeim?
e esil.stack.addr = 0x20002000
e esil.stack.size = 0x5560
aeim 0x20002000 0x5560 app_ram

# lets run manual aaa manually with sweeteners.. we get better aar and I dont like aan
aa

# find values referencing a specific section or map
aav

# flag function calls without performing a complete analysis
aac @e:anal.hasnext=true @e:search.in=io.maps.exec @ entry0

# find strings
aar @e:anal.strings=true

# types
afta

# print IO maps
om=

?E Maybe check out one of these functions?

#show top functions
afl | sort -r -k2 | head -n10
