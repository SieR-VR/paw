# Electronics requirements draft

## Architecture assumption

The current concept uses:

- 24 TS4231 + photodiode optical channels.
- 2 RP2350 MCUs.
- RP2350 PIO blocks to capture optical timing signals.
- IMU for inertial data.
- Battery-powered wireless controller electronics.
- Minimal inputs: one thumb-reachable boolean trigger/touch input and one thumb-reachable system button.
- Haptics if feasible within mass, power, and packaging constraints.

This is an assumption for mechanical layout only. Electrical feasibility must be separately validated.

## Major unknowns

### TS4231 sensor modules

- Exact TS4231 board size.
- Photodiode package and optical center.
- Required decoupling and passive components.
- Board thickness.
- Whether modules are individual rigid PCBs, a flex assembly, or rigid-flex.
- Wire/flex exit direction.
- Connector or soldering method.
- Whether sensor modules are part of a detachable common tracking module.

### RP2350 electronics

- Whether the two RP2350s are on one PCB or two.
- Which MCU receives which sensor channels.
- Timing synchronization strategy between MCUs.
- Shared clock, sync line, or timestamp reconciliation method.
- USB/wireless data path.
- Firmware update path.
- Whether MCUs live in the detachable tracking module or in the palm/fist core.

### IMU

- IMU part number.
- Required sample rate.
- Placement restrictions.
- Transform from IMU coordinate frame to controller frame.
- Thermal and vibration considerations.
- Whether the IMU should be part of the detachable tracking module so optical and inertial calibration remain bundled.

### Wireless and power

- Wireless module and antenna type.
- Antenna keep-out volume.
- Battery chemistry, capacity, mass, and size.
- Charger IC and thermal limits.
- USB-C placement.
- Power budget for 24 optical channels, two MCUs, IMU, wireless, and haptics.
- Electrical interface across a detachable tracking-module boundary, if used.

### Haptics and inputs

- Haptics are desirable if they can be included without unacceptable mass or power cost.
- Haptic motor type is not defined: ERM, LRA, voice-coil, piezo, or another actuator.
- Haptic driver requirements are not defined.
- Haptic placement should remain near the fist/palm core if possible.
- Boolean trigger/touch input mechanism is not defined.
- System button switch type is not defined.
- Thumb-reachable input PCB and cable routing are not yet defined.
- Input placement must minimize accidental presses and avoid thumb occlusion of important sensors.

## Mechanical implications

Heavy components should remain in the palm/fist core:

- Battery.
- Main PCB.
- RP2350s, unless bundling them with a detachable tracking module proves necessary.
- Haptic actuator.
- USB-C reinforcement.

The upper bridge should carry only lightweight optical sensor modules and routing where possible.

If the tracking module is detachable, the electrical/mechanical boundary should be chosen to preserve calibration, keep mass low, and avoid fragile connectors in high-stress areas.
