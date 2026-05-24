# Mechanical requirements draft

## Primary goals

- Knuckle-style shape.
- Upper bridge sits above the first phalanges of the four non-thumb fingers.
- Minimize total mass.
- Keep center of mass near the center of a clenched fist.
- Keep optical sensors visible and structurally stable.

## Upper bridge requirements

The upper bridge should:

- Be lightweight.
- Provide multi-directional sensor surfaces.
- Avoid a large flat single-plane sensor layout.
- Keep enough clearance from the fingers to avoid pressure, sweat blockage, and motion interference.
- Have enough stiffness that sensor positions do not shift during normal use.
- Provide cable/flex routing to the main electronics.

The upper bridge should avoid:

- Battery placement.
- Large rigid PCBs unless needed.
- Heavy connectors.
- Large haptic motors.
- Unnecessary decorative mass.

## Lower/palm core requirements

The lower or palm-side core should:

- Hold battery and main PCB close to the fist center.
- Hold IMU near a stable reference location.
- Provide structural connection to the upper bridge.
- Support strap/handle/ring fastening once the fastening concept is chosen.
- Provide accessible USB-C or debug access if required.

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
- Strap or handle geometry.
- Actual component sizes.

## Structural concerns

- Sensor mounts must not flex relative to one another.
- The bridge must survive ordinary handling and minor impacts.
- The design should avoid long unsupported thin arms unless material and printing process are known.
- Cable routing must not force the bridge to deform.
- Assembly must not twist sensor boards out of calibration.
