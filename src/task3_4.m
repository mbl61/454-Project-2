function task3_4 (camera_1, camera_2)

% this function measures some points in scene
% see coordinate sampling in floor_points/ & wall_points/ & *_point/

% this part is for floor/wall function
floor_pts1 = [[977, 935]; [1514, 710]; [337, 707]];
floor_pts2 = [[1711, 698]; [1115, 533]; [934, 892]];

wall_pts1 = [[1153, 214]; [1396, 128]; [1426, 220]];
wall_pts2 = [[245, 73]; [565, 10]; [610, 107]];

floor_pts3d = task3_3(camera_1, camera_2, [], floor_pts1.', floor_pts2.', 0);
wall_pts3d = task3_3(camera_1, camera_2, [], wall_pts1.', wall_pts2.', 0);

floor_plane = fit_plane(floor_pts3d);
wall_plane = fit_plane(wall_pts3d);

fprintf('----------------------------\n');
fprintf('Task3.4:\n');

fprintf('Floor plane: %.12g x %+.12g y %+.12g z %+.12g = 0\n', floor_plane);

% compare with z = 0
floor_angle_deg = acosd(min(1, abs(floor_plane(3))));
floor_height_mse = mean(floor_pts3d(:,3).^2);
fprintf('Angle of floor: %.12g degrees\n', floor_angle_deg);
fprintf('Floor z MSE relative to z = 0: %.12g\n', floor_height_mse);

fprintf('----------------------------\n');

fprintf('Wall plane:  %.12g x %+.12g y %+.12g z %+.12g = 0\n', wall_plane);

fprintf('----------------------------\n');

% door height
door_pt1 = [1073, 301];
door_pt2 = [103, 187];

door_pt3d = task3_3(camera_1, camera_2, [], door_pt1.', door_pt2.', 0);
door_h = door_pt3d(3);

fprintf('Height of the door:  %.12g\n', door_h);

fprintf('----------------------------\n');

% person height
person_pt1 = [574, 395];
person_pt2 = [1037, 347];

person_pt3d = task3_3(camera_1, camera_2, [], person_pt1.', person_pt2.', 0);
person_h = person_pt3d(3);

fprintf('Height of the person:  %.12g\n', person_h);

fprintf('----------------------------\n');

% camera location
cam_pt1 = [1463, 254];
cam_pt2 = [721, 154];

cam_pt3d = task3_3(camera_1, camera_2, [], cam_pt1.', cam_pt2.', 0);

fprintf('Location of the camera:  (%.12g, %.12g, %.12g)\n', cam_pt3d);
fprintf('----------------------------\n');
end
