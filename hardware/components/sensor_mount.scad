// sensor_mount.scad
// Sensor placeholder and FOV visualization.

include <controller_params.scad>

module sensor_body() {
    color(sensor_color)
        sphere(d = sensor_body_d);

    // Approximate sensor PCB behind the optical center.
    color("darkred", 0.55)
        translate([0, -sensor_recess, 0])
            cube(sensor_pcb_size, center = true);
}

module sensor_fov_cone() {
    // Cone points along local +Y.
    // OpenSCAD cylinders are along Z, so rotate Z to Y.
    color(sensor_fov_color, sensor_fov_alpha)
        rotate([-90, 0, 0])
            cylinder(
                h = sensor_fov_len,
                r1 = 0,
                r2 = tan(sensor_fov_angle) * sensor_fov_len,
                center = false
            );
}

module sensor_mount(sensor, show_fov = true) {
    id = sensor[0];
    pos = sensor[1];
    rot = sensor[2];

    translate(pos)
        rotate(rot) {
            sensor_body();
            if (show_fov) {
                sensor_fov_cone();
            }
        }
}
