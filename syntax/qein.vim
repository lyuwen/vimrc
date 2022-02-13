" Vim syntax file
" Language: QE input file
" Maintainer: Lyuwen Fu
" Latest Revision: 13 Feburary 2022

if exists("b:current_syntax")
  finish
endif

" Keywords
" syn keyword syntaxElementKeyword keyword1 keyword2 nextgroup=syntaxElement2


" syn keyword qeControl &CONTROL &SYSTEM &ELECTRONS &IONS &CELL &FCP &control &system &electrons &ions &cell &fcp
syntax match qeControl "\v\&(CONTROL|SYSTEM|ELECTRONS|IONS|CELL|FCP|control|system|electrons|ions|cell|fcp)"
syn keyword qeKeywords ATOMIC_SPECIES ATOMIC_POSITIONS K_POINTS CELL_PARAMETERS OCCUPATIONS CONSTRAINTS ATOMIC_VELOCITIES ATOMIC_FORCES ADDITIONAL_K_POINTS
syn keyword qeConstants calculation title verbosity restart_mode wf_collect nstep iprint tstress tprnfor dt outdir wfcdir prefix lkpoint_dir max_seconds etot_conv_thr forc_conv_thr disk_io pseudo_dir tefield dipfield lelfield nberrycyc lorbm lberry gdir nppstr lfcp gate ibrav celldm A B C cosAB cosAC cosBC nat ntyp nbnd tot_charge starting_charge tot_magnetization starting_magnetization ecutwfc ecutrho ecutfock nr1 nr2 nr3 nr1s nr2s nr3s nosym nosym_evc noinv no_t_rev force_symmorphic use_all_frac occupations one_atom_occupations starting_spin_angle degauss smearing nspin noncolin ecfixed qcutz q2sigma input_dft ace exx_fraction screening_parameter exxdiv_treatment x_gamma_extrapolation ecutvcut nqx1 nqx2 nqx3 localization_thr lda_plus_u lda_plus_u_kind Hubbard_U Hubbard_J0 Hubbard_V Hubbard_alpha Hubbard_beta Hubbard_J starting_ns_eigenvalue U_projection_type Hubbard_parameters dmft dmft_prefix ensemble_energies edir emaxpos eopreg eamp angle1 angle2 lforcet constrained_magnetization fixed_magnetization lambda report lspinorb assume_isolated esm_bc esm_w esm_efield esm_nfit lgcscf gcscf_mu gcscf_conv_thr gcscf_beta vdw_corr london london_s6 london_c6 london_rvdw london_rcut dftd3_version dftd3_threebody ts_vdw_econv_thr ts_vdw_isolated xdm xdm_a1 xdm_a2 space_group uniqueb origin_choice rhombohedral zgate relaxz block block_1 block_2 block_height electron_maxstep scf_must_converge conv_thr adaptive_thr conv_thr_init conv_thr_multi mixing_mode mixing_beta mixing_ndim mixing_fixed_ns diagonalization diago_thr_init diago_cg_maxiter diago_david_ndim diago_full_acc diago_rmm_ndim diago_rmm_conv efield efield_cart efield_phase startingpot startingwfc tqr real_space ion_positions ion_velocities ion_dynamics pot_extrapolation wfc_extrapolation remove_rigid_rot ion_temperature tempw tolp delta_t nraise refold_pos upscale bfgs_ndim trust_radius_max trust_radius_min trust_radius_ini w_1 w_2 fire_alpha_init fire_falpha fire_nmin fire_f_inc fire_f_dec fire_dtmax cell_dynamics press wmass cell_factor press_conv_thr cell_dofree fcp_mu fcp_dynamics fcp_conv_thr fcp_ndiis fcp_mass fcp_velocity fcp_temperature fcp_tempw fcp_tolp fcp_delta_t fcp_nraise freeze_all_atoms alat bohr angstrom crystal crystal_sg tpiba automatic crystal gamma tpiba_b crystal_b tpiba_c crystal_c alat bohr angstrom 

let b:current_syntax = "qein"

hi def link qeControl      Statement
hi def link qeKeywords     Type
hi def link qeConstants    PreProc
" hi def link celBlockCmd    Statement
" hi def link celHip         Type
" hi def link celDesc        PreProc
" hi def link celNumber      Constant
