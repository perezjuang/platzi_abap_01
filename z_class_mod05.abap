CLASS z_class_mod05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_class_mod05 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " IF
    DATA Result TYPE i VALUE 65.

    IF Result < 0.
      out->write(  'Resultado es menor a 0' ).
    ELSEIF Result < 70.
      out->write(  'El resultado es menor a 70').
    ELSE.
      out->write(  'el resultado es mayor a 70').
    ENDIF.


    " CASE


    DATA: Title_1(10) TYPE c,
          Title_2(15) TYPE c.

    Title_1 = 'ABAP'.
    Title_2 = 'Programming'.

    CASE Title_2.

      WHEN 'ABAP'.
        out->write( 'Este no es el titulo').

      WHEN 'Tutorials'.
       out->write( 'Este no es el titulo').

      WHEN 'Limited'.
        out->write( 'Este no es el titulo').

      WHEN 'Programming'.
        out->write( 'Este si no es el titulo').

      WHEN OTHERS.
        out->write( 'No se Encuentra en el CASE').
    ENDCASE.
  ENDMETHOD.
ENDCLASS.
