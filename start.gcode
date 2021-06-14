; BIQU B1 Start G-code
M117 Starting bed heat up
M140 S{material_bed_temperature_layer_0}      ; Set Heat Bed temperature

M117 Starting extruder heat up
M104 S{material_print_temperature_layer_0}    ; Set Extruder temperature

M117 Waiting for bed to heat up
M190 S{material_bed_temperature_layer_0}      ; Wait for Heat Bed temperature

M117 Homing axes
G28 ; home all axes
G29 L1 ; Load the mesh stored in slot 1
G29 J ; Probe 3 points to tilt mesh

M117 Waiting for extruder to heat up
M109 S{material_print_temperature_layer_0}    ; Wait for Extruder temperature
G92 E0                                        ; Reset Extruder

G1 Z2.0 F3000                    ; Move Z Axis up little to prevent scratching of Heat Bed
G1 X4.1 Y20 Z0.3 F5000.0         ; Move to start position

M117 Purging
G1 X4.1 Y200.0 Z0.3 F1500.0 E15  ; Draw the first line
G1 X4.4 Y200.0 Z0.3 F5000.0      ; Move to side a little
G1 X4.4 Y20 Z0.3 F1500.0 E30     ; Draw the second line
#G92 E0                           ; Reset Extruder

M117 Ready to print
G1 Z2.0 F3000                    ; Move Z Axis up little to prevent scratching of Heat Bed
G1 X5 Y20 Z0.3 F5000.0           ; Move over to prevent blob squish