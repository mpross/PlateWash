function Attractor = jan13PreOffsetAssembly
	run3147PendulumParameters

	A = [jan13ScrewGaps;...
		jan13Attractor;...
		jan13Spindles;...
		jan14MacorSpindles;...
		jan14Flexure];

	Attractor = A;
end