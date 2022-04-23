! .f90 FORTAX system; generated using sys_saveF90
 
call sys_init(sys)
 
! inctax
sys%inctax%numbands = 4
sys%inctax%pa =  1.24519230769231001E+02_dp
sys%inctax%doPATaper = 1
sys%inctax%disablePATaperRounding = 0
sys%inctax%paTaperThresh =  1.92307692307691991E+03_dp
sys%inctax%paTaperRate =  5.00000000000000000E-01_dp
sys%inctax%mma =  0.00000000000000000E+00_dp
sys%inctax%ctc =  0.00000000000000000E+00_dp
sys%inctax%ctcyng =  0.00000000000000000E+00_dp
sys%inctax%mmarate =  1.00000000000000006E-01_dp
sys%inctax%ctctaper =  0.00000000000000000E+00_dp
sys%inctax%c4rebate =  0.00000000000000000E+00_dp
sys%inctax%bands(1) =  4.69230769230768985E+01_dp
sys%inctax%bands(2) =  7.19230769230769056E+02_dp
sys%inctax%bands(3) =  2.88461538461538021E+03_dp
sys%inctax%bands(4) =  1.92307692307692014E+04_dp
sys%inctax%rates(1) =  2.00000000000000011E-01_dp
sys%inctax%rates(2) =  2.00000000000000011E-01_dp
sys%inctax%rates(3) =  4.00000000000000022E-01_dp
sys%inctax%rates(4) =  5.00000000000000000E-01_dp
 
! natins
sys%natins%numrates = 5
sys%natins%c4nrates = 3
sys%natins%c2floor =  9.75999999999999943E+01_dp
sys%natins%c2rate =  2.39999999999999991E+00_dp
sys%natins%ceiling =  1.00000000000000002+100_dp
sys%natins%rates(1) =  0.00000000000000000E+00_dp
sys%natins%rates(2) =  0.00000000000000000E+00_dp
sys%natins%rates(3) =  1.10000000000000001E-01_dp
sys%natins%rates(4) =  1.10000000000000001E-01_dp
sys%natins%rates(5) =  1.00000000000000002E-02_dp
sys%natins%bands(1) =  9.70000000000000000E+01_dp
sys%natins%bands(2) =  1.10000000000000000E+02_dp
sys%natins%bands(3) =  7.70000000000000000E+02_dp
sys%natins%bands(4) =  8.44000000000000000E+02_dp
sys%natins%bands(5) =  1.00000000000000002+100_dp
sys%natins%c4rates(1) =  0.00000000000000000E+00_dp
sys%natins%c4rates(2) =  8.00000000000000017E-02_dp
sys%natins%c4rates(3) =  1.00000000000000002E-02_dp
sys%natins%c4bands(1) =  1.09900000000000006E+02_dp
sys%natins%c4bands(2) =  8.43750000000000000E+02_dp
sys%natins%c4bands(3) =  1.00000000000000000E+06_dp
 
! chben
sys%chben%doChBen = 1
sys%chben%basic =  1.34000000000000004E+01_dp
sys%chben%kid1xtr =  6.90000000000000036E+00_dp
sys%chben%opf =  0.00000000000000000E+00_dp
sys%chben%MatGrantVal =  5.00000000000000000E+02_dp
sys%chben%MatGrantOnlyFirstKid = 0
sys%chben%doTaper = 0
sys%chben%disableTaperRounding = 0
sys%chben%taperStart =  0.00000000000000000E+00_dp
sys%chben%taperRate =  0.00000000000000000E+00_dp
sys%chben%taperIsIncTax = 0
 
! fc
sys%fc%dofamcred = 0
sys%fc%NumAgeRng = 4
sys%fc%MaxAgeCC = 0
sys%fc%WFTCMaxAgeCC = 0
sys%fc%adult =  0.00000000000000000E+00_dp
sys%fc%ftprem =  0.00000000000000000E+00_dp
sys%fc%hours1 =  1.60000000000000000E+01_dp
sys%fc%hours2 =  3.00000000000000000E+01_dp
sys%fc%thres =  0.00000000000000000E+00_dp
sys%fc%taper =  0.00000000000000000E+00_dp
sys%fc%MaintDisreg =  1.00000000000000002+100_dp
sys%fc%MaxCC1 =  0.00000000000000000E+00_dp
sys%fc%MaxCC2 =  0.00000000000000000E+00_dp
sys%fc%WFTCMaxCC1 =  0.00000000000000000E+00_dp
sys%fc%WFTCMaxCC2 =  0.00000000000000000E+00_dp
sys%fc%WFTCPropCC =  0.00000000000000000E+00_dp
sys%fc%MinAmt =  0.00000000000000000E+00_dp
sys%fc%kidagel(1) = 0
sys%fc%kidagel(2) = 11
sys%fc%kidagel(3) = 16
sys%fc%kidagel(4) = 18
sys%fc%kidageu(1) = 10
sys%fc%kidageu(2) = 15
sys%fc%kidageu(3) = 17
sys%fc%kidageu(4) = 18
sys%fc%kidcred(1) =  0.00000000000000000E+00_dp
sys%fc%kidcred(2) =  0.00000000000000000E+00_dp
sys%fc%kidcred(3) =  0.00000000000000000E+00_dp
sys%fc%kidcred(4) =  0.00000000000000000E+00_dp
 
! ctc
sys%ctc%fam =  1.04807692307691998E+01_dp
sys%ctc%baby =  1.04807692307691998E+01_dp
sys%ctc%kid =  4.42307692307691980E+01_dp
 
