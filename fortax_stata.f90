! This file is part of FORTAX for Stata.
!
! FORTAX for Stata is free software: you can redistribute it and/or modify
! it under the terms of the GNU General Public License as published by
! the Free Software Foundation, either version 3 of the License, or
! (at your option) any later version.
!
! FORTAX for Stata is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
! GNU General Public License for more details.
!
! You should have received a copy of the GNU General Public License
! along with FORTAX for Stata.  If not, see <http://www.gnu.org/licenses/>.

module stata_save

    use fortax_type, only : fam_t, sys_t, net_t
    use fortax_realtype, only : dp

    type(sys_t) :: stata_sys
    type(fam_t) :: stata_fam
    type(net_t) :: stata_net

    logical :: stata_setnkids, stata_couple, stata_setcouple
    integer :: stata_nkids

contains

    pure function c_to_f_string(s,n) result(str)
        use iso_c_binding
        character(kind=c_char,len=1), intent(in) :: s(*)
        integer, intent(in) :: n
        character(len=n) :: str
        str = transfer(s(1:n), str)
    end function c_to_f_string

    subroutine c_get_sysdb(sysname,sysnamelen,ifail) bind(c)
        use fortax_sysdb, only : get_sysdb
        use, intrinsic :: iso_c_binding
        implicit none
        integer(c_int), intent(out) :: ifail
        integer(c_int), intent(in)  :: sysnamelen
        character(kind=c_char,len=1), intent(in) :: sysname(sysnamelen)
        character(len=sysnamelen) :: sysnameFortran
        sysnameFortran = c_to_f_string(sysname,sysnamelen)
        call get_sysdb(stata_sys,sysnameFortran,ifail)
    end subroutine c_get_sysdb

    subroutine c_statauprate(factor) bind(c)
        use, intrinsic :: iso_c_binding
        use fortax_prices, only : upratesys
        implicit none
        real(c_double), intent(in) :: factor
        if (factor.ne.1.0_dp) then
            call upratesys(stata_sys,factor)
        end if
    end subroutine c_statauprate

    subroutine c_stataincome() bind(c)
        use fortax_type, only : net_t !, fam_desc
        use fortax_calc, only : calcnetinc
        use, intrinsic :: iso_c_binding
        implicit none
        call calcnetinc(stata_sys,stata_fam,stata_net)
    end subroutine c_stataincome

    subroutine c_statanetget(netstr,netstrlen,income) bind(c)
        use, intrinsic :: iso_c_binding
        implicit none
        integer(c_int), intent(in) :: netstrlen
        real(c_double), intent(out) :: income
        character(kind=c_char,len=1), intent(in) :: netstr(netstrlen)
        character(len=netstrlen) :: netstrFortran
        netstrFortran = c_to_f_string(netstr,netstrlen)
        !select case(trim(adjustl(lower(famstr))))

        ! this can be automated...
        select case(trim(adjustl(netstrFortran)))
        case('pretaxearn')
            income = stata_net%tu%pretaxearn
        case('posttaxearn')
            income = stata_net%tu%posttaxearn
        case('chben')
            income = stata_net%tu%chben
        case('matgrant')
            income = stata_net%tu%matgrant
        case('fc')
            income = stata_net%tu%fc
        case('wtc')
            income = stata_net%tu%wtc
        case('ctc')
            income = stata_net%tu%ctc
        case('incsup')
            income = stata_net%tu%incsup
        case('hben')
            income = stata_net%tu%hben
        case('polltax')
            income = stata_net%tu%polltax
        case('polltaxben')
            income = stata_net%tu%polltaxben
        case('ctax')
            income = stata_net%tu%ctax
        case('ctaxben')
            income = stata_net%tu%ctaxben
        case('uc')
            income = stata_net%tu%uc
        case('dispinc')
            income = stata_net%tu%dispinc
        case('pretax')
            income = stata_net%tu%pretax
        case('nettax')
            income = stata_net%tu%nettax
        case('chcaresub')
            income = stata_net%tu%chcaresub
        case('fsm')
            income = stata_net%tu%fsm
        case('totben')
            income = stata_net%tu%totben
        case('taxable1')
            income = stata_net%ad(1)%taxable
        case('inctax1')
            income = stata_net%ad(1)%inctax
        case('natins1')
            income = stata_net%ad(1)%natins
        case('pretaxearn1')
            income = stata_net%ad(1)%pretaxearn
        case('posttaxearn1')
            income = stata_net%ad(1)%posttaxearn
        case('taxable2')
            income = stata_net%ad(2)%taxable
        case('inctax2')
            income = stata_net%ad(2)%inctax
        case('natins2')
            income = stata_net%ad(2)%natins
        case('pretaxearn2')
            income = stata_net%ad(2)%pretaxearn
        case('posttaxearn2')
            income = stata_net%ad(2)%posttaxearn
        case default
            income = 0.0_dp
        end select

    end subroutine c_statanetget

    subroutine c_statafaminit() bind(c)
        use fortax_type, only : fam_init
        use, intrinsic :: iso_c_binding
        implicit none
        call fam_init(stata_fam)
        stata_fam%ad(2)%age = 25
        stata_setnkids = .false.
        stata_setcouple = .false.
        stata_nkids = stata_fam%nkids
        stata_couple = stata_fam%couple
    end subroutine c_statafaminit

    subroutine c_statafamfin() bind(c)
        use, intrinsic :: iso_c_binding
        implicit none

        if (.not. stata_setcouple) stata_fam%couple = stata_couple
        if (.not. stata_setnkids)  stata_fam%nkids  = stata_nkids

        if (stata_fam%nkids>0) then
            stata_fam%yngkid = minval(stata_fam%kidage(1:stata_fam%nkids))
        end if
    end subroutine c_statafamfin

    subroutine c_statafamset(famstr,famstrlen,famval) bind(c)
        use, intrinsic :: iso_c_binding
        implicit none
        integer(c_int), intent(in) :: famstrlen
        !integer(c_int), intent(out) :: notset
        character(kind=c_char,len=1), intent(in) :: famstr(famstrlen)
        character(len=famstrlen) :: famstrFortran
        real(c_double) :: famval
        famstrFortran = c_to_f_string(famstr,famstrlen)

        select case(trim(adjustl(famstrFortran)))
            case('age1')
                stata_fam%ad(1)%age= max(famval, 16.0_dp)
            case('age2')
                stata_fam%ad(2)%age= max(famval, 16.0_dp)
                stata_couple = .true.
            case('earn1')
                stata_fam%ad(1)%earn = max(famval, 0.0_dp)
            case('earn2')
                stata_fam%ad(2)%earn = max(famval, 0.0_dp)
                stata_couple = .true.
            case('hrs1')
                stata_fam%ad(1)%hrs = max(famval, 0.0_dp)
            case('hrs2')
                stata_fam%ad(2)%hrs = max(famval, 0.0_dp)
                stata_couple = .true.
            case('selfemp1')
                stata_fam%ad(1)%selfemp = merge(.true., .false., famval/=0.0_dp)
            case('selfemp2')
                stata_fam%ad(2)%selfemp = merge(.true., .false., famval/=0.0_dp)
                stata_couple = .true.
            case('couple')
                stata_fam%couple = merge(.true., .false., famval/=0.0_dp)
                stata_setcouple = .true.
            case('married')
                stata_fam%married = merge(.true., .false., famval/=0.0_dp)
                stata_couple = .true.
            case('ccexp')
                stata_fam%ccexp = max(famval,0.0_dp)
            case('maint')
                stata_fam%maint = famval
            case('nkids')
                stata_fam%nkids = min(max(famval,0.0_dp),10.0_dp)
                stata_setnkids = .true.
            case('kidage1')
                stata_fam%kidage(1) = min(max(famval,0.0_dp),18.0_dp)
                stata_nkids = max(1,stata_nkids)
            case('kidage2')
                stata_fam%kidage(2) = min(max(famval,0.0_dp),18.0_dp)
                stata_nkids = max(2,stata_nkids)
            case('kidage3')
                stata_fam%kidage(3) = min(max(famval,0.0_dp),18.0_dp)
                stata_nkids = max(3,stata_nkids)
            case('kidage4')
                stata_fam%kidage(4) = min(max(famval,0.0_dp),18.0_dp)
                stata_nkids = max(4,stata_nkids)
            case('kidage5')
                stata_fam%kidage(5) = min(max(famval,0.0_dp),18.0_dp)
                stata_nkids = max(5,stata_nkids)
            case('kidage6')
                stata_fam%kidage(6) = min(max(famval,0.0_dp),18.0_dp)
                stata_nkids = max(6,stata_nkids)
            case('kidage7')
                stata_fam%kidage(7) = min(max(famval,0.0_dp),18.0_dp)
                stata_nkids = max(7,stata_nkids)
            case('kidage8')
                stata_fam%kidage(8) = min(max(famval,0.0_dp),18.0_dp)
                stata_nkids = max(8,stata_nkids)
            case('kidage9')
                stata_fam%kidage(9) = min(max(famval,0.0_dp),18.0_dp)
                stata_nkids = max(9,stata_nkids)
            case('kidage10')
                stata_fam%kidage(10) = min(max(famval,0.0_dp),18.0_dp)
                stata_nkids = max(10,stata_nkids)
            !case('yngkid')
            !    stata_fam%yngkid= famval
            case('nothads')
                stata_fam%nothads = max(famval,0.0_dp)
            case('tenure')
                stata_fam%tenure = famval
            case('rent')
                stata_fam%rent = max(famval,0.0_dp)
            case('rentcap')
                stata_fam%rentcap = max(famval,0.0_dp)
            case('region')
                stata_fam%region = famval
            case('ctband')
                stata_fam%ctband = famval
            case('banddratio')
                stata_fam%banddratio = max(famval,0.0_dp)
            case('intdate')
                stata_fam%intdate = famval
            case default
