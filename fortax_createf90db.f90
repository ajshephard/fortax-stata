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

program fortax_createf90db

    use fortax_library
    use iso_fortran_env

    implicit none

    integer :: narg
    integer :: istat
    integer :: tmpunit
    integer :: funit
    integer :: ppos
    logical :: err
    character(len = 1024) :: listname
    character(len = 1024) :: carg
    character(len = 1024) :: fpathin
    character(len = 1024) :: fpathout
    character(len = 1024) :: fileline
    character(len = 1024) :: f90name

    type(sys_t) :: sys

    narg = command_argument_count()

    if (narg .ne. 2) then
        stop 'usage: ./fortax_createf90db.out syspath outpath'
    end if

    call get_command_argument(1, carg)
    fpathin = trim(carg)
    call get_command_argument(2, carg)
    fpathout = trim(carg)

    ! first, use system call to get contents of directory
    listname = trim(adjustl(fpathout)) // '/systems.txt'
#   ifdef _WIN32
        call system('dir ' // trim(fpathin) // '\*.json /b >' // listname)
#   endif
#   ifdef __linux
        call system('ls ' // trim(fpathin)//'/*.json | xargs -n1 basename >' // listname)
#   endif
    open(newunit = funit, file = listname, action = 'read', status = 'old', iostat = istat)

    do

        read(funit, *, iostat = istat) fileline

        if (istat == -1) then !eof
            exit
        else if (istat > 0) then !error
            err = .true.
            write(output_unit, *) "Error reading file list"
        else
            write(output_unit, *) trim(fileline)
            ppos = scan(trim(fileline), ".", back = .true.)
            if ( ppos > 0 ) f90name = fileline(1:ppos) // 'f90'
            call FORTAX_readFortaxParams(sys, trim(fpathin) // '/' // trim(fileline))
            call FORTAX_sys_saveF90(sys, trim(fpathout) // '/' // f90name)
        end if

    end do

end program fortax_createf90db
