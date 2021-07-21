CLASS z_class_mod08 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_class_mod08 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    " Tipos Literales
    TYPES: BEGIN OF student_type,
             Name(25)         TYPE c,
             Organization(40) TYPE c,
             Place(10)        TYPE c,
             email            TYPE string,
           END OF student_type.

    DATA student TYPE student_type.
    student-name = 'Estudiante of Platzi'.
    student-organization = 'SAP'.
    student-place = 'India'.
    student-email = 'EMAIL&PLATZI.COM'.

    "Modularizacion - Modulo de Funcion
    DATA isMailValid TYPE abap_bool.
    DATA messageValidMail TYPE string.
    CALL FUNCTION 'Z_FM_MODULEOFPLATZI_100_1'
      EXPORTING
        p_email = student-email   " Parametro Mail
      IMPORTING
        e_valid = isMailValid
        e_msg   = messageValidMail.

    out->write( messageValidMail ).
    out->write( isMailValid ).

    IF isMailValid EQ abap_true.
      out->write( |'Email is: '{ student-email } | ).
    ELSE.
      student-email = ''.
    ENDIF.


  ENDMETHOD.
ENDCLASS.
