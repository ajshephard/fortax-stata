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
        #:set name="nettu"
        #:def fortaxdef(type, var, str, attr, **kwargs)
        case("${var}$")
            income = stata_net%tu%${var}$
        #:enddef
        #:include "include_files.fypp"
        #:set name="netad"
        #:def fortaxdef(type, var, str, attr, **kwargs)
        case("${var}$1")
            income = stata_net%ad(1)%${var}$
        #:enddef
        #:include "include_files.fypp"
        #:def fortaxdef(type, var, str, attr, **kwargs)
        case("${var}$2")
            income = stata_net%ad(2)%${var}$
        #:enddef
        #:include "include_files.fypp"
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
        #:set name="nettu"
        #:def fortaxdef(type, var, str, attr, **kwargs)
        case("${var}$")
            netlabelFortran = ${str}$ // C_NULL_CHAR
        #:enddef
        #:include "include_files.fypp"
        #:set name="netad"
        #:def fortaxdef(type, var, str, attr, **kwargs)
        case("${var}$1")
            netlabelFortran = "${"Adult 1: " + str.strip('"')}$" // C_NULL_CHAR
        #:enddef
        #:include "include_files.fypp"
        #:def fortaxdef(type, var, str, attr, **kwargs)
        case("${var}$2")
            netlabelFortran = "${"Adult 2: " + str.strip('"')}$" // C_NULL_CHAR
        #:enddef
        #:include "include_files.fypp"
        end select

        do ix = 1, 255
            netlabel(ix) = netlabelFortran(ix:ix)
        end do

    end subroutine c_statalabelget

end module stata_save
