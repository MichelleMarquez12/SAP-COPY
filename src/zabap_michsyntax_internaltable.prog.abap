*&---------------------------------------------------------------------*
*& Report ZABAP_MICHSYNTAX_INTERNALTABLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_michsyntax_internaltable.

TYPES: BEGIN OF tp_emp,
        employee_id TYPE zmemp_id,
        title       TYPE zmtitle,
        first_name  TYPE zmfirst_name,
        last_name   TYPE zmlast_name,
        full_name(50) TYPE c,
        doj         TYPE zmpsg_datjo,
        departament TYPE zmdepart,
        ctc         TYPE zmdmbtr,
       END OF tp_emp.

"declaracion de variables"

DATA: it_mara TYPE TABLE OF zmara_table,
      wa_mara TYPE zmara_table,
      gt_employee TYPE STANDARD TABLE OF tp_emp with HEADER LINE,
      gs_employee TYPE tp_emp.

DATA: gv_lines type i,
      gv_department(10).

      gv_department = 'SAP'.


*****appednd instruction****
*CLEAR: gs_employee. "clear instruction****
*       gs_employee-employee_id = 'ZMT01'.
*       gs_employee-title       = 'Miss.'.
*       gs_employee-first_name  = 'Michelle'.
*       gs_employee-last_name   = 'Marquez'.
*       gs_employee-doj         = '20240701'.
*       gs_employee-departament = 'it-sap'.
*       gs_employee-ctc         = '100000.00'.
*       APPEND gs_employee TO gt_employee.
*CLEAR: gs_employee.
*
*CLEAR: gs_employee.
*       gs_employee-employee_id = 'ZMT02'.
*       gs_employee-title       = 'Mr.'.
*       gs_employee-first_name  = 'David'.
*       gs_employee-last_name   = 'Zuñiga'.
*       gs_employee-doj         = '20240211'.
*       gs_employee-departament = 'it-infra'.
*       gs_employee-ctc         = '20000.00'.
*       APPEND gs_employee TO gt_employee.
*CLEAR: gs_employee.
*
*CLEAR: gs_employee.
*       gs_employee-employee_id = 'ZMT03'.
*       gs_employee-title       = 'Miss.'.
*       gs_employee-first_name  = 'Dulce'.
*       gs_employee-last_name   = 'Marquez'.
*       gs_employee-doj         = '20240620'.
*       gs_employee-departament = 'it-sap'.
*       gs_employee-ctc         = '20000.00'.
*       APPEND gs_employee TO gt_employee.
*CLEAR: gs_employee.
*
*CLEAR: gs_employee.
*       gs_employee-employee_id = 'ZMT04'.
*       gs_employee-title       = 'Mr.'.
*       gs_employee-first_name  = 'Miguel'.
*       gs_employee-last_name   = 'Rios'.
*       gs_employee-doj         = '20240301'.
*       gs_employee-departament = 'it-sap'.
*       gs_employee-ctc         = '100000.00'.
*       APPEND gs_employee TO gt_employee.
*CLEAR: gs_employee.
*
*       gs_employee-employee_id = 'ZMT05'.
*       gs_employee-title       = 'Miss.'.
*       gs_employee-first_name  = 'Melania'.
*       gs_employee-last_name   = 'Moran'.
*       gs_employee-doj         = '20240205'.
*       gs_employee-departament = 'it-abap'.
*       gs_employee-ctc         = '150000.00'.
*       INSERT gs_employee INTO TABLE gt_employee.
*CLEAR: gs_employee.
*
*       gs_employee-employee_id = 'ZMT06'.
*       gs_employee-title       = 'Miss.'.
*       gs_employee-first_name  = 'Maria'.
*       gs_employee-last_name   = 'Marquez'.
*       gs_employee-doj         = '20240215'.
*       gs_employee-departament = 'it-abap'.
*       gs_employee-ctc         = '150000.00'.
*       INSERT gs_employee INTO TABLE gt_employee.
**      INSERT gs_employee INTO gt_employee INDEX 1. "*****insert for index instruction****
*CLEAR: gs_employee.
*
*       gs_employee-employee_id = 'ZMT07'.
*       gs_employee-title       = 'Mr.'.
*       gs_employee-first_name  = 'Daniel'.
*       gs_employee-last_name   = 'Zuñiga'.
*       gs_employee-doj         = '20240101'.
*       gs_employee-departament = 'hr'.
*       gs_employee-ctc         = '10000.00'.
*       INSERT gs_employee INTO TABLE gt_employee.
*CLEAR: gs_employee.
*
*       gs_employee-employee_id = 'ZMT09'.
*       gs_employee-title       = 'Mr.'.
*       gs_employee-first_name  = 'Arturo'.
*       gs_employee-last_name   = 'Cortez'.
*       gs_employee-doj         = '20240115'.
*       gs_employee-departament = 'fr'.
*       gs_employee-ctc         = '10000.00'.
*       INSERT gs_employee INTO TABLE gt_employee.
*CLEAR: gs_employee.
*
*       gs_employee-employee_id = 'ZMT08'.
*       gs_employee-title       = 'Mr.'.
*       gs_employee-first_name  = 'Jacqueline'.
*       gs_employee-last_name   = 'Gaspar'.
*       gs_employee-doj         = '20240101'.
*       gs_employee-departament = 'fr'.
*       gs_employee-ctc         = '10000.00'.
*       INSERT gs_employee INTO TABLE gt_employee.
*CLEAR: gs_employee.

