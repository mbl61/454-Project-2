# 454-Project-2

This repository is located at `https://github.com/mbl61/454-Project-2`

## How to use

```
cd src\
main
```

## Expected Output:
```
>> main
----------------------------
Task 3.1:
Camera 1 Internal Parameters:
   Focal Length (f): 1560.6793
   Principal Point (cx, cy): [967.5391, 548.7386]
   Aspect Ratio (a): 1.0000
   Skew (s): 0.0000

Camera 1 External Parameters:
   Position (C): [-4479.6412, 5524.6708, 1899.0398]

Difference between camera 1 Kmat and calculated Kmat:
     0     0     0
     0     0     0
     0     0     0

Difference between camera 1 Pmat and calculated extrinsic matrix [R, -R*C]:
   1.0e-12 *

         0         0         0   -0.0568
         0         0         0    0.1137
         0         0         0   -0.9095

----------------------------
Camera 2 Internal Parameters:
   Focal Length (f): 1527.9015
   Principal Point (cx, cy): [969.8920, 549.8908]
   Aspect Ratio (a): 1.0000
   Skew (s): 0.0000

Camera 2 External Parameters:
   Position (C): [4416.8864, 5513.7913, 1788.9126]

Difference between camera 2 Kmat and calculated Kmat:
     0     0     0
     0     0     0
     0     0     0

Difference between camera 2 Pmat and calculated extrinsic matrix [R, -R*C]:
   1.0e-12 *

         0         0         0    0.1137
         0         0         0   -0.0568
         0         0         0         0

----------------------------
----------------------------
Task 3.3:
MSE: 1.90673637192e-19
----------------------------
----------------------------
Task3.4:
Floor plane: -0.00968267554634 x +0.00013175429035 y -0.999953113118 z -15.354960171 = 0
Angle of floor: 0.554836472576 degrees
Floor z MSE relative to z = 0: 452.228924497
----------------------------
Wall plane:  -0.00498018623374 x -0.999408337944 y -0.0340319231605 z -5443.91062183 = 0
----------------------------
Height of the door:  2034.38094948
----------------------------
Height of the person:  1461.55747953
----------------------------
Location of the camera:  (-76.0242317842, -4893.79832156, 2417.60305729)
----------------------------
----------------------------
Task3.5:
Fundamental matrix F from camera:
  -6.31827085133e-08  1.2860877451e-06  -0.000397113266345
   1.519919331e-06  2.14609931138e-07   0.0013208998864
  -0.000197388614484 -0.00446132271135   0.99998907754
----------------------------
----------------------------
Task3.6:
Fundamental matrix F from sampling points:
  -5.61771352264e-08  1.19221884596e-06  -0.000373151893453
   1.51798535191e-06  3.35650991204e-07   0.0011598208234
  -0.000218875280352 -0.00430629245428   0.99998996172
----------------------------
----------------------------
Task 3.7:
Eight-point fundamental matrix SED: 1.91669483902
Camera-parameter fundamental matrix SED: 1.73062429689e-26
----------------------------
----------------------------
Extra 1:
Fundamental matrix F from cropped image:
  -9.94740773456e-06  0.000202480069057   0.00789107510378
   0.000239294225665  3.378792298e-05   0.343560976928
   0.0378817128513 -0.502220112294  -0.811291647511
----------------------------
```

The expected output figures are in
```
\figures\
```