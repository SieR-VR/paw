# paw

Parametric mechanical exploration for a SteamVR Tracking-style knuckle controller.

This repository currently contains early design documentation and OpenSCAD debug models for a lightweight controller concept:

- A mirrored two-hand controller pair for Beat Saber.
- A knuckle-style bridge above the first phalanges of the four non-thumb fingers.
- A preferred common tracking module that may become physically detachable if feasible.
- Latch-based detachable tracking module concept.
- Tracking module contains the optical sensors and two RP2350 MCUs.
- Palm/fist core contains main MCU, IMU, battery, inputs, wireless/power electronics, and optional haptics.
- Pogo-pin communication between the detachable tracking module and palm/fist core.
- 24 optical sensor placeholders intended for TS4231 + photodiode channels.
- Two RP2350 MCUs using PIO as the tentative sensor-capture architecture.
- A mass-layout goal that keeps the center of mass near the center of a clenched fist.
- Minimal inputs: one thumb-reachable PCB-trace/electrode boolean trigger/touch input and one thumb-reachable system button on the same plane.
- Haptics if feasible within mass and power limits.
- BSOR replay analysis as the preferred path for quantifying Beat Saber motion coverage.

> This is not a production-ready design. The SCAD files are intentionally placeholder-heavy so that dimensions, sensor positions, and component masses can be revised quickly.

## Repository layout

```text
docs/
  design_notes.md
  open_questions.md
  tracking_requirements.md
  mechanical_requirements.md
  electronics_requirements.md
  bsor_motion_analysis.md
hardware/components/
  paw_controller.scad
  controller_params.scad
  coordinate_system.scad
  hand_reference.scad
  knuckle_bridge.scad
  sensor_mount.scad
  sensor_layout_24.scad
  electronics_placeholders.scad
  center_of_mass.scad
  debug_visualization.scad
```

## Current design direction

The preferred architecture is:

- **Upper knuckle bridge / tracking module:** lightweight sensor surface, two RP2350s, latch-detachable if feasible.
- **Physically detachable tracking module:** preferred if repeatable alignment, rigidity, calibration, latch, and pogo-pin constraints can be solved.
- **Palm/fist core:** battery, main MCU, IMU, wireless module, optional haptics, inputs, charging, and USB-C where possible.
- **Sensor geometry:** distributed over top/front/rear/side/lower faces rather than a single flat plane, with slightly wider-than-normal pose coverage.
- **Mass goal:** minimize wrist torque by keeping heavy parts close to the center of the clenched hand.
- **Application goal:** Beat Saber first; optimize for saber swing poses and minimal required inputs.
- **Motion-data goal:** parse BeatLeader BSOR replays to quantify real controller motion envelopes.

## Opening the model

Open `hardware/components/paw_controller.scad` in OpenSCAD.

Useful toggles are defined in `hardware/components/controller_params.scad`:

- `show_hand_reference`
- `show_sensor_fov`
- `show_electronics`
- `show_center_of_mass`
- `show_debug_axes`

## Next steps

1. Measure the target hand dimensions.
2. Define the actual TS4231 + photodiode board size.
3. Define tracking-module PCB dimensions for the two RP2350s.
4. Define palm/fist core dimensions for main MCU, IMU, battery, wireless, haptic, inputs, and connector sizes/masses.
5. Decide latch geometry and pogo-pin interface details.
6. Decide the haptic actuator type or omit haptics if mass/power is too high.
7. Define the thumb-reachable PCB-trace trigger/touch input and system button placement.
8. Parse BSOR replay files to derive Beat Saber motion envelopes.
9. Refine the 24 sensor positions and normals for Beat Saber swing poses plus extra recovery margin.
10. Validate occlusion with a hand reference model.
11. Iterate toward printable split parts and sensor-board mounts.
