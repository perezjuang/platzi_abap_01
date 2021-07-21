*&---------------------------------------------------------------------*
*& Report ZPLATZI_ALV01
*&---------------------------------------------------------------------*
*& Primer Reporte ALV - PLATZI - JUAN GABRIEL PEREZ GUERRA
*&---------------------------------------------------------------------*
REPORT zplatzi_alv01.

"Definicion de Clase de Eventos del Programa
CLASS lcl_event_handle DEFINITION.
  PUBLIC SECTION.
    "Metodo usado para identificar si los datos del ALV Cambian
    CLASS-METHODS : hndl_data_changed
      FOR EVENT data_changed OF cl_gui_alv_grid
      IMPORTING er_data_changed.
ENDCLASS.
"Implementacion de Clase de eventos del programa
CLASS lcl_event_handle IMPLEMENTATION.
  METHOD hndl_data_changed.
    DATA : lt_zplatzicursos TYPE TABLE OF zplatzicursos.
    FIELD-SYMBOLS : <fs> TYPE any .
    ASSIGN er_data_changed->mp_mod_rows->* TO <fs>.
    lt_zplatzicursos = <fs>.
    IF lt_zplatzicursos IS NOT INITIAL.
      MODIFY zplatzicursos FROM TABLE lt_zplatzicursos.
      IF sy-subrc = 0.
        COMMIT WORK.
        MESSAGE 'Base de Datos Actualizada' TYPE 'S'.
      ENDIF.
    ENDIF.
  ENDMETHOD.
ENDCLASS.


"Definicion Clase local Principal
CLASS lcl_main DEFINITION.
  PUBLIC SECTION.
    "Variables locales de la clase
    CLASS-DATA : lo_grid          TYPE REF TO cl_gui_alv_grid, "Clase reusable para ALV
                 lo_cust          TYPE REF TO cl_gui_custom_container, " Clase reusable para contenedor de Screen.
                 lo_handle        TYPE REF TO lcl_event_handle, " Clase de Eventos
                 lt_zplatzicursos TYPE TABLE OF zplatzicursos, " Tabla de platzi
                 ls_layout        TYPE lvc_s_layo. " Estructura Reusable de un Layour alv
    "Implementacion de metodos
    CLASS-METHODS: run,
      get_data,
      prepare_layout,
      display_alv,
      user_command.

ENDCLASS.
"Implementacion de Clase local
CLASS lcl_main IMPLEMENTATION.
  METHOD run.
    CALL METHOD lcl_main=>get_data.
    CALL METHOD lcl_main=>prepare_layout.
    CALL METHOD lcl_main=>display_alv.
  ENDMETHOD.

  METHOD get_data.
    SELECT * FROM zplatzicursos INTO TABLE lt_zplatzicursos.
  ENDMETHOD.

  METHOD prepare_layout.
    ls_layout-edit = abap_true.
  ENDMETHOD.

  METHOD display_alv.
    IF lo_cust IS NOT BOUND.
      CREATE OBJECT lo_cust
        EXPORTING
          container_name = 'CONTAINER'.
    ENDIF.

    IF lo_grid IS NOT BOUND.
      CREATE OBJECT lo_grid
        EXPORTING
          i_parent = lo_cust.

    ENDIF.

    IF lo_handle IS NOT BOUND.
      CREATE OBJECT lo_handle.
    ENDIF.

    IF lo_handle IS BOUND.
      SET HANDLER lo_handle->hndl_data_changed FOR lo_grid.
    ENDIF.

    CALL METHOD lo_grid->set_table_for_first_display
      EXPORTING
        i_structure_name = 'ZPLATZICURSOS'
        is_layout        = ls_layout
      CHANGING
        it_outtab        = lt_zplatzicursos.

  ENDMETHOD.

  METHOD user_command.

    CASE sy-ucomm.
      WHEN 'BACK' OR 'EXIT' OR 'CANCEL'.
        LEAVE TO SCREEN 0.
      WHEN 'SAVE'.
        DATA lv_valid.
        DATA lv_refresh.
        CALL METHOD lo_grid->check_changed_data
          IMPORTING
            e_valid = lv_valid.  " Entries are Consistent
      WHEN OTHERS.
    ENDCASE.
  ENDMETHOD.

ENDCLASS.


START-OF-SELECTION.
  CALL SCREEN 9001.
*&---------------------------------------------------------------------*
*&      Module  STATUS_0001  OUTPUT
*&---------------------------------------------------------------------*
MODULE status_9001 OUTPUT.
  SET PF-STATUS 'STATUS'.
  SET TITLEBAR 'TITLE'.
  CALL METHOD lcl_main=>run.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0001  INPUT
*&---------------------------------------------------------------------*

MODULE user_command_9001 INPUT.
  CALL METHOD lcl_main=>user_command.
ENDMODULE.
