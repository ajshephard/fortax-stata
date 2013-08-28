! .f90 FORTAX system; generated using sys_saveF90
 
call sys_init(sys) !deallocates arrays and sets values to default
 
!inctax
sys%inctax%numbands=3
sys%inctax%pa=124.519230769231_dp
sys%inctax%doPATaper=.false.
sys%inctax%disablePATaperRounding=.false.
sys%inctax%paTaperThresh=0.000000000000000E+000_dp
sys%inctax%paTaperRate=0.000000000000000E+000_dp
sys%inctax%mma=0.000000000000000E+000_dp
sys%inctax%ctc=0.000000000000000E+000_dp
sys%inctax%ctcyng=0.000000000000000E+000_dp
sys%inctax%mmarate=0.100000000000000_dp
sys%inctax%ctctaper=0.000000000000000E+000_dp
sys%inctax%c4rebate=0.000000000000000E+000_dp
allocate(sys%inctax%bands(3))
sys%inctax%bands(1)=46.9230769230769_dp
sys%inctax%bands(2)=719.230769230769_dp
sys%inctax%bands(3)=19230.7692307692_dp
allocate(sys%inctax%rates(3))
sys%inctax%rates(1)=0.200000000000000_dp
sys%inctax%rates(2)=0.200000000000000_dp
sys%inctax%rates(3)=0.400000000000000_dp
 
!natins
sys%natins%numrates=5
sys%natins%c4nrates=3
sys%natins%c2floor=97.6000000000000_dp
sys%natins%c2rate=2.40000000000000_dp
sys%natins%ceiling=9.999999999999990E+099_dp
allocate(sys%natins%rates(5))
sys%natins%rates(1)=0.000000000000000E+000_dp
sys%natins%rates(2)=0.000000000000000E+000_dp
sys%natins%rates(3)=0.110000000000000_dp
sys%natins%rates(4)=0.110000000000000_dp
sys%natins%rates(5)=1.000000000000000E-002_dp
allocate(sys%natins%bands(5))
sys%natins%bands(1)=95.0000000000000_dp
sys%natins%bands(2)=110.000000000000_dp
sys%natins%bands(3)=770.000000000000_dp
sys%natins%bands(4)=844.000000000000_dp
sys%natins%bands(5)=9.999999999999990E+099_dp
allocate(sys%natins%c4rates(3))
sys%natins%c4rates(1)=0.000000000000000E+000_dp
sys%natins%c4rates(2)=8.000000000000000E-002_dp
sys%natins%c4rates(3)=1.000000000000000E-002_dp
allocate(sys%natins%c4bands(3))
sys%natins%c4bands(1)=109.900000000000_dp
sys%natins%c4bands(2)=843.750000000000_dp
sys%natins%c4bands(3)=1000000.00000000_dp
 
!chben
sys%chben%doChBen=.true. 
sys%chben%basic=13.2000000000000_dp
sys%chben%kid1xtr=6.80000000000000_dp
sys%chben%opf=0.000000000000000E+000_dp
sys%chben%MatGrantVal=500.000000000000_dp
sys%chben%MatGrantOnlyFirstKid=.false.
sys%chben%doTaper=.false.
sys%chben%disableTaperRounding=.false.
sys%chben%taperStart=0.000000000000000E+000_dp
sys%chben%taperRate=0.000000000000000E+000_dp
sys%chben%taperIsIncTax=.false.
 
!fc
sys%fc%dofamcred=.false.
sys%fc%NumAgeRng=4
sys%fc%MaxAgeCC=0
sys%fc%WFTCMaxAgeCC=0
sys%fc%adult=0.000000000000000E+000_dp
sys%fc%ftprem=0.000000000000000E+000_dp
sys%fc%hours1=16.0000000000000_dp
sys%fc%hours2=30.0000000000000_dp
sys%fc%thres=0.000000000000000E+000_dp
sys%fc%taper=0.000000000000000E+000_dp
sys%fc%MaintDisreg=9.999999999999990E+099_dp
sys%fc%MaxCC1=0.000000000000000E+000_dp
sys%fc%MaxCC2=0.000000000000000E+000_dp
sys%fc%WFTCMaxCC1=0.000000000000000E+000_dp
sys%fc%WFTCMaxCC2=0.000000000000000E+000_dp
sys%fc%WFTCPropCC=0.000000000000000E+000_dp
sys%fc%MinAmt=0.000000000000000E+000_dp
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
sys%fc%kidcred(1)=0.000000000000000E+000_dp
sys%fc%kidcred(2)=0.000000000000000E+000_dp
sys%fc%kidcred(3)=0.000000000000000E+000_dp
sys%fc%kidcred(4)=0.000000000000000E+000_dp
 
!ctc
sys%ctc%fam=10.4807692307692_dp
sys%ctc%baby=10.4807692307692_dp
sys%ctc%kid=42.9807692307692_dp
 
