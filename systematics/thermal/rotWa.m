%calibration drawn from gpl file, which is by-eye SWAG.
d = load('aveTempData/merge1.dat');
[s i] = sort(d(:,1));
d = d(i,:);
d(:,3) = 5.7868 * d(:,3) + 20.0722;
rotWa = resampleAndHold( [d(:,1), d(:,3)], 2 );

save 'rotWa.dat' rotWa
