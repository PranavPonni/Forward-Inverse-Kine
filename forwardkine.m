function forwardkine()
    theta1 = Input('theta1', -135, 135);
    theta2 = Input('theta2', -135, 135);
    d3 = Input('d3', -35, 35);
    theta4 = Input('theta4', -150, 150);
    A01 = [cosd(theta1) -sind(theta1) 0 0; sind(theta1) cosd(theta1) 0 0; 0 0 1 30; 0 0 0 1];
    A12 = [cosd(theta2) -sind(theta2) 0 80; sind(theta2) cosd(theta2) 0 0; 0 0 1 0; 0 0 0 1];
    A23 = [1 0 0 80; 0 1 0 0; 0 0 1 -d3; 0 0 0 1];
    A34 = [cosd(theta4) -sind(theta4) 0 0; -sind(theta4) -cosd(theta4) 0 0; 0 0 -1 0; 0 0 0 1];
    T = A01 * A12 * A23 * A34;
    B = atan2d(-T(3, 1), sqrt(T(1, 1)^2 + T(2, 1)^2));
    Y = atan2d(T(3, 2) / cos(B), T(3, 3) / cos(B));
    a = atan2d(T(2, 1) / cos(B), T(1, 1) / cos(B));
    fprintf("x\t\t= %.3f.\n", T(1, 4));
    fprintf("y\t\t= %.3f.\n", T(2, 4));
    fprintf("z\t\t= %.3f.\n", T(3, 4));
    fprintf("a\t= %.3f.\n", a);
    fprintf("B\t= %.3f.\n", B);
    fprintf("Y\t= %.3f.\n", Y);
end

function value = Input(prompt, lowerBound, upperBound)
    while true
        value = input(['Please input a value between ', num2str(lowerBound), ' and ', num2str(upperBound), ' for ', prompt, ' [degrees]: ']);
        if value <= upperBound && value >= lowerBound
            break;
        end
        disp('Value is out of bounds.');
    end
end
