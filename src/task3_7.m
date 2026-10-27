function [sed_manual, sed_camera] = task3_7(F_manual, F_camera, pts1, pts2)
% evaluate the fundamental matrix from 3_5 and 3_6
% pts1 and pts2 are N*2 arrays

% to homogeneous coordinate
pts1 = [pts1, ones(size(pts1, 1), 1)].';
pts2 = [pts2, ones(size(pts2, 1), 1)].';

% evaluate eight points fundamental matrix

epipolar_lines1_m = F_manual' * pts2;
epipolar_lines2_m = F_manual * pts1;

sed_manual = calculate_SED(epipolar_lines1_m, epipolar_lines2_m, pts1, pts2);

% evaluate camera parameters fundamental matrix

epipolar_lines1_c = F_camera' * pts2;
epipolar_lines2_c = F_camera * pts1;

sed_camera = calculate_SED(epipolar_lines1_c, epipolar_lines2_c, pts1, pts2);

fprintf('Eight-point fundamental matrix SED: %.12g\n', sed_manual);
fprintf('Camera-parameter fundamental matrix SED: %.12g\n', sed_camera);

end
