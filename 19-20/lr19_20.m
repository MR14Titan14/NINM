obych = [90.1915 90.1915 90.1915 89.3755 88.7574
        88.7436 88.7604 88.7606 88.7606 88.7606
        88.7606 88.7606 88.2080 88.2080 88.2080
        88.2080 88.2080 85.4176 87.9595 87.9595
        87.9595 87.3730 87.2770 87.8064 84.9640
        85.7480 85.7480 86.1091 85.7833 85.7024
        85.7024 85.7024 84.9471 85.1646 85.9543
        86.5621 87.9920 88.91 88.91 88.91
        90.01 88.80 89.54 90.69 91.6862
        91.2881 90.6944 89.5428 88.9062 88.9062
];
% disp(obych);

min_vals = min(obych);
max_vals = max(obych);

vxod = obych(:, 1:4);
% disp(vxod);

vixod = obych(:, 5);
% disp(vixod);

prognoz = newff(minmax(vxod'), [15 1], { 'purelin' 'purelin'});
% disp(prognoz);

prognoz = train(prognoz, vxod', vixod');

test = [91.4807 91.4807 91.4807 91.4807 91.4807
        91.4807 91.4807 91.4807 90.6944 90.6944
        90.6944 90.6944 90.6944 90.6944 90.6944
        90.6944 91.1127 91.1127 91.1127 91.1127];

test_vxod = test(:, 1:4);
% disp("test_vxod");
% disp(test_vxod);

test_vixod = test(:, 5);
disp("test_vixod");
disp(test_vixod);

pred = sim(prognoz, test_vxod');
disp(pred);