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

    use fortax_library, dp => FORTAX_dp
    use iso_c_binding

    type(sys_t) :: stata_sys
    type(fam_t) :: stata_fam
    type(net_t) :: stata_net

    logical :: stata_setnkids, stata_setcouple
    integer :: stata_nkids, stata_couple

contains

    pure function c_to_f_string(s, n) result(str)
        implicit none
        character(kind = c_char), intent(in) :: s(*)
        integer, intent(in) :: n
        character(len = n) :: str
        str = transfer(s(1:n), str)
    end function c_to_f_string

    subroutine c_get_sysdb(sysname, sysnamelen, ifail) bind(c)
        use fortax_sysdb, only : get_sysdb
        implicit none
        integer(c_int), intent(out) :: ifail
        integer(c_int), intent(in) :: sysnamelen
        character(kind = c_char), intent(in) :: sysname(sysnamelen)
        character(len = sysnamelen) :: sysnameFortran
        sysnameFortran = c_to_f_string(sysname, sysnamelen)
        call get_sysdb(stata_sys, sysnameFortran, ifail)
    end subroutine c_get_sysdb

    subroutine c_statauprate(factor) bind(c)
        implicit none
        real(c_double), intent(in) :: factor
        if (factor .ne. 1.0_dp) then
            call FORTAX_upratesys(stata_sys, factor)
        end if
    end subroutine c_statauprate

    subroutine c_stataincome() bind(c)
        implicit none
        call FORTAX_calcNetInc(stata_sys, stata_fam, stata_net)
    end subroutine c_stataincome

    subroutine c_statanetget(netstr, netstrlen, income) bind(c)
        use, intrinsic :: iso_c_binding
        implicit none
        integer(c_int), intent(in) :: netstrlen
        real(c_double), intent(out) :: income
        character(kind = c_char), intent(in) :: netstr(netstrlen)
        character(len = netstrlen) :: netstrFortran
        netstrFortran = c_to_f_string(netstr, netstrlen)

        select case(trim(adjustl(netstrFortran)))
        case("pretaxearn")
            income = stata_net%tu%pretaxearn
        case("posttaxearn")
            income = stata_net%tu%posttaxearn
        case("chben")
            income = stata_net%tu%chben
        case("matgrant")
            income = stata_net%tu%matgrant
        case("fc")
            income = stata_net%tu%fc
        case("wtc")
            income = stata_net%tu%wtc
        case("ctc")
            income = stata_net%tu%ctc
        case("ccexp")
            income = stata_net%tu%ccexp
        case("incsup")
            income = stata_net%tu%incsup
        case("hben")
            income = stata_net%tu%hben
        case("polltax")
            income = stata_net%tu%polltax
        case("polltaxben")
            income = stata_net%tu%polltaxben
        case("ctax")
            income = stata_net%tu%ctax
        case("ctaxben")
            income = stata_net%tu%ctaxben
        case("maxuc")
            income = stata_net%tu%maxuc
        case("uc")
            income = stata_net%tu%uc
        case("dispinc")
            income = stata_net%tu%dispinc
        case("pretax")
            income = stata_net%tu%pretax
        case("nettax")
            income = stata_net%tu%nettax
        case("chcaresub")
            income = stata_net%tu%chcaresub
        case("fsm")
            income = stata_net%tu%fsm
        case("totben")
            income = stata_net%tu%totben
        case("taxable1")
            income = stata_net%ad(1)%taxable
        case("inctax1")
            income = stata_net%ad(1)%inctax
        case("natins1")
            income = stata_net%ad(1)%natins
        case("natinsc11")
            income = stata_net%ad(1)%natinsc1
        case("natinsc21")
            income = stata_net%ad(1)%natinsc2
        case("natinsc41")
            income = stata_net%ad(1)%natinsc4
        case("pretaxearn1")
            income = stata_net%ad(1)%pretaxearn
        case("posttaxearn1")
            income = stata_net%ad(1)%posttaxearn
        case("taxable2")
            income = stata_net%ad(2)%taxable
        case("inctax2")
            income = stata_net%ad(2)%inctax
        case("natins2")
            income = stata_net%ad(2)%natins
        case("natinsc12")
            income = stata_net%ad(2)%natinsc1
        case("natinsc22")
            income = stata_net%ad(2)%natinsc2
        case("natinsc42")
            income = stata_net%ad(2)%natinsc4
        case("pretaxearn2")
            income = stata_net%ad(2)%pretaxearn
        case("posttaxearn2")
            income = stata_net%ad(2)%posttaxearn
        case default
            income = 0.0_dp
        end select

    end subroutine c_statanetget

    subroutine c_statafaminit() bind(c)
        implicit none
        call FORTAX_fam_init(stata_fam)
        stata_setnkids = .false.
        stata_setcouple = .false.
        stata_nkids = stata_fam%nkids
        stata_couple = stata_fam%couple
    end subroutine c_statafaminit

    subroutine c_statafamfin() bind(c)
        implicit none
        if (.not. stata_setcouple) stata_fam%couple = stata_couple
        if (.not. stata_setnkids)  stata_fam%nkids = stata_nkids
    end subroutine c_statafamfin

    subroutine c_statafamset(famstr, famstrlen, famval) bind(c)
        use, intrinsic :: iso_c_binding
        implicit none
        integer(c_int), intent(in) :: famstrlen
        character(kind = c_char), intent(in) :: famstr(famstrlen)
        character(len = famstrlen) :: famstrFortran
        real(c_double) :: famval
        famstrFortran = c_to_f_string(famstr, famstrlen)

        select case(trim(adjustl(famstrFortran)))
            case('age1')
                stata_fam%ad(1)%age = nint(max(famval, 16.0_dp))
            case('age2')
                stata_fam%ad(2)%age = nint(max(famval, 16.0_dp))
                stata_couple = 1
            case('earn1')
                stata_fam%ad(1)%earn = max(famval, 0.0_dp)
            case('earn2')
                stata_fam%ad(2)%earn = max(famval, 0.0_dp)
                stata_couple = 1
            case('hrs1')
                stata_fam%ad(1)%hrs = max(famval, 0.0_dp)
            case('hrs2')
                stata_fam%ad(2)%hrs = max(famval, 0.0_dp)
                stata_couple = 1
            case('selfemp1')
                stata_fam%ad(1)%selfemp = merge(1, 0, famval/=0.0_dp)
            case('selfemp2')
                stata_fam%ad(2)%selfemp = merge(1, 0, famval/=0.0_dp)
                stata_couple = 1
            case('couple')
                stata_fam%couple = merge(1, 0, famval/=0.0_dp)
                stata_setcouple = .true.
            case('married')
                stata_fam%married = merge(1, 0, famval/=0.0_dp)
                stata_couple = 1
            case('ccexp')
                stata_fam%ccexp = max(famval, 0.0_dp)
            case('maint')
                stata_fam%maint = famval
            case('nkids')
                stata_fam%nkids = nint(min(max(famval, 0.0_dp), 10.0_dp))
                stata_setnkids = .true.
            case('kidage1')
                stata_fam%kidage(1) = nint(min(max(famval, 0.0_dp), 18.0_dp))
                stata_nkids = max(1, stata_nkids)
            case('kidage2')
                stata_fam%kidage(2) = nint(min(max(famval, 0.0_dp), 18.0_dp))
                stata_nkids = max(2, stata_nkids)
            case('kidage3')
                stata_fam%kidage(3) = nint(min(max(famval, 0.0_dp), 18.0_dp))
                stata_nkids = max(3, stata_nkids)
            case('kidage4')
                stata_fam%kidage(4) = nint(min(max(famval, 0.0_dp), 18.0_dp))
                stata_nkids = max(4, stata_nkids)
            case('kidage5')
                stata_fam%kidage(5) = nint(min(max(famval, 0.0_dp), 18.0_dp))
                stata_nkids = max(5, stata_nkids)
            case('kidage6')
                stata_fam%kidage(6) = nint(min(max(famval, 0.0_dp), 18.0_dp))
                stata_nkids = max(6, stata_nkids)
            case('kidage7')
                stata_fam%kidage(7) = nint(min(max(famval, 0.0_dp), 18.0_dp))
                stata_nkids = max(7, stata_nkids)
            case('kidage8')
                stata_fam%kidage(8) = nint(min(max(famval, 0.0_dp), 18.0_dp))
                stata_nkids = max(8, stata_nkids)
            case('kidage9')
                stata_fam%kidage(9) = nint(min(max(famval, 0.0_dp), 18.0_dp))
                stata_nkids = max(9, stata_nkids)
            case('kidage10')
                stata_fam%kidage(10) = nint(min(max(famval, 0.0_dp), 18.0_dp))
                stata_nkids = max(10, stata_nkids)
            case('nothads')
                stata_fam%nothads = nint(max(famval, 0.0_dp))
            case('tenure')
                stata_fam%tenure = nint(famval)
            case('rent')
                stata_fam%rent = max(famval, 0.0_dp)
            case('rentcap')
                stata_fam%rentcap = max(famval, 0.0_dp)
            case('region')
                stata_fam%region = nint(famval)
            case('ctband')
                stata_fam%ctband = nint(famval)
            case('banddratio')
                stata_fam%banddratio = max(famval, 0.0_dp)
            case('intdate')
                stata_fam%intdate = nint(famval)
            case default
