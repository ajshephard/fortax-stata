! .f90 FORTAX system; generated using sys_saveF90
 
call sys_init(sys) !deallocates arrays and sets values to default
 
!inctax
sys%inctax%numbands=3
sys%inctax%pa=77.7884615384615_dp
sys%inctax%doPATaper=.false.
sys%inctax%disablePATaperRounding=.false.
sys%inctax%paTaperThresh=0.000000000000000E+000_dp
sys%inctax%paTaperRate=0.000000000000000E+000_dp
sys%inctax%mma=35.1923076923077_dp
sys%inctax%ctc=0.000000000000000E+000_dp
sys%inctax%ctcyng=0.000000000000000E+000_dp
sys%inctax%mmarate=0.150000000000000_dp
sys%inctax%ctctaper=0.000000000000000E+000_dp
sys%inctax%c4rebate=0.000000000000000E+000_dp
allocate(sys%inctax%bands(3))
sys%inctax%bands(1)=78.8461538461538_dp
sys%inctax%bands(2)=501.923076923077_dp
sys%inctax%bands(3)=19230.7692307692_dp
allocate(sys%inctax%rates(3))
sys%inctax%rates(1)=0.200000000000000_dp
sys%inctax%rates(2)=0.230000000000000_dp
sys%inctax%rates(3)=0.400000000000000_dp
 
!natins
sys%natins%numrates=2
sys%natins%c4nrates=3
sys%natins%c2floor=66.9000000000000_dp
sys%natins%c2rate=6.05000000000000_dp
sys%natins%ceiling=465.000000000000_dp
allocate(sys%natins%rates(2))
sys%natins%rates(1)=2.000000000000000E-002_dp
sys%natins%rates(2)=0.100000000000000_dp
allocate(sys%natins%bands(2))
sys%natins%bands(1)=62.0000000000000_dp
sys%natins%bands(2)=465.000000000000_dp
allocate(sys%natins%c4rates(3))
sys%natins%c4rates(1)=0.000000000000000E+000_dp
sys%natins%c4rates(2)=6.000000000000000E-002_dp
sys%natins%c4rates(3)=0.000000000000000E+000_dp
allocate(sys%natins%c4bands(3))
sys%natins%c4bands(1)=134.800000000000_dp
sys%natins%c4bands(2)=465.000000000000_dp
sys%natins%c4bands(3)=1000000.00000000_dp
 
!chben
sys%chben%doChBen=.true. 
sys%chben%basic=9.00000000000000_dp
sys%chben%kid1xtr=2.05000000000000_dp
sys%chben%opf=6.05000000000000_dp
sys%chben%MatGrantVal=100.000000000000_dp
sys%chben%MatGrantOnlyFirstKid=.false.
sys%chben%doTaper=.false.
sys%chben%disableTaperRounding=.false.
sys%chben%taperStart=0.000000000000000E+000_dp
sys%chben%taperRate=0.000000000000000E+000_dp
sys%chben%taperIsIncTax=.false.
 
!fc
sys%fc%dofamcred=.true. 
sys%fc%NumAgeRng=4
sys%fc%MaxAgeCC=11
sys%fc%WFTCMaxAgeCC=11
sys%fc%adult=47.6500000000000_dp
sys%fc%ftprem=10.5500000000000_dp
sys%fc%hours1=16.0000000000000_dp
sys%fc%hours2=30.0000000000000_dp
sys%fc%thres=77.1500000000000_dp
sys%fc%taper=0.700000000000000_dp
sys%fc%MaintDisreg=15.0000000000000_dp
sys%fc%MaxCC1=60.0000000000000_dp
sys%fc%MaxCC2=0.000000000000000E+000_dp
sys%fc%WFTCMaxCC1=0.000000000000000E+000_dp
sys%fc%WFTCMaxCC2=0.000000000000000E+000_dp
sys%fc%WFTCPropCC=1.00000000000000_dp
sys%fc%MinAmt=0.500000000000000_dp
allocate(sys%fc%kidagel(4))
sys%fc%kidagel(1)=0
sys%fc%kidagel(2)=11
sys%fc%kidagel(3)=16
sys%fc%kidagel(4)=18
allocate(sys%fc%kidageu(4))
sys%fc%kidageu(1)=10
sys%fc%kidageu(2)=15
sys%fc%kidageu(3)=17
sys%fc%kidageu(4)=18
allocate(sys%fc%kidcred(4))
sys%fc%kidcred(1)=12.0500000000000_dp
sys%fc%kidcred(2)=19.9500000000000_dp
sys%fc%kidcred(3)=24.8000000000000_dp
sys%fc%kidcred(4)=34.7000000000000_dp
 
