*&---------------------------------------------------------------------*
*& Report ZABAP_MICH_SYNTAX_JOINS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_mich_syntax_joins.

TYPES : BEGIN OF tp_ZMARA_TABLE,
          matnr TYPE zmara_table-matnr,
          mtart TYPE zmara_table-mtart,
          maktx TYPE makt-maktx,
          wrkst TYPE marc-wrkst,
        END OF tp_zmara_table.

DATA : gt_ZMARA_TABLE TYPE TABLE OF tp_ZMARA_TABLE,
       gs_ZMARA_TABLE TYPE tp_ZMARA_TABLE.

DATA : gv_matnr TYPE zmara_table-matnr,
       gv_wrkst TYPE marc-wrkst.

SELECT-OPTIONS : s_matnr FOR gv_matnr,
                 s_wrkst FOR gv_wrkst.

START-OF-SELECTION.

SELECT a-matnr, a-mtart,
       b-maktx,
       c-wrkst
       FROM zmara_table AS a INNER JOIN makt AS b
       ON a-matnr = b-matnr
       INNER JOIN marc AS c
       ON a-matnr = c-matnr
       INTO TABLE @zmara_table
       WHERE a-matnr IN @s_matnr
       and b-spras = @sy-langu
       and b-wrkst in @s_wrkst.

LOOP AT gt_ZMARA_TABLE INTO gs_ZMARA_TABLE.
      WRITE : gs_ZMARA_TABLE-matnr, 25 gs_ZMARA_TABLE-mtart,40  gs_ZMARA_TABLE-maktx,75 gs_ZMARA_TABLE-wrkst.
      CLEAR : gs_ZMARA_TABLE.
ENDLOOP.

*  select a-matnr, a-mtart,
*         b-wrkst
**         from ZMARA_TABLE as a INNER JOIN ZMARA_TABLE as
*         from ZMARA_TABLE as a left OUTER join marc as b
*         on a-matnr = b-matnr
*         into table @gt_zmara_table
*         where a-matnr in @s_matnr
*         and b-wrkst in @s_wrkst.

*    cl_demo_output=>display( gt_ZMARA_TABLE ).


end-of-SELECTION.
