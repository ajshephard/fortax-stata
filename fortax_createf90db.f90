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
    use fortax_type
    use fortax_read
    implicit none
    integer :: narg
    integer :: istat
    integer :: tmpunit
    integer :: funit
    logical :: err
    character(len=1024) :: tmpname
    character(len=1024) :: carg
    character(len=1024) :: fpathin
    character(len=1024) :: fpathout
    character(len=1024) :: fileline
    character(len=1024) :: f90name

    type(sys_t) :: sys

    narg = command_argument_count()

    if (narg.ne.2) then
        stop 'usage: ./fortax_createf90db.out syspath outpath'
    end if

    call get_command_argument(1,carg)
    fpathin = trim(carg)
    call get_command_argument(2,carg)
    fpathout = trim(carg)

    ! first, use system call to get contents of directory
    open( newunit=tmpunit, status='scratch' )
    inquire(unit=tmpunit,name=tmpname)
#   ifdef _WIN32
        call system('dir '//trim(fpathin)//'\*.xml /b >'//tmpname)
#   endif
#   ifdef __linux
        call system('ls '//trim(fpathin)//'/*.xml | xargs -n1 basename >'//tmpname)
#   endif
    open(newunit=funit,file=tmpname,action='read',status='old',iostat=istat)

    do

        read(funit,*,iostat=istat) fileline

        if (istat==-1) then !eof
            exit
        else if (istat>0) then !error
            err = .true.
            write(*,*)  "error reading file list"
        else
            print *, trim(fileline)
            f90name = trim(fileline)
            f90name(len_trim(fileline)-2:len_trim(fileline)) = 'f90'
            call readFortaxParams(sys,trim(fpathin)//'/'//trim(fileline))
            call sys_saveF90(sys,trim(fpathout)//'/'//f90name)
        end if

    end do

end program fortax_createf90db
