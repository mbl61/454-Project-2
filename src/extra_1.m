function extra_1 (camera_1, camera_2, mocap_data, img1, img2)

% this function crop the images to focus on person, calculate new fundamental matrix, then demonstrate mocap points and new epipolar lines.

camera_1_Kmat = camera_1.Kmat;
camera_2_Kmat = camera_2.Kmat;

% cutting corner of the img1/img2
top_left = [[515, 374]; [935, 328]];
bottom_right = [[748, 728]; [1139, 785]];

img1 = img1(top_left(1,2):bottom_right(1,2), top_left(1,1):bottom_right(1,1), :);
img2 = img2(top_left(2,2):bottom_right(2,2), top_left(2,1):bottom_right(2,1), :);

% transform matrix (see report for details)
T1 = [[1, 0, 1 - top_left(1,1)]; [0, 1, 1 - top_left(1,2)]; [0, 0, 1]];
T2 = [[1, 0, 1 - top_left(2,1)]; [0, 1, 1 - top_left(2,2)]; [0, 0, 1]];

camera_1_Kmat = T1 * camera_1_Kmat;
camera_2_Kmat = T2 * camera_2_Kmat;

camera_1.Kmat = camera_1_Kmat;
camera_2.Kmat = camera_2_Kmat;

[crop_pts2d_1, crop_pts2d_2] = task3_2(camera_1, camera_2, mocap_data, img1, img2);

F_crop = task3_5(camera_1, camera_2, crop_pts2d_1.', crop_pts2d_2.', img1, img2, 0);

fprintf('----------------------------\n');
fprintf('Extra 1:\n');

fprintf('Fundamental matrix F from cropped image:\n');
fprintf('  % .12g % .12g  % .12g\n', F_crop.');

fprintf('----------------------------\n');

end
