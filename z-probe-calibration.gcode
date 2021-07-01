; Based on https://www.reddit.com/r/BIGTREETECH/comments/j55rt3/biqub1_firmware_updating_bltouch_guide_a/
M140 S60         ; Heat bed to temperature.
M851 Z0          ; Set Z-offset to zero so new offset can be calculated
G28 Z            ; Home Z-axis.
G1 Z0            ; Move to Z0 position.
M211 S0          ; Disable software endstops. WARNING: From this point on, you can crash the nozzle into the print bed. Be very careful.
; Now, put a piece of paper on the bed under the nozzle.
; Use OctoPrint or pronterface to move the nozzle down in 0.1 mm steps until the nozzle just grips the paper - you should feel a very slight friction.
M114             ; Tells you the Z position. Should be a negative number. Note this down, subtracting the width of the paper (~0.1 mm). E.g. If this returns -2.0, I would use -2.1.
M851 Z<the value you noted down, including the `-`>  ; Sets the Z-offset
M211 S1          ; Re-enable software endstops
M500             ; Write settings to EEPROM (persistent memory - so they're not lost on restart).
G28              ; Home all axes again.
G28 X Y          ; Move to X=0 Y=0, so the printer primes off the bed.
G26              ; Print a single-layer test grid.