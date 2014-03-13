function X2 = chiSquareWSystematics( pM , x)
	global HOMEDIR
	columnNames;
	transpose(x)

%	[C A L BA BL B2A B2L] = x;
	C = x(1);
	L = x(2);
	A = x(3);
	BA = x(4);
	BL = x(5);
	B2L = x(6);
	B2A = x(7);

%	Nsyst = 3;
%	prototype = ones (Nsyst,1);
%	alphas = alphas*prototype;
%	lambdas = L*prototype;

%	alphas = [A; 0 ; 0];

	alphas =  [A; BA; B2A];
	lambdas = [L; BL; B2L]* 1e-4;
	slope = C * 1e-12;
	
	DoNotExtractFixedParameters = 1;
	run3147FixedParameters;

	x1Vec = pM(:,aCol);
	x2Vec = pM(:,bCol);
	sx1Vec = pM(:,aErrCol);
	sx2Vec = pM(:,bErrCol);

	YPF = YukPreFactor;
	BMat = [ones(rows(x1Vec),1) pM(:,magFieldCol)*YPF pM(:,magField2Col)*YPF ];
%	BMat = repmat([1 0 0], rows(x1Vec), 1) ; 
	sBMat =[zeros(rows(x1Vec),1) ones(rows(x1Vec),1)*0.01*YPF, ones(rows(x1Vec),1)*0.0001*YPF];

	[GBV varG] = evalYukawaSystematicAveAndVariance(x1Vec, x2Vec, sx1Vec, sx2Vec, BMat, sBMat, alphas, lambdas, slope);

	X2 = sum( (pM(:,torCol) - GBV ).^2  %lqr
		./(pM(:,torerrCol).^2 +varG )
		) %sum

	if(isnan(X2))
		error("X2 threw a NaN, bailing back up");
	end

	if(X2 < 0)
		error("Chi squared is less than zero. That is impossible! Go fix it!");
	end
end
