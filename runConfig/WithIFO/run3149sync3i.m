pwrunNumber  = '3149'
psrunNumber  = '3149';
iforunNumber = '3149';

FAKING_THE_INTERFEROMETER_ENTIRELY = 0;

preSync3

%psStartSec  = psStartSec+9*128;
%psEndSec    = psEndSec-100;
%psEndSec    = psEndSec - 86000*.8
%psStartSec  = psStartSec + 141000*.8 
pwEndSec    = pwStartSec + 233300; 
%pwStartSec  = pwStartSec + 6300;
%ifoEndSec   = ifoStartSec + 16000; 
%ifoStartSec = ifoStartSec + 4100;

sync3
