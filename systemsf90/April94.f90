! .f90 FORTAX system; generated using sys_saveF90
 
call sys_init(sys)
 
! inctax
sys%inctax%numbands = 3
sys%inctax%pa =  6.62500000000000000E+01_dp
sys%inctax%doPATaper = 0
sys%inctax%disablePATaperRounding = 0
sys%inctax%paTaperThresh =  0.00000000000000000E+00_dp
sys%inctax%paTaperRate =  0.00000000000000000E+00_dp
sys%inctax%mma =  3.30769230769231015E+01_dp
sys%inctax%ctc =  0.00000000000000000E+00_dp
sys%inctax%ctcyng =  0.00000000000000000E+00_dp
sys%inctax%mmarate =  2.00000000000000011E-01_dp
sys%inctax%ctctaper =  0.00000000000000000E+00_dp
sys%inctax%c4rebate =  5.00000000000000000E-01_dp
sys%inctax%bands(1) =  5.76923076923077005E+01_dp
sys%inctax%bands(2) =  4.55769230769231001E+02_dp
sys%inctax%bands(3) =  1.92307500000000000E+04_dp
sys%inctax%rates(1) =  2.00000000000000011E-01_dp
sys%inctax%rates(2) =  2.50000000000000000E-01_dp
sys%inctax%rates(3) =  4.00000000000000022E-01_dp
 
! natins
sys%natins%numrates = 2
sys%natins%c4nrates = 3
sys%natins%c2floor =  6.15399999999999991E+01_dp
sys%natins%c2rate =  5.65000000000000036E+00_dp
sys%natins%ceiling =  4.30000000000000000E+02_dp
sys%natins%rates(1) =  2.00000000000000004E-02_dp
sys%natins%rates(2) =  1.00000000000000006E-01_dp
sys%natins%bands(1) =  5.70000000000000000E+01_dp
sys%natins%bands(2) =  4.30000000000000000E+02_dp
sys%natins%c4rates(1) =  0.00000000000000000E+00_dp
sys%natins%c4rates(2) =  7.29999999999999954E-02_dp
sys%natins%c4rates(3) =  0.00000000000000000E+00_dp
sys%natins%c4bands(1) =  1.24810000000000002E+02_dp
sys%natins%c4bands(2) =  4.30000000000000000E+02_dp
sys%natins%c4bands(3) =  1.00000000000000000E+06_dp
 
! chben
sys%chben%doChBen = 1
sys%chben%basic =  8.25000000000000000E+00_dp
sys%chben%kid1xtr =  1.94999999999999996E+00_dp
sys%chben%opf =  6.15000000000000036E+00_dp
sys%chben%MatGrantVal =  1.00000000000000000E+02_dp
sys%chben%MatGrantOnlyFirstKid = 0
sys%chben%doTaper = 0
sys%chben%disableTaperRounding = 0
sys%chben%taperStart =  0.00000000000000000E+00_dp
sys%chben%taperRate =  0.00000000000000000E+00_dp
sys%chben%taperIsIncTax = 0
 
! fc
sys%fc%dofamcred = 1
sys%fc%NumAgeRng = 4
sys%fc%MaxAgeCC = 11
sys%fc%WFTCMaxAgeCC = 11
sys%fc%adult =  4.42999999999999972E+01_dp
sys%fc%ftprem =  0.00000000000000000E+00_dp
sys%fc%hours1 =  1.60000000000000000E+01_dp
sys%fc%hours2 =  0.00000000000000000E+00_dp
sys%fc%thres =  7.17000000000000028E+01_dp
sys%fc%taper =  6.99999999999999956E-01_dp
sys%fc%MaintDisreg =  1.50000000000000000E+01_dp
sys%fc%MaxCC1 =  0.00000000000000000E+00_dp
sys%fc%MaxCC2 =  0.00000000000000000E+00_dp
sys%fc%WFTCMaxCC1 =  0.00000000000000000E+00_dp
sys%fc%WFTCMaxCC2 =  0.00000000000000000E+00_dp
sys%fc%WFTCPropCC =  1.00000000000000000E+00_dp
sys%fc%MinAmt =  5.00000000000000000E-01_dp
sys%fc%kidagel(1) = 0
sys%fc%kidagel(2) = 11
sys%fc%kidagel(3) = 16
sys%fc%kidagel(4) = 18
sys%fc%kidageu(1) = 10
sys%fc%kidageu(2) = 15
sys%fc%kidageu(3) = 17
sys%fc%kidageu(4) = 18
sys%fc%kidcred(1) =  1.11999999999999993E+01_dp
sys%fc%kidcred(2) =  1.85500000000000007E+01_dp
sys%fc%kidcred(3) =  2.30500000000000007E+01_dp
sys%fc%kidcred(4) =  3.22000000000000028E+01_dp
 
! ctc
sys%ctc%fam =  0.00000000000000000E+00_dp
sys%ctc%baby =  0.00000000000000000E+00_dp
sys%ctc%kid =  0.00000000000000000E+00_dp
 
