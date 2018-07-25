radare-veryfit-id101
=====================

I started this a few years ago but only wrote about it recently in [Paying China to reverse engineer for you](https://citizengadget.com/post/167790047262/paying-china-to-reverse-engineer-for-you)

~~If you googled or dumped the app you might find a [firmware manifest](https://thrivestorage.blob.core.windows.net/gbycmfp7kapezg2ejzhiqttqc/LogCat_mysti_day1.txt?st=2016-09-15T10%3A54%3A00Z&se=2066-09-03T11%3A09%3A00Z&sp=r&sv=2015-04-05&sr=b&sig=QzjIVKi9u4vVpEthTy%2F2x%2BCTBAiJXZsum4%2FFpQp8r7M%3D). Then you might find a [firmware to look at](http://www.youduoyun.com/apps/firmwares/aiju_fw_id101hr_qzj_flash_v28.zip).~~ My links are dead, so youll need to find firmware yourself, or get it off your device. I made a [dumping script](https://gist.github.com/jacobrosenthal/6187c1b822e2f3bbec63bede6a1a0e92) a while back based on the [known cortex-m vulnerability](http://blog.includesecurity.com/2015/11/NordicSemi-ARM-SoC-Firmware-dumping-technique.html).

If you have an app update zip there is a manifest that says `"softdevice_req": [100]`. [Some](https://github.com/NordicSemiconductor/pc-nrfutil/blob/62d1e6c2554dfb5fbeb7d7aa906deb2a9ed67cc8/nordicsemi/__main__.py#L419) [googling](https://github.com/NordicSemiconductor/pc-nrfutil/blob/62d1e6c2554dfb5fbeb7d7aa906deb2a9ed67cc8/nordicsemi/__main__.py#L419) will tell you we have softdevice S110 8.0.0 and theres a standard layout for this very stock nordic vendor code from a few years ago. Note: theyre pushing a secure bootloader nowadays and this isnt the same anymore. The [s110](https://devzone.nordicsemi.com/f/nordic-q-a/1171/how-do-i-access-softdevice-version-string#post-id-3693) document tells us app_code_base should be at 0x00018000 so thats how I knew where to load application.bin.

I left some helper tools to annotate arm cortex m0 stuff in here as well but all you have to do is understand and run `r2 -i application.r2 --` to start poking around.
