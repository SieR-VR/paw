# Mechanical requirements draft

## Primary goals

- Knuckle-style shape.
- Upper bridge sits above the first phalanges of the four non-thumb fingers.
- Minimize total mass.
- Keep center of mass near the center of a clenched fist.
- Keep optical sensors visible and structurally stable.
- Support a mirrored two-hand controller pair.
- Prefer a reusable, and ideally physically detachable, common tracking module if practical.

## Upper bridge requirements

The upper bridge should:

- Be lightweight.
- Provide multi-directional sensor surfaces.
- Avoid a large flat single-plane sensor layout.
- Keep enough clearance from the fingers to avoid pressure, sweat blockage, and motion interference.
- Have enough stiffness that sensor positions do not shift during normal use.
- Provide cable/flex routing to the main electronics.
- Potentially serve as the common tracking module shared between left and right controllers.

The upper bridge should avoid:

- Battery placement.
- Large rigid PCBs unless needed.
- Heavy connectors.
- Large haptic motors.
- Unnecessary decorative mass.

## Detachable tracking module requirements

A physically detachable tracking module is preferred if feasible. The design must still protect tracking quality:

- The module interface should be repeatable and rigid.
- Locating features should define position and rotation independently of retention force.
- Retention may be screws, latch, magnets, or a hybrid, but must not allow sensor movement during swings.
- The electrical connector should be robust and compact.
- The module should either preserve calibration after reattachment or include a way to identify/store module-specific calibration.
- The detachable boundary should not force heavy components into the upper bridge unless the mass penalty is acceptable.

## Lower/palm core requirements

The lower or palm-side core should:

- Hold battery and main PCB close to the fist center.
- Hold IMU near a stable reference location.
- Provide structural connection to the upper bridge or detachable module interface.
- Support strap/handle/ring fastening once the fastening concept is chosen.
- Provide accessible USB-C or debug access if required.
- Provide thumb-reachable placement for:
  - boolean trigger/touch input;
  - system button.
- Provide haptic actuator placement if haptics are retained.

## Input placement requirements

- The boolean touch input should act as the trigger input.
- The trigger/touch and system button should be reachable by the thumb.
- The system button should be protected against accidental presses during Beat Saber swings.
- Input placement should not cause the thumb to occlude critical tracking sensors during normal use.

## Provisional print assumptions

The SCAD defaults assume a rough FDM/SLA prototype stage:

- Wall thickness default: 1.6 mm.
- Clearances are not final.
- Screw bosses and inserts are not yet modeled.
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
- Detachable tracking-module boundary and attachment method.
- Actual component sizes.

## Structural concerns

- Sensor mounts must not flex relative to one another.
- The bridge must survive ordinary handling and minor impacts.
- Beat Saber swings may create high acceleration loads, so the tracking module and haptic actuator mounts should not loosen.
- The design should avoid long unsupported thin arms unless material and printing process are known.
- Cable routing must not force the bridge to deform.
- Assembly must not twist sensor boards out of calibration.
- Detaching and reattaching a module must not invalidate calibration unless recalibration is expected.
