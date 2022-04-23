! .f90 FORTAX system; generated using sys_saveF90
 
call sys_init(sys)
 
! inctax
sys%inctax%numbands = 2
sys%inctax%pa =  5.77884615384614975E+01_dp
sys%inctax%doPATaper = 0
sys%inctax%disablePATaperRounding = 0
sys%inctax%paTaperThresh =  0.00000000000000000E+00_dp
sys%inctax%paTaperRate =  0.00000000000000000E+00_dp
sys%inctax%mma =  3.30769230769231015E+01_dp
sys%inctax%ctc =  0.00000000000000000E+00_dp
sys%inctax%ctcyng =  0.00000000000000000E+00_dp
sys%inctax%mmarate =  0.00000000000000000E+00_dp
sys%inctax%ctctaper =  0.00000000000000000E+00_dp
sys%inctax%c4rebate =  5.00000000000000000E-01_dp
sys%inctax%bands(1) =  3.98076923076922981E+02_dp
sys%inctax%bands(2) =  1.92307500000000000E+04_dp
sys%inctax%rates(1) =  2.50000000000000000E-01_dp
sys%inctax%rates(2) =  4.00000000000000022E-01_dp
 
! natins
sys%natins%numrates = 2
sys%natins%c4nrates = 3
sys%natins%c2floor =  5.00000000000000000E+01_dp
sys%natins%c2rate =  4.54999999999999982E+00_dp
sys%natins%ceiling =  3.50000000000000000E+02_dp
sys%natins%rates(1) =  2.00000000000000004E-02_dp
sys%natins%rates(2) =  8.99999999999999967E-02_dp
sys%natins%bands(1) =  4.60000000000000000E+01_dp
sys%natins%bands(2) =  3.50000000000000000E+02_dp
sys%natins%c4rates(1) =  0.00000000000000000E+00_dp
sys%natins%c4rates(2) =  6.30000000000000004E-02_dp
sys%natins%c4rates(3) =  0.00000000000000000E+00_dp
sys%natins%c4bands(1) =  1.04810000000000002E+02_dp
sys%natins%c4bands(2) =  3.50000000000000000E+02_dp
sys%natins%c4bands(3) =  1.00000000000000000E+06_dp
 
! chben
sys%chben%doChBen = 1
sys%chben%basic =  7.25000000000000000E+00_dp
sys%chben%kid1xtr =  0.00000000000000000E+00_dp
sys%chben%opf =  5.59999999999999964E+00_dp
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
sys%fc%adult =  3.63500000000000014E+01_dp
sys%fc%ftprem =  0.00000000000000000E+00_dp
sys%fc%hours1 =  2.40000000000000000E+01_dp
sys%fc%hours2 =  0.00000000000000000E+00_dp
sys%fc%thres =  5.76000000000000014E+01_dp
sys%fc%taper =  6.99999999999999956E-01_dp
sys%fc%MaintDisreg =  0.00000000000000000E+00_dp
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
sys%fc%kidcred(1) =  8.25000000000000000E+00_dp
sys%fc%kidcred(2) =  1.41500000000000004E+01_dp
sys%fc%kidcred(3) =  1.78000000000000007E+01_dp
sys%fc%kidcred(4) =  2.51000000000000014E+01_dp
 
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
sys%incsup%MainCou =  5.76000000000000014E+01_dp
sys%incsup%YngCou =  4.37999999999999972E+01_dp
sys%incsup%MainLP =  3.67000000000000028E+01_dp
sys%incsup%YngLP =  2.18999999999999986E+01_dp
sys%incsup%MainSin =  3.67000000000000028E+01_dp
sys%incsup%YngSin =  2.88000000000000007E+01_dp
sys%incsup%ValFSM =  3.29999999999999982E+00_dp
sys%incsup%DisregLP =  1.50000000000000000E+01_dp
sys%incsup%DisregSin =  5.00000000000000000E+00_dp
sys%incsup%DisregCou =  1.00000000000000000E+01_dp
sys%incsup%DisregShared = 0
sys%incsup%PremFam =  7.34999999999999964E+00_dp
sys%incsup%PremLP =  4.09999999999999964E+00_dp
sys%incsup%hours =  2.40000000000000000E+01_dp
sys%incsup%MaintDisreg =  0.00000000000000000E+00_dp
sys%incsup%AgeRngl(1) = 0
sys%incsup%AgeRngl(2) = 11
sys%incsup%AgeRngl(3) = 16
sys%incsup%AgeRngl(4) = 18
sys%incsup%AgeRngu(1) = 10
sys%incsup%AgeRngu(2) = 15
sys%incsup%AgeRngu(3) = 17
sys%incsup%AgeRngu(4) = 18
sys%incsup%AddKid(1) =  1.23499999999999996E+01_dp
sys%incsup%AddKid(2) =  1.82500000000000000E+01_dp
sys%incsup%AddKid(3) =  2.18999999999999986E+01_dp
sys%incsup%AddKid(4) =  2.88000000000000007E+01_dp
 
