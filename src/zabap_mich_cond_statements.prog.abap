*&---------------------------------------------------------------------*
*& Report ZABAP_MICH_COND_STATEMENTS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABAP_MICH_COND_STATEMENTS.

PARAMETERS : p_sal type i,
             p_exp type i.

START-OF-SELECTION.

"SENTENCIAS IF, IF ELSE MULTIPLE
*IF P_SAL > 1000000 AND P_EXP > 5.
*    WRITE : / '1.5% BONUS'.
*ELSEIF.
*    WRITE : / '1% BONUS'.
*ELSEIF P_SAL > 750000.
*  WRITE : / '2% BONUS'.
*ELSEIF P_SAL > 50000.
*  WRITE : / '3% BONUS'.
*ELSE.
*  WRITE : / '5% BONUS'.
*ENDIF.
*
*SKIP 2.
*WRITE : / 'END OF PRG'.
*SKIP 2.
*end-of-SELECTION.


"SENTENCIAS CASE

CASE p_exp.
  WHEN 0.
    WRITE : / 'FREHSER'.
  WHEN 1 OR 2 OR 3.
    WRITE : / 'JUNIOR'.
  WHEN 4.
    WRITE : / 'SENIOR'.
  WHEN OTHERS.
    WRITE : / 'TEAM LEAD'.
ENDCASE .
