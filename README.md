# paw

Parametric mechanical exploration for a SteamVR Tracking-style knuckle controller.

This repository currently contains early design documentation and OpenSCAD debug models for a lightweight controller concept:

- A mirrored two-hand controller pair for Beat Saber.
- A knuckle-style bridge above the first phalanges of the four non-thumb fingers.
- 24 optical sensor placeholders intended for TS4231 + photodiode channels.
- Two RP2350 MCUs using PIO as the tentative sensor-capture architecture.
- A mass-layout goal that keeps the center of mass near the center of a clenched fist.
- Minimal inputs: one boolean touch input and one system button.

> This is not a production-ready design. The SCAD files are intentionally placeholder-heavy so that dimensions, sensor positions, and component masses can be revised quickly.

## Repository layout

```text
docs/
  design_notes.md
  open_questions.md
  tracking_requirements.md
  mechanical_requirements.md
  electronics_requirements.md
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

- **Upper knuckle bridge:** lightweight sensor surface only.
- **Possible common tracking module:** desirable if one module design can be reused on both hands without compromising tracking or ergonomics.
- **Palm/fist core:** battery, RP2350 electronics, IMU, wireless module, optional haptics, and USB-C where possible.
- **Sensor geometry:** distributed over top/front/rear/side/lower faces rather than a single flat plane.
- **Mass goal:** minimize wrist torque by keeping heavy parts close to the center of the clenched hand.
- **Application goal:** Beat Saber first; optimize for saber swing poses and minimal required inputs.

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
3. Define battery, PCB, IMU, wireless, haptic, and connector sizes/masses.
4. Decide whether haptics are required or should be omitted for mass reduction.
5. Define the boolean touch input and system button placement.
6. Refine the 24 sensor positions and normals for Beat Saber swing poses.
7. Validate occlusion with a hand reference model.
8. Iterate toward printable split parts and sensor-board mounts.
