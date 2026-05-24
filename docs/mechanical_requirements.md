# Mechanical requirements draft

## Primary goals

- Knuckle-style shape.
- Upper bridge sits above the first phalanges of the four non-thumb fingers.
- Minimize total mass.
- Keep center of mass near the center of a clenched fist.
- Keep optical sensors visible and structurally stable.
- Support a mirrored two-hand controller pair.
- Prefer a reusable, physically detachable, common tracking module if practical.

## Upper bridge / tracking module requirements

The upper bridge is now expected to be the detachable tracking module or a major part of it. It should:

- Be lightweight.
- Include the optical sensors.
- Include the two RP2350 MCUs for optical capture.
- Provide multi-directional sensor surfaces.
- Avoid a large flat single-plane sensor layout.
- Keep enough clearance from the fingers to avoid pressure, sweat blockage, and motion interference.
- Have enough stiffness that sensor positions do not shift during normal use.
- Provide routing from sensors to the RP2350s.
- Potentially serve as the common tracking module shared between left and right controllers.
- Connect to the palm/fist core through pogo pins.

The upper bridge / tracking module should avoid:

- Battery placement.
- Large non-tracking electronics unless needed for capture or module identity.
- Large haptic motors.
- Unnecessary decorative mass.

## Latch-detachable tracking module requirements

A physically detachable latch-based tracking module is preferred. The design must still protect tracking quality:

- The latch should retain the module during fast Beat Saber swings.
- Locating features should define position and rotation independently of latch retention force.
- The pogo pins should provide electrical contact, not primary alignment.
- The module interface must resist rocking, torsion, and vibration.
- The latch should avoid accidental release during gameplay.
- The release action should be deliberate and preferably one-handed or tool-less if feasible.
- The module should either preserve calibration after reattachment or include a way to identify/store module-specific calibration.
- The detachable boundary should not force battery or haptics into the upper bridge.

## Lower/palm core requirements

The lower or palm-side core should:

- Hold battery and main PCB close to the fist center.
- Hold the main MCU and IMU near stable reference locations.
- Provide the latch receiver and locating interface for the detachable tracking module.
- Provide pogo-pin contact pads or pins for module communication.
- Support strap/handle/ring fastening once the fastening concept is chosen.
- Provide accessible USB-C or debug access if required.
- Provide thumb-reachable placement for:
  - PCB-trace/electrode boolean trigger/touch input;
  - system button on the same plane as the trigger/touch input.
- Provide haptic actuator placement if haptics are retained.

## Input placement requirements

- The boolean touch input should act as the trigger input.
- The trigger/touch should be implemented as PCB routing/electrode geometry where possible.
- The trigger/touch and system button should be reachable by the thumb.
- The trigger/touch and system button should sit side-by-side on the same plane.
- The system button should be protected against accidental presses during Beat Saber swings.
- Input placement should not cause the thumb to occlude critical tracking sensors during normal use.

## Provisional print assumptions

The SCAD defaults assume a rough FDM/SLA prototype stage:

- Wall thickness default: 1.6 mm.
- Clearances are not final.
- Screw bosses and inserts are not yet modeled.
- Latch and pogo-pin details are not yet modeled.
- Shell split lines are not yet modeled.
- All electronics are simple placeholders.

## Required measurements

Before moving from debug model to printable prototype, measure or decide:

- Knuckle width, index to pinky.
- Finger pitch values.
- First phalanx height and width.
- Bridge length from wrist direction to fingertip direction.
- Maximum allowed bridge height.
- Minimum skin clearance.
- Palm/fist core volume.
- Thumb reach envelope.
- Strap or handle geometry.
- Detachable tracking-module boundary.
- Latch type and release direction.
- Pogo-pin count, pitch, and keep-out volume.
- Actual component sizes.

## Structural concerns

- Sensor mounts must not flex relative to one another.
- The bridge must survive ordinary handling and minor impacts.
- Beat Saber swings may create high acceleration loads, so the tracking module, latch, pogo-pin interface, and haptic actuator mounts should not loosen.
- The design should avoid long unsupported thin arms unless material and printing process are known.
- Cable routing must not force the bridge to deform.
- Assembly must not twist sensor boards out of calibration.
- Detaching and reattaching a module must not invalidate calibration unless recalibration is expected.
