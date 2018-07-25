# pip install -U cmsis-svd
# python3 nrf51.py >> nrf51.flags.r2

from cmsis_svd.parser import SVDParser

parser = SVDParser.for_packaged_svd('Nordic', 'nrf51.svd')
for peripheral in parser.get_device().peripherals:
    print("f %s = 0x%08x" % (peripheral.name, peripheral.base_address))
    for register in peripheral.registers:
        print("f %s.%s = 0x%08x" % (peripheral.name, register.name, peripheral.base_address+register.address_offset))
	