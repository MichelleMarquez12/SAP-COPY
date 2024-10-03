*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZMV_EMPLOYEE....................................*
TABLES: ZMV_EMPLOYEE, *ZMV_EMPLOYEE. "view work areas
CONTROLS: TCTRL_ZMV_EMPLOYEE
TYPE TABLEVIEW USING SCREEN '0001'.
DATA: BEGIN OF STATUS_ZMV_EMPLOYEE. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_ZMV_EMPLOYEE.
* Table for entries selected to show on screen
DATA: BEGIN OF ZMV_EMPLOYEE_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE ZMV_EMPLOYEE.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZMV_EMPLOYEE_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF ZMV_EMPLOYEE_TOTAL OCCURS 0010.
INCLUDE STRUCTURE ZMV_EMPLOYEE.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZMV_EMPLOYEE_TOTAL.

*.........table declarations:.................................*
TABLES: ZEMPLOYEE_COM                  .
TABLES: ZEMPLOYEE_MASTER               .
