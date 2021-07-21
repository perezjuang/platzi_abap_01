CLASS z_class_mod03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_class_mod03 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Constantes
    CONSTANTS pqr TYPE p DECIMALS 4 VALUE '1.2356'.
    DATA(text) = |'The value of PQR is:' { pqr }|.
    out->write( pqr  ).

    " Tipos Literales
    TYPES: BEGIN OF student_type,
             Name(25)         TYPE C,
             Organization(40) TYPE C,
             Place(10)        TYPE C,
           END OF student_type.

    data student type student_type.
    student-name = 'Estudiante of Platzi'.
    student-organization = 'SAP'.
    student-place = 'India'.

    out->write( student ).
    out->write( student-organization ).


  ENDMETHOD.
ENDCLASS.
