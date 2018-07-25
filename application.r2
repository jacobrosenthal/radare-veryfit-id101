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

# load our file at 0x18000 from googling the manifests softdevice_req 100
on application.bin 0x18000 r-x

# label supersection
omn 0x18000 app

# I made a thing to label nrf51 vectors
. nrf51.vector.r2 @ 0x00018000

# I made a thing that brings in nrf51 register names
. nrf51.flags.r2

# Show offsets in disasm prefixed with section/map name Default is false
e asm.section.sub = true

# label some stuff
on malloc://0x2000 0x20000000 rwx
omn 0x20000000 softdevice_ram

# hardcoding from the nrf51.vector.r2 script
on malloc://0xAA0 0x20007560 rwx
omn 0x20007560 stack_dummy

on malloc://0x80000 0x40000000 rw-
omn 0x40000000 io

on malloc://0x80000 0x50000000 rw-
omn 0x50000000 gpio

on malloc://0x100000 0xe0000000 rw-
omn 0xe0000000 cortex

# initialize esil vm for the app
# todo dont hardcode these somehow
# NOTE hardcoded to the app @ 0x18000 for stack top 0x20007560
# do I need to set esil.stack.x if I give the values directly to aeim?
e esil.stack.addr = 0x20002000
e esil.stack.size = 0x5560
aeim 0x20002000 0x5560 app_ram

# NOTE hardcoded to the app @ 0x18000
# analyze exectuble sections and continue analysis after each function
aac @e:anal.hasnext=true @e:search.in=io.maps.exec @ 0x18000

# find values referencing a specific section or map, why doesnt he run this?
aav

# print IO maps
om=

?E Maybe check out one of the functions in the app memory space, s fcn.00018200 and VV and then =

#show top functions
# afl | sort -r -k2 | head -n10
