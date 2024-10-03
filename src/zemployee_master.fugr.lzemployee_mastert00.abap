*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZEMPLOYEE_MASTER................................*
DATA:  BEGIN OF STATUS_ZEMPLOYEE_MASTER              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZEMPLOYEE_MASTER              .
CONTROLS: TCTRL_ZEMPLOYEE_MASTER
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZEMPLOYEE_MASTER              .
TABLES: ZEMPLOYEE_MASTER               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
