Readme file:
Part 1:
I have split the function file into to two:
1. forwardkine.m
2. inversekine.m
   
Forward Kinematics code explanation:
1. The function takes user inputs for theta1, theta2, d3, and theta4, making sure
they are within specific ranges.
2. It calculates four transformation matrices (A01, A12, A23, A34) representing
the coordinate transformations between joints.
3. The transformation matrices are multiplied together to get the overall
transformation matrix T, representing the position and orientation of the endeffector
with respect to the robot's base.
4. The angles a, B, Y are calculated from the elements of T matrix to determine
the end-effector's position.
5. The function then prints the calculated values of the end-effector's position (x,
y, z) and Euler angles (a, B, Y).
Sample input:
Theta 1: 45
Theta 2: 60
D3 = 5 mm
Theta 4:20
Output should look like this:
x = 35.863.
y = 133.843.
z = 25.000.
a = 85.000.
B = -0.000.
Y = 180.000.

Inverse Kinematics code explanation:
1. The code takes inputs for the robot's desired (x, y, z) position and alpha (zaxis)
in degrees.
2. It checks if the given position is within the robot's workspace. If not, it
displays a message and exits.
3. It calculates the cosine of the second joint angle (theta2) using the x and y
coordinates provided.
4. Based on the calculated cosine, it finds two possible values for the second joint
angle (theta2) using arcsine.
5. Using the first and second joint angles, it calculates other values related to the
robot arm's geometry (k1, k2, theta1, and theta4).
6. It checks if the calculated joint angles and displacement (d3) fall within the
robot's allowable ranges. It then displays the joint angles and d3 values for two
possible solutions (a and b). If not in range, it displays a message indicating that
the position is outside of the robot's workspace.
Sample input:
x = 35.863.
y = 133.843.
z = 25.000.
a = 85.000.
Output for sample input:
theta1(a) = 45.000.
theta1(b) = 105.000.
theta2(a) = 59.999.
theta2(b) = -59.999.
d3 = 5.000.
theta4(a) = 25.000.
theta4(b) = -35.000.
