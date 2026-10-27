function main()

% load camera patameters

data1 = load('../Project2DataFiles/Parameters_V1_1.mat');
data2 = load('../Project2DataFiles/Parameters_V2_1.mat');
camera_1 = data1.Parameters;
camera_2 = data2.Parameters;

% fprintf(fieldnames(camera_1));

camera_1_foclen = camera_1.foclen;
camera_2_foclen = camera_2.foclen;

camera_1_orientation = camera_1.orientation;
camera_2_orientation = camera_2.orientation;

camera_1_position = camera_1.position;
camera_2_position = camera_2.position;

camera_1_prinpoint = camera_1.prinpoint;
camera_2_prinpoint = camera_2.prinpoint;

camera_1_radial = camera_1.radial;
camera_2_radial = camera_2.radial;

camera_1_aspectratio = camera_1.aspectratio;
camera_2_aspectratio = camera_2.aspectratio;

camera_1_skew = camera_1.skew;
camera_2_skew = camera_2.skew;

camera_1_Pmat = camera_1.Pmat;
camera_2_Pmat = camera_2.Pmat;

camera_1_Rmat = camera_1.Rmat;
camera_2_Rmat = camera_2.Rmat;

camera_1_Kmat = camera_1.Kmat;
camera_2_Kmat = camera_2.Kmat;

task3_1(camera_1, camera_2);

% load mocap points

mocap_data = load('../Project2DataFiles/mocapPoints3D.mat');

mocap_pts3D = mocap_data.pts3D;

% project 3D-mocap-points to 2D pixels

[pts2d_1, pts2d_2] = task3_2(camera_1, camera_2, mocap_data);

% recover 2D pixels to 3D-mocap-pts

recover_pts = task3_3(camera_1, camera_2, mocap_data, pts2d_1, pts2d_2, 1);

% measure points in scene

task3_4(camera_1, camera_2)

% compute fundamental matrix from camera parameters

F_camera = task3_5(camera_1, camera_2);

% compute fundamental matrix from 8 points

F_manual = task3_6();

% evaluate both matrix with mocap points

task3_7(F_manual, F_camera, pts2d_1.', pts2d_2.');

end
