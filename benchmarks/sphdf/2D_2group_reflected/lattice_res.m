
% Increase counter:

if (exist('idx', 'var'));
  idx = idx + 1;
else;
  idx = 1;
end;

% Version, title and date:

VERSION                   (idx, [1:  13]) = 'Serpent 2.2.0' ;
COMPILE_DATE              (idx, [1:  20]) = 'Feb  9 2023 19:08:08' ;
DEBUG                     (idx, 1)        = 0 ;
TITLE                     (idx, [1:   8]) = 'Untitled' ;
CONFIDENTIAL_DATA         (idx, 1)        = 0 ;
INPUT_FILE_NAME           (idx, [1:   7]) = 'lattice' ;
WORKING_DIRECTORY         (idx, [1:  59]) = '/home/cluster/gburgio/Thesis/2DBasicModel/reflected_lattice' ;
HOSTNAME                  (idx, [1:   5]) = 'hmc02' ;
CPU_TYPE                  (idx, [1:  41]) = 'Intel(R) Xeon(R) Gold 6242R CPU @ 3.10GHz' ;
CPU_MHZ                   (idx, 1)        = 83898626.0 ;
START_DATE                (idx, [1:  24]) = 'Tue May 16 10:25:07 2023' ;
COMPLETE_DATE             (idx, [1:  24]) = 'Tue May 16 10:30:56 2023' ;

% Run parameters:

POP                       (idx, 1)        = 100000 ;
CYCLES                    (idx, 1)        = 100 ;
SKIP                      (idx, 1)        = 20 ;
BATCH_INTERVAL            (idx, 1)        = 1 ;
SRC_NORM_MODE             (idx, 1)        = 2 ;
SEED                      (idx, 1)        = 1684225507855 ;
UFS_MODE                  (idx, 1)        = 0 ;
UFS_ORDER                 (idx, 1)        = 1.00000 ;
NEUTRON_TRANSPORT_MODE    (idx, 1)        = 1 ;
PHOTON_TRANSPORT_MODE     (idx, 1)        = 0 ;
GROUP_CONSTANT_GENERATION (idx, 1)        = 1 ;
B1_CALCULATION            (idx, [1:  3])  = [ 1 0 1 ] ;
B1_BURNUP_CORRECTION      (idx, 1)        = 0 ;

CRIT_SPEC_MODE            (idx, 1)        = 2 ;
IMPLICIT_REACTION_RATES   (idx, 1)        = 1 ;

% Optimization:

OPTIMIZATION_MODE         (idx, 1)        = 4 ;
RECONSTRUCT_MICROXS       (idx, 1)        = 1 ;
RECONSTRUCT_MACROXS       (idx, 1)        = 1 ;
DOUBLE_INDEXING           (idx, 1)        = 0 ;
MG_MAJORANT_MODE          (idx, 1)        = 0 ;

% Parallelization:

MPI_TASKS                 (idx, 1)        = 1 ;
OMP_THREADS               (idx, 1)        = 75 ;
MPI_REPRODUCIBILITY       (idx, 1)        = 0 ;
OMP_REPRODUCIBILITY       (idx, 1)        = 1 ;
OMP_HISTORY_PROFILE       (idx, [1:  75]) = [  1.82938E+00  7.46188E-01  8.99201E-01  1.00934E+00  1.14790E+00  1.03354E+00  8.01977E-01  1.20552E+00  7.83048E-01  9.64515E-01  1.25487E+00  1.00634E+00  1.10329E+00  9.55603E-01  7.63218E-01  9.99113E-01  9.52441E-01  8.85534E-01  7.87141E-01  1.05243E+00  1.00887E+00  1.03299E+00  1.08226E+00  1.06278E+00  1.07302E+00  1.08471E+00  9.99363E-01  1.03887E+00  1.08194E+00  1.08213E+00  9.60072E-01  8.02609E-01  1.07833E+00  8.63154E-01  1.07208E+00  9.41048E-01  8.70891E-01  1.09557E+00  1.20560E+00  1.06270E+00  8.00959E-01  8.43187E-01  1.12567E+00  9.99606E-01  9.71840E-01  7.79354E-01  7.97796E-01  9.93213E-01  7.80566E-01  8.81984E-01  1.06238E+00  1.01490E+00  1.09896E+00  1.09575E+00  9.83507E-01  1.05213E+00  9.23293E-01  1.03597E+00  1.34354E+00  9.93463E-01  1.05893E+00  1.02230E+00  1.10105E+00  9.27724E-01  9.56809E-01  1.09429E+00  1.10214E+00  1.04602E+00  9.20031E-01  1.00024E+00  8.76653E-01  7.88547E-01  1.07960E+00  9.72852E-01  7.95178E-01  ];
SHARE_BUF_ARRAY           (idx, 1)        = 0 ;
SHARE_RES2_ARRAY          (idx, 1)        = 1 ;
OMP_SHARED_QUEUE_LIM      (idx, 1)        = 0 ;

% File paths:

XS_DATA_FILE_PATH         (idx, [1:  93]) = '/home/cluster/gburgio/Cross_Sections/ENDF7.1-edepmode/sss_endfb7_edepmode_photon_modded.xdata' ;
DECAY_DATA_FILE_PATH      (idx, [1:  77]) = '/home/cluster/gburgio/Cross_Sections/ENDF7.1-edepmode/sss_endfb7_edepmode.dec' ;
SFY_DATA_FILE_PATH        (idx, [1:  77]) = '/home/cluster/gburgio/Cross_Sections/ENDF7.1-edepmode/sss_endfb7_edepmode.nfy' ;
NFY_DATA_FILE_PATH        (idx, [1:  77]) = '/home/cluster/gburgio/Cross_Sections/ENDF7.1-edepmode/sss_endfb7_edepmode.nfy' ;
BRA_DATA_FILE_PATH        (idx, [1:   3]) = 'N/A' ;

% Collision and reaction sampling (neutrons/photons):

