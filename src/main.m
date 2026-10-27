function main()

% load camera patameters

data1 = load('../Project2DataFiles/Parameters_V1_1.mat');
data2 = load('../Project2DataFiles/Parameters_V2_1.mat');
img1 = imread('../Project2DataFiles/im1corrected.jpg');
img2 = imread('../Project2DataFiles/im2corrected.jpg');
camera_1 = data1.Parameters;
camera_2 = data2.Parameters;

% eight points for task3.5, 3.6,
% see sampling points in eight_points/
eight_pts1 = [[979, 935]; [337, 709]; [1514, 710]; [1124, 298]; [1274, 235]; [1454, 358]; [1463, 256]; [577, 392]];
eight_pts2 = [[1712, 698]; [935, 892]; [1108, 530]; [217, 185]; [437, 113]; [698, 251]; [716, 155]; [1042, 346]];

% Eight points give a huge error. To reduce the error, we add more points.
eight_pts1 = [eight_pts1; [1754, 115]; [1871, 940]];
eight_pts2 = [eight_pts2; [872, 44]; [1618, 560]];

% load mocap points
mocap_data = load('../Project2DataFiles/mocapPoints3D.mat');

% display camera parameters
task3_1(camera_1, camera_2);

% project 3D-mocap-points to 2D pixels

[pts2d_1, pts2d_2] = task3_2(camera_1, camera_2, mocap_data, img1, img2);

% recover 2D pixels to 3D-mocap-pts

recover_pts = task3_3(camera_1, camera_2, mocap_data, pts2d_1, pts2d_2, 1);

% measure points in scene

task3_4(camera_1, camera_2)

% compute fundamental matrix from camera parameters

F_camera = task3_5(camera_1, camera_2, eight_pts1, eight_pts2, img1, img2, 1);

% compute fundamental matrix from 8 points

F_manual = task3_6(eight_pts1, eight_pts2, img1, img2);

% evaluate both matrix with mocap points

task3_7(F_manual, F_camera, pts2d_1, pts2d_2);

% project mocap points and draw epipolar lines on the cropped views
extra_1(camera_1, camera_2, mocap_data, img1, img2);

end