!ctc
sys%ctc%fam=0.000000000000000E+000_dp
sys%ctc%baby=0.000000000000000E+000_dp
sys%ctc%kid=0.000000000000000E+000_dp
 
!wtc
sys%wtc%Basic=0.000000000000000E+000_dp
sys%wtc%CouLP=0.000000000000000E+000_dp
sys%wtc%FT=0.000000000000000E+000_dp
sys%wtc%MinHrsKids=0.000000000000000E+000_dp
sys%wtc%MinHrsCouKids=0.000000000000000E+000_dp
sys%wtc%MinHrsNoKids=0.000000000000000E+000_dp
sys%wtc%FTHrs=0.000000000000000E+000_dp
sys%wtc%MinAgeKids=0
sys%wtc%MinAgeNoKids=0
sys%wtc%MaxCC1=0.000000000000000E+000_dp
sys%wtc%MaxCC2=0.000000000000000E+000_dp
sys%wtc%PropCC=0.000000000000000E+000_dp
sys%wtc%MaxAgeCC=0
sys%wtc%NewDisreg=0.000000000000000E+000_dp
sys%wtc%NewDisregCon=.false.
 
!ntc
sys%ntc%donewtaxcred=.false.
sys%ntc%thr1lo=0.000000000000000E+000_dp
sys%ntc%thr1hi=0.000000000000000E+000_dp
sys%ntc%thr2=0.000000000000000E+000_dp
sys%ntc%taper1=0.000000000000000E+000_dp
sys%ntc%taper2=0.000000000000000E+000_dp
sys%ntc%taperCTCInOneGo=.false.
sys%ntc%MinAmt=0.000000000000000E+000_dp
 
!incsup
sys%incsup%doIncSup=.true. 
sys%incsup%IncChben=.true. 
sys%incsup%NumAgeRng=4
sys%incsup%MainCou=77.1500000000000_dp
sys%incsup%YngCou=58.7000000000000_dp
sys%incsup%MainLP=49.1500000000000_dp
sys%incsup%YngLP=29.6000000000000_dp
sys%incsup%MainSin=49.1500000000000_dp
sys%incsup%YngSin=38.9000000000000_dp
sys%incsup%ValFSM=4.10000000000000_dp
sys%incsup%DisregLP=15.0000000000000_dp
sys%incsup%DisregSin=5.00000000000000_dp
sys%incsup%DisregCou=10.0000000000000_dp
sys%incsup%DisregShared=.true. 
sys%incsup%PremFam=10.8000000000000_dp
sys%incsup%PremLP=4.95000000000000_dp
sys%incsup%hours=16.0000000000000_dp
sys%incsup%MaintDisreg=0.000000000000000E+000_dp
allocate(sys%incsup%AgeRngl(4))
sys%incsup%AgeRngl(1)=0
sys%incsup%AgeRngl(2)=11
sys%incsup%AgeRngl(3)=16
sys%incsup%AgeRngl(4)=18
allocate(sys%incsup%AgeRngu(4))
sys%incsup%AgeRngu(1)=10
sys%incsup%AgeRngu(2)=15
sys%incsup%AgeRngu(3)=17
sys%incsup%AgeRngu(4)=18
allocate(sys%incsup%AddKid(4))
sys%incsup%AddKid(1)=16.9000000000000_dp
sys%incsup%AddKid(2)=24.7500000000000_dp
sys%incsup%AddKid(3)=29.6000000000000_dp
sys%incsup%AddKid(4)=38.9000000000000_dp
 
!ctax
sys%ctax%docounciltax=.true. 
sys%ctax%bandD=13.0384615384615_dp
sys%ctax%SinDis=0.250000000000000_dp
sys%ctax%RatioA=0.670000000000000_dp
sys%ctax%RatioB=0.770000000000000_dp
sys%ctax%RatioC=0.880000000000000_dp
sys%ctax%RatioE=1.22000000000000_dp
sys%ctax%RatioF=1.44000000000000_dp
sys%ctax%RatioG=1.67000000000000_dp
sys%ctax%RatioH=2.00000000000000_dp
 