MIN_MACROXS               (idx, [1:   4]) = [  5.00000E-02 1.9E-09  0.00000E+00 0.0E+00 ];
DT_THRESH                 (idx, [1:   2]) = [  9.00000E-01  9.00000E-01 ] ;
ST_FRAC                   (idx, [1:   4]) = [  4.93446E-03 0.00113  0.00000E+00 0.0E+00 ];
DT_FRAC                   (idx, [1:   4]) = [  9.95066E-01 5.6E-06  0.00000E+00 0.0E+00 ];
DT_EFF                    (idx, [1:   4]) = [  9.38367E-01 3.4E-05  0.00000E+00 0.0E+00 ];
REA_SAMPLING_EFF          (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
REA_SAMPLING_FAIL         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_COL_EFF               (idx, [1:   4]) = [  9.38524E-01 3.4E-05  0.00000E+00 0.0E+00 ];
AVG_TRACKING_LOOPS        (idx, [1:   8]) = [  2.82309E+00 0.00026  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
DBRC_EXCEED_FRAC          (idx, 1)        =  1.66766E-06 ;
AVG_TRACKS                (idx, [1:   4]) = [  9.83092E+01 0.00040  0.00000E+00 0.0E+00 ];
AVG_REAL_COL              (idx, [1:   4]) = [  9.83092E+01 0.00040  0.00000E+00 0.0E+00 ];
AVG_VIRT_COL              (idx, [1:   4]) = [  6.43941E+00 0.00041  0.00000E+00 0.0E+00 ];
AVG_SURF_CROSS            (idx, [1:   4]) = [  2.50611E-01 0.00097  0.00000E+00 0.0E+00 ];
LOST_PARTICLES            (idx, 1)        = 0 ;

% Run statistics:

CYCLE_IDX                 (idx, 1)        = 100 ;
SIMULATED_HISTORIES       (idx, 1)        = 9999852 ;
MEAN_POP_SIZE             (idx, [1:   2]) = [  9.99985E+04 0.00066 ] ;
MEAN_POP_WGT              (idx, [1:   2]) = [  9.99985E+04 0.00066 ] ;
SIMULATION_COMPLETED      (idx, 1)        = 1 ;

% Running times:

TOT_CPU_TIME              (idx, 1)        =  4.11158E+02 ;
RUNNING_TIME              (idx, 1)        =  5.80452E+00 ;
INIT_TIME                 (idx, [1:   2]) = [  1.37833E-01  1.37833E-01 ] ;
PROCESS_TIME              (idx, [1:   2]) = [  7.38333E-03  7.38333E-03 ] ;
TRANSPORT_CYCLE_TIME      (idx, [1:   3]) = [  5.65928E+00  5.65928E+00  0.00000E+00 ] ;
MPI_OVERHEAD_TIME         (idx, [1:   2]) = [  0.00000E+00  0.00000E+00 ] ;
LEAKAGE_CORR_SOL_TIME     (idx, 1)        =  6.66698E-05 ;
ESTIMATED_RUNNING_TIME    (idx, [1:   2]) = [  5.80313E+00  0.00000E+00 ] ;
CPU_USAGE                 (idx, 1)        = 70.83415 ;
TRANSPORT_CPU_USAGE       (idx, [1:   2]) = [  7.26386E+01 0.00029 ];
OMP_PARALLEL_FRAC         (idx, 1)        =  8.82187E-01 ;

% Memory usage:

AVAIL_MEM                 (idx, 1)        = 772466.14 ;
ALLOC_MEMSIZE             (idx, 1)        = 4773.87 ;
MEMSIZE                   (idx, 1)        = 4030.49 ;
XS_MEMSIZE                (idx, 1)        = 3257.26 ;
MAT_MEMSIZE               (idx, 1)        = 96.71 ;
RES_MEMSIZE               (idx, 1)        = 7.36 ;
IFC_MEMSIZE               (idx, 1)        = 0.00 ;
MISC_MEMSIZE              (idx, 1)        = 669.15 ;
UNKNOWN_MEMSIZE           (idx, 1)        = 0.00 ;
UNUSED_MEMSIZE            (idx, 1)        = 743.38 ;

% Geometry parameters:

TOT_CELLS                 (idx, 1)        = 2 ;
UNION_CELLS               (idx, 1)        = 0 ;

% Neutron energy grid:

NEUTRON_ERG_TOL           (idx, 1)        =  0.00000E+00 ;
NEUTRON_ERG_NE            (idx, 1)        = 1150462 ;
NEUTRON_EMIN              (idx, 1)        =  1.00000E-11 ;
NEUTRON_EMAX              (idx, 1)        =  2.00000E+01 ;

% Unresolved resonance probability table sampling:

URES_DILU_CUT             (idx, 1)        =  1.00000E-09 ;
URES_EMIN                 (idx, 1)        =  1.50000E-03 ;
URES_EMAX                 (idx, 1)        =  1.49029E-01 ;
URES_AVAIL                (idx, 1)        = 10 ;
URES_USED                 (idx, 1)        = 4 ;

% Nuclides and reaction channels:

TOT_NUCLIDES              (idx, 1)        = 21 ;
TOT_TRANSPORT_NUCLIDES    (idx, 1)        = 21 ;
TOT_DOSIMETRY_NUCLIDES    (idx, 1)        = 0 ;
TOT_DECAY_NUCLIDES        (idx, 1)        = 0 ;
TOT_PHOTON_NUCLIDES       (idx, 1)        = 0 ;
TOT_REA_CHANNELS          (idx, 1)        = 413 ;
TOT_TRANSMU_REA           (idx, 1)        = 0 ;

% Neutron physics options:

USE_DELNU                 (idx, 1)        = 1 ;
USE_URES                  (idx, 1)        = 1 ;
USE_DBRC                  (idx, 1)        = 1 ;
IMPL_CAPT                 (idx, 1)        = 0 ;
IMPL_NXN                  (idx, 1)        = 1 ;
IMPL_FISS                 (idx, 1)        = 0 ;
DOPPLER_PREPROCESSOR      (idx, 1)        = 0 ;
TMS_MODE                  (idx, 1)        = 0 ;
SAMPLE_FISS               (idx, 1)        = 1 ;
SAMPLE_CAPT               (idx, 1)        = 1 ;
SAMPLE_SCATT              (idx, 1)        = 1 ;

% Energy deposition:

EDEP_MODE                 (idx, 1)        = 0 ;
EDEP_DELAYED              (idx, 1)        = 1 ;
EDEP_KEFF_CORR            (idx, 1)        = 1 ;
EDEP_LOCAL_EGD            (idx, 1)        = 0 ;
EDEP_COMP                 (idx, [1:   9]) = [ 0 0 0 0 0 0 0 0 0 ] ;
EDEP_CAPT_E               (idx, 1)        =  0.00000E+00 ;

% Radioactivity data:

TOT_ACTIVITY              (idx, 1)        =  0.00000E+00 ;
TOT_DECAY_HEAT            (idx, 1)        =  0.00000E+00 ;
TOT_SF_RATE               (idx, 1)        =  0.00000E+00 ;
ACTINIDE_ACTIVITY         (idx, 1)        =  0.00000E+00 ;
ACTINIDE_DECAY_HEAT       (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_ACTIVITY  (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_DECAY_HEAT(idx, 1)        =  0.00000E+00 ;
INHALATION_TOXICITY       (idx, 1)        =  0.00000E+00 ;
INGESTION_TOXICITY        (idx, 1)        =  0.00000E+00 ;
ACTINIDE_INH_TOX          (idx, 1)        =  0.00000E+00 ;
ACTINIDE_ING_TOX          (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_INH_TOX   (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_ING_TOX   (idx, 1)        =  0.00000E+00 ;
SR90_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
TE132_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
I131_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
I132_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
CS134_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
CS137_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
PHOTON_DECAY_SOURCE       (idx, [1:   2]) = [  0.00000E+00  0.00000E+00 ] ;
NEUTRON_DECAY_SOURCE      (idx, 1)        =  0.00000E+00 ;
ALPHA_DECAY_SOURCE        (idx, 1)        =  0.00000E+00 ;
ELECTRON_DECAY_SOURCE     (idx, 1)        =  0.00000E+00 ;

% Normalization coefficient:

NORM_COEF                 (idx, [1:   4]) = [  7.49347E+08 0.00036  0.00000E+00 0.0E+00 ];

% Analog reaction rate estimators:

CONVERSION_RATIO          (idx, [1:   2]) = [  1.15474E-02 0.00414 ];
U235_FISS                 (idx, [1:   4]) = [  3.07795E+13 0.00033  9.97619E-01 2.5E-05 ];
U238_FISS                 (idx, [1:   4]) = [  4.29020E+10 0.01189  1.39045E-03 0.01183 ];
U235_CAPT                 (idx, [1:   4]) = [  7.21323E+12 0.00096  1.63557E-01 0.00092 ];
U238_CAPT                 (idx, [1:   4]) = [  2.78853E+11 0.00484  6.32272E-03 0.00479 ];

% Neutron balance (particles/weight):

BALA_SRC_NEUTRON_SRC      (idx, [1:   2]) = [ 0 0.00000E+00 ] ;
BALA_SRC_NEUTRON_FISS     (idx, [1:   2]) = [ 9999852 1.00000E+07 ] ;
BALA_SRC_NEUTRON_NXN      (idx, [1:   2]) = [ 0 2.82057E+03 ] ;
BALA_SRC_NEUTRON_VR       (idx, [1:   2]) = [ 0 0.00000E+00 ] ;
BALA_SRC_NEUTRON_TOT      (idx, [1:   2]) = [ 9999852 1.00028E+07 ] ;

BALA_LOSS_NEUTRON_CAPT    (idx, [1:   2]) = [ 5883786 5.88547E+06 ] ;
BALA_LOSS_NEUTRON_FISS    (idx, [1:   2]) = [ 4116066 4.11735E+06 ] ;
BALA_LOSS_NEUTRON_LEAK    (idx, [1:   2]) = [ 0 0.00000E+00 ] ;
BALA_LOSS_NEUTRON_CUT     (idx, [1:   2]) = [ 0 0.00000E+00 ] ;
BALA_LOSS_NEUTRON_ERR     (idx, [1:   2]) = [ 0 0.00000E+00 ] ;
BALA_LOSS_NEUTRON_TOT     (idx, [1:   2]) = [ 9999852 1.00028E+07 ] ;

BALA_NEUTRON_DIFF         (idx, [1:   2]) = [ 0 1.37463E-06 ] ;

% Normalized total reaction rates (neutrons):

TOT_POWER                 (idx, [1:   2]) = [  1.00000E+03 0.0E+00 ];
TOT_POWDENS               (idx, [1:   2]) = [  1.33726E-38 0.0E+00 ];
TOT_GENRATE               (idx, [1:   2]) = [  7.58079E+13 5.7E-06 ];
TOT_FISSRATE              (idx, [1:   2]) = [  3.08566E+13 1.7E-08 ];
TOT_CAPTRATE              (idx, [1:   2]) = [  4.41047E+13 0.00053 ];
TOT_ABSRATE               (idx, [1:   2]) = [  7.49613E+13 0.00031 ];
TOT_SRCRATE               (idx, [1:   2]) = [  7.49347E+13 0.00036 ];
TOT_FLUX                  (idx, [1:   2]) = [  4.57063E+15 0.00043 ];
TOT_PHOTON_PRODRATE       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_LEAKRATE              (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
ALBEDO_LEAKRATE           (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_LOSSRATE              (idx, [1:   2]) = [  7.49613E+13 0.00031 ];
TOT_CUTRATE               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_RR                    (idx, [1:   2]) = [  7.36868E+15 0.00058 ];
TOT_XE135_ABSRATE         (idx, [1:   2]) = [  6.06753E-26 0.00038 ];
TOT_XE135M_ABSRATE        (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
INI_FMASS                 (idx, 1)        =  7.47795E+34 ;
TOT_FMASS                 (idx, 1)        =  7.47795E+34 ;

% Equilibrium Xe-135 iteration:

I135_EQUIL_CONC           (idx, [1:   2]) = [  1.10231E-45 6.2E-08 ];
XE135_EQUIL_CONC          (idx, [1:   2]) = [  1.59616E-45 4.5E-08 ];
XE135M_EQUIL_CONC         (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];

% Six-factor formula:

SIX_FF_ETA                (idx, [1:   2]) = [  2.06771E+00 0.00026 ];
SIX_FF_F                  (idx, [1:   2]) = [  3.82767E-01 0.00049 ];
SIX_FF_P                  (idx, [1:   2]) = [  7.68732E-01 0.00017 ];
SIX_FF_EPSILON            (idx, [1:   2]) = [  1.66263E+00 0.00038 ];
SIX_FF_LF                 (idx, [1:   2]) = [  1.00000E+00 0.0E+00 ];
SIX_FF_LT                 (idx, [1:   2]) = [  1.00000E+00 0.0E+00 ];
SIX_FF_KINF               (idx, [1:   2]) = [  1.01155E+00 0.00044 ];
SIX_FF_KEFF               (idx, [1:   2]) = [  1.01155E+00 0.00044 ];

% Fission neutron and energy production:

NUBAR                     (idx, [1:   2]) = [  2.45679E+00 5.7E-06 ];
FISSE                     (idx, [1:   2]) = [  2.02275E+02 1.8E-08 ];

% Criticality eigenvalues:

ANA_KEFF                  (idx, [1:   6]) = [  1.01169E+00 0.00044  1.00455E+00 0.00044  7.00339E-03 0.00549 ];
IMP_KEFF                  (idx, [1:   2]) = [  1.01160E+00 0.00031 ];
COL_KEFF                  (idx, [1:   2]) = [  1.01167E+00 0.00036 ];
ABS_KEFF                  (idx, [1:   2]) = [  1.01160E+00 0.00031 ];
ABS_KINF                  (idx, [1:   2]) = [  1.01160E+00 0.00031 ];
GEOM_ALBEDO               (idx, [1:   6]) = [  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00 ];

% ALF (Average lethargy of neutrons causing fission):
% Based on E0 = 2.000000E+01 MeV

ANA_ALF                   (idx, [1:   2]) = [  1.55902E+01 0.00017 ];
IMP_ALF                   (idx, [1:   2]) = [  1.55934E+01 0.00011 ];

% EALF (Energy corresponding to average lethargy of neutrons causing fission):

ANA_EALF                  (idx, [1:   2]) = [  3.39195E-06 0.00266 ];
IMP_EALF                  (idx, [1:   2]) = [  3.38054E-06 0.00175 ];

% AFGE (Average energy of neutrons causing fission):

ANA_AFGE                  (idx, [1:   2]) = [  1.88262E-01 0.00194 ];
IMP_AFGE                  (idx, [1:   2]) = [  1.88133E-01 0.00063 ];

% Forward-weighted delayed neutron parameters:

PRECURSOR_GROUPS          (idx, 1)        = 6 ;
FWD_ANA_BETA_ZERO         (idx, [1:  14]) = [  6.45278E-03 0.00395  2.32173E-04 0.02090  1.16475E-03 0.00956  1.11452E-03 0.01032  2.49078E-03 0.00652  1.02480E-03 0.00999  4.25753E-04 0.01634 ];
FWD_ANA_LAMBDA            (idx, [1:  14]) = [  4.67568E-01 0.00654  1.33358E-02 2.2E-05  3.27366E-02 1.8E-05  1.20787E-01 1.2E-05  3.02847E-01 2.4E-05  8.49869E-01 6.0E-05  2.85398E+00 8.8E-05 ];

% Beta-eff using Meulekamp's method:

ADJ_MEULEKAMP_BETA_EFF    (idx, [1:  14]) = [  6.92774E-03 0.00560  2.43168E-04 0.02969  1.24850E-03 0.01277  1.21276E-03 0.01535  2.66388E-03 0.00872  1.10495E-03 0.01309  4.54489E-04 0.02512 ];
ADJ_MEULEKAMP_LAMBDA      (idx, [1:  14]) = [  4.66322E-01 0.00861  1.33354E-02 2.8E-05  3.27365E-02 3.4E-05  1.20786E-01 1.5E-05  3.02843E-01 3.5E-05  8.49861E-01 8.0E-05  2.85349E+00 9.6E-05 ];

% Adjoint weighted time constants using Nauchi's method:

IFP_CHAIN_LENGTH          (idx, 1)        = 15 ;
ADJ_NAUCHI_GEN_TIME       (idx, [1:   6]) = [  5.75115E-05 0.00126  5.75420E-05 0.00127  5.32435E-05 0.01429 ];
ADJ_NAUCHI_LIFETIME       (idx, [1:   6]) = [  5.81824E-05 0.00117  5.82134E-05 0.00118  5.38627E-05 0.01426 ];
ADJ_NAUCHI_BETA_EFF       (idx, [1:  14]) = [  6.93632E-03 0.00552  2.42314E-04 0.03501  1.26493E-03 0.01302  1.21294E-03 0.01573  2.65677E-03 0.00958  1.10309E-03 0.01459  4.56291E-04 0.02637 ];
ADJ_NAUCHI_LAMBDA         (idx, [1:  14]) = [  4.66011E-01 0.00934  1.33355E-02 2.4E-05  3.27372E-02 2.7E-05  1.20787E-01 1.7E-05  3.02843E-01 3.8E-05  8.49780E-01 7.0E-05  2.85362E+00 0.00013 ];

% Adjoint weighted time constants using IFP:

ADJ_IFP_GEN_TIME          (idx, [1:   6]) = [  5.61987E-05 0.00296  5.62206E-05 0.00293  5.29031E-05 0.04506 ];
ADJ_IFP_LIFETIME          (idx, [1:   6]) = [  5.68551E-05 0.00296  5.68773E-05 0.00294  5.35071E-05 0.04499 ];
ADJ_IFP_IMP_BETA_EFF      (idx, [1:  14]) = [  7.30580E-03 0.01896  2.63851E-04 0.11849  1.37042E-03 0.04616  1.25874E-03 0.04511  2.69489E-03 0.03148  1.22551E-03 0.05335  4.92389E-04 0.07460 ];
ADJ_IFP_IMP_LAMBDA        (idx, [1:  14]) = [  4.70454E-01 0.02650  1.33329E-02 0.00023  3.27386E-02 6.1E-05  1.20782E-01 1.4E-05  3.02823E-01 5.9E-05  8.49492E-01 0.00011  2.85434E+00 0.00033 ];
ADJ_IFP_ANA_BETA_EFF      (idx, [1:  14]) = [  7.30339E-03 0.01851  2.78423E-04 0.11320  1.36613E-03 0.04470  1.26656E-03 0.04428  2.69650E-03 0.03096  1.20761E-03 0.05328  4.88162E-04 0.07433 ];
ADJ_IFP_ANA_LAMBDA        (idx, [1:  14]) = [  4.67184E-01 0.02662  1.33329E-02 0.00023  3.27397E-02 4.8E-05  1.20782E-01 1.6E-05  3.02826E-01 5.9E-05  8.49533E-01 8.3E-05  2.85431E+00 0.00032 ];
ADJ_IFP_ROSSI_ALPHA       (idx, [1:   2]) = [ -1.30095E+02 0.01941 ];

% Adjoint weighted time constants using perturbation technique:

ADJ_PERT_GEN_TIME         (idx, [1:   2]) = [  5.69910E-05 0.00064 ];
ADJ_PERT_LIFETIME         (idx, [1:   2]) = [  5.76559E-05 0.00048 ];
ADJ_PERT_BETA_EFF         (idx, [1:   2]) = [  7.00166E-03 0.00343 ];
ADJ_PERT_ROSSI_ALPHA      (idx, [1:   2]) = [ -1.22857E+02 0.00342 ];

% Inverse neutron speed :

ANA_INV_SPD               (idx, [1:   2]) = [  1.62995E-06 0.00030 ];

% Analog slowing-down and thermal neutron lifetime (total/prompt/delayed):

ANA_SLOW_TIME             (idx, [1:   6]) = [  1.51601E-06 0.00035  1.51583E-06 0.00035  1.54336E-06 0.00411 ];
ANA_THERM_TIME            (idx, [1:   6]) = [  1.27468E-04 0.00044  1.27507E-04 0.00044  1.21259E-04 0.00509 ];
ANA_THERM_FRAC            (idx, [1:   6]) = [  7.68832E-01 0.00017  7.68969E-01 0.00017  7.48870E-01 0.00565 ];
ANA_DELAYED_EMTIME        (idx, [1:   2]) = [  1.10569E+01 0.00968 ];
ANA_MEAN_NCOL             (idx, [1:   4]) = [  9.83092E+01 0.00040  6.41400E+01 0.00068 ];

% Group constant generation:

GC_UNIVERSE_NAME          (idx, [1:   1]) = '0' ;

% Micro- and macro-group structures:

MICRO_NG                  (idx, 1)        = 70 ;
MICRO_E                   (idx, [1:  71]) = [  1.00000E+37  6.06550E+00  3.67900E+00  2.23100E+00  1.35300E+00  8.21000E-01  5.00000E-01  3.02500E-01  1.83000E-01  1.11000E-01  6.74300E-02  4.08500E-02  2.47800E-02  1.50300E-02  9.11800E-03  5.50000E-03  3.51910E-03  2.23945E-03  1.42510E-03  9.06898E-04  3.67262E-04  1.48728E-04  7.55014E-05  4.80520E-05  2.77000E-05  1.59680E-05  9.87700E-06  4.00000E-06  3.30000E-06  2.60000E-06  2.10000E-06  1.85500E-06  1.50000E-06  1.30000E-06  1.15000E-06  1.12300E-06  1.09700E-06  1.07100E-06  1.04500E-06  1.02000E-06  9.96000E-07  9.72000E-07  9.50000E-07  9.10000E-07  8.50000E-07  7.80000E-07  6.25000E-07  5.00000E-07  4.00000E-07  3.50000E-07  3.20000E-07  3.00000E-07  2.80000E-07  2.50000E-07  2.20000E-07  1.80000E-07  1.40000E-07  1.00000E-07  8.00000E-08  6.70000E-08  5.80000E-08  5.00000E-08  4.20000E-08  3.50000E-08  3.00000E-08  2.50000E-08  2.00000E-08  1.50000E-08  1.00000E-08  5.00000E-09  0.00000E+00 ];

MACRO_NG                  (idx, 1)        = 2 ;
MACRO_E                   (idx, [1:   3]) = [  1.00000E+37  6.25000E-07  0.00000E+00 ];

% Micro-group spectrum:

INF_MICRO_FLX             (idx, [1: 140]) = [  3.55846E+06 0.0E+00  1.52694E+07 0.0E+00  3.29958E+07 0.0E+00  4.10135E+07 0.0E+00  3.95858E+07 0.0E+00  3.63317E+07 0.0E+00  2.69996E+07 0.0E+00  1.99029E+07 0.0E+00  1.47310E+07 0.0E+00  1.09293E+07 0.0E+00  9.01193E+06 0.0E+00  7.62978E+06 0.0E+00  6.85752E+06 0.0E+00  6.28600E+06 0.0E+00  5.96494E+06 0.0E+00  5.21143E+06 0.0E+00  5.02577E+06 0.0E+00  4.80419E+06 0.0E+00  4.60767E+06 0.0E+00  8.69384E+06 0.0E+00  8.01083E+06 0.0E+00  5.67073E+06 0.0E+00  3.57067E+06 0.0E+00  4.19618E+06 0.0E+00  4.07299E+06 0.0E+00  3.54443E+06 0.0E+00  6.64478E+06 0.0E+00  1.48396E+06 0.0E+00  1.81059E+06 0.0E+00  1.76054E+06 0.0E+00  9.33986E+05 0.0E+00  1.72083E+06 0.0E+00  1.13504E+06 0.0E+00  8.79799E+05 0.0E+00  1.57360E+05 0.0E+00  1.56516E+05 0.0E+00  1.61117E+05 0.0E+00  1.66302E+05 0.0E+00  1.65793E+05 0.0E+00  1.64459E+05 0.0E+00  1.70705E+05 0.0E+00  1.61674E+05 0.0E+00  3.04640E+05 0.0E+00  4.90128E+05 0.0E+00  6.23237E+05 0.0E+00  1.62060E+06 0.0E+00  1.63853E+06 0.0E+00  1.62646E+06 0.0E+00  9.61092E+05 0.0E+00  6.45677E+05 0.0E+00  4.70268E+05 0.0E+00  5.19774E+05 0.0E+00  9.08412E+05 0.0E+00  1.21052E+06 0.0E+00  2.81601E+06 0.0E+00  6.67539E+06 0.0E+00  1.93533E+07 0.0E+00  2.13769E+07 0.0E+00  2.00301E+07 0.0E+00  1.82329E+07 0.0E+00  1.93692E+07 0.0E+00  2.25203E+07 0.0E+00  2.19681E+07 0.0E+00  1.67146E+07 0.0E+00  1.71692E+07 0.0E+00  1.68755E+07 0.0E+00  1.59322E+07 0.0E+00  1.35653E+07 0.0E+00  1.01777E+07 0.0E+00  4.00166E+06 0.0E+00 ];

% Integral parameters:

INF_KINF                  (idx, [1:   2]) = [  1.01167E+00 0.0E+00 ];

% Flux spectra in infinite geometry:

INF_FLX                   (idx, [1:   4]) = [  2.66160E+15 0.0E+00  1.90903E+15 0.0E+00 ];
INF_FISS_FLX              (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reaction cross sections:

INF_TOT                   (idx, [1:   4]) = [  5.20630E-01 0.0E+00  3.13403E+00 0.0E+00 ];
INF_CAPT                  (idx, [1:   4]) = [  1.95725E-03 0.0E+00  2.03743E-02 0.0E+00 ];
INF_ABS                   (idx, [1:   4]) = [  6.51933E-03 0.0E+00  3.01775E-02 0.0E+00 ];
INF_FISS                  (idx, [1:   4]) = [  4.56207E-03 0.0E+00  9.80317E-03 0.0E+00 ];
INF_NSF                   (idx, [1:   4]) = [  1.13493E-02 0.0E+00  2.38874E-02 0.0E+00 ];
INF_NUBAR                 (idx, [1:   4]) = [  2.48774E+00 0.0E+00  2.43670E+00 0.0E+00 ];
INF_KAPPA                 (idx, [1:   4]) = [  2.02283E+02 0.0E+00  2.02270E+02 0.0E+00 ];
INF_INVV                  (idx, [1:   4]) = [  4.00221E-08 0.0E+00  3.84667E-06 0.0E+00 ];

% Total scattering cross sections:

INF_SCATT0                (idx, [1:   4]) = [  5.14111E-01 0.0E+00  3.10385E+00 0.0E+00 ];
INF_SCATT1                (idx, [1:   4]) = [  2.68596E-01 0.0E+00  6.46196E-01 0.0E+00 ];
INF_SCATT2                (idx, [1:   4]) = [  1.02955E-01 0.0E+00  1.08379E-01 0.0E+00 ];
INF_SCATT3                (idx, [1:   4]) = [  5.39455E-03 0.0E+00  2.96570E-02 0.0E+00 ];
INF_SCATT4                (idx, [1:   4]) = [ -1.32849E-02 0.0E+00 -2.61070E-02 0.0E+00 ];
INF_SCATT5                (idx, [1:   4]) = [ -7.11967E-04 0.0E+00  1.35640E-02 0.0E+00 ];
INF_SCATT6                (idx, [1:   4]) = [  5.04255E-03 0.0E+00 -3.57616E-02 0.0E+00 ];
INF_SCATT7                (idx, [1:   4]) = [  4.49655E-04 0.0E+00  1.05454E-02 0.0E+00 ];

% Total scattering production cross sections:

INF_SCATTP0               (idx, [1:   4]) = [  5.14119E-01 0.0E+00  3.10385E+00 0.0E+00 ];
INF_SCATTP1               (idx, [1:   4]) = [  2.68596E-01 0.0E+00  6.46196E-01 0.0E+00 ];
INF_SCATTP2               (idx, [1:   4]) = [  1.02955E-01 0.0E+00  1.08379E-01 0.0E+00 ];
INF_SCATTP3               (idx, [1:   4]) = [  5.39459E-03 0.0E+00  2.96570E-02 0.0E+00 ];
INF_SCATTP4               (idx, [1:   4]) = [ -1.32849E-02 0.0E+00 -2.61070E-02 0.0E+00 ];
INF_SCATTP5               (idx, [1:   4]) = [ -7.11994E-04 0.0E+00  1.35640E-02 0.0E+00 ];
INF_SCATTP6               (idx, [1:   4]) = [  5.04262E-03 0.0E+00 -3.57616E-02 0.0E+00 ];
INF_SCATTP7               (idx, [1:   4]) = [  4.49610E-04 0.0E+00  1.05454E-02 0.0E+00 ];

% Diffusion parameters:

INF_TRANSPXS              (idx, [1:   4]) = [  1.76856E-01 0.0E+00  2.14687E+00 0.0E+00 ];
INF_DIFFCOEF              (idx, [1:   4]) = [  1.88477E+00 0.0E+00  1.55265E-01 0.0E+00 ];

% Reduced absoption and removal:

INF_RABSXS                (idx, [1:   4]) = [  6.51138E-03 0.0E+00  3.01775E-02 0.0E+00 ];
INF_REMXS                 (idx, [1:   4]) = [  2.82389E-02 0.0E+00  3.02821E-02 0.0E+00 ];

% Poison cross sections:

INF_I135_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_XE135_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM147_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148M_YIELD          (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM149_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_SM149_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_I135_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_XE135_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM147_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148M_MICRO_ABS      (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM149_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_SM149_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_I135_MACRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_XE135_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM147_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148M_MACRO_ABS      (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM149_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_SM149_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Poison universe-averaged densities:

I135_ADENS                (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
XE135_ADENS               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
PM147_ADENS               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
PM148_ADENS               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
PM148M_ADENS              (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
PM149_ADENS               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
SM149_ADENS               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];

% Poison decay constants:

PM147_LAMBDA              (idx, 1)        =  8.37254E-09 ;
PM148_LAMBDA              (idx, 1)        =  1.49451E-06 ;
PM148M_LAMBDA             (idx, 1)        =  1.94297E-07 ;
PM149_LAMBDA              (idx, 1)        =  3.62737E-06 ;
I135_LAMBDA               (idx, 1)        =  2.93061E-05 ;
XE135_LAMBDA              (idx, 1)        =  2.10657E-05 ;
XE135M_LAMBDA             (idx, 1)        =  7.55556E-04 ;
I135_BR                   (idx, 1)        =  9.01450E-01 ;

% Fission spectra:

INF_CHIT                  (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_CHIP                  (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_CHID                  (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Scattering matrixes:

INF_S0                    (idx, [1:   8]) = [  4.92391E-01 0.0E+00  2.17199E-02 0.0E+00  1.07259E-04 0.0E+00  3.10375E+00 0.0E+00 ];
INF_S1                    (idx, [1:   8]) = [  2.61962E-01 0.0E+00  6.63330E-03 0.0E+00  7.30109E-05 0.0E+00  6.46123E-01 0.0E+00 ];
INF_S2                    (idx, [1:   8]) = [  1.05152E-01 0.0E+00 -2.19681E-03 0.0E+00  4.64252E-05 0.0E+00  1.08333E-01 0.0E+00 ];
INF_S3                    (idx, [1:   8]) = [  7.97700E-03 0.0E+00 -2.58246E-03 0.0E+00  2.41391E-05 0.0E+00  2.96329E-02 0.0E+00 ];
INF_S4                    (idx, [1:   8]) = [ -1.26524E-02 0.0E+00 -6.32532E-04 0.0E+00  7.84602E-06 0.0E+00 -2.61148E-02 0.0E+00 ];
INF_S5                    (idx, [1:   8]) = [ -9.53902E-04 0.0E+00  2.41935E-04 0.0E+00 -1.43334E-06 0.0E+00  1.35654E-02 0.0E+00 ];
INF_S6                    (idx, [1:   8]) = [  5.22567E-03 0.0E+00 -1.83123E-04 0.0E+00 -5.49334E-06 0.0E+00 -3.57561E-02 0.0E+00 ];
INF_S7                    (idx, [1:   8]) = [  7.97010E-04 0.0E+00 -3.47356E-04 0.0E+00 -6.60235E-06 0.0E+00  1.05520E-02 0.0E+00 ];

% Scattering production matrixes:

INF_SP0                   (idx, [1:   8]) = [  4.92399E-01 0.0E+00  2.17199E-02 0.0E+00  1.07259E-04 0.0E+00  3.10375E+00 0.0E+00 ];
INF_SP1                   (idx, [1:   8]) = [  2.61963E-01 0.0E+00  6.63330E-03 0.0E+00  7.30109E-05 0.0E+00  6.46123E-01 0.0E+00 ];
INF_SP2                   (idx, [1:   8]) = [  1.05151E-01 0.0E+00 -2.19681E-03 0.0E+00  4.64252E-05 0.0E+00  1.08333E-01 0.0E+00 ];
INF_SP3                   (idx, [1:   8]) = [  7.97704E-03 0.0E+00 -2.58246E-03 0.0E+00  2.41391E-05 0.0E+00  2.96329E-02 0.0E+00 ];
INF_SP4                   (idx, [1:   8]) = [ -1.26524E-02 0.0E+00 -6.32532E-04 0.0E+00  7.84602E-06 0.0E+00 -2.61148E-02 0.0E+00 ];
INF_SP5                   (idx, [1:   8]) = [ -9.53929E-04 0.0E+00  2.41935E-04 0.0E+00 -1.43334E-06 0.0E+00  1.35654E-02 0.0E+00 ];
INF_SP6                   (idx, [1:   8]) = [  5.22575E-03 0.0E+00 -1.83123E-04 0.0E+00 -5.49334E-06 0.0E+00 -3.57561E-02 0.0E+00 ];
INF_SP7                   (idx, [1:   8]) = [  7.96966E-04 0.0E+00 -3.47356E-04 0.0E+00 -6.60235E-06 0.0E+00  1.05520E-02 0.0E+00 ];

% Micro-group spectrum:

B1_MICRO_FLX              (idx, [1: 140]) = [  3.56155E+06 0.0E+00  1.53029E+07 0.0E+00  3.30772E+07 0.0E+00  4.11161E+07 0.0E+00  3.96774E+07 0.0E+00  3.63934E+07 0.0E+00  2.70404E+07 0.0E+00  1.99273E+07 0.0E+00  1.47463E+07 0.0E+00  1.09393E+07 0.0E+00  9.01851E+06 0.0E+00  7.63469E+06 0.0E+00  6.86095E+06 0.0E+00  6.28850E+06 0.0E+00  5.96672E+06 0.0E+00  5.21247E+06 0.0E+00  5.02637E+06 0.0E+00  4.80440E+06 0.0E+00  4.60754E+06 0.0E+00  8.69265E+06 0.0E+00  8.00879E+06 0.0E+00  5.66875E+06 0.0E+00  3.56921E+06 0.0E+00  4.19423E+06 0.0E+00  4.07086E+06 0.0E+00  3.54238E+06 0.0E+00  6.64037E+06 0.0E+00  1.48288E+06 0.0E+00  1.80923E+06 0.0E+00  1.75915E+06 0.0E+00  9.33240E+05 0.0E+00  1.71940E+06 0.0E+00  1.13407E+06 0.0E+00  8.79056E+05 0.0E+00  1.57227E+05 0.0E+00  1.56384E+05 0.0E+00  1.60981E+05 0.0E+00  1.66160E+05 0.0E+00  1.65651E+05 0.0E+00  1.64318E+05 0.0E+00  1.70558E+05 0.0E+00  1.61534E+05 0.0E+00  3.04376E+05 0.0E+00  4.89700E+05 0.0E+00  6.22688E+05 0.0E+00  1.61915E+06 0.0E+00  1.63704E+06 0.0E+00  1.62495E+06 0.0E+00  9.60194E+05 0.0E+00  6.45069E+05 0.0E+00  4.69818E+05 0.0E+00  5.19266E+05 0.0E+00  9.07476E+05 0.0E+00  1.20913E+06 0.0E+00  2.81212E+06 0.0E+00  6.66463E+06 0.0E+00  1.93193E+07 0.0E+00  2.13383E+07 0.0E+00  1.99935E+07 0.0E+00  1.81995E+07 0.0E+00  1.93336E+07 0.0E+00  2.24789E+07 0.0E+00  2.19276E+07 0.0E+00  1.66838E+07 0.0E+00  1.71376E+07 0.0E+00  1.68444E+07 0.0E+00  1.59029E+07 0.0E+00  1.35403E+07 0.0E+00  1.01589E+07 0.0E+00  3.99430E+06 0.0E+00 ];

% Integral parameters:

B1_KINF                   (idx, [1:   2]) = [  1.01212E+00 0.0E+00 ];
B1_KEFF                   (idx, [1:   2]) = [  1.00000E+00 0.0E+00 ];
B1_B2                     (idx, [1:   2]) = [  1.84282E-04 0.0E+00 ];
B1_ERR                    (idx, [1:   2]) = [  1.36966E-09 0.0E+00 ];

% Critical spectra in infinite geometry:

B1_FLX                    (idx, [1:   4]) = [  2.66502E+15 0.0E+00  1.90561E+15 0.0E+00 ];
B1_FISS_FLX               (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reaction cross sections:

B1_TOT                    (idx, [1:   4]) = [  5.20248E-01 0.0E+00  3.13397E+00 0.0E+00 ];
B1_CAPT                   (idx, [1:   4]) = [  1.95455E-03 0.0E+00  2.03739E-02 0.0E+00 ];
B1_ABS                    (idx, [1:   4]) = [  6.51270E-03 0.0E+00  3.01776E-02 0.0E+00 ];
B1_FISS                   (idx, [1:   4]) = [  4.55815E-03 0.0E+00  9.80372E-03 0.0E+00 ];
B1_NSF                    (idx, [1:   4]) = [  1.13399E-02 0.0E+00  2.38887E-02 0.0E+00 ];
B1_NUBAR                  (idx, [1:   4]) = [  2.48783E+00 0.0E+00  2.43670E+00 0.0E+00 ];
B1_KAPPA                  (idx, [1:   4]) = [  2.02283E+02 0.0E+00  2.02270E+02 0.0E+00 ];
B1_INVV                   (idx, [1:   4]) = [  3.99451E-08 0.0E+00  3.84656E-06 0.0E+00 ];

% Total scattering cross sections:

B1_SCATT0                 (idx, [1:   4]) = [  5.13736E-01 0.0E+00  3.10379E+00 0.0E+00 ];
B1_SCATT1                 (idx, [1:   4]) = [  2.68366E-01 0.0E+00  6.46200E-01 0.0E+00 ];
B1_SCATT2                 (idx, [1:   4]) = [  1.02870E-01 0.0E+00  1.08384E-01 0.0E+00 ];
B1_SCATT3                 (idx, [1:   4]) = [  5.39107E-03 0.0E+00  2.96586E-02 0.0E+00 ];
B1_SCATT4                 (idx, [1:   4]) = [ -1.32708E-02 0.0E+00 -2.61057E-02 0.0E+00 ];
B1_SCATT5                 (idx, [1:   4]) = [ -7.09240E-04 0.0E+00  1.35633E-02 0.0E+00 ];
B1_SCATT6                 (idx, [1:   4]) = [  5.03916E-03 0.0E+00 -3.57605E-02 0.0E+00 ];
B1_SCATT7                 (idx, [1:   4]) = [  4.49179E-04 0.0E+00  1.05446E-02 0.0E+00 ];

% Total scattering production cross sections:

B1_SCATTP0                (idx, [1:   4]) = [  5.13744E-01 0.0E+00  3.10379E+00 0.0E+00 ];
B1_SCATTP1                (idx, [1:   4]) = [  2.68366E-01 0.0E+00  6.46200E-01 0.0E+00 ];
B1_SCATTP2                (idx, [1:   4]) = [  1.02870E-01 0.0E+00  1.08384E-01 0.0E+00 ];
B1_SCATTP3                (idx, [1:   4]) = [  5.39111E-03 0.0E+00  2.96586E-02 0.0E+00 ];
B1_SCATTP4                (idx, [1:   4]) = [ -1.32708E-02 0.0E+00 -2.61057E-02 0.0E+00 ];
B1_SCATTP5                (idx, [1:   4]) = [ -7.09267E-04 0.0E+00  1.35633E-02 0.0E+00 ];
B1_SCATTP6                (idx, [1:   4]) = [  5.03923E-03 0.0E+00 -3.57605E-02 0.0E+00 ];
B1_SCATTP7                (idx, [1:   4]) = [  4.49134E-04 0.0E+00  1.05446E-02 0.0E+00 ];

% Diffusion parameters:

B1_TRANSPXS               (idx, [1:   4]) = [  1.92431E-01 0.0E+00  2.06908E+00 0.0E+00 ];
B1_DIFFCOEF               (idx, [1:   4]) = [  1.73222E+00 0.0E+00  1.61102E-01 0.0E+00 ];

% Reduced absoption and removal:

B1_RABSXS                 (idx, [1:   4]) = [  6.50476E-03 0.0E+00  3.01776E-02 0.0E+00 ];
B1_REMXS                  (idx, [1:   4]) = [  2.81869E-02 0.0E+00  3.02823E-02 0.0E+00 ];

% Poison cross sections:

B1_I135_YIELD             (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_XE135_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM147_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148M_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM149_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SM149_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_I135_MICRO_ABS         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_XE135_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM147_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148M_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM149_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SM149_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_XE135_MACRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SM149_MACRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Fission spectra:

B1_CHIT                   (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CHIP                   (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CHID                   (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Scattering matrixes:

B1_S0                     (idx, [1:   8]) = [  4.92061E-01 0.0E+00  2.16745E-02 0.0E+00  1.07354E-04 0.0E+00  3.10369E+00 0.0E+00 ];
B1_S1                     (idx, [1:   8]) = [  2.61747E-01 0.0E+00  6.61924E-03 0.0E+00  7.30753E-05 0.0E+00  6.46127E-01 0.0E+00 ];
B1_S2                     (idx, [1:   8]) = [  1.05062E-01 0.0E+00 -2.19251E-03 0.0E+00  4.64661E-05 0.0E+00  1.08338E-01 0.0E+00 ];
B1_S3                     (idx, [1:   8]) = [  7.96818E-03 0.0E+00 -2.57711E-03 0.0E+00  2.41604E-05 0.0E+00  2.96344E-02 0.0E+00 ];
B1_S4                     (idx, [1:   8]) = [ -1.26397E-02 0.0E+00 -6.31044E-04 0.0E+00  7.85294E-06 0.0E+00 -2.61135E-02 0.0E+00 ];
B1_S5                     (idx, [1:   8]) = [ -9.50786E-04 0.0E+00  2.41547E-04 0.0E+00 -1.43460E-06 0.0E+00  1.35648E-02 0.0E+00 ];
B1_S6                     (idx, [1:   8]) = [  5.22191E-03 0.0E+00 -1.82752E-04 0.0E+00 -5.49819E-06 0.0E+00 -3.57550E-02 0.0E+00 ];
B1_S7                     (idx, [1:   8]) = [  7.95852E-04 0.0E+00 -3.46673E-04 0.0E+00 -6.60817E-06 0.0E+00  1.05512E-02 0.0E+00 ];

% Scattering production matrixes:

B1_SP0                    (idx, [1:   8]) = [  4.92069E-01 0.0E+00  2.16745E-02 0.0E+00  1.07354E-04 0.0E+00  3.10369E+00 0.0E+00 ];
B1_SP1                    (idx, [1:   8]) = [  2.61747E-01 0.0E+00  6.61924E-03 0.0E+00  7.30753E-05 0.0E+00  6.46127E-01 0.0E+00 ];
B1_SP2                    (idx, [1:   8]) = [  1.05062E-01 0.0E+00 -2.19251E-03 0.0E+00  4.64661E-05 0.0E+00  1.08338E-01 0.0E+00 ];
B1_SP3                    (idx, [1:   8]) = [  7.96822E-03 0.0E+00 -2.57711E-03 0.0E+00  2.41604E-05 0.0E+00  2.96344E-02 0.0E+00 ];
B1_SP4                    (idx, [1:   8]) = [ -1.26397E-02 0.0E+00 -6.31044E-04 0.0E+00  7.85294E-06 0.0E+00 -2.61135E-02 0.0E+00 ];
B1_SP5                    (idx, [1:   8]) = [ -9.50814E-04 0.0E+00  2.41547E-04 0.0E+00 -1.43460E-06 0.0E+00  1.35648E-02 0.0E+00 ];
B1_SP6                    (idx, [1:   8]) = [  5.22199E-03 0.0E+00 -1.82752E-04 0.0E+00 -5.49819E-06 0.0E+00 -3.57550E-02 0.0E+00 ];
B1_SP7                    (idx, [1:   8]) = [  7.95808E-04 0.0E+00 -3.46673E-04 0.0E+00 -6.60817E-06 0.0E+00  1.05512E-02 0.0E+00 ];

% Additional diffusion parameters:

CMM_TRANSPXS              (idx, [1:   4]) = [  1.89638E-01 0.0E+00  2.06506E+00 0.0E+00 ];
CMM_TRANSPXS_X            (idx, [1:   4]) = [  1.98373E-01 0.0E+00  2.06336E+00 0.0E+00 ];
CMM_TRANSPXS_Y            (idx, [1:   4]) = [  1.98138E-01 0.0E+00  2.06190E+00 0.0E+00 ];
CMM_TRANSPXS_Z            (idx, [1:   4]) = [  1.74471E-01 0.0E+00  2.06995E+00 0.0E+00 ];
CMM_DIFFCOEF              (idx, [1:   4]) = [  1.75773E+00 0.0E+00  1.61415E-01 0.0E+00 ];
CMM_DIFFCOEF_X            (idx, [1:   4]) = [  1.68034E+00 0.0E+00  1.61549E-01 0.0E+00 ];
CMM_DIFFCOEF_Y            (idx, [1:   4]) = [  1.68233E+00 0.0E+00  1.61663E-01 0.0E+00 ];
CMM_DIFFCOEF_Z            (idx, [1:   4]) = [  1.91053E+00 0.0E+00  1.61034E-01 0.0E+00 ];

% Delayed neutron parameters (Meulekamp method):

BETA_EFF                  (idx, [1:  14]) = [  6.92774E-03 0.00560  2.43168E-04 0.02969  1.24850E-03 0.01277  1.21276E-03 0.01535  2.66388E-03 0.00872  1.10495E-03 0.01309  4.54489E-04 0.02512 ];
LAMBDA                    (idx, [1:  14]) = [  4.66322E-01 0.00861  1.33354E-02 2.8E-05  3.27365E-02 3.4E-05  1.20786E-01 1.5E-05  3.02843E-01 3.5E-05  8.49861E-01 8.0E-05  2.85349E+00 9.6E-05 ];

