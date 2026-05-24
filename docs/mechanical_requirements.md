# Mechanical requirements draft

## Primary goals

- Knuckle-style shape.
- Upper bridge sits above the first phalanges of the four non-thumb fingers.
- Four non-thumb fingers pass through a rounded opening to retain the controller.
- A rounded/oval lower palm handle sits under the palm.
- Thumb-side end of the handle carries the trigger/touch pad and system button.
- Minimize total mass.
- Keep center of mass near the center of a clenched fist.
- Keep optical sensors visible and structurally stable.
- Support a mirrored two-hand controller pair.
- Prefer a reusable, physically detachable, common tracking module if practical.

## Recommended overall structure

```text
[Detachable tracking module]
  - upper knuckle bridge / tracking crown
  - optical sensors
  - two RP2350 MCUs
  - local routing / sensor boards
  - locating features
  - snap-latch feature
  - pogo-pin pads

[Palm/fist core]
  - four-finger slot/frame
  - rounded/oval lower palm handle
  - latch receiver
  - locating-feature receiver
  - pogo-pin receiver
  - battery
  - main MCU / main PCB
  - IMU
  - wireless / charging / power
  - thumb-side trigger touch pad and system button
  - optional haptic actuator
```

## Four-finger retention opening

The controller should be retained by the four non-thumb fingers passing through a knuckle-style opening.

Recommended starting point:

- Use one large **rounded four-finger slot** for the first prototypes.
- Avoid four tight hard rings until fit, safety, and comfort are understood.
- Keep internal corners heavily rounded.
- Leave enough clearance for hand-size variation and sweat.
- Design for optional soft liner, foam, or TPU insert later.

Reasons:

- A single rounded slot is easier to print and iterate.
- It is less likely to create painful pressure points.
- It reduces risk of finger trapping compared with tight individual rings.
- It allows quicker tuning by changing slot width, height, and liner thickness.

Later alternatives:

- Split into four individual holes if retention is insufficient.
- Add soft dividers between fingers.
- Add replaceable inserts for different hand sizes.

## Lower/palm core requirements

The lower or palm-side core should:

- Hold battery and main PCB close to the fist center.
- Hold the main MCU and IMU near stable reference locations.
- Provide the latch receiver and locating interface for the detachable tracking module.
- Provide pogo-pin contact pads or pins for module communication.
- Support the four-finger slot/frame.
- Include a rounded/oval lower palm handle.
- Provide accessible USB-C or debug access if required.
- Provide thumb-reachable placement for:
  - PCB-trace/electrode boolean trigger/touch input;
  - system button on the same plane as the trigger/touch input.
- Provide haptic actuator placement if haptics are retained.

## Lower palm handle recommendation

Use an oval or rounded-rectangle handle section rather than a perfectly circular cylinder.

Reasons:

- An oval handle resists rotation in the hand better than a circular handle.
- It provides clearer orientation during Beat Saber swings.
- It gives more internal volume for battery, PCB, IMU, and haptics.
- It helps keep mass near the center of the clenched fist.

The handle should be adjusted by printed prototypes once hand-fit testing is possible.

## Input placement requirements

- The boolean touch input should act as the trigger input.
- The trigger/touch should be implemented as PCB routing/electrode geometry where possible.
- The trigger/touch and system button should be reachable by the thumb.
- The trigger/touch and system button should sit side-by-side on the same plane at the thumb-side end of the handle.
- The trigger/touch should be a larger easy-to-contact pad.
- The system button should be smaller and physically protected against accidental presses.
- Recommended system-button implementation: tactile switch or similar physical button with a cap.
- Recommended accidental-press prevention:
  - small recess;
  - raised guard/ridge;
  - separation from the touch pad;
  - smaller button area than the trigger pad.
- Input placement should not cause the thumb to occlude critical tracking sensors during normal use.

## Capacitive trigger/touch recommendations

The trigger should start as a simple capacitive pad implemented with PCB trace/electrode geometry.

Design notes:

- Treat the pad size and position as prototype-tuned parameters.
- Keep plastic thickness above the electrode low enough for reliable sensing; exact value is TBD.
- Firmware should allow threshold tuning.
- Evaluate sweat, gloves, grounding, and battery noise effects.
- Keep the system button electrically and mechanically distinct from the capacitive trigger pad.

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

## Snap-latch-detachable tracking module requirements

A physically detachable snap-latch-based tracking module is preferred. The design must still protect tracking quality.

Use separate mechanisms for separate jobs:

