*&---------------------------------------------------------------------*
*& Report ZABAP_MICH_SYNTAX_CONTROL_BRK
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABAP_MICH_SYNTAX_CONTROL_BRK.

DATA : gt_ekpo type STANDARD TABLE OF ekpo,
       gs_ekpo type ekpo.

data : gv_ebeln type ekpo-ebeln.

select-OPTIONS : s_ebeln for gv_ebeln.


START-OF-SELECTION.

  SELECT * from ekpo into TABLE gt_ekpo where ebeln in s_ebeln.

    sort gt_ekpo by ebeln ebelp.

    loop at gt_ekpo into gs_ekpo.
      at FIRST.
        write : / 'PO Number', 13 'Item No.', 30 'Material Code', 50 'Descriptrion', 90 'Net Value'.
      ENDAT.

      at new ebeln.
        uline.
        write : 'New PO' color 5.
      ENDAT.

      write : gs_ekpo-ebeln, 15 gs_ekpo-ebelp, 30 gs_ekpo-matnr, 50 gs_ekpo-txz01, 90 gs_ekpo-netwr.

      at END OF ebeln.
        sum.
        write : / 'Total value for P0' color 3 , gs_ekpo-netwr.
      ENDAT.

      at LAST.
        uline.
        skip 2.
        sum.
        write : / 'Total value for P0' color 7 , gs_ekpo-netwr.
      endat.

      clear : gs_ekpo.
    ENDLOOP.

end-of-SELECTION.
