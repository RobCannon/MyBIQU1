M502            ; Reset settings to configuration defaults...
M500            ; ...and Save to EEPROM. Use this on a new install.
M501            ; Read back in the saved EEPROM.

M190 S60        ; Not required, but having the printer at temperature helps accuracy. (IMO this one is quite important - the bed expands when heated.)
M104 S160       ; Not required, but having the printer at temperature helps accuracy. (Personally I don't see how the nozzle temperature would affect ABL.)

G28             ; Home XYZ. The Z homing should happen last - the nozzle moves
                ; to the centre of the bed and deploys twice.
                ; If this doesn't happen and the Z-min endstop switch is used,
                ; the firmware is incorrectly configured or not updated.
G29 P1          ; Do automated probing of the bed.
G29 P3 T        ; Interpolates the mesh points that couldn't be probed
                ; because the probe can't reach them.

G29 T           ; View the Z compensation values.
G29 S1          ; Save UBL mesh points to EEPROM.
                ; At this point, if you're using OctoPrint,
                ; you can see the mesh using the Bed Visualizer plugin.
G29 F 10.0      ; Set Fade Height for correction at 10.0 mm.
                ; When the printer reaches the Fade Height, it stops
                ; compensating for the unevenness of the bed.
G29 A           ; Activate the UBL System.
M500            ; Save current setup. WARNING: UBL will be active at power up, before any [`G28`](/docs/gcode/G028.html).