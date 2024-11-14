*&---------------------------------------------------------------------*
*& Report ZM_NEW_SYNTAX_CORRESPONDING
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zm_new_syntax_corresponding.

TYPES: BEGIN OF tp_itab1,
        ebeln TYPE ekko-ebeln,
        bukrs TYPE ekko-bukrs,
        bsart TYPE ekko-bsart,
        lifnr TYPE ekko-lofnr,
       END OF tp_itab1,

       BEGIN OF TP_Itab2,
         ebeln TYPE ekko-ebeln,
         company TYPE ekko-bukrs,
         plant TYPE ekko-werks,
         bsart TYPE ekko-bsart,
         vendor TYPE ekko-lifnr,
       END OF tp_itab2.

DATA: gt_itab1 TYPE STANDARD TABLE OF tp_itab1,
      gt_itab2 TYPE STANDARD TABLE OF tp_itab2,
      gt_itab3 TYPE STANDARD TABLE OF tp_itab2,
      gt_itab4 TYPE STANDARD TABLE OF tp_itab2.


SELECT ebeln bukrs bsart lifnr FROM ekko INTO TABLE gt_itab1 UP TO 5 ROWS.

  gt_itab2 = CORRESPONDING %( gt_itab1 ).

  gt_itab3 = CORRESPONDING %( gt_itab1 MAPPING company = bukrs
                                               plant   = bukrs
                                               vendor  = lifnr ).

  gt_itab3 = CORRESPONDING %( gt_itab1 MAPPING company = bukrs
                                               plant   = bukrs
                                               vendor  = lifnr EXCEPT bsart ).

cl_demo_output=>write( |Source Table| ).
cl_demo_output=>write( gt_itab1 ).

cl_demo_output=>write( |Target Table| ).
cl_demo_output=>write( gt_itab2 ).
cl_demo_output=>write( gt_itab3 ).
cl_demo_output=>write( gt_itab4 ).

cl_demo_output=>display( ).