! ctax
sys%ctax%docounciltax = 0
sys%ctax%bandD =  0.00000000000000000E+00_dp
sys%ctax%SinDis =  0.00000000000000000E+00_dp
sys%ctax%RatioA =  0.00000000000000000E+00_dp
sys%ctax%RatioB =  0.00000000000000000E+00_dp
sys%ctax%RatioC =  0.00000000000000000E+00_dp
sys%ctax%RatioE =  0.00000000000000000E+00_dp
sys%ctax%RatioF =  0.00000000000000000E+00_dp
sys%ctax%RatioG =  0.00000000000000000E+00_dp
sys%ctax%RatioH =  0.00000000000000000E+00_dp
 
! rebatesys
sys%rebatesys%RulesUnderFC = 1
sys%rebatesys%RulesUnderWFTC = 0
sys%rebatesys%RulesUnderNTC = 0
sys%rebatesys%RulesUnderUC = 0
sys%rebatesys%NumAgeRng = 4
sys%rebatesys%Restrict = 0
sys%rebatesys%docap = 0
sys%rebatesys%MainCou =  5.76000000000000014E+01_dp
sys%rebatesys%YngCou =  4.37999999999999972E+01_dp
sys%rebatesys%MainLP =  3.67000000000000028E+01_dp
sys%rebatesys%YngLP =  2.18999999999999986E+01_dp
sys%rebatesys%MainSin =  3.67000000000000028E+01_dp
sys%rebatesys%YngSin =  2.88000000000000007E+01_dp
sys%rebatesys%DisregSin =  5.00000000000000000E+00_dp
sys%rebatesys%DisregLP =  2.50000000000000000E+01_dp
sys%rebatesys%DisregCou =  1.00000000000000000E+01_dp
sys%rebatesys%CredInDisregCC = 0
sys%rebatesys%ChbenIsIncome = 1
sys%rebatesys%PremFam =  7.34999999999999964E+00_dp
sys%rebatesys%PremLP =  9.69999999999999929E+00_dp
sys%rebatesys%MaintDisreg =  0.00000000000000000E+00_dp
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
sys%rebatesys%AddKid(1) =  1.23499999999999996E+01_dp
sys%rebatesys%AddKid(2) =  1.82500000000000000E+01_dp
sys%rebatesys%AddKid(3) =  2.18999999999999986E+01_dp
sys%rebatesys%AddKid(4) =  2.88000000000000007E+01_dp
 
! hben
sys%hben%doHBen = 1
sys%hben%taper =  6.50000000000000022E-01_dp
sys%hben%MinAmt =  5.00000000000000000E-01_dp
 
! ctaxben
sys%ctaxben%docounciltaxben = 0
sys%ctaxben%taper =  0.00000000000000000E+00_dp
sys%ctaxben%doEntitlementCut = 0
sys%ctaxben%entitlementShare =  0.00000000000000000E+00_dp
 
! ccben
sys%ccben%dopolltax = 1
sys%ccben%taper =  1.49999999999999994E-01_dp
sys%ccben%PropElig =  8.00000000000000044E-01_dp
sys%ccben%MinAmt =  5.00000000000000000E-01_dp
sys%ccben%CCrate =  6.63269230769231033E+00_dp
 
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
sys%extra%prices = 19900401
 
! .f90 FORTAX system; END-OF-FILE
 