! wtc
sys%wtc%Basic =  3.69230769230768985E+01_dp
sys%wtc%CouLP =  7.32692307692308020E+01_dp
sys%wtc%FT =  1.51923076923077005E+01_dp
sys%wtc%MinHrsKids =  1.60000000000000000E+01_dp
sys%wtc%MinHrsCouKids =  1.60000000000000000E+01_dp
sys%wtc%MinHrsNoKids =  3.00000000000000000E+01_dp
sys%wtc%FTHrs =  3.00000000000000000E+01_dp
sys%wtc%MinAgeKids = 16
sys%wtc%MinAgeNoKids = 25
sys%wtc%MaxCC1 =  1.75000000000000000E+02_dp
sys%wtc%MaxCC2 =  3.00000000000000000E+02_dp
sys%wtc%PropCC =  8.00000000000000044E-01_dp
sys%wtc%MaxAgeCC = 15
sys%wtc%NewDisreg =  1.71000000000000014E+01_dp
sys%wtc%NewDisregCon = 1
 
! ntc
sys%ntc%donewtaxcred = 1
sys%ntc%thr1lo =  1.23461538461537998E+02_dp
sys%ntc%thr1hi =  3.11346153846153982E+02_dp
sys%ntc%thr2 =  9.61538461538462002E+02_dp
sys%ntc%taper1 =  3.90000000000000013E-01_dp
sys%ntc%taper2 =  6.66666000000000064E-02_dp
sys%ntc%taperCTCInOneGo = 0
sys%ntc%MinAmt =  5.00000000000000000E-01_dp
 
! incsup
sys%incsup%doIncSup = 1
sys%incsup%IncChben = 0
sys%incsup%NumAgeRng = 1
sys%incsup%MainCou =  1.02750000000000000E+02_dp
sys%incsup%YngCou =  7.82999999999999972E+01_dp
sys%incsup%MainLP =  6.54500000000000028E+01_dp
sys%incsup%YngLP =  5.18500000000000014E+01_dp
sys%incsup%MainSin =  6.54500000000000028E+01_dp
sys%incsup%YngSin =  5.18500000000000014E+01_dp
sys%incsup%ValFSM =  5.51999999999999957E+00_dp
sys%incsup%DisregLP =  2.00000000000000000E+01_dp
sys%incsup%DisregSin =  5.00000000000000000E+00_dp
sys%incsup%DisregCou =  1.00000000000000000E+01_dp
sys%incsup%DisregShared = 1
sys%incsup%PremFam =  0.00000000000000000E+00_dp
sys%incsup%PremLP =  0.00000000000000000E+00_dp
sys%incsup%hours =  1.60000000000000000E+01_dp
sys%incsup%MaintDisreg =  1.00000000000000002+100_dp
sys%incsup%AgeRngl(1) = 0
sys%incsup%AgeRngu(1) = 19
sys%incsup%AddKid(1) =  0.00000000000000000E+00_dp
 
! ctax
sys%ctax%docounciltax = 1
sys%ctax%bandD =  2.73205769230768993E+01_dp
sys%ctax%SinDis =  2.50000000000000000E-01_dp
sys%ctax%RatioA =  6.70000000000000040E-01_dp
sys%ctax%RatioB =  7.70000000000000018E-01_dp
sys%ctax%RatioC =  8.80000000000000004E-01_dp
sys%ctax%RatioE =  1.21999999999999997E+00_dp
sys%ctax%RatioF =  1.43999999999999995E+00_dp
sys%ctax%RatioG =  1.66999999999999993E+00_dp
sys%ctax%RatioH =  2.00000000000000000E+00_dp
 
! rebatesys
sys%rebatesys%RulesUnderFC = 0
sys%rebatesys%RulesUnderWFTC = 0
sys%rebatesys%RulesUnderNTC = 1
sys%rebatesys%RulesUnderUC = 0
sys%rebatesys%NumAgeRng = 2
sys%rebatesys%Restrict = 0
sys%rebatesys%docap = 0
sys%rebatesys%MainCou =  1.02750000000000000E+02_dp
sys%rebatesys%YngCou =  7.82999999999999972E+01_dp
sys%rebatesys%MainLP =  6.54500000000000028E+01_dp
sys%rebatesys%YngLP =  5.18500000000000014E+01_dp
sys%rebatesys%MainSin =  6.54500000000000028E+01_dp
sys%rebatesys%YngSin =  5.18500000000000014E+01_dp
sys%rebatesys%DisregSin =  5.00000000000000000E+00_dp
sys%rebatesys%DisregLP =  2.50000000000000000E+01_dp
sys%rebatesys%DisregCou =  1.00000000000000000E+01_dp
sys%rebatesys%CredInDisregCC = 1
sys%rebatesys%ChbenIsIncome = 0
sys%rebatesys%PremFam =  1.73999999999999986E+01_dp
sys%rebatesys%PremLP =  0.00000000000000000E+00_dp
sys%rebatesys%MaintDisreg =  1.00000000000000002+100_dp
sys%rebatesys%MaxCC1 =  1.75000000000000000E+02_dp
sys%rebatesys%MaxCC2 =  3.00000000000000000E+02_dp
sys%rebatesys%MaxAgeCC = 15
sys%rebatesys%AgeRngl(1) = 0
sys%rebatesys%AgeRngl(2) = 1
sys%rebatesys%AgeRngu(1) = 0
sys%rebatesys%AgeRngu(2) = 19
sys%rebatesys%AddKid(1) =  6.80699999999999932E+01_dp
sys%rebatesys%AddKid(2) =  5.75700000000000003E+01_dp
 
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
sys%extra%prices = 20101201
 
! .f90 FORTAX system; END-OF-FILE
 
