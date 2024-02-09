function inversekine()
    l1 = 80;
    l2 = 80;
    x = input('Please input a value for x [mm]: ');
    y = input('Please input a value for y [mm]: ');
    z = input('Please input a value for z [mm]: ');
    a = input('Please input a value for alpha (about z axis) [degrees]: ');
    c2 = ((x^2+y^2)/12800) -1;
    if any(c2 < -1) || any(c2 > 1)
        disp('Position is outside of workspace.');
        return;
    end
    s2 = [sqrt(1-(c2.*c2)), -sqrt(1-(c2.*c2))];
    theta2 = atan2d(s2, c2);
    k1 = l1 + l2*c2;
    k2 = l2*s2;
    theta1 = atan2d(y,x) - atan2d(k2,k1);
    theta4 = theta1 + theta2 - a;
    d3 = 30 - z;
    pos = (theta1 <= 135 & theta1 >= -135) & (theta2 <= 135 & theta2 >= -135) & (d3 <= 35 & d3 >= -35) & (theta4 <= 150 & theta4 >= -150);
    if all(pos)
        fprintf("theta1(a)\t= %.3f.\n", theta1(1));
        fprintf("theta1(b)\t= %.3f.\n", theta1(2));
        fprintf("theta2(a)\t= %.3f.\n", theta2(1));
        fprintf("theta2(b)\t= %.3f.\n", theta2(2));
        fprintf("d3\t= %.3f.\n", d3);
        fprintf("theta4(a)\t= %.3f.\n", theta4(1));
        fprintf("theta4(b)\t= %.3f.\n", theta4(2));
    else
        disp('Position is outside of workspace.');
        return;
    end
end
