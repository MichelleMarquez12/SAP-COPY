*&---------------------------------------------------------------------*
*& Report ZDEMO_NEW_ABAP_SYNTAX_PART2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdemo_new_abap_syntax_part2.

TABLES : bkpf.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS : s_bukrs FOR bkpf-bukrs,
                   s_belnr FOR bkpf-belnr,
                   s_gjarh FOR bkpf-gjarh.
SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

  "read and loop in internal table
  SELECT * FROM bkpf INTO TABLE @DATA(gs_bkpf) WHERE bukrs IN @s_bukrs
                                              AND belnr IN @s_belnr
                                              AND gjahr IN @s_gjahr.

  sort gt_bkpf1 by bukrs belnr gjahr.


  try.

    data(gv_bukrs) = gt_bkpf1[ 1 ]-bukrs.
  CATCH cx_root.
  ENDTRY.

*  IF gt_bkpf1[] IS NOT INITIAL.

    "LINE ITEMS DATA
*    SELECT * FROM bseg INTO TABLE @DATA(gt_bseg) FOR ALL ENTRIES IN @gt_bkpf1
*      WHERE bukrs = @gt_bkpf1-bukrs
*        AND belnr = @gt_bkpf1-belnr
*        AND gjahr = @gt_bkpf1-gjahr.
*
*      loop at gt_bkpf1 into data(bkpf1).
*
*        try.
*          data(gs_bseg) = gt_bseg[ bukrs = gs_bkpf1-bukrs
*                                   belnr = gs_bkpf1-belnr
*                                   gjahr = gs_bkpf1-gjahr ].
*        CATCH cx_root.
*        ENDTRY.
*        clear : gs_bkpf1.
*      ENDLOOP.

*ENDIF.

*read table gt_bkpf1 into data(gs_bkpf1) index 1.
*read table gt_bkpf1 into data(gs_bkpf1) with key gjahr = s_gjahr-low.

*try
*  data(gs_bkpf1) = gt_bkpf1[ 1 ].
*  "excepcion de raiz
*CATCH  cx_root.   " cx_sy_itam_line_not_found.
*  write : / 'No record found'.
*ENDTRY.
*
*cl_demo_output=>display( gs_bkpf1 ).



*  "loop
*  LOOP AT gt_bkpf1 INTO DATA(gs_bkpf1).
*    EXIT.
*  ENDLOOP.
*
*  cl_demo_output=>write( gs_bkpf1 ).
*
*  LOOP AT gt_bkpf1 ASSIGNING FIELD-SYMBOL(<fs1>).
*    EXIT.
*  ENDLOOP.
*
*  cl_demo_output=>display( <fs1> ).



*  SELECT SINGLE * FROM bkpf INTO @data(gs_bkpf) WHERE bukrs IN @s_bukrs
*                                                  AND belnr IN @s_belnr
*                                                  AND gjahr IN @s_gjahr.
**    CL_DEMO_OUTPUT=>display( gs_bkpf).
*
*    SELECT SINGLE bukrs FROM bkpf INTO @data(gs_bkpf) WHERE bukrs IN @s_bukrs
*                                                        AND belnr IN @s_belnr
*                                                        AND gjahr IN @s_gjahr.
*
*    SELECT SINGLE bukrs, belnr, gjahr FROM bkpf into (@data(gv_bukrs1), @data(gv_belnr1), @data(gv_gjahr)) WHERE bukrs IN @s_bukrs
*                                                                                                          	 AND belnr IN @s_belnr
*                                                                                                             AND gjahr IN @s_gjahr.

*  "LIMITED NO, COLUMNS
*  SELECT burks, belnr, gjahr FROM bkpf INTO TABLE @DATA(gt_bkpf) WHERE bukrs IN @s_bukrs
*                                                                   AND belnr IN @s_belnr
*                                                                   AND gjahr IN @s_gjahr.
*    "ALL COLUMNS
*    SELECT * FROM bkpf INTO TABLE @DATA(gt_bkpf1) WHERE bukrs IN @s_bukrs
*                                                    AND belnr IN @s_belnr
*                                                    AND gjahr IN @s_gjahr.
*      IF gt_bkpf1[] IS NOT INITIAL.
*        SORT gt_bkpf1 BY bukrs belnr gjahr.
*
*        "LINE ITEMS DATA
*         SELECT * FROM bseg INTO TABLE @DATA(gt_bseg) FOR ALL ENTRIES IN @gt_bkpf1
*            WHERE bukrs = @gt_bkpf1-bukrs
*              AND belnr = @gt_bkpf1-belnr
*              AND gjahr = @gt_bkpf1-gjahr.
*
*      ENDIF.
*
*
*      CL_DEMO_OUTPUT=>WRITE( gt_bkpf ).
*      CL_DEMO_OUTPUT=>WRITE( gt_bkpf1 ).
*      CL_DEMO_OUTPUT=>display( gt_bseg ).

end-of-selection.
