# Open questions and unresolved decisions

This document records unresolved questions from the design discussion. Keep this list updated as decisions are made.

## Product definition

### Accepted decisions

- The product is intended to be a **mirrored two-hand controller pair**.
- It is recommended, but not mandatory, that the left and right controllers be perfectly mechanically symmetric.
- If feasible, the tracking module should be separable/reusable so that a **common tracking module design** can be used on both hands.
- A **physically detachable tracking module** is preferred if it can be achieved without major penalties to mass, rigidity, sensor geometry, or assembly complexity.
- The knuckle-style form factor is expected to remain attached to the hand even when the user opens their hand.
- Finger tracking is **not required**.
- Grip buttons are **not required**.
- Touch sensing beyond one simple boolean touch input is **not required**.
- Required user inputs are currently limited to:
  - one boolean touch input, mapped as the trigger;
  - one system button input.
- The boolean touch/trigger input and system button should be reachable by the thumb.
- In SteamVR, the device should identify as a **controller**.
- A custom/new SteamVR Input profile is preferred over trying to exactly emulate an existing controller layout.
- The target application is currently **Beat Saber only**.
- Haptics are desirable if they can be included without compromising weight, center of mass, or ergonomics.
- Sensor placement should cover a range slightly wider than typical expected use so that tracking remains robust outside ordinary hand poses.

### Remaining product questions

- What exact detachable tracking-module interface is preferred: mechanical latch, screws, magnets plus locating pins, or another method?
- Should the detachable module include only optical sensors, or should it also include IMU, MCUs, wireless, and battery?
- If a common tracking module is used, where should handedness-specific parts begin: shell only, input cap only, strap only, lower frame, or palm core?
- What should the boolean touch/trigger input physically be: momentary switch, capacitive touch pad, force sensor, optical touch, or another mechanism?
- What should the system button physically look like and where should it be placed to avoid accidental presses while remaining thumb-reachable?
- What haptic actuator type should be used if haptics are retained: ERM, LRA, voice-coil, piezo, or another actuator?
- What is the acceptable haptic mass and power budget?

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
- Thumb reach envelope for trigger/touch and system button is not defined.

## Mechanical structure

- Final fastening method is not defined: strap, ring, handle, glove mount, or hybrid.
- Whether there is a lower palm handle is not finalized.
- Whether the knuckle bridge is a single rigid shell, several small rigid boards, or rigid-flex is not finalized.
- The separable/common tracking module concept is not yet mechanically defined.
- Detachable tracking-module retention, alignment, electrical connector, and rigidity requirements are not defined.
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
- Expected Beat Saber controller poses and swing motions are not yet ranked or modeled.
- The extra tracking margin beyond ordinary use poses is not quantified.
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
- Haptics are desired but implementation is not decided.
- Thumb-reachable boolean trigger/touch input implementation is not defined.
- Thumb-reachable system button implementation is not defined.
- Power budget is not defined.
- Thermal limits are not defined.

## Firmware / software

- Whether the controller uses native SteamVR-compatible lighthouse solving or a custom OpenVR driver path is not decided.
- Sensor hit decoding responsibilities across two RP2350 MCUs are not defined.
- Data transport from MCU to host is not defined.
- SteamVR input profile is expected to be custom/new, but exact actions and bindings are not defined.
- Exact controller input mapping for Beat Saber is not defined beyond boolean trigger/touch and system button.
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
