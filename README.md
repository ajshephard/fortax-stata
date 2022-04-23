# FORTAX for Stata

FORTAX for Stata (henceforth, fortax) provides a convenient way of accessing the [Fortran FORTAX library](https://github.com/ajshephard/fortax-library/) from within Stata. It allows users to calculate very detailed income measures under a range of UK tax and benefit systems.

## Stata syntax

```
fortax [if exp] [in range] [, listsys listfam listnet listlbl sys(sysname) sysfile(filename) uprate(real) famvar1(varname) ...  famvarN(varname)
    netout(namelist) netoutvar(namelist) label replace ]
```

There are essentially three parts to using fortax; firstly, specifying the tax and benefit system that you wish to calculate income components under through options `sys` or `sysfile`; secondly, defining the families who these incomes will be calculated for through the `famvar` variables; thirdly,     specifying the income measures that you wish fortax to calculate through `netout`.

## Tax and benefit systems

To perform any calculations, the FORTAX library requires that an appropriate tax and benefit system is specified.  Only a single system may be    specified on a call to fortax. Multiple systems may be handled by either a series of calls, or by potentially making use of appropriate if/in     conditioning. There are two alternative ways of specifying the tax and transfer system:

- `sys(sysname)` will load a system with internal name `sysname` from a database of system files which is stored in the compiled plugin file and can not be
modified. This method is recommended for most users.  Type `fortax, listsys` to list the systems which are available.

- `sysfile(filename)` will load an external FORTAX system file filename. Note that the full path should be included when specifying filename.

Regardless of how systems are specified, all tax and benefit system parameters may be subjected to automatic price uprating:

`uprate(real)` will scale all monetary values in the tax and benefit system by the amount `real`, where `real` is both strictly positive and non-missing. If `uprate` is not specified it takes the value of 1 (no uprating).

## Family information

fortax requires information regarding incomes and family circumstances. Stata observations correspond to the level of the family, and the family     characteristics must be stored as numeric Stata variables. The list of family characteristics that may be set through the famvar options is available by typing `fortax, listfam`.  For example, `earn1(var1)` would set `earn1` (the earnings of adult 1) equal to the Stata variable `var1`. Any family     characteristics which are not explictly set are given their default values. Note also that missing values are treated as if no value had been     specified for the respective observations (so the default is again applied).

## FORTAX output

Given the tax and benefit system specified by `sys` or `sysfile`, together with the family characteristics specified through the `famvar` options, fortax will return a number of income measures that are then accessible in Stata. Since all family options are passed as numerical values, the labels associated with them are available by typing fortax, listlbl.

- `netout` specifies the income measures that are returned to Stata. The list of income measures that are accessible is available by typing `fortax, listnet`. If `netout` is not specified, then only `dispinc` (family disposable income) will be returned. Unless this option is combined with `netoutvar` (see below) variables will generated with a variable name equal to the short name. Note that the cost of requesting further variables (in a single call to fortax) is negligble as these are calculated internally by the FORTAX library.

- `netoutvar` specifies the Stata variable names for all the income measures specified in `netout` (the order of variables is the same as in `netout`).

- `replace` will replace the contents of existing variables. If variables already exist, and `replace` is not specified, and error will be raised.

- `label` writes a descriptive variable label for any income component that is specified in `netout`.

## Further notes and current limitations

When specifying `famvar` variables that are true or false (e.g. `married`, `selfemp`, etc.) values of zero correspond to false; all other values are interpreted as being true.

If options `listsys`, `listnet`, `listfam`, or `listlbl` are specified, then any further options will be ignored.  These options may also be combined.

To simplify the calling syntax you may wish to consider writing a Stata program that calls fortax. This will be particularly relevant if the names of family characteristic variables are constant in your application.

The FORTAX library does not currently model disability related benefits, and incomes for non-working age families.

## Examples

```
fortax, listsys listfam listnet listlbl
```
```
fortax, sys(april02) earn1(var1) hrs1(var2) replace
```
```
fortax, sys(april02) uprate(1.1) earn1(var1) hrs1(var2) kidage1(var3) netout(dispinc incsup chben) replace label
```

## Compiling FORTAX for Stata

To use FORTAX for Stata you must first compile the [FORTAX library](https://github.com/ajshephard/fortax-library/). The Stata plugin file can then be compiled using the provided `makefile`. More details on compiling Stata plugins is provided by [StataCorp](https://www.stata.com/plugins/). The files `fortax.ado`, `fortax.hlp`, and `fortax.plugin` must be placed in an ado-file path that is accessible bt Stata. If these files are present and Stata returns an `unrecognized command` error, then the problem is most likely that Stata is unable to load the plugin file.
fortax requires a plugin file
