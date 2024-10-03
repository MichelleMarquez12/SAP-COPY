*----------------------------------------------------------------------*
***INCLUDE LZEMPLOYEE_MASTERF01.
*----------------------------------------------------------------------*
FORM SET_CREATOR.

ZEMPLOYEE_MASTER-createdby  =  sy-uname.    "current user"
ZEMPLOYEE_MASTER-createdon  =  sy-datum.    "system date"
ZEMPLOYEE_MASTER-createdtime  = sy-uzeit.    "system time"

ENDFORM.

FORM SET_CHANGE_BY.

types : begin of tp_itab.
         INCLUDE STRUCTURE zemployee_master.
         INCLUDE STRUCTURE VIMTBFLAGS.
types : end of tp_itab.

FIELD-SYMBOLS <fs> TYPE tp_itab.

loop at total ASSIGNING <fs> CASTING.

  IF <fs>-VIM_ACTION = 'U'.
    <fs>-changeby   = sy-uname.
    <fs>-changeon   = sy-datum.
    <fs>-changetime = sy-uzeit.
  ENDIF.

ENDLOOP.

ENDFORM.


FORM SET_ERROR.
  message 'Set the inactive flag - Data can not be delete' type 'E'.


  ENDFORM.
