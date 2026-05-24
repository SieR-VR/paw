# Tracking requirements draft

## Tracking goal

The controller should be trackable across common SteamVR use poses while being worn or held as a knuckle-style controller. The sensor geometry should prioritize robust visibility rather than merely fitting all sensors onto the upper shell.

## Sensor count

Current planning value: **24 TS4231 + photodiode channels**.

This count is a design assumption, not a final validated requirement.

## Visibility principle

The design should aim to keep several spatially separated sensors visible from at least one base station in normal poses. The working assumption for geometry iteration is:

- Avoid placing all sensors on a single plane.
- Avoid placing most sensors where fingers or thumb can cover them.
- Distribute sensor normals across top, front, rear, left, right, and some lower directions.
- Use enough baseline in X, Y, and Z so the pose solution is not geometrically fragile.

## Provisional coordinate system

Right-hand reference:

```text
+X: thumb side
-X: pinky side
+Y: back-of-hand / away from palm
-Y: palm interior
+Z: fingertip direction
-Z: wrist direction
```

The coordinate origin is currently provisional and placed near the center of a clenched fist / middle-finger MCP region.

## Provisional sensor layout groups

| Group | Sensor IDs | Region |
|---|---|---|
| Top ridge | S00-S05 | Upper bridge ridge |
| Front slope | S06-S09 | Fingertip-facing slope |
| Rear slope | S10-S13 | Wrist-facing slope |
| Thumb side | S14-S16 | +X side face |
| Pinky side | S17-S19 | -X side face |
| Lower auxiliary | S20-S23 | Lower/front/rear backup positions |

The actual OpenSCAD placeholder layout is in `hardware/components/sensor_layout_24.scad`.

## FOV modeling

The SCAD model uses simple translucent cones to visualize approximate sensor field of view. This is only a mechanical clearance aid. It is not a substitute for optical/electrical validation.

Parameters to define later:

- Effective photodiode angular response.
- Aperture diameter.
- Recess depth.
- Window material and thickness.
- Internal reflection risk.
- Dust/scratch tolerance.

## Calibration requirements to define

- Exact sensor center coordinates.
- Exact sensor normal vectors.
- Per-device manufacturing calibration or CAD-nominal calibration.
- Sensor ID to physical position mapping.
- IMU-to-sensor coordinate transform.
- Controller tracking pose, grip pose, and aim pose.
