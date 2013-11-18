more off;

P = [1 , 0, 0, 0];;


t = defineFaceTranslation;


attractors = { "imageTarget" }


for attrCtr = 1:rows(attractors); 

	attrString = char(attractors(attrCtr));

	A = eval(attrString);

	for ctr = 1:rows(t)

		ctr

		At = rotatePMArray(A, t(ctr, 1), t(ctr, 2:4));

		At = translatePMArray(At, t(ctr, 5:7)); 

		[force(ctr, :) torque(ctr,:)] = pointMatrixGravity(P,At);

%		if (mod(ctr,10) == 1 )
			displayPoints(P,At);
			pause(0.1);
%		end

		save -text 'temp.dat' force torque;

	end

	outString = [ 'SimulationOutput/face' attrString '.dat' ];

	outMatrix = [t force torque];
	save ("-text" , outString, "outMatrix")

end