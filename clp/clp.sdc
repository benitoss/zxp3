derive_pll_clocks
derive_clock_uncertainty

create_clock -name spiCk -period 41.666 -waveform { 20.8 41.666 } [get_ports spiCk]
create_clock -name clock12 -period 83.333 [get_ports clock12]

set_clock_groups -asynchronous -group [get_clocks spiCk]
set_clock_groups -asynchronous -group [get_clocks pll|altpll_component|auto_generated|pll1|clk[0]]

set_false_path -to   {sync*}
set_false_path -to   {rgb*}
set_false_path -from {tape}
set_false_path -to   {i2s*}
set_false_path -to   {dram*}
set_false_path -to   {led*}

set_false_path -from {spiSs2}
set_false_path -from {spiSs3}
set_false_path -from {spiSsIo}
set_false_path -from {spiMosi}
set_false_path -to   {spiMiso}