!rebatesys
sys%rebatesys%RulesUnderFC=.true. 
sys%rebatesys%RulesUnderWFTC=.false.
sys%rebatesys%RulesUnderNTC=.false.
sys%rebatesys%NumAgeRng=4
sys%rebatesys%Restrict=.false.
sys%rebatesys%docap=.false.
sys%rebatesys%MainCou=77.1500000000000_dp
sys%rebatesys%YngCou=58.7000000000000_dp
sys%rebatesys%MainLP=49.1500000000000_dp
sys%rebatesys%YngLP=38.9000000000000_dp
sys%rebatesys%MainSin=49.1500000000000_dp
sys%rebatesys%YngSin=38.9000000000000_dp
sys%rebatesys%DisregSin=5.00000000000000_dp
sys%rebatesys%DisregLP=25.0000000000000_dp
sys%rebatesys%DisregCou=10.0000000000000_dp
sys%rebatesys%CredInDisregCC=.false.
sys%rebatesys%ChbenIsIncome=.true. 
sys%rebatesys%PremFam=10.8000000000000_dp
sys%rebatesys%PremLP=11.2500000000000_dp
sys%rebatesys%MaintDisreg=15.0000000000000_dp
sys%rebatesys%MaxCC1=60.0000000000000_dp
sys%rebatesys%MaxCC2=0.000000000000000E+000_dp
sys%rebatesys%MaxAgeCC=11
allocate(sys%rebatesys%AgeRngl(4))
sys%rebatesys%AgeRngl(1)=0
sys%rebatesys%AgeRngl(2)=11
sys%rebatesys%AgeRngl(3)=16
sys%rebatesys%AgeRngl(4)=18
allocate(sys%rebatesys%AgeRngu(4))
sys%rebatesys%AgeRngu(1)=10
sys%rebatesys%AgeRngu(2)=15
sys%rebatesys%AgeRngu(3)=17
sys%rebatesys%AgeRngu(4)=18
allocate(sys%rebatesys%AddKid(4))
sys%rebatesys%AddKid(1)=16.9000000000000_dp
sys%rebatesys%AddKid(2)=24.7500000000000_dp
sys%rebatesys%AddKid(3)=29.6000000000000_dp
sys%rebatesys%AddKid(4)=38.9000000000000_dp
 
!hben
sys%hben%doHBen=.true. 
sys%hben%taper=0.650000000000000_dp
sys%hben%MinAmt=0.500000000000000_dp
 
!ctaxben
sys%ctaxben%docounciltaxben=.true. 
sys%ctaxben%taper=0.200000000000000_dp
sys%ctaxben%doEntitlementCut=.false.
sys%ctaxben%entitlementShare=0.000000000000000E+000_dp
 
!ccben
sys%ccben%dopolltax=.false.
sys%ccben%taper=0.150000000000000_dp
sys%ccben%PropElig=0.800000000000000_dp
sys%ccben%MinAmt=0.500000000000000_dp
sys%ccben%CCrate=0.000000000000000E+000_dp
 
!uc
sys%uc%doUnivCred=.false.
sys%uc%MainCou=0.000000000000000E+000_dp
sys%uc%YngCou=0.000000000000000E+000_dp
sys%uc%MainSin=0.000000000000000E+000_dp
sys%uc%YngSin=0.000000000000000E+000_dp
sys%uc%MinAgeMain=0
sys%uc%FirstKid=0.000000000000000E+000_dp
sys%uc%OtherKid=0.000000000000000E+000_dp
sys%uc%MaxCC1=0.000000000000000E+000_dp
sys%uc%MaxCC2=0.000000000000000E+000_dp
sys%uc%PropCC=0.000000000000000E+000_dp
sys%uc%MaxAgeCC=0
sys%uc%doRentCap=.false.
sys%uc%DisregSinNoKidsHi=0.000000000000000E+000_dp
sys%uc%DisregSinNoKidsLo=0.000000000000000E+000_dp
sys%uc%DisregSinKidsHi=0.000000000000000E+000_dp
sys%uc%DisregSinKidsLo=0.000000000000000E+000_dp
sys%uc%DisregCouNoKidsHi=0.000000000000000E+000_dp
sys%uc%DisregCouNoKidsLo=0.000000000000000E+000_dp
sys%uc%DisregCouKidsHi=0.000000000000000E+000_dp
sys%uc%DisregCouKidsLo=0.000000000000000E+000_dp
sys%uc%taper=0.000000000000000E+000_dp
sys%uc%MinAmt=0.000000000000000E+000_dp
 
!statepen
sys%statepen%doStatePen=.false.
sys%statepen%PenAgeMan=65
sys%statepen%PenAgeWoman=60
 
!bencap
sys%bencap%doCap=.false.
sys%bencap%doThruUC=.false.
sys%bencap%sinNoKids=9.999999999999990E+099_dp
sys%bencap%sinKids=9.999999999999990E+099_dp
sys%bencap%couNoKids=9.999999999999990E+099_dp
sys%bencap%couKids=9.999999999999990E+099_dp
sys%bencap%UCEarnThr=0.000000000000000E+000_dp
 
!extra
sys%extra%fsminappamt=.false.
sys%extra%matgrant=.false.
sys%extra%prices=19970401
 
!.f90 FORTAX system; END-OF-FILE
 
