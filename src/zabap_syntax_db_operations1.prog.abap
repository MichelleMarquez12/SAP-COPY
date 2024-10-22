*&---------------------------------------------------------------------*
*& Report ZABAP_SYNTAX_DB_OPERATIONS1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_syntax_db_operations1.

DATA : gs_master TYPE zemployee_master,
       gt_master TYPE TABLE OF zemployee_master.

*CLEAR : gs_master.
*        gs_master-employee_id = 'ZMT10'.
*        gs_master-title = 'Miss.'.
*        gs_master-first_name = 'DIANA'.
*        gs_master-last_name = 'MARQUEZ'.
*        gs_master-doj = '20240712'.
*        gs_master-departament = 'SAP-ABAP'.
*        gs_master-ctc = '100000.00'.
*        gs_master-currency = 'US'.
*        gs_master-createdby = sy-uname.
*        gs_master-createdon = sy-datum.
*        gs_master-createdtime = sy-uzeit.
*
*modify zemployee_master from gs_master.
*
*IF sy-subrc = 0.
*  MESSAGE 'record inserted successfully' TYPE 'I'.
*ELSE.
*  MESSAGE 'error while modifiying a record' TYPE 'I'.
*ENDIF.
*
*clear : gs_master.

delete from  zemployee_master where employee_id = 'ZMT01'.

IF sy-subrc = 0.
  MESSAGE 'record deleted successfully' TYPE 'I'.
ELSE.
  MESSAGE 'error while deleting a record' TYPE 'I'.
ENDIF.


*update zemployee_master set ctc = '300000.00' where employee_id = 'ZMT03'.
*
*IF sy-subrc = 0.
*  MESSAGE 'record inserted successfully' TYPE 'I'.
*ELSE.
*  MESSAGE 'error while updating a record' TYPE 'I'.
*ENDIF.

*        gs_master-employee_id = 'ZMT13'.
*        gs_master-title = 'Miss.'.
*        gs_master-first_name = 'DIANA'.
*        gs_master-last_name = 'martinez'.
*        gs_master-doj = '20230712'.
*        gs_master-departament = 'SAP-ABAP'.
*        gs_master-ctc = '10000.00'.
*        gs_master-currency = 'US'.
*        gs_master-createdby = sy-uname.
*        gs_master-createdon = sy-datum.
*        gs_master-createdtime = sy-uzeit.
*        APPEND gs_master to gt_master.
*        clear : gs_master.
*
*INSERT zemployee_master FROM table gt_master.
*
*        IF sy-subrc = 0.
*          MESSAGE 'record inserted successfully' TYPE 'I'.
*        ELSE.
*          MESSAGE 'error while inserting a record' TYPE 'I'.
*        ENDIF.
