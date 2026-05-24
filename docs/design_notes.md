# Design notes

## Goal

Design a lightweight SteamVR Tracking-style controller with a knuckle-like form factor. The user wants the main visible hardware to sit above the first phalanges of the four non-thumb fingers, while keeping the controller center of mass as close as possible to the center of a clenched fist.

## Product definition

- The product is a **mirrored two-hand controller pair**.
- Perfect mechanical symmetry is a recommendation, not an absolute requirement.
- If practical, the design should separate the tracking module so the same tracking-module design can be reused between left and right hands.
- A physically detachable tracking module is preferred if it does not compromise rigidity, tracking geometry, center of mass, or build complexity too much.
- The preferred detachable-module retention method is a **latch**.
- The detachable tracking module should include the optical sensor modules and the two RP2350 MCUs used for sensor capture.
- The remaining main electronics should live in the palm/fist core where possible: main MCU, IMU, battery, buttons, wireless, charging, and related support electronics.
- The module-to-core connection should use **pogo pins**.
- The controller should remain on the hand when the hand opens, assuming the knuckle form factor and fastening method support this.
- The SteamVR identity should be **controller**.
- The initial target application is **Beat Saber only**.
- A custom/new SteamVR Input profile is preferred.
- Required inputs are minimal:
  - one PCB-trace/electrode-style boolean touch input mapped as the trigger;
  - one system button input.
- Both the boolean trigger/touch input and system button should be reachable by the thumb.
- The system button should sit on the same plane as the touch trigger, arranged side-by-side.
- Not required:
  - finger tracking;
  - grip button;
  - capacitive touch sensing beyond the single boolean touch/trigger input.
- Haptics are desirable if they can be added without unacceptable mass, power, or ergonomic cost.
- Haptic actuator choice should be informed by examples from existing devices before selecting an actuator.
- Sensor placement should intentionally cover a slightly wider range than normal expected use to improve robustness in off-nominal poses.
- The wider tracking range should be quantified by analyzing BeatLeader BSOR replay files if practical.

## Known design constraints from discussion

- The target device is a **controller**, not only a generic tracker.
- The intended optical sensor IC is **TS4231**.
- A pre-order source for TS4231 exists via JLCPCB.
- **TL448K6D-VR is not available**, so the current concept avoids depending on it.
- The tentative electronics architecture uses **two RP2350 MCUs** and their PIO blocks to capture signals from **24 TS4231 channels**.
- The user prefers a **knuckle-like handle**.
- The upper structure should sit above the first phalanges of the index, middle, ring, and pinky fingers.
- The thumb should remain mostly excluded from the upper bridge region, except for thumb-reachable input surfaces/buttons.
- The center of mass should be near the middle of a clenched fist.
- Total mass should be as low as practical.

## Current mechanical/electrical partition

The design is currently split into two main assemblies:

1. **Latch-detachable tracking module**
   - Holds optical sensor modules.
   - Holds the two RP2350 MCUs used for optical capture.
   - Should be as light as possible.
   - Should use a faceted or curved multi-face shape rather than a flat plate.
   - Should preserve sensor position/normal calibration after attachment.
   - Should connect to the palm/fist core via pogo pins.
   - Should remain reusable between left and right controllers if the geometry works for both hands.

2. **Palm/fist core / mass core**
   - Holds heavier components: battery, main MCU, IMU, haptics if retained, USB-C, wireless module, charging/power electronics, and user input PCB.
   - Should be positioned close to the clenched fist center.
   - Should minimize wrist torque and rotational inertia.
   - May need handed shell or fastening differences even if the tracking module is common.
   - Should provide thumb-reachable locations for the boolean trigger/touch input and system button on the same plane.

## Human-factor parameter strategy

Detailed Human Factors decisions are intentionally deferred for now.

The current plan is to use computer vision from hand photos as an **initialization and threshold-setting method**, not as the final authority for ergonomic fit. CV-based hand measurement can provide initial OpenSCAD parameters such as knuckle width, finger spacing, approximate phalanx lengths, and rough thumb input regions.

Final comfort-related and fit-critical parameters should be refined later using physical prototypes. Once a 3D printer is available, those values can be tuned through iterative fitting methods such as binary search or bracketed search. This is especially important for parameters that are difficult to infer reliably from photographs, including clearances, pressure points, bridge height, strap tension, latch feel, and thumb reach comfort.

## Sensor placement concept

The 24 sensors should not be placed on one flat plane. The provisional grouping is:

| Group | Count | Purpose |
|---|---:|---|
| Top ridge | 6 | Visibility from above/front room-scale base stations |
| Front slope | 4 | Forward visibility and saber aiming/swing poses |
| Rear slope | 4 | Visibility when the hand is pulled toward the body |
| Thumb-side side face | 3 | Side visibility without relying on the thumb area |
| Pinky-side side face | 3 | Side visibility during wrist roll |
| Lower/front/rear auxiliary positions | 4 | Backup visibility when the upper bridge is occluded |

This is only an initial layout. Actual hit-rate testing and sensor geometry calibration are still required. Since Beat Saber is the current target, swing poses, wrist roll, crossed arms, hands near the torso, and somewhat wider-than-normal motion coverage should be tested early.

## Motion-analysis direction

BeatLeader BSOR replay files may be used to quantify real Beat Saber controller motion. The desired analysis is to extract controller pose distributions, angular velocity, linear velocity, acceleration, wrist-roll-like orientation changes, crossed-arm/near-torso cases, and high/low swing extremes. Those distributions can then define the sensor coverage margin more objectively than hand-written assumptions.

## OpenSCAD design approach

The initial SCAD model is intentionally a debug model. It should help answer:

- Where is the coordinate origin?
- Where are the hand reference volumes?
- Where are the 24 sensors?
- Which way does each sensor face?
- Does the sensor FOV intersect the shell?
- Where are heavy components located?
- Where is the estimated center of mass?
- Can a common tracking module be shared between left and right controllers?
- Can that common tracking module be latch-detachable while preserving sensor rigidity and calibration?
- Where can thumb-reachable trigger/touch and system-button inputs fit on the same plane?

Later versions can replace placeholders with printable parts, screw bosses, latch geometry, pogo-pin interfaces, cable channels, sensor board pockets, covers, and split lines.
