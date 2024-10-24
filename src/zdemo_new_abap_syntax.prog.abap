*&---------------------------------------------------------------------*
*& Report ZDEMO_NEW_ABAP_SYNTAX
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZDEMO_NEW_ABAP_SYNTAX.

TABLES : bkpf.

TYPES : begin of tp_bkpf,
          burks type bkpf-burks,
          belnr type bkpf-belnr,
          gjahr type bkpf-gjahr,
        end of tp_bkpf.

DATA : gt_bkpf type STANDARD TABLE OF tp_bkpf,
       gs_bkpf type tp_bkpf,
       gt_bkpf1 type STANDARD TABLE OF bkpf,
       gs_bkpf1 type bkpf,
       gt_bseg type STANDARD TABLE OF bseg,
       gs_bseg type bseg.

SELECTION-SCREEN begin of BLOCK b1 with frame title text-001.
  select-OPTIONS : s_burks for bkpf-burks,
                   s_belnr for bkpf-belnr,
                   s_gjarh for bkpf-gjarh.
SELECTION-SCREEN end of BLOCK b1.
