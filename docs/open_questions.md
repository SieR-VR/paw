# Open questions and unresolved decisions

This document records unresolved questions from the design discussion. Keep this list updated as decisions are made.

## Product definition

- Is the controller right-hand only, left-hand only, or mirrored left/right pair?
- Should left and right models be mechanically mirrored or share a symmetric core?
- Is the controller meant to remain attached when the user opens their hand?
- Does it need finger tracking, grip sensing, capacitive touch, or only normal controller inputs?
- What SteamVR device identity is desired: controller, tracker, or custom driver-defined device?
- What are the target applications: VRChat, general SteamVR games, motion capture, custom software, or development hardware?

## Human factors

- Target hand size range is not defined.
- Exact knuckle width is not defined.
- Finger pitch values are not defined.
- Maximum allowed bridge height over the first phalanges is not defined.
- Required skin clearance under the bridge is not defined.
- The first phalanx reference point needs clarification: MCP-to-PIP region, MCP ridge, or another anatomical reference.
- Required finger freedom is not defined.
- Whether gloves are used is not defined.
- Whether the hand grip should be relaxed, clenched, or semi-open is not defined.

## Mechanical structure

- Final fastening method is not defined: strap, ring, handle, glove mount, or hybrid.
- Whether there is a lower palm handle is not finalized.
- Whether the knuckle bridge is a single rigid shell, several small rigid boards, or rigid-flex is not finalized.
- Shell split lines are not defined.
- Screw sizes are not defined.
- Heat-set insert usage is not defined.
- Cable channels are not defined.
- Sensor board replacement strategy is not defined.
- Battery replacement strategy is not defined.
- Drop resistance targets are not defined.
- Water/sweat/dust protection requirements are not defined.

## Tracking geometry

- Exact 24 sensor positions are not finalized.
- Exact sensor normal vectors are not finalized.
- Minimum number of simultaneously visible sensors required by the firmware/solver is not finalized.
- Whether Base Station 1.0 support is required is not decided.
- Whether Base Station 2.0 only is acceptable is not decided.
- Target tracking volume is not defined.
- Target room setup is not defined: 1, 2, 3, or 4 base stations.
- Expected controller poses are not ranked by importance.
- Occlusion caused by the hand, other controller, arms, torso, and props has not been tested.
- Sensor FOV model is currently approximate.
- Sensor aperture diameter and recess depth are not finalized.
- IR window usage is not decided.
- IR window material, transmission, reflection, and scratch behavior are not defined.

## Electronics

- TS4231 + photodiode module dimensions are not known.
- Photodiode part number is not defined.
- Photodiode package height and optical center are not defined.
- RP2350 board arrangement is not defined: one PCB with two MCUs or separate PCBs.
- RP2350-to-RP2350 synchronization method is not defined.
- Timestamp strategy for optical events is not defined.
- IMU model is not defined.
- IMU placement and coordinate transform are not defined.
- Wireless technology is not defined.
- Antenna keep-out and placement are not defined.
- Battery dimensions, capacity, and mass are not defined.
- Charging IC and charge current are not defined.
- USB-C position and retention structure are not defined.
- Debug connector is not defined.
- Haptics are not decided.
- Power budget is not defined.
- Thermal limits are not defined.

## Firmware / software

- Whether the controller uses native SteamVR-compatible lighthouse solving or a custom OpenVR driver path is not decided.
- Sensor hit decoding responsibilities across two RP2350 MCUs are not defined.
- Data transport from MCU to host is not defined.
- SteamVR input profile is not defined.
- Grip pose and aim pose are not defined.
- Calibration storage format is not defined.
- Manufacturing calibration procedure is not defined.
- Per-device sensor position calibration strategy is not defined.

## Manufacturing

- Prototype process is not decided: FDM, SLA, SLS, CNC, or another method.
- Minimum wall thickness is not defined.
- Tolerances are not defined.
- Material is not defined.
- Surface finish is not defined.
- Black/IR-reflective material behavior is not defined.
- Production process is not decided.
- Test jig requirements are not defined.
