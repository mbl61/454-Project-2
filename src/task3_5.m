function F = task3_5(camera_1, camera_2, pts1, pts2, img1, img2, testmode)
% compute a 3*3 fundamental matrix from two camera parameter 
% eight points from task3_6

R = camera_2.Rmat*camera_1.Rmat';
T = camera_1.Rmat*(camera_2.position(:)-camera_1.position(:));

T_cross_p = [ 0, -T(3), T(2);
            T(3), 0, -T(1);
            -T(2), T(1), 0];

E_matrix = R * T_cross_p;

F_matrix = inv(camera_2.Kmat)' * E_matrix * inv(camera_1.Kmat);

F = F_matrix / norm(F_matrix);

if testmode:
    fprintf('----------------------------\n');
    fprintf('Task3.5:\n');

    fprintf('Fundamental matrix F from camera:\n');
    fprintf('  % .12g % .12g  % .12g\n', F.');

    fprintf('----------------------------\n');
end

% each point produces an epipolar line in the other images      
pts1_h = [pts1, ones(size(pts1, 1), 1)].';
pts2_h = [pts2, ones(size(pts2, 1), 1)].';
lines1 = F.' * pts2_h;
lines2 = F * pts1_h;
colors = lines(size(pts1, 1));

figure('Name', 'Camera-parameter epipolar', 'NumberTitle', 'off', 'Position', [100, 100, 1400, 500]);
subplot(1, 2, 1);
draw_epipolar_lines(img1, pts1, lines1, colors);
title('Camera 1: epipolar lines from camera 2 points');
subplot(1, 2, 2);
draw_epipolar_lines(img2, pts2, lines2, colors);
title('Camera 2: epipolar lines from camera 1 points');

end
