// center_of_mass.scad
// Rough center-of-mass estimate using placeholder component masses.

include <controller_params.scad>

masses = [
    ["battery", battery_pos, battery_mass_g],
    ["main_pcb", main_pcb_pos, main_pcb_mass_g],
    ["imu", imu_pos, imu_mass_g],
    ["wireless", wireless_pos, wireless_mass_g],
    ["haptic", haptic_pos, haptic_mass_g],
    ["upper_bridge_estimate", bridge_mass_pos, bridge_mass_g]
];

function mass_total(i = 0) =
    i >= len(masses) ? 0 : masses[i][2] + mass_total(i + 1);

function weighted_axis(axis, i = 0) =
    i >= len(masses) ? 0 : masses[i][1][axis] * masses[i][2] + weighted_axis(axis, i + 1);

function center_of_mass() =
    [
        weighted_axis(0) / mass_total(),
        weighted_axis(1) / mass_total(),
        weighted_axis(2) / mass_total()
    ];

module center_of_mass_marker() {
    com = center_of_mass();
    color("black")
        translate(com)
            sphere(d = 7);
}

module target_center_of_mass_marker() {
    color("purple", 0.45)
        translate(target_com)
            sphere(d = 11);
}
