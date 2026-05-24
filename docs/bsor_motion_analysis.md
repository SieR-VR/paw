# BSOR motion analysis requirements

## Purpose

Use BeatLeader BSOR replay files to quantify real Beat Saber controller motion so the controller sensor layout can be designed against measured pose envelopes instead of only hand-written assumptions.

## Desired outcomes

The analysis should help answer:

- What controller positions and orientations occur during real Beat Saber play?
- How often do extreme poses occur?
- What pose coverage should the tracking sensors support?
- How much additional sensor coverage margin is useful beyond typical motion?
- Which poses are most likely to cause tracking loss: crossed arms, hands near torso, high/low swings, large wrist roll, or recovery movements?

## Target outputs

For left and right controllers separately:

- Position distribution over time.
- Orientation distribution over time.
- Linear velocity estimate.
- Linear acceleration estimate.
- Angular velocity estimate.
- High/low/left/right/front/back extrema.
- Near-body or near-HMD cases if body/HMD reference data is available.
- Crossed-arm indicators if both controller poses are available.
- Percentile envelopes:
  - 50%;
  - 90%;
  - 95%;
  - 99%;
  - maximum observed.

## Dataset questions

- Which BSOR files should be used?
- Should the dataset include only the target user's replays, or many players?
- Should analysis focus on Expert/Expert+ maps?
- Should maps with unusual modifiers or mapping styles be separated?
- Should failed runs be included?
- Should replay data be filtered by scoring sections, note density, or swing speed?

## Processing questions

- Confirm BSOR file format and available fields.
- Determine coordinate frame conventions used by BSOR.
- Determine whether HMD pose is available.
- Determine whether controller pose is raw, filtered, or game-transformed.
- Determine sample rate and timestamp reliability.
- Decide smoothing/filtering for velocity and acceleration estimation.
- Decide how to detect crossed-arm and near-torso cases.

## Design usage

The results should feed back into:

- sensor normal direction selection;
- required angular coverage;
- Beat Saber-specific occlusion tests;
- OpenSCAD FOV debug poses;
- target tracking margin beyond ordinary use;
- latch strength assumptions from acceleration envelopes;
- haptic and battery placement if acceleration loads are significant.

## Future tooling idea

A future repository tool could parse BSOR files and export:

- CSV pose samples;
- JSON percentile envelopes;
- plots of pose/orientation/velocity;
- generated OpenSCAD debug pose sets;
- sensor coverage test cases.
