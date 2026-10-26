function plane = fit_plane(pts3d)
% fit Ax + By + Cz + D = 0 to non-collinear 3D points (see 3.4.md)

pts3d_mean = mean(pts3d, 1);
M = pts3d - pts3d_mean;

[~,~,V] = svd(M);
n = V(:,3);
n = n / norm(n);

% plane = [A,B,C,D], D = -n^T * p_mean
plane = [n.', -pts3d_mean * n];
end