!                 notset = 1
        end select

    end subroutine c_statafamset

    subroutine c_statasys(sysname,sysnamelen) bind(c)
        !use fortax_type, only : sys_t
        use fortax_read, only : readFortaxParams
        !use stata_save
        use, intrinsic :: iso_c_binding
        implicit none
        integer(c_int), intent(in) :: sysnamelen
        character(kind=c_char,len=1), intent(in) :: sysname(sysnamelen)
        character(len=sysnamelen) :: sysnameFortran
        sysnameFortran = c_to_f_string(sysname,sysnamelen)
        call readFortaxParams(stata_sys,trim(adjustl(sysnameFortran)))

    end subroutine c_statasys

    subroutine c_statalabelget(netstr,netstrlen,netlabel) bind(c)
        use, intrinsic :: iso_c_binding
        implicit none
        integer(c_int), intent(in) :: netstrlen
        character(kind=c_char,len=1), intent(in)  :: netstr(*)
        character(kind=c_char,len=1), intent(out) :: netlabel(255)
        character(len=netstrlen) :: netstrFortran
        character(len=255) :: netlabelFortran
        integer :: ix
        netstrFortran = c_to_f_string(netstr,netstrlen)

#       undef _$header
#       undef _$footer
#       define _$header
#       define _$footer
        select case(trim(adjustl(netstrFortran)))
#       undef _$double
#       define _$double(a,b,c) case(#a);netlabelFortran=b//C_NULL_CHAR
#       include "includes/nettu_t.inc"
#       undef _$double
#       define _$double(a,b,c) case(#a//"1");netlabelFortran="Adult 1, "//b//C_NULL_CHAR
#       include "includes/netad_t.inc"
#       undef _$double
#       define _$double(a,b,c) case(#a//"2");netlabelFortran="Adult 2, "//b//C_NULL_CHAR
#       include "includes/netad_t.inc"
        end select

#       undef _$header
#       undef _$footer
#       undef _$double

        do ix=1, 255
            netlabel(ix) = netlabelFortran(ix:ix)
        end do

    end subroutine c_statalabelget

end module stata_save

