# adiabatic_magnon_patch


This patch file is used to install the first-principles method described in arxiv.org/abs/2402.05473v1 in VASP.5.4.4, which obtains the magnon spectrum and wavefunctions in real materials by solving the adiabatic motion equations.

### How to Install?
Copy the `patch/adiabatic_magnon.patch` file to the root directory of VASP.5.4.4, then run the following command in the terminal:

```bash
patch -d src/ -p1 < adiabatic_magnon.patch
```

After that, run:

```bash
make ncl
```

to compile the non-collinear version of VASP. Please note that the DFPT functionality in this patch file requires non-collinear wavefunctions and is not compatible with the `std` or `gam` versions of VASP; attempting to compile these versions will result in errors. 

### Example Calculation
The `patch/CrO2` folder provides an example input for calculating magnons at the Brillouin zone boundary for the material CrO2. Users need to prepare the corresponding LDA functional pseudopotential file `POTCAR`. First, use `INCAR_scf` as the input file `INCAR` to obtain converged wavefunctions. Then, use `INCAR_magnon` as the input file `INCAR` to perform the adiabatic magnon calculation. In `INCAR_magnon`, `IBRION=19` is the switch to enable magnon calculations. `EMLR_INPUT` is an additional input file for magnon calculations, with relevant parameter descriptions available in the file comments. You can submit the `job.sh` script on the Slurm system for calculation; please modify the `prog` variable to the `vasp_ncl` program that has the magnon calculation functionality installed.

More detailed document on the adiabatic magnon calculation is under construction.
