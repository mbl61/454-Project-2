function [F, pts1, pts2] = task3_6()
% compute a 3*3 fundamental matrix using eight-point algorithm
% pts1 and pts2 size = 8*2

F = zeros(3,3);

% see sampling points in eight_points/
pts1 = [[979, 935]; [337, 709]; [1514, 710]; [1124, 298]; [1274, 235]; [1454, 358]; [1463, 256]; [577, 392]];
pts2 = [[1712, 698]; [935, 892]; [1108, 530]; [217, 185]; [437, 113]; [698, 251]; [716, 155]; [1042, 346]];

% normalize points
mu1 = mean(pts1, 1);
mu2 = mean(pts2, 1);

sigma1 = std(pts1, 1, 1);
sigma2 = std(pts2, 1, 1);

pts1_n = (pts1 - mu1) ./ sigma1;
pts2_n = (pts2 - mu2) ./ sigma2;

T1 = [1 / sigma1(1), 0, -mu1(1) / sigma1(1); 0, 1 / sigma1(2), -mu1(2) / sigma1(2); 0, 0, 1];
T2 = [1 / sigma2(1), 0, -mu2(1) / sigma2(1); 0, 1 / sigma2(2), -mu2(2) / sigma2(2); 0, 0, 1];

% this formula is from slides
A = zeros(size(pts1_n,1), 9);
for i = 1:size(pts1_n, 1)
    A(i,:) = [pts1_n(i,1)*pts2_n(i,1), pts1_n(i,1)*pts2_n(i,2), pts1_n(i,1), pts1_n(i,2)*pts2_n(i,1), pts1_n(i,2)*pts2_n(i,2), pts1_n(i,2), pts2_n(i,1), pts2_n(i,2), 1];
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

% denormalize

F = T2' * F * T1;

F = F / norm(F);

end
