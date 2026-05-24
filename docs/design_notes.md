# Design notes

## Goal

Design a lightweight SteamVR Tracking-style controller with a knuckle-like form factor. The user wants the main visible hardware to sit above the first phalanges of the four non-thumb fingers, while keeping the controller center of mass as close as possible to the center of a clenched fist.

## Known design constraints from discussion

- The target device is a **controller**, not only a generic tracker.
- The intended optical sensor IC is **TS4231**.
- A pre-order source for TS4231 exists via JLCPCB.
- **TL448K6D-VR is not available**, so the current concept avoids depending on it.
- The tentative electronics architecture uses **two RP2350 MCUs** and their PIO blocks to capture signals from **24 TS4231 channels**.
- The user prefers a **knuckle-like handle**.
- The upper structure should sit above the first phalanges of the index, middle, ring, and pinky fingers.
- The thumb should remain mostly excluded from the upper bridge region.
- The center of mass should be near the middle of a clenched fist.
- Total mass should be as low as practical.

## Current mechanical concept

The design should be separated into two functional regions:

1. **Upper knuckle bridge / sensor crown**
   - Holds optical sensor modules.
   - Should be as light as possible.
   - Should not contain battery or other heavy components unless later proven necessary.
   - Should use a faceted or curved multi-face shape rather than a flat plate.

2. **Palm/fist core / mass core**
   - Holds heavier components: battery, main PCB, RP2350s, IMU, haptics, USB-C, wireless module.
   - Should be positioned close to the clenched fist center.
   - Should minimize wrist torque and rotational inertia.

## Sensor placement concept

The 24 sensors should not be placed on one flat plane. The provisional grouping is:

| Group | Count | Purpose |
|---|---:|---|
| Top ridge | 6 | Visibility from above/front room-scale base stations |
| Front slope | 4 | Pointing/aiming poses, forward visibility |
| Rear slope | 4 | Visibility when the hand is pulled toward the body |
| Thumb-side side face | 3 | Side visibility without relying on the thumb area |
| Pinky-side side face | 3 | Side visibility during wrist roll |
| Lower/front/rear auxiliary positions | 4 | Backup visibility when the upper bridge is occluded |

This is only an initial layout. Actual hit-rate testing and sensor geometry calibration are still required.

## OpenSCAD design approach

The initial SCAD model is intentionally a debug model. It should help answer:

- Where is the coordinate origin?
- Where are the hand reference volumes?
- Where are the 24 sensors?
- Which way does each sensor face?
- Does the sensor FOV intersect the shell?
- Where are heavy components located?
- Where is the estimated center of mass?

Later versions can replace placeholders with printable parts, screw bosses, cable channels, sensor board pockets, covers, and split lines.