!                 notset = 1
        end select

    end subroutine c_statafamset

    subroutine c_statasys(sysname, sysnamelen) bind(c)
        implicit none
        integer(c_int), intent(in) :: sysnamelen
        character(kind = c_char), intent(in) :: sysname(sysnamelen)
        character(len = sysnamelen) :: sysnameFortran
        sysnameFortran = c_to_f_string(sysname, sysnamelen)
        call FORTAX_readFortaxParams(stata_sys, trim(adjustl(sysnameFortran)))
    end subroutine c_statasys

    subroutine c_statalabelget(netstr, netstrlen, netlabel) bind(c)
        implicit none
        integer(c_int), intent(in) :: netstrlen
        character(kind = c_char), intent(in) :: netstr(*)
        character(kind = c_char), intent(out) :: netlabel(255)
        character(len = netstrlen) :: netstrFortran
        character(len = 255) :: netlabelFortran
        integer :: ix
        netstrFortran = c_to_f_string(netstr, netstrlen)

        select case(trim(adjustl(netstrFortran)))
        case("pretaxearn")
            netlabelFortran = "Pre-tax earnings" // C_NULL_CHAR
        case("posttaxearn")
            netlabelFortran = "Post-tax earnings" // C_NULL_CHAR
        case("chben")
            netlabelFortran = "Child benefit" // C_NULL_CHAR
        case("matgrant")
            netlabelFortran = "Maternity grant" // C_NULL_CHAR
        case("fc")
            netlabelFortran = "Family Credit/WFTC" // C_NULL_CHAR
        case("wtc")
            netlabelFortran = "Working Tax Credit" // C_NULL_CHAR
        case("ctc")
            netlabelFortran = "Child Tax Credit" // C_NULL_CHAR
        case("ccexp")
            netlabelFortran = "Childcare expenditure" // C_NULL_CHAR
        case("incsup")
            netlabelFortran = "Income Support" // C_NULL_CHAR
        case("hben")
            netlabelFortran = "Housing Benefit" // C_NULL_CHAR
        case("polltax")
            netlabelFortran = "Community Charge" // C_NULL_CHAR
        case("polltaxben")
            netlabelFortran = "Community Charge Benefit" // C_NULL_CHAR
        case("ctax")
            netlabelFortran = "Council Tax" // C_NULL_CHAR
        case("ctaxben")
            netlabelFortran = "Council Tax Benefit" // C_NULL_CHAR
        case("maxuc")
            netlabelFortran = "Universal Credit maximum award" // C_NULL_CHAR
        case("uc")
            netlabelFortran = "Universal Credit" // C_NULL_CHAR
        case("dispinc")
            netlabelFortran = "Disposable income" // C_NULL_CHAR
        case("pretax")
            netlabelFortran = "Pre-tax income" // C_NULL_CHAR
        case("nettax")
            netlabelFortran = "Total net tax" // C_NULL_CHAR
        case("chcaresub")
            netlabelFortran = "Childcare subsidy" // C_NULL_CHAR
        case("fsm")
            netlabelFortran = "Free school meals value" // C_NULL_CHAR
        case("totben")
            netlabelFortran = "Total benefits and Tax Credits" // C_NULL_CHAR
        case("taxable1")
            netlabelFortran = "Adult 1: Taxable income" // C_NULL_CHAR
        case("inctax1")
            netlabelFortran = "Adult 1: Income tax" // C_NULL_CHAR
        case("natins1")
            netlabelFortran = "Adult 1: National Insurance" // C_NULL_CHAR
        case("natinsc11")
            netlabelFortran = "Adult 1: National Insurance, class 1" // C_NULL_CHAR
        case("natinsc21")
            netlabelFortran = "Adult 1: National Insurance, class 2" // C_NULL_CHAR
        case("natinsc41")
            netlabelFortran = "Adult 1: National Insurance, class 4" // C_NULL_CHAR
        case("pretaxearn1")
            netlabelFortran = "Adult 1: Pre-tax earnings" // C_NULL_CHAR
        case("posttaxearn1")
            netlabelFortran = "Adult 1: Post-tax earnings" // C_NULL_CHAR
        case("taxable2")
            netlabelFortran = "Adult 2: Taxable income" // C_NULL_CHAR
        case("inctax2")
            netlabelFortran = "Adult 2: Income tax" // C_NULL_CHAR
        case("natins2")
            netlabelFortran = "Adult 2: National Insurance" // C_NULL_CHAR
        case("natinsc12")
            netlabelFortran = "Adult 2: National Insurance, class 1" // C_NULL_CHAR
        case("natinsc22")
            netlabelFortran = "Adult 2: National Insurance, class 2" // C_NULL_CHAR
        case("natinsc42")
            netlabelFortran = "Adult 2: National Insurance, class 4" // C_NULL_CHAR
        case("pretaxearn2")
            netlabelFortran = "Adult 2: Pre-tax earnings" // C_NULL_CHAR
        case("posttaxearn2")
            netlabelFortran = "Adult 2: Post-tax earnings" // C_NULL_CHAR
        end select

        do ix = 1, 255
            netlabel(ix) = netlabelFortran(ix:ix)
        end do

    end subroutine c_statalabelget

end module stata_save
