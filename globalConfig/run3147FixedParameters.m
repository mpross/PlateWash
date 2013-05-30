fprintf('# defining parameters ');

%From run3077free.m
fprintf('FREQUENCY IS NOT PROPERLY DEFINED. CHECK run3077free.m for provenance!!!! Post-fit best fit is 13.2 mHz');

pendulumF0=0.0128; 
pendulumF0Width = 4e-3;
pendulumQ=3500;
pendulumI=2.369e-6;
kappa=4*pi*pi*pendulumF0*pendulumF0*pendulumI;
psdWidth=1e-2;
focalLength=400e-3;
unBlind = 0 ;

%end 3077free.m

%units are seconds 
dTime = 55;   printInteger(dTime, 'extracted/dTime.tex');
pTime = 15;   printInteger(pTime, 'extracted/pTime.tex');
stepPeriod = 128; printInteger(stepPeriod, 'extracted/stepPeriod.tex');

weight = 1;

lockAve = 20;  printInteger(lockAve, 'extracted/lockAve.tex');

TheoSampleTime = 0.8; printDecimal(TheoSampleTime,'extracted/TheoSampleTime.tex', 1);

qTesterFreq1=3e-3;
qTesterWidth1=0.2e-3;
qTesterChunkCalibWidth1 = 0.5;

fitOneOmega = false;
doNotFitTwoOmega = 1

qTesterFreq   = 3*2e-3;
qTesterWidth  = 0.2e-3;
qTesterTorque = 1.678e-14;
printSigNumber(qTesterTorque, 'extracted/qTesterTorque.tex',3);

spikeChopWidth = 100/TheoSampleTime; % in samples

doNotRemoveSpikes = 1
%doNotFitTwoOmega = 1

fprintf('# setup ');
psSquareCol = 15;
torqueCol   = 16;
%torqueCol   = 23;
ifoDataCol  = 2;

fprintf('# filtering ');
Nfilt = 2560*3/0.8
Ncut = floor(Nfilt*1.5);


NyquistFrequency = 1.0/TheoSampleTime/2;
printSigNumber(NyquistFrequency, 'extracted/NyquistFrequency.tex', 3);

% FIR filter bandpass selection
% if changing these off integer millihertz, change print statements below.
filterLow        = 0.001; printInteger( 1000*filterLow       ,  'extracted/filterLow.tex');
filterHigh       = 0.1;   printInteger( 1000*filterHigh      ,  'extracted/filterHigh.tex');
filterSensorHigh = 0.2;   printInteger( 1000*filterSensorHigh,  'extracted/filterSensorHigh.tex');

printInteger( 1.0./filterHigh/2, 'extracted/filterHighLag.tex');

fprintf('# read Complete \n')

