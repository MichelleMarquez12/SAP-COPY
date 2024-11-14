*&---------------------------------------------------------------------*
*& Report ZM_NEWABAP_SYNTAX_GROUPBY
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zm_newabap_syntax_groupby.

TABLES : ekko.

SELECT-OPTIONS : s_ebeln FOR ekko-ebeln.

START-OF-SELECTION.

  SELECT a-ebeln, a-lifnr, a-aedat,
         b-ebelp, b-matnr, b-txz01, b-menge, b-netpr
    FROM ekko AS a INNER JOIN ekpo AS b ON a-ebeln = b-ebeln
    INTO TABLE @DATA(gt_po) UP TO 30 ROWS
    WHERE matnr NE ''.

  LOOP AT gt_po ASSIGNING FIELD-SYMBOL(<fs1>) GROUP BY <fs1>-ebeln ASCENDING.

    WRITE : / <fs1>-ebeln COLOR 5.

    LOOP AT GROUP <FS1> ASSIGNING FIELD-SYMBOL(<FS2>).
      WRITE : / ' ',<FS2>-EBELN, <FS2>-MATNR, <FS2>-TXZ01, <FS2>-MENGE, <FS2>-NETPR.
    ENDLOOP.

    ULINE.
  ENDLOOP.


END-OF-SELECTION.