!wtc
sys%wtc%Basic=36.3461538461538_dp
sys%wtc%CouLP=72.1153846153846_dp
sys%wtc%FT=14.9038461538462_dp
sys%wtc%MinHrsKids=16.0000000000000_dp
sys%wtc%MinHrsCouKids=16.0000000000000_dp
sys%wtc%MinHrsNoKids=30.0000000000000_dp
sys%wtc%FTHrs=30.0000000000000_dp
sys%wtc%MinAgeKids=16
sys%wtc%MinAgeNoKids=25
sys%wtc%MaxCC1=175.000000000000_dp
sys%wtc%MaxCC2=300.000000000000_dp
sys%wtc%PropCC=0.800000000000000_dp
sys%wtc%MaxAgeCC=15
sys%wtc%NewDisreg=16.8500000000000_dp
sys%wtc%NewDisregCon=.true. 
 
!ntc
sys%ntc%donewtaxcred=.true. 
sys%ntc%thr1lo=123.461538461538_dp
sys%ntc%thr1hi=308.461538461538_dp
sys%ntc%thr2=961.538461538462_dp
sys%ntc%taper1=0.390000000000000_dp
sys%ntc%taper2=6.666660000000001E-002_dp
sys%ntc%taperCTCInOneGo=.false.
sys%ntc%MinAmt=0.500000000000000_dp
 
!incsup
sys%incsup%doIncSup=.true. 
sys%incsup%IncChben=.false.
sys%incsup%NumAgeRng=1
sys%incsup%MainCou=100.950000000000_dp
sys%incsup%YngCou=76.9000000000000_dp
sys%incsup%MainLP=64.3000000000000_dp
sys%incsup%YngLP=50.9500000000000_dp
sys%incsup%MainSin=64.3000000000000_dp
sys%incsup%YngSin=50.9500000000000_dp
sys%incsup%ValFSM=5.38000000000000_dp
sys%incsup%DisregLP=20.0000000000000_dp
sys%incsup%DisregSin=5.00000000000000_dp
sys%incsup%DisregCou=10.0000000000000_dp
sys%incsup%DisregShared=.true. 
sys%incsup%PremFam=0.000000000000000E+000_dp
sys%incsup%PremLP=0.000000000000000E+000_dp
sys%incsup%hours=16.0000000000000_dp
sys%incsup%MaintDisreg=10.0000000000000_dp
allocate(sys%incsup%AgeRngl(1))
sys%incsup%AgeRngl(1)=0
allocate(sys%incsup%AgeRngu(1))
sys%incsup%AgeRngu(1)=19
allocate(sys%incsup%AddKid(1))
sys%incsup%AddKid(1)=0.000000000000000E+000_dp
 
!ctax
sys%ctax%docounciltax=.true. 
sys%ctax%bandD=26.8167307692308_dp
sys%ctax%SinDis=0.250000000000000_dp
sys%ctax%RatioA=0.670000000000000_dp
sys%ctax%RatioB=0.770000000000000_dp
sys%ctax%RatioC=0.880000000000000_dp
sys%ctax%RatioE=1.22000000000000_dp
sys%ctax%RatioF=1.44000000000000_dp
sys%ctax%RatioG=1.67000000000000_dp
sys%ctax%RatioH=2.00000000000000_dp
 
!rebatesys
sys%rebatesys%RulesUnderFC=.false.
sys%rebatesys%RulesUnderWFTC=.false.
sys%rebatesys%RulesUnderNTC=.true. 
sys%rebatesys%NumAgeRng=2
sys%rebatesys%Restrict=.false.
sys%rebatesys%docap=.false.
sys%rebatesys%MainCou=100.950000000000_dp
sys%rebatesys%YngCou=76.9000000000000_dp
sys%rebatesys%MainLP=64.3000000000000_dp
sys%rebatesys%YngLP=50.9500000000000_dp
sys%rebatesys%MainSin=64.3000000000000_dp
sys%rebatesys%YngSin=50.9500000000000_dp
sys%rebatesys%DisregSin=5.00000000000000_dp
sys%rebatesys%DisregLP=25.0000000000000_dp
sys%rebatesys%DisregCou=10.0000000000000_dp
sys%rebatesys%CredInDisregCC=.true. 
sys%rebatesys%ChbenIsIncome=.true. 
sys%rebatesys%PremFam=17.3000000000000_dp
sys%rebatesys%PremLP=0.000000000000000E+000_dp
sys%rebatesys%MaintDisreg=25.0000000000000_dp
sys%rebatesys%MaxCC1=175.000000000000_dp
sys%rebatesys%MaxCC2=300.000000000000_dp
sys%rebatesys%MaxAgeCC=15
allocate(sys%rebatesys%AgeRngl(2))
sys%rebatesys%AgeRngl(1)=0
sys%rebatesys%AgeRngl(2)=1
allocate(sys%rebatesys%AgeRngu(2))
sys%rebatesys%AgeRngu(1)=0
sys%rebatesys%AgeRngu(2)=19
allocate(sys%rebatesys%AddKid(2))
sys%rebatesys%AddKid(1)=66.6600000000000_dp
sys%rebatesys%AddKid(2)=56.1100000000000_dp
 
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
sys%extra%prices=20090401
 
!.f90 FORTAX system; END-OF-FILE
 
