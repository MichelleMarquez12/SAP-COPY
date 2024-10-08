*&---------------------------------------------------------------------*
*& Report ZABAP_SYNTAX_DB_OPERATIONS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABAP_SYNTAX_DB_OPERATIONS.

TABLES : ZKNA1.

data : gt_zkna1 type table of zkna1,
       gs_zkna1 type zkna1.

select-OPTIONS : s_kunnr for zkna1-kunnr.

START-OF-SELECTION.

  SELECT * from zkna1 into table gt_zkna1 where KUNNR in s_kunnr.

    if sy-subrc = 0.
      sort gt_zkna1 by kunnr.

      loop at gt_zkna1 into gs_zkna1.
        write : / gs_zkna1-kunnr, 20 gs_zkna1-name1, 55 gs_zkna1-land1, 65 gs_zkna1-ort01.

        clear : gs_zkna1.
      ENDLOOP.

    ENDIF.

end-of-SELECTION.
