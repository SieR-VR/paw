# Tracking requirements draft

## Tracking goal

The controller should be trackable across Beat Saber-style use poses while being worn or held as a knuckle-style controller. The sensor geometry should prioritize robust visibility during fast saber swings, wrist rotation, crossed-arm motions, and near-torso controller positions rather than merely fitting all sensors onto the upper shell.

The sensor layout should also include some margin beyond ordinary expected use. In practice, this means not optimizing only for a narrow forward-facing saber pose; the controller should retain visibility during wider wrist roll, high/low swings, hands pulled close to the body, and off-axis recovery poses.

## Product tracking identity

- SteamVR identity target: **controller**.
- Target application: **Beat Saber**.
- Left/right usage: **mirrored controller pair**.
- A common separable tracking module is desirable if it does not compromise tracking geometry, mass, or ergonomics.
- A physically detachable tracking module is preferred if it can preserve sensor alignment and calibration.

## Sensor count

Current planning value: **24 TS4231 + photodiode channels**.

This count is a design assumption, not a final validated requirement.

## Visibility principle

The design should aim to keep several spatially separated sensors visible from at least one base station in normal poses. The working assumption for geometry iteration is:

- Avoid placing all sensors on a single plane.
- Avoid placing most sensors where fingers or thumb can cover them.
- Distribute sensor normals across top, front, rear, left, right, and some lower directions.
- Use enough baseline in X, Y, and Z so the pose solution is not geometrically fragile.
- Prioritize Beat Saber motions: forward swings, downward cuts, upward cuts, wrist roll, crossed arms, and hands near the torso.
- Include additional angular coverage beyond the typical saber pose to improve recovery from off-nominal positions.

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

## Detachable tracking module considerations

If the tracking module becomes physically detachable, the following constraints apply:

- Reattachment must preserve sensor positions and normals closely enough for calibration to remain valid, or the module must carry its own calibration identity.
- The mechanical interface should include repeatable locating features, not only screws or magnets.
- Electrical connectors must not introduce excessive bulk near the upper bridge.
- The detachable boundary should not place heavy components far from the fist center unless necessary.
- Left/right reuse must be checked against Beat Saber occlusion and wrist-roll poses.

## FOV modeling

The SCAD model uses simple translucent cones to visualize approximate sensor field of view. This is only a mechanical clearance aid. It is not a substitute for optical/electrical validation.

Parameters to define later:

- Effective photodiode angular response.
- Aperture diameter.
- Recess depth.
- Window material and thickness.
- Internal reflection risk.
- Dust/scratch tolerance.
- The desired quantitative margin beyond typical Beat Saber pose coverage.

## Calibration requirements to define

- Exact sensor center coordinates.
- Exact sensor normal vectors.
- Per-device manufacturing calibration or CAD-nominal calibration.
- Sensor ID to physical position mapping.
- IMU-to-sensor coordinate transform.
- Controller tracking pose, grip pose, and aim pose.
- Whether detachable tracking modules store their own calibration data.
