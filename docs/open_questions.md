# Open questions and unresolved decisions

This document records unresolved questions from the design discussion. Keep this list updated as decisions are made.

## Product definition

### Accepted decisions

- The product is intended to be a **mirrored two-hand controller pair**.
- It is recommended, but not mandatory, that the left and right controllers be perfectly mechanically symmetric.
- If feasible, the tracking module should be separable/reusable so that a **common tracking module design** can be used on both hands.
- A **physically detachable tracking module** is preferred if it can be achieved without major penalties to mass, rigidity, sensor geometry, or assembly complexity.
- The detachable tracking module should use a **latch-based retention mechanism**.
- The detachable tracking module should include:
  - optical sensor modules;
  - the two RP2350 MCUs used for optical capture.
- The palm/fist core should include the remaining main electronics where possible:
  - main MCU or host-side controller electronics;
  - IMU;
  - battery;
  - buttons/input surfaces;
  - wireless/power/charging electronics, unless later architecture changes require otherwise.
- Communication between the detachable tracking module and palm/fist core should use **pogo pins**.
- The knuckle-style form factor is expected to remain attached to the hand even when the user opens their hand.
- Finger tracking is **not required**.
- Grip buttons are **not required**.
- Touch sensing beyond one simple boolean touch input is **not required**.
- Required user inputs are currently limited to:
  - one boolean touch input, mapped as the trigger;
  - one system button input.
- The boolean touch/trigger input should be implemented as PCB routing/electrodes where possible.
- The system button should sit on the same plane as the touch trigger, arranged side-by-side.
- The boolean touch/trigger input and system button should be reachable by the thumb.
- In SteamVR, the device should identify as a **controller**.
- A custom/new SteamVR Input profile is preferred over trying to exactly emulate an existing controller layout.
- The target application is currently **Beat Saber only**.
- Haptics are desirable if they can be included without compromising weight, center of mass, or ergonomics.
- Haptic actuator selection should reference examples from other devices before committing to a specific actuator type.
- Sensor placement should cover a range slightly wider than typical expected use so that tracking remains robust outside ordinary hand poses.
- Beat Saber motion coverage should be quantified by parsing **BeatLeader BSOR replay files** if practical.

### Remaining product questions

- What latch geometry is preferred: sliding latch, snap latch, spring latch, push-button release, or another latch style?
- Should the latch be user-serviceable without tools?
- What pogo-pin count, pitch, current rating, and signal assignment are required?
- What should be the exact module boundary between the RP2350 tracking module and palm/fist core?
- Which component owns time synchronization: the tracking module, the palm/fist core MCU, or a shared clock/sync line across pogo pins?
- If a common tracking module is used, where should handedness-specific parts begin: shell only, input cap only, strap only, lower frame, or palm core?
- What should the system button physically be: tactile switch, dome switch, sealed button, or another mechanism?
- How much separation is required between the touch trigger and system button to avoid accidental system-button activation?
- What haptic actuator type should be used after reference-device research: ERM, LRA, voice-coil, piezo, or another actuator?
- What is the acceptable haptic mass and power budget?
- What BSOR dataset should be used for motion analysis: one user, multiple users, expert maps, casual maps, full-body modifiers, or a curated test set?

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

- Final fastening method to the hand is not defined: strap, ring, handle, glove mount, or hybrid.
- Whether there is a lower palm handle is not finalized.
- Whether the knuckle bridge is a single rigid shell, several small rigid boards, or rigid-flex is not finalized.
- The separable/common tracking module concept is latch-based but not yet mechanically defined.
- Detachable tracking-module retention, alignment, electrical connector, and rigidity requirements are not fully defined.
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
- Expected Beat Saber controller poses and swing motions should be quantified from BSOR replay analysis but are not yet measured.
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
- RP2350 board arrangement is now assumed to be inside the detachable tracking module, but exact PCB layout is not defined.
- RP2350-to-RP2350 synchronization method is not defined.
- Timestamp strategy for optical events is not defined.
- Pogo-pin electrical interface between detachable tracking module and palm/fist core is not defined.
- Main MCU part number and role are not defined.
- IMU model is not defined.
- IMU placement and coordinate transform are not defined.
- Wireless technology is not defined.
- Antenna keep-out and placement are not defined.
- Battery dimensions, capacity, and mass are not defined.
- Charging IC and charge current are not defined.
- USB-C position and retention structure are not defined.
- Debug connector is not defined.
- Haptics are desired but implementation is not decided.
- Thumb-reachable PCB-trace touch trigger implementation is not defined.
- Thumb-reachable system button implementation is not defined.
- Power budget is not defined.
- Thermal limits are not defined.

## Firmware / software

- Whether the controller uses native SteamVR-compatible lighthouse solving or a custom OpenVR driver path is not decided.
- Sensor hit decoding responsibilities across two RP2350 MCUs are not defined.
- Data transport from tracking module to palm/fist core over pogo pins is not defined.
- Data transport from device to host is not defined.
- SteamVR input profile is expected to be custom/new, but exact actions and bindings are not defined.
- Exact controller input mapping for Beat Saber is not defined beyond boolean trigger/touch and system button.
- Grip pose and aim pose are not defined.
- Calibration storage format is not defined.
- Manufacturing calibration procedure is not defined.
- Per-device sensor position calibration strategy is not defined.
- BSOR replay parser and motion-analysis tooling are not implemented.

## Manufacturing

- Prototype process is not decided: FDM, SLA, SLS, CNC, or another method.
- Minimum wall thickness is not defined.
- Tolerances are not defined.
- Material is not defined.
- Surface finish is not defined.
- Black/IR-reflective material behavior is not defined.
- Production process is not decided.
- Test jig requirements are not defined.
