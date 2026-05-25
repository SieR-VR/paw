# paw

Parametric mechanical exploration for a SteamVR Tracking-style knuckle controller.

This repository currently contains early design documentation and OpenSCAD debug models for a lightweight controller concept:

- A mirrored two-hand controller pair for Beat Saber.
- A four-finger knuckle slot/retention structure.
- A rounded/oval lower palm handle.
- Thumb-side input plane with PCB-trace/electrode trigger touch pad and a physical system button.
- A preferred common tracking module that may become physically detachable if feasible.
- Snap-latch-based detachable tracking module concept.
- Tracking module contains the optical sensors and two RP2350 MCUs.
- Palm/fist core contains main MCU, IMU, battery, inputs, wireless/power electronics, and optional haptics.
- Pogo-pin communication between the detachable tracking module and palm/fist core.
- 24 optical sensor placeholders intended for TS4231 + photodiode channels.
- Two RP2350 MCUs using PIO as the tentative sensor-capture architecture.
- A mass-layout goal that keeps the center of mass near the center of a clenched fist.
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
  paw_controller.scad          — top-level assembly
  controller_params.scad       — all shared parameters and debug toggles
  coordinate_system.scad
  hand_reference.scad
  knuckle_bridge.scad
  sensor_mount.scad
  sensor_layout_24.scad
  electronics_placeholders.scad
  center_of_mass.scad
  debug_visualization.scad
  finger_retention.scad        — four-finger slot / retention frame placeholder
  palm_handle.scad             — oval lower palm handle placeholder
  thumb_input_plane.scad       — thumb-side trigger pad + system button placeholder
  snap_latch_placeholder.scad  — snap-latch + alignment rail/boss placeholder
  pogo_pin_interface.scad      — pogo-pin contact array placeholder
```

## Current design direction

The preferred architecture is:

- **Upper knuckle bridge / tracking module:** lightweight sensor surface, two RP2350s, snap-latch-detachable if feasible.
- **Retention:** four non-thumb fingers pass through a rounded slot/opening; optional soft liner may be added later.
- **Palm handle:** rounded/oval lower handle under the palm, carrying heavy components near the clenched fist center.
- **Thumb input plane:** capacitive trigger pad plus smaller protected system button on the same plane.
- **Physically detachable tracking module:** preferred if repeatable alignment, rigidity, calibration, snap latch, and pogo-pin constraints can be solved.
- **Palm/fist core:** battery, main MCU, IMU, wireless module, optional haptics, inputs, charging, and USB-C where possible.
- **Sensor geometry:** distributed over top/front/rear/side/lower faces rather than a single flat plane, with slightly wider-than-normal pose coverage.
- **Mass goal:** minimize wrist torque by keeping heavy parts close to the center of the clenched hand.
- **Application goal:** Beat Saber first; optimize for saber swing poses and minimal required inputs.
- **Motion-data goal:** parse BeatLeader BSOR replays to quantify real controller motion envelopes.

## Mechanical recommendation summary

- Start with a single large rounded four-finger slot, not four tight hard rings.
- Use an oval/rounded lower palm handle rather than a perfect cylinder.
- Use snap latch for tracking-module retention, but separate alignment into rails/pins/bosses/dovetails/cones.
- Use pogo pins only for electrical contact, not structural alignment.
- Reserve space for roughly 10-12 pogo contacts until the electrical design is known.
- Prototype sensor placement using replaceable small rigid sensor boards before committing to rigid-flex.
- Use robust early walls and local reinforcement, then lighten after testing.
- Prefer M2.5 screws and heat-set inserts for serviceable shell joints where possible.
- Split the model into serviceable parts: tracking module, palm core body, palm core cover, finger slot/frame, and thumb input cap/cover.
- Target sweat resistance rather than waterproofing for early prototypes.

## Opening the model

Open `hardware/components/paw_controller.scad` in OpenSCAD.

Useful toggles are defined in `hardware/components/controller_params.scad`:

- `show_hand_reference`
- `show_sensor_fov`
- `show_electronics`
- `show_center_of_mass`
- `show_debug_axes`
- `show_finger_retention`
- `show_palm_handle`
- `show_thumb_input`
- `show_snap_latch`
- `show_pogo_interface`

## Next steps

1. ~~Update the OpenSCAD model to include the four-finger slot, lower palm handle, thumb input plane, snap-latch placeholder, and pogo-pin placeholder.~~ ✅ Done.
2. Measure or estimate target hand dimensions.
3. Define the actual TS4231 + photodiode board size.
4. Define tracking-module PCB dimensions for the two RP2350s.
5. Define palm/fist core dimensions for main MCU, IMU, battery, wireless, haptic, inputs, and connector sizes/masses.
6. Decide snap-latch geometry and pogo-pin interface details.
7. Decide the haptic actuator type or omit haptics if mass/power is too high.
8. Define the thumb-reachable PCB-trace trigger/touch input and system button placement.
9. Parse BSOR replay files to derive Beat Saber motion envelopes.
10. Refine the 24 sensor positions and normals for Beat Saber swing poses plus extra recovery margin.
11. Validate occlusion with a hand reference model.
12. Iterate toward printable split parts and sensor-board mounts.
