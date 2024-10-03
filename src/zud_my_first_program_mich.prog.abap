*&---------------------------------------------------------------------*
*& Report ZUD_MY_FIRST_PROGRAM_MICH
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUD_MY_FIRST_PROGRAM_MICH NO STANDARD PAGE HEADING.

WRITE: 'MY FIRST PROGRAM ABAP...'.

* Declaración de datos
DATA: P_line1 TYPE string,
      P_line2 TYPE string,
      P_line3 TYPE string,
      P_line4 TYPE string,
      P_line5 TYPE string,
      P_line6 TYPE string.

* Asignación de cada línea del patito
P_line1 = '     __'.
P_line2 = ' ___( o)>'.
P_line3 = ' \ <_. )'.
P_line4 = '  `---'''.
P_line5 = '   l l '.
P_line6 = ' Hello, how are you?'.

* Mostrar el patito línea por línea
WRITE: / P_line1,
       / P_line2,
       / P_line3,
       / P_line4,
       / P_line5,
       / P_line6.
