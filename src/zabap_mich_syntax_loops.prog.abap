*&---------------------------------------------------------------------*
*& Report ZABAP_MICH_SYNTAX_LOOPS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABAP_MICH_SYNTAX_LOOPS.

PARAMETERS : P_DATE TYPE sy-datum OBLIGATORY DEFAULT sy-datum.


START-OF-SELECTION.

  PERFORM DO_ENDO.

END-OF-SELECTION.
*&---------------------------------------------------------------------*
*& Form DO_ENDO
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM do_endo .

*  DO.
*    WRITE : / 'DATE', p_date, sy-tabix.
*
*    if p_date > sy-datum.
*      exit.
*    ENDIF.
*
*    p_date = p_date + 1.
*  ENDDO.

"sentencia do con continuidad, donde salta el registro 4
*   DO 10 TIMES.
*     if sy-index = 4.
*       p_date = p_date + 1.
*       CONTINUE.
*     ENDIF.
*
*      WRITE : / 'DATE', p_date, sy-index.
*     p_date = p_date + 1.
*   ENDDO.

"sentencia while
while p_date <= sy-datum.
  WRITE : / 'DATE', p_date, sy-index.
  p_date = p_date + 1.
ENDWHILE.

ENDFORM.
