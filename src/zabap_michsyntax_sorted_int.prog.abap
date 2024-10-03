*&---------------------------------------------------------------------*
*& Report ZABAP_MICHSYNTAX_SORTED_INT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABAP_MICHSYNTAX_SORTED_INT.

TYPES: BEGIN OF tp_emp,
        employee_id TYPE zmemp_id,
        title       TYPE zmtitle,
        first_name  TYPE zmfirst_name,
        last_name   TYPE zmlast_name,
        full_name(50) TYPE c,
        doj         TYPE zmpsg_datjo,
        departament TYPE zmdepart,
        ctc         TYPE zmdmbtr,
        bukrs       TYPE bukrs,
       END OF tp_emp,

       BEGIN OF tp_sal,
         departament TYPE zmdepart,
         ctc         TYPE zmdmbtr,
         bukrs       TYPE bukrs,
       end of tp_sal.

"declaracion de variables"

DATA: it_mara TYPE TABLE OF zmara_table,
      wa_mara TYPE zmara_table,
      gt_employee TYPE SORTED TABLE OF tp_emp WITH NON-UNIQUE KEY employee_id bukrs, "PERMITE REISTROS DUPLICADOS, PARA NO ADMITIR DUPLICADOS SOLO QUITO EL NON-
      gs_employee TYPE tp_emp.


*****appednd instruction****
CLEAR:  gs_employee. "clear instruction****
        gs_employee-employee_id = 'ZMT01'.
        gs_employee-title       = 'Miss.'.
        gs_employee-first_name  = 'Michelle'.
        gs_employee-last_name   = 'Marquez'.
        gs_employee-doj         = '20240701'.
        gs_employee-departament = 'it-sap'.
        gs_employee-ctc         = '100000.00'.
        gs_employee-bukrs     = '1000'.
        INSERT gs_employee INTO TABLE gt_employee.
 CLEAR: gs_employee.

 CLEAR: gs_employee.
        gs_employee-employee_id = 'ZMT02'.
        gs_employee-title       = 'Mr.'.
        gs_employee-first_name  = 'David'.
        gs_employee-last_name   = 'Zuñiga'.
        gs_employee-doj         = '20240211'.
        gs_employee-departament = 'it-infra'.
        gs_employee-ctc         = '20000.00'.
        gs_employee-bukrs     = '1000'.
        INSERT gs_employee INTO TABLE gt_employee.
 CLEAR: gs_employee.

 CLEAR: gs_employee.
        gs_employee-employee_id = 'ZMT03'.
        gs_employee-title       = 'Miss.'.
        gs_employee-first_name  = 'Dulce'.
        gs_employee-last_name   = 'Marquez'.
        gs_employee-doj         = '20240620'.
        gs_employee-departament = 'it-sap'.
        gs_employee-ctc         = '20000.00'.
        gs_employee-bukrs     = '1000'.
        INSERT gs_employee INTO TABLE gt_employee.
 CLEAR: gs_employee.

 CLEAR: gs_employee.
        gs_employee-employee_id = 'ZMT04'.
        gs_employee-title       = 'Mr.'.
        gs_employee-first_name  = 'Miguel'.
        gs_employee-last_name   = 'Rios'.
        gs_employee-doj         = '20240301'.
        gs_employee-departament = 'it-sap'.
        gs_employee-ctc         = '100000.00'.
        gs_employee-bukrs     = '1000'.
        INSERT gs_employee INTO TABLE gt_employee.
 CLEAR: gs_employee.

        gs_employee-employee_id = 'ZMT05'.
        gs_employee-title       = 'Miss.'.
        gs_employee-first_name  = 'Melania'.
        gs_employee-last_name   = 'Moran'.
        gs_employee-doj         = '20240205'.
        gs_employee-departament = 'it-abap'.
        gs_employee-ctc         = '150000.00'.
        gs_employee-bukrs     = '1000'.
        INSERT gs_employee INTO TABLE gt_employee.
 CLEAR: gs_employee.

        gs_employee-employee_id = 'ZMT06'.
        gs_employee-title       = 'Miss.'.
        gs_employee-first_name  = 'Maria'.
        gs_employee-last_name   = 'Marquez'.
        gs_employee-doj         = '20240215'.
        gs_employee-departament = 'it-abap'.
        gs_employee-ctc         = '150000.00'.
        gs_employee-bukrs     = '1000'.
        INSERT gs_employee INTO TABLE gt_employee.
 CLEAR: gs_employee.

        gs_employee-employee_id = 'ZMT07'.
        gs_employee-title       = 'Mr.'.
        gs_employee-first_name  = 'Daniel'.
        gs_employee-last_name   = 'Zuñiga'.
        gs_employee-doj         = '20240101'.
        gs_employee-departament = 'hr'.
        gs_employee-ctc         = '10000.00'.
        gs_employee-bukrs     = '1000'.
        INSERT gs_employee INTO TABLE gt_employee.
 CLEAR: gs_employee.

        gs_employee-employee_id = 'ZMT09'.
        gs_employee-title       = 'Mr.'.
        gs_employee-first_name  = 'Arturo'.
        gs_employee-last_name   = 'Cortez'.
        gs_employee-doj         = '20240115'.
        gs_employee-departament = 'fr'.
        gs_employee-ctc         = '10000.00'.
        gs_employee-bukrs     = '3000'.
        INSERT gs_employee INTO TABLE gt_employee.
 CLEAR: gs_employee.

        gs_employee-employee_id = 'ZMT08'.
        gs_employee-title       = 'Mr.'.
        gs_employee-first_name  = 'Jacqueline'.
        gs_employee-last_name   = 'Gaspar'.
        gs_employee-doj         = '20240101'.
        gs_employee-departament = 'fr'.
        gs_employee-ctc         = '10000.00'.
        gs_employee-bukrs     = '2000'.
        INSERT gs_employee INTO TABLE gt_employee.
 CLEAR: gs_employee.


 WRITE: / 'Employee id', 25 'Employee name', 55 'Date of joining', 80 'Department', 95 'CTC', 120 'COMPANY CODE'.
 ULINE.

    "bucle or loop instruction"

LOOP AT gt_employee INTO gs_employee.

   CONCATENATE gs_employee-first_name gs_employee-last_name into gs_employee-full_name SEPARATED BY space. ""concatenate instruction

   "gs_employee-ctc  = gs_employee-ctc  + '10000.00'."

   WRITE:/ gs_employee-employee_id, 25 gs_employee-full_name, 55 gs_employee-doj , 80 gs_employee-departament, 95 gs_employee-ctc LEFT-JUSTIFIED, 120 gs_employee-bukrs.

   MODIFY gt_employee FROM gs_employee TRANSPORTING full_name ctc. "    modify instruction

   CLEAR : gs_employee.

ENDLOOP.

ULINE.

SKIP 2.

 CLEAR : gs_employee.

* READ TABLE gt_employee INTO gs_employee INDEX 2.

 READ TABLE gt_employee INTO gs_employee WITH KEY employee_id = 'ZMT04' BINARY SEARCH.

 WRITE:/ gs_employee-employee_id, 25 gs_employee-full_name, 55 gs_employee-doj , 80 gs_employee-departament, 95 gs_employee-ctc LEFT-JUSTIFIED, 120 gs_employee-bukrs.
