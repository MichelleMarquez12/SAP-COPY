*&---------------------------------------------------------------------*
*& Report ZM_NEW_SYNTAX_FILTER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZM_NEW_SYNTAX_FILTER.

TYPES: BEGIN OF tp_blart,
          blart type bsik-blart,
       END OF tp_blart,

       tt_blart type HASHED TABLE OF tp_blart WITH UNIQUE KEY blart.

DATA: gt_bsik type STANDARD TABLE OF bsik WITH NON-UNIQUE SORTED KEY blart COMPONENTS blart,
      gt_bsik_rt type STANDARD TABLE OF bsik,
      gt_bsik_rall type STANDARD TABLE OF bsik,
      gt_bsik_x type STANDARD TABLE OF bsik,
      gt_blart type tt_blart.

select * from bsik into table gt_bsik up to 1000 rows where gjahr = '2018'.

  "doc type rt
  gt_bsik_rt = FILTER %( gt_bsik USING KEY blart where blart = 'RT' ).

  "non rt doc type
  gt_bsik_rall = FILTER %( gt_bsik EXCEPT USING KEY blart where blart = 'RT' ).

  "add the filter values
  gt_blart = value tt_blart(
                           ( BLART = 'XR' )
                           ( BLART = 'XP' )
                           ( BLART = 'AT' )
                           ).

gt_bsik_x = FILTER %( gt_bsik in gt_blart where blart = blart ).

cl_demo_output=>display( gt_bsik_x ).

BREAK-POINT.
