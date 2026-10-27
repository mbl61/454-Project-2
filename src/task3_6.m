function [F, pts1, pts2] = task3_6(pts1, pts2)
% compute a 3*3 fundamental matrix using eight-point algorithm
% pts1 and pts2 size = 8*2

F = zeros(3,3);

%{
% Eight points give a huge error. To reduce the error, we add more points.
pts1 = [pts1; [1754, 115]; [1871, 940]];
pts2 = [pts2; [872, 44]; [1618, 560]];
%}

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

fprintf('----------------------------\n');
fprintf('Task3.6:\n');

fprintf('Fundamental matrix F from sampling points:\n');
fprintf('  % .12g % .12g  % .12g\n', F.');

fprintf('----------------------------\n');

% load images
img1 = imread('../Project2DataFiles/im1corrected.jpg');
img2 = imread('../Project2DataFiles/im2corrected.jpg');

% each point produces an epipolar line in the other images
pts1_h = [pts1, ones(size(pts1, 1), 1)].';
pts2_h = [pts2, ones(size(pts2, 1), 1)].';
lines1 = F.' * pts2_h;
lines2 = F * pts1_h;
colors = lines(size(pts1, 1));

figure('Name', 'Eight-point epipolar', 'NumberTitle', 'off', 'Position', [100, 100, 1400, 500]);
subplot(1, 2, 1);
draw_epipolar_lines(img1, pts1, lines1, colors);
title('Camera 1: epipolar lines from camera 2 points');
subplot(1, 2, 2);
draw_epipolar_lines(img2, pts2, lines2, colors);
title('Camera 2: epipolar lines from camera 1 points');

end
