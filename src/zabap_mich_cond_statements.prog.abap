*&---------------------------------------------------------------------*
*& Report ZABAP_MICH_COND_STATEMENTS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABAP_MICH_COND_STATEMENTS.

PARAMETERS : p_sal type i,
             p_exp type i.

START-OF-SELECTION.

IF P_SAL > 500000.

  WRITE : / '2% BONUS'.

ELSE.

  WRITE : / '3% BONUS'.

ENDIF.

SKIP 2.

WRITE : / 'END OF PRG'.


end-of-SELECTION.
