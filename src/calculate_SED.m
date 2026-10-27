function sed = calculate_SED(lines1, lines2, pts1, pts2)

% this function calculate mean squared symmetric epipolar distance
% lines = [a; b; c] * n
% ax + by + c = 0

% (ax + by + c)^2 / (a^2 + b^2)
error1 = (lines1(1,:) .* pts1(1,:) + lines1(2,:) .* pts1(2,:) + lines1(3,:)).^2 ./ (lines1(1,:).^2 + lines1(2,:).^2);
error2 = (lines2(1,:) .* pts2(1,:) + lines2(2,:) .* pts2(2,:) + lines2(3,:)).^2 ./ (lines2(1,:).^2 + lines2(2,:).^2);

sed = mean([error1, error2]);

end
