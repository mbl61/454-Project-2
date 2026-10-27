function task3_1 (camera_1, camera_2)

% this function shows the parameters of two cameras

cameras = {camera_1, camera_2};

fprintf('----------------------------\n');
fprintf('Task 3.1:\n');

for i = 1:2
    cam = cameras{i};

    % internal parameters
    f = cam.foclen;
    cx = cam.prinpoint(1);
    cy = cam.prinpoint(2);
    a = cam.aspectratio;
    s = cam.skew;
    
    % external parameters
    C = cam.position(:); % 3x1 column
    R = cam.Rmat;
    
    fprintf("Camera %d Internal Parameters:\n", i);
    fprintf("   Focal Length (f): %.4f\n", f);
    fprintf("   Principal Point (cx, cy): [%.4f, %.4f]\n", cx, cy);
    fprintf("   Aspect Ratio (a): %.4f\n", a);
    fprintf("   Skew (s): %.4f\n\n", s);
    
    fprintf("Camera %d External Parameters:\n", i);
    fprintf("   Position (C): [%.4f, %.4f, %.4f]\n\n", C(1), C(2), C(3));
    
    % Kmat
    Kmat = [f * a, s, cx;
        0, f, cy;
        0, 0, 1];
    
    fprintf("Difference between camera %d Kmat and calculated Kmat:\n", i);
    disp(cam.Kmat - Kmat);
    
    % Pmat is extrinsic matrix [R, -R*C]
    t = -R * C;
    extrinsic_matrix = [R, t];
    fprintf("Difference between camera %d Pmat and calculated extrinsic matrix [R, -R*C]:\n", i);
    disp(cam.Pmat - extrinsic_matrix);
    fprintf('----------------------------\n');
end

end