! wtc
sys%wtc%Basic =  0.00000000000000000E+00_dp
sys%wtc%CouLP =  0.00000000000000000E+00_dp
sys%wtc%FT =  0.00000000000000000E+00_dp
sys%wtc%MinHrsKids =  0.00000000000000000E+00_dp
sys%wtc%MinHrsCouKids =  0.00000000000000000E+00_dp
sys%wtc%MinHrsNoKids =  0.00000000000000000E+00_dp
sys%wtc%FTHrs =  0.00000000000000000E+00_dp
sys%wtc%MinAgeKids = 0
sys%wtc%MinAgeNoKids = 0
sys%wtc%MaxCC1 =  0.00000000000000000E+00_dp
sys%wtc%MaxCC2 =  0.00000000000000000E+00_dp
sys%wtc%PropCC =  0.00000000000000000E+00_dp
sys%wtc%MaxAgeCC = 0
sys%wtc%NewDisreg =  0.00000000000000000E+00_dp
sys%wtc%NewDisregCon = 0
 
! ntc
sys%ntc%donewtaxcred = 0
sys%ntc%thr1lo =  0.00000000000000000E+00_dp
sys%ntc%thr1hi =  0.00000000000000000E+00_dp
sys%ntc%thr2 =  0.00000000000000000E+00_dp
sys%ntc%taper1 =  0.00000000000000000E+00_dp
sys%ntc%taper2 =  0.00000000000000000E+00_dp
sys%ntc%taperCTCInOneGo = 0
sys%ntc%MinAmt =  0.00000000000000000E+00_dp
 
! incsup
sys%incsup%doIncSup = 1
sys%incsup%IncChben = 1
sys%incsup%NumAgeRng = 4
sys%incsup%MainCou =  7.17000000000000028E+01_dp
sys%incsup%YngCou =  5.45499999999999972E+01_dp
sys%incsup%MainLP =  4.57000000000000028E+01_dp
sys%incsup%YngLP =  2.75000000000000000E+01_dp
sys%incsup%MainSin =  4.57000000000000028E+01_dp
sys%incsup%YngSin =  3.61499999999999986E+01_dp
sys%incsup%ValFSM =  3.75000000000000000E+00_dp
sys%incsup%DisregLP =  1.50000000000000000E+01_dp
sys%incsup%DisregSin =  5.00000000000000000E+00_dp
sys%incsup%DisregCou =  1.00000000000000000E+01_dp
sys%incsup%DisregShared = 0
sys%incsup%PremFam =  1.00500000000000007E+01_dp
sys%incsup%PremLP =  5.09999999999999964E+00_dp
sys%incsup%hours =  1.60000000000000000E+01_dp
sys%incsup%MaintDisreg =  0.00000000000000000E+00_dp
sys%incsup%AgeRngl(1) = 0
sys%incsup%AgeRngl(2) = 11
sys%incsup%AgeRngl(3) = 16
sys%incsup%AgeRngl(4) = 18
sys%incsup%AgeRngu(1) = 10
sys%incsup%AgeRngu(2) = 15
sys%incsup%AgeRngu(3) = 17
sys%incsup%AgeRngu(4) = 18
sys%incsup%AddKid(1) =  1.56500000000000004E+01_dp
sys%incsup%AddKid(2) =  2.30000000000000000E+01_dp
sys%incsup%AddKid(3) =  2.75000000000000000E+01_dp
sys%incsup%AddKid(4) =  3.61499999999999986E+01_dp
 
! ctax
sys%ctax%docounciltax = 1
sys%ctax%bandD =  1.11538461538461995E+01_dp
sys%ctax%SinDis =  2.50000000000000000E-01_dp
sys%ctax%RatioA =  6.70000000000000040E-01_dp
sys%ctax%RatioB =  7.70000000000000018E-01_dp
sys%ctax%RatioC =  8.80000000000000004E-01_dp
sys%ctax%RatioE =  1.21999999999999997E+00_dp
sys%ctax%RatioF =  1.43999999999999995E+00_dp
sys%ctax%RatioG =  1.66999999999999993E+00_dp
sys%ctax%RatioH =  2.00000000000000000E+00_dp
 
