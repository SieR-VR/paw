# Electronics requirements draft

## Architecture assumption

The current concept uses:

- 24 TS4231 + photodiode optical channels.
- A latch-detachable tracking module containing:
  - optical sensor modules;
  - 2 RP2350 MCUs for optical timing capture.
- A palm/fist core containing:
  - main MCU or controller-side host electronics;
  - IMU;
  - battery;
  - wireless and power/charging electronics;
  - inputs;
  - haptics if retained.
- Pogo pins for communication and power between the detachable tracking module and palm/fist core.
- Minimal inputs: one thumb-reachable PCB-trace/electrode boolean trigger/touch input and one thumb-reachable system button on the same plane.
- Haptics if feasible within mass, power, and packaging constraints.

This is an assumption for mechanical layout only. Electrical feasibility must be separately validated.

## Module partition

### Detachable tracking module

Expected contents:

- TS4231 + photodiode channels.
- Local sensor routing.
- Two RP2350 MCUs.
- Required local decoupling and support passives.
- Pogo-pin pads or mating contacts.
- Optional module ID / calibration memory, if detachable calibration management requires it.

Expected responsibilities:

- Capture optical timing close to the sensors.
- Provide timestamped or preprocessed optical data to the palm/fist core.
- Preserve sensor calibration across detach/reattach cycles as much as possible.

### Palm/fist core

Expected contents:

- Main MCU or higher-level controller electronics.
- IMU.
- Battery.
- Charger and power regulation.
- Wireless module and antenna.
- USB-C/debug as required.
- Thumb input PCB for trigger/touch and system button.
- Haptic actuator and driver if retained.

Expected responsibilities:

- Fuse/route tracking-module data with IMU data, depending on final architecture.
- Manage wireless or USB communication to host.
- Manage inputs, haptics, battery, and power.

## Major unknowns

### TS4231 sensor modules

- Exact TS4231 board size.
- Photodiode package and optical center.
- Required decoupling and passive components.
- Board thickness.
- Whether modules are individual rigid PCBs, a flex assembly, or rigid-flex.
- Wire/flex exit direction.
- Connector or soldering method.
- Exact integration method into the latch-detachable tracking module.

### RP2350 electronics

- Whether the two RP2350s are on one tracking-module PCB or separate tracking-module PCBs.
- Which MCU receives which sensor channels.
- Timing synchronization strategy between MCUs.
- Shared clock, sync line, or timestamp reconciliation method.
- Data protocol over the pogo-pin interface.
- Firmware update path for RP2350s inside the detachable module.
- Whether the tracking module needs local flash, EEPROM, or another calibration/identity device.

### Pogo-pin interface

- Pin count is not defined.
- Pin pitch and physical orientation are not defined.
- Required current rating is not defined.
- Signal voltage levels are not defined.
- Power sequencing is not defined.
- Hot-plug behavior is not defined.
- Mechanical wipe/contact reliability is not defined.
- ESD protection is not defined.
- Candidate signals may include power, ground, reset, boot, SWD/debug, sync/clock, UART/SPI/USB, interrupt, and module detect.

### IMU

- IMU part number.
- Required sample rate.
- Placement restrictions.
- Transform from IMU coordinate frame to controller frame.
- Thermal and vibration considerations.
- Since the IMU is currently assigned to the palm/fist core, the transform between the detachable tracking module and core must be repeatable enough for optical+inertial calibration.

### Wireless and power

- Wireless module and antenna type.
- Antenna keep-out volume.
- Battery chemistry, capacity, mass, and size.
- Charger IC and thermal limits.
- USB-C placement.
- Power budget for 24 optical channels, two RP2350s, IMU, main MCU, wireless, and haptics.
- Electrical interface across the pogo-pin boundary.

### Haptics and inputs

- Haptics are desirable if they can be included without unacceptable mass or power cost.
- Haptic actuator selection should reference examples from other devices before selecting a part.
- Haptic motor type is not defined: ERM, LRA, voice-coil, piezo, or another actuator.
- Haptic driver requirements are not defined.
- Haptic placement should remain near the fist/palm core if possible.
- Boolean trigger/touch input should be PCB-trace/electrode-based where possible.
- System button sits on the same plane as the trigger/touch input.
- System button switch type is not defined.
- Thumb-reachable input PCB and cable routing are not yet defined.
- Input placement must minimize accidental presses and avoid thumb occlusion of important sensors.

## Mechanical implications

Heavy components should remain in the palm/fist core:

- Battery.
- Main MCU / main PCB.
- IMU.
- Haptic actuator.
- USB-C reinforcement.

The upper tracking module should carry optical sensor modules, the two RP2350s, and required local support electronics.

The pogo-pin boundary should be chosen to preserve calibration, keep mass low, and avoid fragile connectors in high-stress areas.
