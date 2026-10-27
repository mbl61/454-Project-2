function F = task3_5(camera_1, camera_2)
% compute a 3*3 fundamental matrix from two camera parameter 

R = camera_2.Rmat*camera_1.Rmat';
T = camera_1.Rmat*(camera_2.position(:)-camera_1.position(:));

T_cross_p = [ 0, -T(3), T(2);
            T(3), 0, -T(1);
            -T(2), T(1), 0];

E_matrix = R * T_cross_p;

F_matrix = inv(camera_2.Kmat)' * E_matrix * inv(camera_1.Kmat);

F = F_matrix / norm(F_matrix);

end
