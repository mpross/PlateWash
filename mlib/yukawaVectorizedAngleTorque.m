%%% position, lambda, and alpha are row vectors %%%

function answer = yukawaVectorizedTorque(position, lambda, alpha, theta)

DoNotExtractPendulumParameters = 1;
run3147PendulumParameters

%Originally working:
%torque1 = inline('2*pi*G*h1*insetWidth*momentArm*(ph1-pl1)* y.^2*exp(-x./y)', 'x', 'y');
%             	  %Tantalum Term					    Aluminum term
%atorque1 = inline('pa1*torque1(x,y)*(1-exp(-1.0*a1/y))*(1-exp(-1.0*da1/y))+ pal1*torque1(x+da1,y)*(1-exp(-1.0*a1/y))*(1-exp(-1.0*dal1/y))','x','y');
%answer = alpha*(atorque1(position,lambda)-atorque1(position+thickness1-a1,lambda));


%Streamlined
%answer = alpha*2*pi*G*h1*insetWidth*momentArm*(ph1-pl1)*lambda.^2*(...
%		pa1  * exp(-position/lambda)                      * (1-exp(-1.0*a1./lambda)) .* (1-exp(-1.0 * da1  /. lambda)) + ...
%		pal1 * exp(-(position+da1)./lambda)               * (1-exp(-1.0*a1./lambda)) .* (1-exp(-1.0 * dal1 /. lambda)) - ...
%		pa1  * exp((a1-position-thickness1)/lambda)       * (1-exp(-1.0*a1./lambda)) .* (1-exp(-1.0 * da1  /. lambda)) + \ %%%% SHOULD BE MINUS?!?!?!
%		pal1 * exp(-(position+thickness1-a1+da1)./lambda) * (1-exp(-1.0*a1./lambda)) .* (1-exp(-1.0 * dal1 /. lambda)));

factors = - 2 * pi * G * h1;
Atten1  = (1-exp(-1.0 * a1   ./ lambda));
Atten2  = (1-exp(-1.0 * da1  ./ lambda));
Atten2l = (1-exp(-1.0 * dal1 ./ lambda));

alphaM = repmat(alpha, [length(lambda) 1 length(position)]);
alphaM = permute(alphaM, [3 1 2]);

%torque convention here presumes inlay on right side as viewed from attractor (note minus in factors)
preans = factors *  (...
		pa1  * repmat(Atten2 , length(position), 1).* (
				yukawaAnglePendulumCore( position, lambda, theta, j1, w1, a1, thickness1, ph1, pl1, 0) ...
		) + ... 
		pal1  * repmat(Atten2l , length(position), 1).* ( ...
				yukawaAnglePendulumCore( position, lambda, theta, j1, w1, a1, thickness1, ph1, pl1, da1) ...
		) ... 
	) ;

	answer = zeros(length(position), length(lambda), length(alpha));

	for i = 1:length(alpha)
		answer(:,:,i) = alphaM(:,:,i) .* preans;
	end

end 