| Function | Recommended mechanism |
|---|---|
| Repeatable alignment | rail, dovetail, locating pin/boss, cone, or equivalent locating geometry |
| Retention | snap latch |
| Electrical connection | pogo pins |
| Anti-rocking preload | latch preload, rail preload, elastomer, or controlled interference |

Requirements:

- The snap latch should retain the module during fast Beat Saber swings.
- Locating features should define position and rotation independently of latch retention force.
- The pogo pins should provide electrical contact, not primary alignment.
- The module interface must resist rocking, torsion, and vibration.
- The latch should avoid accidental release during gameplay.
- The release action should be deliberate and preferably one-handed or tool-less if feasible.
- The module should either preserve calibration after reattachment or include a way to identify/store module-specific calibration.
- The detachable boundary should not force battery or haptics into the upper bridge.

Recommended first prototype attachment:

```text
slide rail + locating boss/pin + end snap latch + pogo pins
```

Reasons:

- Slide rails provide intuitive insertion and repeatable alignment.
- A snap latch provides quick retention without screws.
- Locating bosses/pins can define final position more accurately than a flexible latch.
- Pogo-pin compression direction is easier to control.

## Pogo-pin interface recommendations

Pogo pins should be used for electrical contact only, not for mechanical alignment or structural load.

Initial mechanical assumption:

- Reserve space for roughly **10-12 pogo contacts** until the electrical interface is finalized.
- Include more than one ground contact.
- Include enough power contacts for current margin.
- Consider module-detect, reset, boot/debug, sync/clock, interrupt/ready, and data pins.
- Protect the pogo area from sweat and dust where practical.
- Maintain controlled pogo compression using hard mechanical stops, not uncontrolled shell flex.

Candidate signals may include:

```text
power
GND
GND
data TX/RX or differential/serial bus
sync or clock
reset
boot/debug
module detect
interrupt/ready
optional SWDIO
optional SWCLK
```

## Sensor board / tracking module build recommendation

Early prototypes should avoid committing to rigid-flex too early.

Recommended progression:

| Stage | Recommendation |
|---|---|
| 1st prototype | individual small rigid sensor boards + wire |
| 2nd prototype | sensor sub-boards + flex cable |
| 3rd prototype | integrated rigid-flex or multi-PCB fixture |
| later production candidate | rigid-flex or well-controlled multi-PCB assembly |

Reasons:

- Sensor position and angle will likely change.
- Individual boards are easier to replace when soldering or sensor failures occur.
- Early geometry experiments should be cheap and fast.
- Rigid-flex is better after the geometry stabilizes.

## Strength and reinforcement strategy

The first physical designs should be somewhat robust by default, then selectively lightened or reinforced after testing.

Prefer structural features over simply making every wall thick:

- large fillets;
- ribs;
- gussets;
- closed sections;
- local thickening at latch/rail/handle stress points;
- reinforced screw bosses;
- reinforced pogo-pin support area.

Initial FDM/PETG-like prototype guidance:

| Feature | Starting guidance |
|---|---:|
| general wall | ~2.0 mm |
| load-bearing wall | 2.4-3.0 mm |
| sensor shell wall | 1.6-2.0 mm |
| latch area | >= 2.5 mm plus fillets/gussets |
| small fillet | 1-2 mm |
| large external fillet | 3-6 mm |

These are starting points, not final production requirements.

## Shell split-line recommendation

Start with separate serviceable parts instead of a single monolithic body:

1. `detachable_tracking_module`
2. `palm_core_body`
3. `palm_core_cover`
4. `finger_hole_frame` or integrated front ring/slot frame
5. `thumb_input_cap` or input-plane cover

Avoid placing split lines at:

- sensor reference surfaces;
- latch load paths;
- pogo-pin compression surfaces;
- high-pressure skin contact areas;
- sweat-collecting grooves;
- critical alignment features.

## Fastener recommendation

Use small metric screws with heat-set inserts where repeated disassembly is expected.

Initial suggestions:

| Location | Recommended fastener |
|---|---|
| small covers | M2 |
| general shell assembly | M2.5 |
| high-load handle/frame parts | M3 |
| sensor boards | M1.6 or M2 |

M2.5 should be the default for general serviceable shell joints. Use M3 only where strength and available space justify it.

## Heat-set insert recommendation

Use heat-set inserts for repeated assembly/disassembly where material thickness allows it.

Good candidates:

- palm core cover;
- latch receiver region;
- handle/frame joints;
- serviceable electronics compartments.

Avoid forcing inserts into very thin sensor shell regions unless the design provides adequate boss thickness.

