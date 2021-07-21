CLASS z_class_mod06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_class_mod06 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DO 5 TIMES.
      out->write( sy-index ).
      IF sy-index = 3.
        EXIT.
      ENDIF.
    ENDDO.
    "La salida es: 1 2 3.

    DO 4 TIMES.
      IF sy-index = 2.
        CONTINUE.
      ENDIF.
      out->write( sy-index ).
    ENDDO.
    "La salida es: 1 3 4


    DO 4 TIMES.
      CHECK sy-index BETWEEN 2 AND 3.
      out->write( sy-index ) .
    ENDDO.
    "La salida es: 2 3



    DATA gv_counter TYPE i VALUE 5.
    WHILE gv_counter > 0.
      out->write( |Counter: {  gv_counter }, Iteration: {  sy-index }| ).
      gv_counter = gv_counter - 1.
    ENDWHILE.






    TYPES:
      itab1 TYPE SORTED TABLE OF string WITH UNIQUE KEY table_line,
      BEGIN OF struct,
        col1 TYPE c LENGTH 2,
        col2 TYPE c LENGTH 2,
        col3 TYPE c LENGTH 2,
      END OF struct,
      itab2 TYPE SORTED TABLE OF struct WITH UNIQUE KEY col1 col2 col3.

    DATA(base1) = VALUE itab1(
                    ( `x1y1z1` )
                    ( `x2y2z2` )
                    ( `x3y3z3` ) ).
    DATA(base2) = VALUE itab2(
                    ( col1 = 'x1' col2 = 'y1' col3 = 'z1' )
                    ( col1 = 'x2' col2 = 'y2' col3 = 'z2' )
                    ( col1 = 'x3' col2 = 'y3' col3 = 'z3' ) ).

    DATA(tab1) = VALUE #( BASE base1
                   ( `A1B1B1` )
                   ( `A2B2B2` ) ).

    DATA(tab2)  = VALUE #(
                    BASE base2
                    ( col1 = 'A1' col2 = 'B1' col3 = 'C1' )
                    ( col1 = 'A2' col2 = 'B2' col3 = 'C2' ) ).

    DATA(tab3) = VALUE itab2( BASE base1
                   ( col1 = 'A1' col2 = 'B1' col3 = 'C1' )
                   ( col1 = 'A2' col2 = 'B2' col3 = 'C2' ) ).

    out->write( tab1  ).
    out->write( tab2 ).
    out->write( tab3 ).



**********************************************************************
**
**********************************************************************

    TYPES: BEGIN OF ty_ship,
             tknum TYPE c LENGTH 10,     "Shipment Number
             name  TYPE string,     "Name of Person who Created the Object
             city  TYPE string,     "Starting city
             route TYPE string,     "Shipment route
           END OF ty_ship.
    TYPES: BEGIN OF ty_city,
             id   TYPE c LENGTH 10,     "Shipment Number
             city TYPE string,     "Starting city
           END OF ty_city.

    TYPES: ty_ships TYPE SORTED TABLE OF ty_ship WITH UNIQUE KEY tknum.
    TYPES: ty_citys TYPE STANDARD TABLE OF ty_city WITH EMPTY KEY.
     data gt_cityes TYPE ty_citys.
     data gt_ships TYPE ty_ships.

    data(it_cyty_data) = VALUE ty_citys(
                    ( id = 'x1' city = 'y1' )
                    ( id = 'x2' city = 'y2' )
                     ).
    APPEND LINES OF it_cyty_data  to gt_cityes.

    data(it_ship_Data) = VALUE ty_ships(
                    ( tknum = 'x1' name = 'y1' city = 'z1' route = 'a1' )
                    ( tknum = 'x2' name = 'y2' city = 'z2' route = 'a2' )
                     ).

    APPEND lines of it_ship_Data to gt_ships.


    DATA: gt_citys TYPE ty_citys,
          gs_ship  TYPE ty_ship,
          gs_city  TYPE ty_city.

    LOOP AT gt_ships INTO gs_ship.
      gs_city-city =  gs_ship-city.

      APPEND gs_city TO gt_citys.
    ENDLOOP.


    "DATA(gt_citys2) = VALUE ty_citys( FOR ls_ship IN gt_ships ( ls_ship–city ) ).
    
    

  ENDMETHOD.
ENDCLASS.
