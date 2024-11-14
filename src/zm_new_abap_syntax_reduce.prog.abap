*&---------------------------------------------------------------------*
*& Report ZM_NEW_ABAP_SYNTAX_REDUCE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zm_new_abap_syntax_reduce.

"PANTALLA DE SELCCION
DATA : lv_kunnr TYPE zbsid-kunnr.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS : s_kunnr  FOR lv_kunnr.
SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.
  PERFORM get_display_data.
*&---------------------------------------------------------------------*
*& Form get_display_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_display_data .
  SELECT burks, kunnr, umsks, umskz, augdt, augbl, zuonr, gjahr, belnr, buzei, shkzg, blart,
    CASE shkzg WHEN 'H' THEN ( zdmbtr * -1 ) ELSE zdmbtr END AS amount FROM zbsid INTO TABLE @DATA(gt_bsid)
    WHERE kunnr IN @s_kunnr.

    IF GT_BSID[] IS NOT INITIAL.

      SELECT KUNNR, CAST( 0 AS DEC ) AS AMOUNT FROM KNA1 INTO TABLE @DATA(GT_KNA1) WHERE KUNNR IN @S_KUNNR.

        LOOP AT GT_KNA1 ASSIGNING FIELD-SYMBOL(<FS1>).
          <FS1>-AMOUNT = REDUCE I( INIT I TYPE DMBTR FOR WA IN GT_BSID WHERE ( KUNNR = <FS1>-KUNNR ) NEXT I = I + WA-DMBTR ).
        ENDLOOP.

      CL_DEMO_OUTPUT=>DISPLAY( GT_KNA1 ).
    ENDIF

  BREAK-POINT.
ENDFORM.
