# Electronics requirements draft

## Architecture assumption

The current concept uses:

- 24 TS4231 + photodiode optical channels.
- 2 RP2350 MCUs.
- RP2350 PIO blocks to capture optical timing signals.
- IMU for inertial data.
- Battery-powered wireless controller electronics.

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

### RP2350 electronics

- Whether the two RP2350s are on one PCB or two.
- Which MCU receives which sensor channels.
- Timing synchronization strategy between MCUs.
- Shared clock, sync line, or timestamp reconciliation method.
- USB/wireless data path.
- Firmware update path.

### IMU

- IMU part number.
- Required sample rate.
- Placement restrictions.
- Transform from IMU coordinate frame to controller frame.
- Thermal and vibration considerations.

### Wireless and power

- Wireless module and antenna type.
- Antenna keep-out volume.
- Battery chemistry, capacity, mass, and size.
- Charger IC and thermal limits.
- USB-C placement.
- Power budget for 24 optical channels, two MCUs, IMU, wireless, and haptics.

### Haptics and inputs

- Haptic motor type and mass.
- Trigger, buttons, joystick, or touch inputs are not yet modeled.
- Input PCB and cable routing are not yet defined.

## Mechanical implications

Heavy components should remain in the palm/fist core:

- Battery.
- Main PCB.
- RP2350s.
- Haptic actuator.
- USB-C reinforcement.

The upper bridge should carry only lightweight optical sensor modules and routing where possible.
