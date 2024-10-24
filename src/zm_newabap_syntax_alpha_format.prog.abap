*&---------------------------------------------------------------------*
*& Report ZM_NEWABAP_SYNTAX_ALPHA_FORMAT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zm_newabap_syntax_alpha_format.

DATA :  gv_matnr TYPE matnr,
        gv_msg TYPE string.

SELECT SINGLE matnr FROM zmara_table INTO gv_matnr.

  CONCATENATE  'Material ID - ' gv_matnr INTO gv_msg SEPARATED BY space.
  MESSAGE gv_msg TYPE 'I'.
  WRITE : / gv_msg.
