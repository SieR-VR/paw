// knuckle_bridge.scad
// Lightweight faceted bridge placeholder above the four non-thumb fingers.

include <controller_params.scad>

module bridge_polyhedron() {
    w0 = bridge_width / 2;
    w1 = bridge_width / 2 - bridge_side_inset;
    l0 = bridge_length / 2;
    l1 = bridge_length / 2 - bridge_front_rear_inset;
    y0 = bridge_clearance_y;
    y1 = bridge_clearance_y + bridge_height * 0.55;
    y2 = bridge_top_y;

    // A low faceted crown. This is intentionally simple and solid for early layout.
    polyhedron(
        points = [
            [-w0, y0, -l0], [ w0, y0, -l0], [ w0, y0,  l0], [-w0, y0,  l0],
            [-w0, y1, -l1], [ w0, y1, -l1], [ w0, y1,  l1], [-w0, y1,  l1],
            [-w1, y2, -l1], [ w1, y2, -l1], [ w1, y2,  l1], [-w1, y2,  l1]
        ],
        faces = [
            [0,1,2,3],
            [0,4,5,1], [1,5,6,2], [2,6,7,3], [3,7,4,0],
            [4,8,9,5], [5,9,10,6], [6,10,11,7], [7,11,8,4],
            [8,11,10,9]
        ]
    );
}

module knuckle_bridge() {
    // Minkowski roundover is intentionally not used yet to keep preview fast.
    bridge_polyhedron();
}
