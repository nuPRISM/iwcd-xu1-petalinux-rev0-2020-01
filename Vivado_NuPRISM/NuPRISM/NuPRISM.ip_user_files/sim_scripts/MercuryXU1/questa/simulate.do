onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib MercuryXU1_opt

do {wave.do}

view wave
view structure
view signals

do {MercuryXU1.udo}

run -all

quit -force
