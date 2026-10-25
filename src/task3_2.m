function [pts2d_1, pts2d_2] = task3_2 (camera_1, camera_2, mocap_data)

% this function projects 3D-points to 2D pixels then draws on images

img1 = imread('../Project2DataFiles/im1corrected.jpg');
img2 = imread('../Project2DataFiles/im2corrected.jpg');

camera_1_Pmat = camera_1.Pmat;
camera_2_Pmat = camera_2.Pmat;

camera_1_Kmat = camera_1.Kmat;
camera_2_Kmat = camera_2.Kmat;

mocap_pts3D = mocap_data.pts3D; % size: 3*N

mocap_pts3D = [mocap_pts3D; ones(1, size(mocap_pts3D, 2))]; % size: 4*N

pts2d_1 = camera_1_Kmat * camera_1_Pmat * mocap_pts3D;

pts2d_2 = camera_2_Kmat * camera_2_Pmat * mocap_pts3D;

% homogenious coordinates to pixel coordinates

pts2d_1 = pts2d_1(1:2,:) ./ pts2d_1(3,:);
pts2d_2 = pts2d_2(1:2,:) ./ pts2d_2(3,:);

figure;

subplot(1, 2, 1);
imshow(img1);
hold on;
plot(pts2d_1(1,:), pts2d_1(2,:), 'r.', 'MarkerSize', 15);
title('Camera 1');
hold off;

subplot(1, 2, 2);
imshow(img2);
hold on;
plot(pts2d_2(1,:), pts2d_2(2,:), 'r.', 'MarkerSize', 15);
title('Camera 2');
hold off;

end
