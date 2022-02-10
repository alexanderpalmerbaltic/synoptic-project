&ANALYZE-SUSPEND _VERSION-NUMBER AB_v10r12 GUI
&ANALYZE-RESUME
&Scoped-define WINDOW-NAME CURRENT-WINDOW
&Scoped-define FRAME-NAME Dialog-Frame
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS Dialog-Frame 
/*------------------------------------------------------------------------

  File: 

  Description: 

  Input Parameters:
      <none>

  Output Parameters:
      <none>

  Author: 

  Created: 
------------------------------------------------------------------------*/
/*          This .W file was created with the Progress AppBuilder.       */
/*----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

/* Parameters Definitions ---                                           */

DEFINE INPUT PARAMETER pipSearchType AS INTEGER NO-UNDO.
DEFINE OUTPUT PARAMETER popSelection AS CHARACTER NO-UNDO.
DEFINE OUTPUT PARAMETER popSuccess AS LOGICAL NO-UNDO.

/* Local Variable Definitions ---                                       */

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Dialog-Box
&Scoped-define DB-AWARE no

/* Name of designated FRAME-NAME and/or first browse and/or first query */
&Scoped-define FRAME-NAME Dialog-Frame

/* Standard List Definitions                                            */
&Scoped-Define ENABLED-OBJECTS selectBrand selectProductType Btn_Cancel ~
Btn_OK 
&Scoped-Define DISPLAYED-OBJECTS selectBrand selectProductType 

/* Custom List Definitions                                              */
/* List-1,List-2,List-3,List-4,List-5,List-6                            */

/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME



/* ***********************  Control Definitions  ********************** */

/* Define a dialog box                                                  */

/* Definitions of the field level widgets                               */
DEFINE BUTTON Btn_Cancel AUTO-END-KEY 
     LABEL "Cancel" 
     SIZE 15 BY 1.14
     BGCOLOR 8 .

DEFINE BUTTON Btn_OK AUTO-GO 
     LABEL "OK" 
     SIZE 15 BY 1.14
     BGCOLOR 8 .

DEFINE VARIABLE selectBrand AS CHARACTER 
     VIEW-AS SELECTION-LIST SINGLE SCROLLBAR-VERTICAL 
     LIST-ITEMS "Brand A","Brand B","Brand C","Brand D","Brand E" 
     SIZE 32 BY 8.81
     BGCOLOR 15  NO-UNDO.

DEFINE VARIABLE selectProductType AS CHARACTER 
     VIEW-AS SELECTION-LIST SINGLE SCROLLBAR-VERTICAL 
     LIST-ITEMS "Fleeces","Hoodies","Jackets and Coats","Jeans","Polo Shirts","Shirts","Shoes","Shorts","Sweatshirts","Tracksuit Bottoms","Tracksuits","Trousers","T-Shirts","Dresses & Skirts","Leggings & Tights" 
     SIZE 32 BY 8.81
     BGCOLOR 15  NO-UNDO.


/* ************************  Frame Definitions  *********************** */

DEFINE FRAME Dialog-Frame
     selectBrand AT ROW 1.48 COL 3 NO-LABEL WIDGET-ID 2
     selectProductType AT ROW 1.48 COL 3 NO-LABEL WIDGET-ID 4
     Btn_Cancel AT ROW 10.76 COL 3
     Btn_OK AT ROW 10.76 COL 20
     SPACE(1.19) SKIP(0.33)
    WITH VIEW-AS DIALOG-BOX KEEP-TAB-ORDER 
         SIDE-LABELS NO-UNDERLINE THREE-D  SCROLLABLE 
         FONT 10
         TITLE "Select"
         DEFAULT-BUTTON Btn_OK CANCEL-BUTTON Btn_Cancel WIDGET-ID 100.


/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Type: Dialog-Box
   Allow: Basic,Browse,DB-Fields,Query
   Other Settings: COMPILE
 */
&ANALYZE-RESUME _END-PROCEDURE-SETTINGS



/* ***********  Runtime Attributes and AppBuilder Settings  *********** */

&ANALYZE-SUSPEND _RUN-TIME-ATTRIBUTES
/* SETTINGS FOR DIALOG-BOX Dialog-Frame
   FRAME-NAME                                                           */
ASSIGN 
       FRAME Dialog-Frame:SCROLLABLE       = FALSE
       FRAME Dialog-Frame:HIDDEN           = TRUE.

/* _RUN-TIME-ATTRIBUTES-END */
&ANALYZE-RESUME

 



/* ************************  Control Triggers  ************************ */

