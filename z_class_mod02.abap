CLASS z_class_mod02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_class_mod02 IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
    "Comentarios
    DATA text_line TYPE C LENGTH 40.
    text_line = 'Platzi la mejor plataforma de educacion a distancia'.
    out->write( text_line ).

    DATA text_string TYPE STRING.
    text_string = 'Platzi la mejor plataforma de educacion a distancia'.
    out->write( text_string ).

    DATA d_date TYPE D.
    d_date = SY-DATUM.
    out->write( d_date ).

  ENDMETHOD.
ENDCLASS.
