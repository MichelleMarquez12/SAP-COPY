*&---------------------------------------------------------------------*
*& Report ZABAP_MICH_STRING_OPERATIONS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABAP_MICH_STRING_OPERATIONS.

DATA : string1 type char50 value 'hello',
       string2 type char50 value 'abap',
       string3 type char50 value 'dev',
       string4 type char100,
       gv_list type string value 'ZMT01,MRS.,MICHELLE,MARQUEZ,SAPABAP,20180719',
       gt_list type TABLE of string,
       gs_list like LINE OF gt_list,
       gv_del type char1 value ',',
       gv_org_string type string value 'SAP       ABAP        PROGRAMMING - ABAP',
       gv_sub1 type string,
       gv_sub2 type string,
       gv_len type i,
       gv_amount type dmbtr value '1500.50',
       gv_text_amount(20).


*Pasar de mayusculas a minusculas
CONDENSE gv_org_string.
write : / 'caqdena condense ->', gv_org_string.
uline.
TRANSLATE gv_org_string TO LOWER CASE.
write : / 'Cadena despues del cambio mayus a minus->', gv_org_string.
uline.
TRANSLATE gv_org_string TO UPPER CASE.
write : / 'Cadena despues del cambio minus a mayus->', gv_org_string.


*saber cuantas veces sale la misma palabra en una cadena
*write : / 'Cadena original ->', gv_org_string.
*uline.
*CONDENSE gv_org_string.
*write : / gv_org_string.
*find ALL OCCURRENCES OF 'ABAP' in gv_org_string MATCH COUNT gv_len. "muestra todas las concurrencias
*find FIRST OCCURRENCE OF 'ABAP' in gv_org_string MATCH COUNT gv_len."muestra ls primer concurrencia
*write : / gv_len.



*remplazar texto de cadena mediante concurrencia, es decir quiero que donde diga abap diga abap on hana
*write : / 'Cadena original ->', gv_org_string.
*uline.
*CONDENSE gv_org_string.
*find ALL OCCURRENCES OF 'ABAP' in gv_org_string MATCH COUNT gv_len. "muestra todas las concurrencias
*write : / gv_len.
*REPLACE ALL OCCURRENCES OF'ABAP' in gv_org_string with 'ABAP ON HANA'.
*write : / 'Cadena despues de replace ->',gv_org_string.



*cadenas con shift que desplaza la cadena el numero de espacios que defina
*write : / 'Cadena original ->', gv_org_string.
*uline.
*CONDENSE gv_org_string.
*SHIFT gv_org_string by 4 PLACES LEFT.
*write : / 'Cadena despues del shift ->',gv_org_string.



*tema
*write :  gv_amount to gv_text_amount.
*write : / gv_amount.
*write : / gv_text_amount.
*CONDENSE gv_text_amount.
*write : / gv_text_amount.



*eliminar espacios adicionales en una cadena usando la palabra reservada condense
*write : / 'Cadena original ->', gv_org_string.
*CONDENSE gv_org_string.
*write : / 'Cadena despues de condense ->', gv_org_string.



*imprimir la cadena por subcadenas, con el rango
*write : / gv_org_string.
*gv_sub1 = gv_org_string+0(3).
*write : / 'sub string 1 ->',gv_sub1.
*gv_sub2 = gv_org_string+9(11).
*write : / 'sub string 1 ->',gv_sub2.
*uline.



*saber la longitud de la cadena
*write : / gv_org_string.
*gv_len = strlen( gv_org_string ).
*write : / gv_len.



*separar la cadena por elemento de tabla
*split gv_list at gv_del into table gt_list.
*
*loop at gt_list INTO gs_list.
*  write : / gs_list.
*  clear : gs_list.
*ENDLOOP.



*realizar la lectura de una cadena con concatenacion, o crear cadena de variables con concatenacion.
*CONCATENATE string1 string2 string3 into string4 SEPARATED BY '_'.
*write : / 'concatenate result ->' , string4.
*uline.
**write : / 'String values before clear ->', string1, string2, string3.
*uline.
*clear : string1, string2, string3.
**write : / 'String values after clear ->', string1, string2, string3.
*uline.
*split string4 at '_' into string1 string2 string3.
*write : / 'String values ->', string1, string2, string3.
