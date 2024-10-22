*&---------------------------------------------------------------------*
*& Report ZABAP_SYNTAX_DB_OPERATIONS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_syntax_db_operations.

TABLES : zkna1.

TYPES: BEGIN OF tp_zkna1,
          kunnr TYPE zkna1-kunnr,
          name1 TYPE zkna1-name1,
          land1 TYPE zkna1-land1,
          ort01 TYPE zkna1-ort01,
          pstlz TYPE zkna1-pstlz,
          regio TYPE zkna1-regio,
          additional,
       END   OF tp_zkna1,

       begin of tp_city,
         ort01 TYPE zkna1-ort01,
       end of tp_city.

DATA : gt_zkna1 TYPE TABLE OF tp_zkna1,
       gs_zkna1 TYPE tp_zkna1,
       gt_city type TABLE of tp_city,
       gs_city type tp_city.

SELECT-OPTIONS : s_kunnr FOR zkna1-kunnr.

START-OF-SELECTION.

   SELECT DISTINCT ort01 from zkna1 into table gt_city where kunnr in s_kunnr.

     loop at gt_city into gs_city.
       write:/ gs_city-ort01.
       clear: gs_city.
     ENDLOOP.

*  SELECT kunnr name1 land1 ort01 pstlz regio FROM zkna1 INTO TABLE gt_zkna1 WHERE kunnr IN s_kunnr.
*  SELECT  SINGLE kunnr name1 land1 ort01 pstlz regio FROM zkna1 INTO CORRESPONDING FIELDS OF gs_zkna1 WHERE land1 = 'US'.
*  SELECT kunnr name1 land1 ort01 pstlz regio FROM zkna1 INTO CORRESPONDING FIELDS OF TABLE gt_zkna1 UP TO 1 ROWS WHERE land1 = 'US'.
*    WRITE : / gs_zkna1-kunnr, 20 gs_zkna1-name1, 55 gs_zkna1-land1, 65 gs_zkna1-ort01.
*  ENDSELECT.

*    IF sy-subrc = 0.
*      SORT gt_zkna1 BY kunnr.
*
*      LOOP AT gt_zkna1 INTO gs_zkna1.
*        WRITE : / gs_zkna1-kunnr, 20 gs_zkna1-name1, 55 gs_zkna1-land1, 65 gs_zkna1-ort01.
*
*        CLEAR : gs_zkna1.
*      ENDLOOP.

*    ENDIF.

end-of-SELECTION.