## Cable routing recommendation

Separate sensitive sensor/timing routing from high-current or noisy wiring.

Recommendations:

- sensor wiring channel separate from power/haptic wiring channel;
- no sharp cable bends;
- strain relief near boards and pogo interface;
- service loops where disassembly requires motion;
- avoid cable routing that bends or twists sensor mounts;
- label or key sensor wiring for debugging.

## Sensor board replacement recommendation

Early prototypes should make sensor boards replaceable.

Recommendations:

- mark sensor IDs physically;
- use small screws, slots, or accessible adhesive only after geometry stabilizes;
- provide datum surfaces for sensor normal orientation;
- keep sensor boards accessible enough to fix soldering mistakes;
- avoid permanent potting during early geometry work.

## Battery replacement recommendation

For early prototypes, prefer a serviceable internal battery rather than a fully user-swappable battery.

Reasons:

- User-swappable battery doors and contacts add mass and complexity.
- Serviceable internal batteries are easier to package tightly.
- The battery can still be replaced by opening a screw-secured cover.

## Drop and impact recommendation

Initial drop target:

```text
Survive a typical 1 m accidental drop well enough that the shell does not shatter sharply and the battery, sensors, pogo interface, and latch are not immediately destroyed.
```

This is an early prototype target, not a certified durability specification.

Beat Saber swing testing should also check impacts and near-miss collisions, especially around the tracking module, latch, and finger opening.

## Sweat, dust, and water recommendation

Initial target should be **sweat-resistant**, not waterproof.

Recommendations:

- keep sweat away from pogo pins where practical;
- avoid grooves that collect sweat in skin-contact areas;
- consider conformal coating for exposed electronics after validation;
- make sensor windows/openings cleanable;
- avoid promising water washing or full water resistance in early prototypes.

## Manufacturing recommendation

Prototype progression:

```text
FDM PLA/PETG for fit checks
→ PETG/ABS/ASA for stronger swing tests
→ SLS/MJF nylon or similar for higher-quality functional prototypes
```

Material notes:

| Material/process | Use |
|---|---|
| PLA | quick geometry and fit checks only |
| PETG | general early functional prototype |
| ABS/ASA | better heat resistance, higher print difficulty |
| Nylon / SLS / MJF | strong functional prototype candidate |
| SLA resin | detailed parts, but impact behavior must be checked carefully |

## Human-factor parameter strategy

Detailed Human Factors decisions are intentionally deferred for now.

For early OpenSCAD work, computer-vision hand measurement from photos may be used to produce initial values and thresholds. These values should be treated as starting estimates rather than final dimensions.

Fit-critical parameters should later be tuned through printed prototypes. Once a 3D printer is available, direct fitting can use iterative methods such as binary search or bracketed search. Candidate parameters for physical tuning include:

- bridge clearance above fingers;
- four-finger slot width/height;
- bridge height and width;
- side clearance;
- handle diameter/oval dimensions;
- strap/ring/handle tightness;
- thumb input position;
- system-button separation;
- snap-latch feel and release force;
- comfort around pressure points.

## Provisional print assumptions

The SCAD defaults assume a rough FDM/SLA prototype stage:

- Wall thickness default should move toward ~2.0 mm for early structural prototypes.
- Clearances are not final.
- Screw bosses and inserts are not yet modeled.
- Snap latch and pogo-pin details are not yet modeled.
- Shell split lines are not yet modeled.
- All electronics are simple placeholders.

## Required measurements / decisions

Before moving from debug model to printable prototype, measure or decide:

- Knuckle width, index to pinky.
- Finger pitch values.
- Four-finger slot width, height, and front/back length.
- First phalanx height and width.
- Bridge length from wrist direction to fingertip direction.
- Maximum allowed bridge height.
- Minimum skin clearance.
- Palm/fist core volume.
- Oval handle dimensions.
- Thumb reach envelope.
- Detachable tracking-module boundary.
- Snap-latch type and release direction.
- Pogo-pin count, pitch, compression, and keep-out volume.
- Actual component sizes.

## Structural concerns

- Sensor mounts must not flex relative to one another.
- The bridge must survive ordinary handling and minor impacts.
- Beat Saber swings may create high acceleration loads, so the tracking module, latch, pogo-pin interface, and haptic actuator mounts should not loosen.
- The design should avoid long unsupported thin arms unless material and printing process are known.
- Cable routing must not force the bridge to deform.
- Assembly must not twist sensor boards out of calibration.
- Detaching and reattaching a module must not invalidate calibration unless recalibration is expected.
