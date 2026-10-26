function [F, pts1, pts2] = task3_6()
% compute a 3*3 fundamental matrix using eight-point algorithm
% pts1 and pts2 size = 8*2

F = zeros(3,3);

% see sampling points in eight_points/
pts1 = [[979, 935]; [337, 709]; [1514, 710]; [1124, 298]; [1274, 235]; [1454, 358]; [1463, 256]; [577, 392]];
pts2 = [[1712, 698]; [935, 892]; [1108, 530]; [217, 185]; [437, 113]; [698, 251]; [716, 155]; [1042, 346]];

% this formula is from slides
A = zeros(size(pts1,1), 9);
for i = 1:size(pts1, 1)
    A(i,:) = [pts1(i,1)*pts2(i,1), pts1(i,1)*pts2(i,2), pts1(i,1), pts1(i,2)*pts2(i,1), pts1(i,2)*pts2(i,2), pts1(i,2), pts2(i,1), pts2(i,2), 1];
end

[~,~,V] = svd(A);

f_v = V(:,end);

for i = 1:3
    F(:,i) = f_v(3 * i - 2:3 * i);
end

% rank fundamental matrix to 2
[U,S,V] = svd(F);
S(3,3) = 0;
F = U * S * V';

F = F / norm(F);

end