&Scoped-define SELF-NAME Dialog-Frame
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL Dialog-Frame Dialog-Frame
ON WINDOW-CLOSE OF FRAME Dialog-Frame /* Select */
DO:
  APPLY "END-ERROR":U TO SELF.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME Btn_OK
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL Btn_OK Dialog-Frame
ON CHOOSE OF Btn_OK IN FRAME Dialog-Frame /* OK */
DO:
    /* Return the selected value */

    IF pipSearchType = 5 THEN
        ASSIGN popSelection = selectBrand:SCREEN-VALUE.
    ELSE IF pipSearchType = 6 THEN
        ASSIGN popSelection = selectProductType:SCREEN-VALUE.
    ASSIGN popSuccess = TRUE.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME selectBrand
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL selectBrand Dialog-Frame
ON VALUE-CHANGED OF selectBrand IN FRAME Dialog-Frame
DO:
    /* Make the OK button sensitive if a value has been selected */

    IF selectBrand:SCREEN-VALUE <> "" AND selectBrand:SCREEN-VALUE <> ? THEN
        ASSIGN btn_OK:SENSITIVE = TRUE.
    ELSE
        ASSIGN btn_OK:SENSITIVE = FALSE.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME selectProductType
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL selectProductType Dialog-Frame
ON VALUE-CHANGED OF selectProductType IN FRAME Dialog-Frame
DO:
    /* Make the OK button sensitive if a value has been selected */

    IF selectProductType:SCREEN-VALUE <> "" AND selectProductType:SCREEN-VALUE <> ? THEN
        ASSIGN btn_OK:SENSITIVE = TRUE.
    ELSE
        ASSIGN btn_OK:SENSITIVE = FALSE.  
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&UNDEFINE SELF-NAME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK Dialog-Frame 


/* ***************************  Main Block  *************************** */

/* Parent the dialog-box to the ACTIVE-WINDOW, if there is no parent.   */
IF VALID-HANDLE(ACTIVE-WINDOW) AND FRAME {&FRAME-NAME}:PARENT eq ?
THEN FRAME {&FRAME-NAME}:PARENT = ACTIVE-WINDOW.


/* Now enable the interface and wait for the exit condition.            */
/* (NOTE: handle ERROR and END-KEY so cleanup code will always fire.    */
MAIN-BLOCK:
DO ON ERROR   UNDO MAIN-BLOCK, LEAVE MAIN-BLOCK
   ON END-KEY UNDO MAIN-BLOCK, LEAVE MAIN-BLOCK:
  RUN enable_UI.

  /* Make the OK button insensitive when the dialog first opens */

  FRAME Dialog-Frame:BGCOLOR = 20.

  ASSIGN btn_OK:SENSITIVE = FALSE.

  /* Show the selection list for either brand or product type depending on
  the search type selected on the home screen of the main window */

  IF pipSearchType = 5 THEN
  DO:
      ASSIGN FRAME Dialog-Frame:TITLE = "Select a Brand".
      selectBrand:MOVE-TO-TOP().
      selectBrand:SENSITIVE = TRUE.
      selectProductType:MOVE-TO-BOTTOM().
      selectProductType:SENSITIVE = FALSE.
  END.
  ELSE IF pipSearchType = 6 THEN
  DO:
      ASSIGN FRAME Dialog-Frame:TITLE = "Select a Product Type".
      selectProductType:MOVE-TO-TOP().
      selectProductType:SENSITIVE = TRUE.
      selectBrand:MOVE-TO-BOTTOM().
      selectBrand:SENSITIVE = FALSE.
  END.


  WAIT-FOR GO OF FRAME {&FRAME-NAME}.
END.
RUN disable_UI.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* **********************  Internal Procedures  *********************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE disable_UI Dialog-Frame  _DEFAULT-DISABLE
PROCEDURE disable_UI :
/*------------------------------------------------------------------------------
  Purpose:     DISABLE the User Interface
  Parameters:  <none>
  Notes:       Here we clean-up the user-interface by deleting
               dynamic widgets we have created and/or hide 
               frames.  This procedure is usually called when
               we are ready to "clean-up" after running.
------------------------------------------------------------------------------*/
  /* Hide all frames. */
  HIDE FRAME Dialog-Frame.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE enable_UI Dialog-Frame  _DEFAULT-ENABLE
PROCEDURE enable_UI :
/*------------------------------------------------------------------------------
  Purpose:     ENABLE the User Interface
  Parameters:  <none>
  Notes:       Here we display/view/enable the widgets in the
               user-interface.  In addition, OPEN all queries
               associated with each FRAME and BROWSE.
               These statements here are based on the "Other 
               Settings" section of the widget Property Sheets.
------------------------------------------------------------------------------*/
  DISPLAY selectBrand selectProductType 
      WITH FRAME Dialog-Frame.
  ENABLE selectBrand selectProductType Btn_Cancel Btn_OK 
      WITH FRAME Dialog-Frame.
  VIEW FRAME Dialog-Frame.
  {&OPEN-BROWSERS-IN-QUERY-Dialog-Frame}
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

