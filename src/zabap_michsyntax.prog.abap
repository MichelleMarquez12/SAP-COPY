*&---------------------------------------------------------------------*
*& Report ZABAP_MICHSYNTAX
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABAP_MICHSYNTAX.

*DATA: GV_TITTLE(8) TYPE C,
*      GV_FNAME(35) TYPE C,
*      GV_LNAME(35) TYPE C,
*      GV_VAR.
*
*DATA: GV_POS TYPE I, "INTEGER
*      GV_LEN TYPE I, "INTEGER
*      GV_NUM(3) TYPE N. "NUMBER
*
*DATA: GV_SAL TYPE P DECIMALS 2,
*      GV_TAX TYPE P DECIMALS 4,
*      GV_TAMT TYPE P DECIMALS 2.
*
*gv_tittle = 'MR.'.
*gv_fname = 'MICH'.
*gv_lname = 'MARQUEZ'.
**gv_var = 'BAT'.*
*gv_pos = 123.
*gv_num = 123.
*gv_sal = '123456'.
*gv_tax = '18.00'.
*
*gv_len = strlen( gv_lname ).
*
*gv_tamt = ( gv_sal / 100 ) * gv_tax.
*
*WRITE : / gv_tittle.
*WRITE : / gv_fname.
*WRITE : / gv_lname.
*WRITE : / gv_pos.
*WRITE : / 'lenght of gv_lname is ->', gv_len.
*WRITE : / 'TYPE N VALUE NUMBER IS ->', gv_num.
*WRITE : / 'TYPE I VALUE NUMBER IS ->', gv_pos.
*
*ULINE.
*
*WRITE : / gv_sal.
*WRITE : / gv_tax.
*WRITE : / gv_tamt.
*
*ULINE.
*
*gv_tittle = 'MR.'.
*gv_fname = 'DAVID'.
*gv_lname = 'ZUÑIGA'.
*gv_pos = 11.
*
*WRITE : / gv_tittle.
*WRITE : / gv_fname.
*WRITE : / gv_lname.
*WRITE : / gv_pos.
*
*ULINE.

""""""""""""""""""""""""ELEMENTS DELTA""""""""""""""""""""""""""""""""""""""""""""
DATA: GV_SAL TYPE P DECIMALS 2,
      GV_TAX TYPE P DECIMALS 4 VALUE '18.00',
      GV_TAMT TYPE P DECIMALS 2.

DATA: GV_TITTLE(8) TYPE C,
      GV_FNAME TYPE ZMFIRST_NAME,
      GV_LNAME TYPE ZEMPLOYEE_MASTER-LAST_NAME.

DATA: GV_POS TYPE I, "INTEGER
      GV_LEN TYPE I, "INTEGER
      GV_NUM(3) TYPE N. "NUMBER

CONSTANTS: GC_TAXP TYPE P DECIMALS 2 VALUE '18.00'.

gv_tittle = 'MR.'.
gv_fname = 'MICH'.
gv_lname = 'MARQUEZ'.

*gv_sal = '123456'.
*gv_tax = '20.00'.
*gv_tamt = ( gv_sal / 100 ) * gv_tax.
*gv_tamt = gv_tamt * ( -1 ).


WRITE : / gv_tittle.
WRITE : / gv_fname.
WRITE : / gv_lname.
WRITE : / gv_sal.
WRITE : / 'TAX % ->',gv_tax.
WRITE : / 'TAX % CONSTANT ->',gc_taxp.
WRITE : / gv_tamt.

ULINE.
********************SYSTEM
WRITE : / 'LOGIN USER -> ', SY-uname.
WRITE : / 'CURRENT DATE -> ', SY-datum.
WRITE : / 'CURRENT TIME -> ', SY-uzeit.
WRITE : / 'TCODE -> ', SY-tcode.
