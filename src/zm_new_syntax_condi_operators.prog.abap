*&---------------------------------------------------------------------*
*& Report ZM_NEW_SYNTAX_CONDI_OPERATORS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZM_NEW_SYNTAX_CONDI_OPERATORS.

TABLES: ZBSID.

TYPES: BEGIN OF TP_BSID,
        BUKRS TYPE BUKRS,
        KUNNR TYPE KUNNR,
        UMSKS TYPE UMSKS,
        UMSKZ TYPE UMSKZ,
        AUGDT TYPE AUGDT,
        AUGBL TYPE AUGBL,
        ZUONR TYPE DZUONR,
        GJAHR TYPE GJAHR,
        BELNR TYPE BELNR_D,
        BUZEI TYPE BUZEI,
        BLART TYPE BLART,
        SHKZG TYPE SHKZG,
        DOC_INFO TYPE CHAR30,
      END OF TP_BSID.

DATA: GT_BSID TYPE STANDARD TABLE OF TP_BSID,
      GS_BSID TYPE TP_BSID.

SELECT-OPTIONS :  S_BUKRS FOR BSID-BUKRS,
                  S_GJAHR FOR BSID-GJAHR.

START-OF-SELECTION.

      SELECT BUKRS KUNNR UMSKS UMSKZ AUGDT AUGBL ZUONR GJAHR BELNR BUZEI BLART SHKZG
        FROM ZBSID INTO TABLE GT_BSID UP TO 1000 ROWS WHERE BUKRS IN S_BUKRS AND GJAHR IN S_GJAHR.

      SORT GT_BSID BY BLART SHKZG.
      DELETE ADJACENT DUPLICATES FROM GT_BSID COMPARING BLART SHKZG.

      LOOP AT GT_BSID ASSIGNING FIELD-SYMBOL(<FS1>).

*        IF <FS1>-BLART = 'RV' AND <FS1>-SHKZG = 'H'.
*            <FS1>-DOC_INFO = 'SD INVOICE - CREDIT'.
*        ELSEIF <FS1>-BLART = 'RV' AND <FS1>-SHKZG = 'S'.
*            <FS1>-DOC_INFO = 'SD INVOICE - DEBIT'.
*        ELSEIF <FS1>-BLART = 'DZ'.
*            <FS1>-DOC_INFO = 'PDC'.
*        ELSEIF <FS1>-BLART = 'BR'.
*            <FS1>-DOC_INFO = 'BANK RECEIPT'.
*        ELSE.
*            <FS1>-DOC_INFO = 'ACCOUNTING DOCUMENT'.
*        ENDIF.



*        <FS1>-DOC_INFO = COND %(
*                                WHEN <FS1>-BLART = 'RV' AND <FS1>-SHKZG = 'H' THEN 'SD INVOICE - CREDIT'
*                                WHEN <FS1>-BLART = 'RV' AND <FS1>-SHKZG = 'S' THEN 'SD INVOICE - DEBIT'
*                                WHEN <FS1>-BLART = 'DZ' THEN 'PDC'
*                                WHEN <FS1>-BLART = 'BR' THEN 'BANK RECEIPT'
*                                ELSE 'ACCOUNTING DOCUMENT'
*                                ).



*        CASE <FS1>-BLART.
*          WHEN 'RV'.
*            <FS1>-DOC_INFO = 'SD_INVOICE'.
*          WHEN 'DZ'.
*            <FS1>-DOC_INFO = 'PDC'.
*          WHEN 'BR'.
*            <FS1>-DOC_INFO = 'BANK RECEIPT'.
*          WHEN OTHERS.
*            <FS1>-DOC_INFO = 'ACCOUNTING DOCUMENT'.
*        ENDCASE.



        <FS1>-DOC_INFO = SWITCH %( <FS1>-BLART
                                   WHEN 'RV' THEN 'SD INVOICE'
                                   WHEN 'DZ' THEN 'PDC'
                                   WHEN 'BR' THEN 'BANK RECEIPT'
                                   ELSE 'CCOUNTING DOCUMENT'
                                 ).
      ENDLOOP.

      CL_DEMO_OUTPUT=>DISPLAY( GT_BSID ).