! rebatesys
sys%rebatesys%RulesUnderFC = 1
sys%rebatesys%RulesUnderWFTC = 0
sys%rebatesys%RulesUnderNTC = 0
sys%rebatesys%RulesUnderUC = 0
sys%rebatesys%NumAgeRng = 4
sys%rebatesys%Restrict = 0
sys%rebatesys%docap = 0
sys%rebatesys%MainCou =  7.17000000000000028E+01_dp
sys%rebatesys%YngCou =  5.45499999999999972E+01_dp
sys%rebatesys%MainLP =  4.57000000000000028E+01_dp
sys%rebatesys%YngLP =  3.61499999999999986E+01_dp
sys%rebatesys%MainSin =  4.57000000000000028E+01_dp
sys%rebatesys%YngSin =  3.61499999999999986E+01_dp
sys%rebatesys%DisregSin =  5.00000000000000000E+00_dp
sys%rebatesys%DisregLP =  2.50000000000000000E+01_dp
sys%rebatesys%DisregCou =  1.00000000000000000E+01_dp
sys%rebatesys%CredInDisregCC = 0
sys%rebatesys%ChbenIsIncome = 1
sys%rebatesys%PremFam =  1.00500000000000007E+01_dp
sys%rebatesys%PremLP =  1.12500000000000000E+01_dp
sys%rebatesys%MaintDisreg =  1.50000000000000000E+01_dp
sys%rebatesys%MaxCC1 =  0.00000000000000000E+00_dp
sys%rebatesys%MaxCC2 =  0.00000000000000000E+00_dp
sys%rebatesys%MaxAgeCC = 11
sys%rebatesys%AgeRngl(1) = 0
sys%rebatesys%AgeRngl(2) = 11
sys%rebatesys%AgeRngl(3) = 16
sys%rebatesys%AgeRngl(4) = 18
sys%rebatesys%AgeRngu(1) = 10
sys%rebatesys%AgeRngu(2) = 15
sys%rebatesys%AgeRngu(3) = 17
sys%rebatesys%AgeRngu(4) = 18
sys%rebatesys%AddKid(1) =  1.56500000000000004E+01_dp
sys%rebatesys%AddKid(2) =  2.30000000000000000E+01_dp
sys%rebatesys%AddKid(3) =  2.75000000000000000E+01_dp
sys%rebatesys%AddKid(4) =  3.61499999999999986E+01_dp
 
! hben
sys%hben%doHBen = 1
sys%hben%taper =  6.50000000000000022E-01_dp
sys%hben%MinAmt =  5.00000000000000000E-01_dp
 
! ctaxben
sys%ctaxben%docounciltaxben = 1
sys%ctaxben%taper =  2.00000000000000011E-01_dp
sys%ctaxben%doEntitlementCut = 0
sys%ctaxben%entitlementShare =  0.00000000000000000E+00_dp
 
! ccben
sys%ccben%dopolltax = 0
sys%ccben%taper =  1.49999999999999994E-01_dp
sys%ccben%PropElig =  8.00000000000000044E-01_dp
sys%ccben%MinAmt =  5.00000000000000000E-01_dp
sys%ccben%CCrate =  0.00000000000000000E+00_dp
 
! uc
sys%uc%doUnivCred = 0
sys%uc%MainCou =  0.00000000000000000E+00_dp
sys%uc%YngCou =  0.00000000000000000E+00_dp
sys%uc%MainSin =  0.00000000000000000E+00_dp
sys%uc%YngSin =  0.00000000000000000E+00_dp
sys%uc%MinAgeMain = 0
sys%uc%FirstKid =  0.00000000000000000E+00_dp
sys%uc%OtherKid =  0.00000000000000000E+00_dp
sys%uc%MaxCC1 =  0.00000000000000000E+00_dp
sys%uc%MaxCC2 =  0.00000000000000000E+00_dp
sys%uc%PropCC =  0.00000000000000000E+00_dp
sys%uc%MaxAgeCC = 0
sys%uc%doRentCap = 0
sys%uc%DisregSinNoKidsHi =  0.00000000000000000E+00_dp
sys%uc%DisregSinNoKidsLo =  0.00000000000000000E+00_dp
sys%uc%DisregSinKidsHi =  0.00000000000000000E+00_dp
sys%uc%DisregSinKidsLo =  0.00000000000000000E+00_dp
sys%uc%DisregCouNoKidsHi =  0.00000000000000000E+00_dp
sys%uc%DisregCouNoKidsLo =  0.00000000000000000E+00_dp
sys%uc%DisregCouKidsHi =  0.00000000000000000E+00_dp
sys%uc%DisregCouKidsLo =  0.00000000000000000E+00_dp
sys%uc%taper =  0.00000000000000000E+00_dp
sys%uc%MinAmt =  0.00000000000000000E+00_dp
 
! statepen
sys%statepen%doStatePen = 0
sys%statepen%PenAgeMan = 65
sys%statepen%PenAgeWoman = 60
 
! bencap
sys%bencap%doCap = 0
sys%bencap%doThruUC = 0
sys%bencap%sinNoKids =  1.00000000000000002+100_dp
sys%bencap%sinKids =  1.00000000000000002+100_dp
sys%bencap%couNoKids =  1.00000000000000002+100_dp
sys%bencap%couKids =  1.00000000000000002+100_dp
sys%bencap%UCEarnThr =  0.00000000000000000E+00_dp
 
! extra
sys%extra%fsminappamt = 0
sys%extra%matgrant = 0
sys%extra%prices = 19940401
 
! .f90 FORTAX system; END-OF-FILE
 
