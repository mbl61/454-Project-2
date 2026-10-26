function recover_pts = task3_3 (camera_1, camera_2, mocap_data, pts2d_1, pts2d_2, testmode)

% this function recover 2D-points to 3D points by triangulation then compare with original points

camera_1_Pmat = camera_1.Pmat;
camera_2_Pmat = camera_2.Pmat;

camera_1_Kmat = camera_1.Kmat;
camera_2_Kmat = camera_2.Kmat;

recover_pts = zeros(0, 4);

% to homogenious coordinates

pts2d_1 = [pts2d_1; ones(1, size(pts2d_1, 2))];
pts2d_2 = [pts2d_2; ones(1, size(pts2d_2, 2))];

P1 = camera_1_Kmat * camera_1_Pmat;
P2 = camera_2_Kmat * camera_2_Pmat;

% iterate each pts
for i = 1:size(pts2d_1, 2)
    u1 = pts2d_1(1,i);
    v1 = pts2d_1(2,i);

    u2 = pts2d_2(1,i);
    v2 = pts2d_2(2,i);

    A = [
        u1 * P1(3,:) - P1(1,:);
        v1 * P1(3,:) - P1(2,:);
        u2 * P2(3,:) - P2(1,:);
        v2 * P2(3,:) - P2(2,:);
    ];
    
    [~,~,V] = svd(A);
    recover_pts(i,:) = V(:,4);
end

% normalize
recover_pts = recover_pts(:,1:3) ./ recover_pts(:,4);

if testmode
    % mean squared error of original pts and recover pts
    mocap_pts3D = mocap_data.pts3D;
    error = recover_pts - mocap_pts3D.';
    mse = mean(sum(error.^2, 2));
    fprintf('MSE: %.12g\n', mse);
end

end
