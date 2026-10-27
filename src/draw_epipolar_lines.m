function draw_epipolar_lines(img, pts, epipolar_lines, colors)

% this function draws an epipolar line on img with colors
% epipolar_lines size = 3*n
% [a, b, c], line ax + by + c =0

imshow(img);
hold on;
height = size(img, 1);
width = size(img, 2);

% y = -(ax + c) / b
for i = 1:size(pts, 1)
    x = [1, width];
    y = -(epipolar_lines(1, i) * x + epipolar_lines(3, i)) / epipolar_lines(2, i);

    plot(x, y, '-', 'Color', colors(i, :), 'LineWidth', 1.5);

    plot(pts(i, 1), pts(i, 2), 'o', 'Color', colors(i, :), 'MarkerFaceColor', colors(i, :), 'MarkerSize', 7);
end

hold off;
end