BREAK-POINT.

       gt_employee-employee_id = 'ZMT01'.
       gt_employee-title       = 'Miss.'.
       gt_employee-first_name  = 'Michelle'.
       gt_employee-last_name   = 'Marquez'.
       gt_employee-doj         = '20240701'.
       gt_employee-departament = 'it-sap'.
       gt_employee-ctc         = '100000.00'.
       APPEND gt_employee.

       gt_employee-employee_id = 'ZMT02'.
       gt_employee-title       = 'Miss.'.
       gt_employee-first_name  = 'BELEN'.
       gt_employee-last_name   = 'Marquez'.
       gt_employee-doj         = '20240701'.
       gt_employee-departament = 'it-sap'.
       gt_employee-ctc         = '100000.00'.
       APPEND gt_employee.

DESCRIBE TABLE gt_employee LINES gv_lines.

CLEAR : gv_lines.
CLEAR : gv_department.
REFRESH : gt_employee.
*CLEAR : gt_employee[], gt_employee.
*CLEAR: gs_employee-employee_id.

BREAK-POINT.
*WRITE: / 'Employee id', 25 'Employee name', 55 'Date of joining', 80 'Department', 95 'CTC'.
*ULINE.

*****bucle or loop instruction****
*
*LOOP AT gt_employee INTO gs_employee.
*
*  CONCATENATE gs_employee-first_name gs_employee-last_name into gs_employee-full_name SEPARATED BY space. ""concatenate instruction****
*
*  gs_employee-ctc  = gs_employee-ctc  + '10000.00'.
*
*  WRITE:/ gs_employee-employee_id, 25 gs_employee-full_name, 55 gs_employee-doj , 80 gs_employee-departament, 95 gs_employee-ctc LEFT-JUSTIFIED.
*
*  MODIFY gt_employee FROM gs_employee TRANSPORTING full_name ctc. "****modify instruction****
*
*  CLEAR: gs_employee.
*
*ENDLOOP.



ULINE.

"ver o contar los registros de la tabla"

*DESCRIBE TABLE gt_employee LINES gv_lines.
*
*write: / 'Total Number Of Record ->', gv_lines.
*
*"eliminar un registro deletele intruction"
*
**DELETE gt_employee WHERE departament = 'fr'.
**
**DELETE gt_employee INDEX 1.
*
*"ordenar registros sort intruction"
*
*SORT gt_employee by departament ctc.
*
*"eliminar registros duplicados"
*DELETE ADJACENT DUPLICATES FROM gt_employee COMPARING departament.
*
*DESCRIBE TABLE gt_employee LINES gv_lines.
*
*write: / 'Total Number Of Record after delete for department->', gv_lines.
*
*write: / 'Total Number Of Record after delete for index->', gv_lines.

*uline.
*
*write: / 'Data after sort operations'.
*
*uline.

*sort gt_employee by employee_id. "sort operation order (puede ordenarse por cualquier elemento ya sea id, departamento, ctc, etc.)"
*sort gt_employee by ctc.
*sort gt_employee by departament.
*sort gt_employee by doj.
*sort gt_employee by departament ASCENDING ctc DESCENDING.
*sort gt_employee by departament ASCENDING ctc DESCENDING doj DESCENDING.

*CLEAR: gs_employee.
*
**READ TABLE gt_employee into gs_employee with key departament = 'it-sap' BINARY SEARCH.
*
*READ TABLE gt_employee INTO gs_employee INDEX 1.
*
*IF sy-subrc = 0.
*
*  WRITE:/ gs_employee-employee_id, 25 gs_employee-full_name, 55 gs_employee-doj , 80 gs_employee-departament, 95 gs_employee-ctc LEFT-JUSTIFIED.
*
*ELSE.
*
*    WRITE:/ 'No records found'.
*
*ENDIF.

*LOOP AT gt_employee INTO gs_employee.
*
**  CONCATENATE gs_employee-first_name gs_employee-last_name into gs_employee-full_name SEPARATED BY space. ""concatenate instruction****
**
**  gs_employee-ctc  = gs_employee-ctc  + '10000.00'.
*
*  WRITE:/ gs_employee-employee_id, 25 gs_employee-full_name, 55 gs_employee-doj , 80 gs_employee-departament, 95 gs_employee-ctc LEFT-JUSTIFIED.
*
**  MODIFY gt_employee FROM gs_employee TRANSPORTING full_name ctc. "****modify instruction****
*
*  CLEAR: gs_employee.
*
*ENDLOOP.
