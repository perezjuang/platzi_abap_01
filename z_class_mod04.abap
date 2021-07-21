CLASS z_class_mod04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_class_mod04 IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
* Declarando Variables

DATA: W_NUM1 TYPE I VALUE 10,
      W_NUM2 TYPE I VALUE 3,
      W_ADD  TYPE I,
      W_SUB  TYPE I,
      W_MUL  TYPE I,
      W_DIVI TYPE I,
      W_DIV  TYPE I,
      W_MOD  TYPE I,
      W_POW  TYPE I.

* Suma
W_ADD = W_NUM1 + W_NUM2.
out->write( |'Result of W_NUM1 + W_NUM2: '{ W_ADD }| ).

* Resta
W_SUB = W_NUM1 - W_NUM2.
out->write( |'Result of W_NUM1 - W_NUM2: '{ W_SUB }| ).

* Multiplicacion
W_MUL = W_NUM1 * W_NUM2.
out->write(  |'Result of W_NUM1 * W_NUM2: '{ W_MUL }| ).

* Division
W_DIVI = W_NUM1 / W_NUM2.
out->write( | 'Result of W_NUM1 / W_NUM2: '{ W_DIVI }| ).

* Division 
W_DIV = W_NUM1 DIV W_NUM2.
out->write(  |'Result of W_NUM1 DIV W_NUM2: '{ W_DIV }| ).

* Modulo 
W_MOD = W_NUM1 MOD W_NUM2.
out->write(  |'Result of W_NUM1 MOD W_NUM2: '{ W_MOD } | ).

* Numero Elevado
W_POW = W_NUM1 ** W_NUM2.
out->write(  |'Result of W_NUM1 ** W_NUM2: '{ W_POW } | ).


ENDMETHOD.
ENDCLASS.
