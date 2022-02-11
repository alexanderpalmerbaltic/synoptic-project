&ANALYZE-SUSPEND _VERSION-NUMBER AB_v10r12 GUI ADM2
&ANALYZE-RESUME
&Scoped-define WINDOW-NAME wWin
{adecomm/appserv.i}
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS wWin 
/*------------------------------------------------------------------------

  File: 

  Description: from cntnrwin.w - ADM SmartWindow Template

  Input Parameters:
      <none>

  Output Parameters:
      <none>

  History: New V9 Version - January 15, 1998
          
------------------------------------------------------------------------*/
/*          This .W file was created with the Progress AB.              */
/*----------------------------------------------------------------------*/

/* Create an unnamed pool to store all the widgets created 
     by this procedure. This is a good default which assures
     that this procedure's triggers and internal procedures 
     will execute in this procedure's storage, and that proper
     cleanup will occur on deletion of the procedure. */

CREATE WIDGET-POOL.

/* ***************************  Definitions  ************************** */

/* Parameters Definitions ---                                           */

/* Local Variable Definitions ---                                       */

{src/adm2/widgetprto.i}

DEFINE TEMP-TABLE ttResults
    FIELD tProductDescription AS CHARACTER
    FIELD tBrand AS CHARACTER
    FIELD tQuantity AS INTEGER
    FIELD tAvailableInStore AS LOGICAL FORMAT "Yes/No".

DEFINE VARIABLE pvSearchType AS INTEGER NO-UNDO.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE SmartWindow
&Scoped-define DB-AWARE no

&Scoped-define ADM-CONTAINER WINDOW

&Scoped-define ADM-SUPPORTED-LINKS Data-Target,Data-Source,Page-Target,Update-Source,Update-Target,Filter-target,Filter-Source

/* Name of designated FRAME-NAME and/or first browse and/or first query */
&Scoped-define FRAME-NAME fMain
&Scoped-define BROWSE-NAME brResults

/* Internal Tables (found by Frame, Query & Browse Queries)             */
&Scoped-define INTERNAL-TABLES ttResults

/* Definitions for BROWSE brResults                                     */
&Scoped-define FIELDS-IN-QUERY-brResults tProductDescription tBrand tQuantity tAvailableInStore   
&Scoped-define ENABLED-FIELDS-IN-QUERY-brResults   
&Scoped-define SELF-NAME brResults
&Scoped-define QUERY-STRING-brResults FOR EACH ttResults
&Scoped-define OPEN-QUERY-brResults OPEN QUERY {&SELF-NAME} FOR EACH ttResults.
&Scoped-define TABLES-IN-QUERY-brResults ttResults
&Scoped-define FIRST-TABLE-IN-QUERY-brResults ttResults


/* Definitions for BROWSE brResults-2                                   */
&Scoped-define FIELDS-IN-QUERY-brResults-2 tProductDescription tQuantity tAvailableInStore   
&Scoped-define ENABLED-FIELDS-IN-QUERY-brResults-2   
&Scoped-define SELF-NAME brResults-2
&Scoped-define QUERY-STRING-brResults-2 FOR EACH ttResults
&Scoped-define OPEN-QUERY-brResults-2 OPEN QUERY {&SELF-NAME} FOR EACH ttResults.
&Scoped-define TABLES-IN-QUERY-brResults-2 ttResults
&Scoped-define FIRST-TABLE-IN-QUERY-brResults-2 ttResults


/* Definitions for FRAME fResults                                       */
&Scoped-define OPEN-BROWSERS-IN-QUERY-fResults ~
    ~{&OPEN-QUERY-brResults}

/* Definitions for FRAME fResultsBrand                                  */
&Scoped-define OPEN-BROWSERS-IN-QUERY-fResultsBrand ~
    ~{&OPEN-QUERY-brResults-2}

/* Custom List Definitions                                              */
/* List-1,List-2,List-3,List-4,List-5,List-6                            */

/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME



/* ***********************  Control Definitions  ********************** */

/* Define the widget handle for the window                              */
DEFINE VAR wWin AS WIDGET-HANDLE NO-UNDO.

/* Definitions of the field level widgets                               */
DEFINE BUTTON btnSearch1  NO-FOCUS
     LABEL "Mens" 
     SIZE 20 BY 4.52
     FONT 11.

DEFINE BUTTON btnSearch2  NO-FOCUS
     LABEL "Ladies" 
     SIZE 20 BY 4.52
     FONT 11.

DEFINE BUTTON btnSearch3  NO-FOCUS
     LABEL "Boys" 
     SIZE 20 BY 4.52
     FONT 11.

DEFINE BUTTON btnSearch4  NO-FOCUS
     LABEL "Girls" 
     SIZE 20 BY 4.52
     FONT 11.

DEFINE BUTTON btnSearch5  NO-FOCUS
     LABEL "Brand" 
     SIZE 20 BY 4.52
     FONT 11.

DEFINE BUTTON btnSearch6  NO-FOCUS
     LABEL "Product Type" 
     SIZE 20 BY 4.52
     FONT 12.

DEFINE IMAGE IMAGE-1
     FILENAME "Images/stylishyou_logo_main.png":U
     STRETCH-TO-FIT
     SIZE 12.8 BY 3.05.

DEFINE BUTTON btnBack 
     LABEL "<< Back" 
     SIZE 20 BY 2.

DEFINE BUTTON btnHomeResults  NO-FOCUS
     LABEL "Home" 
     SIZE 20 BY 2.

DEFINE VARIABLE edSearchQuery AS CHARACTER 
     VIEW-AS EDITOR SCROLLBAR-VERTICAL
     SIZE 50 BY 5
     BGCOLOR 15 FONT 10 NO-UNDO.

DEFINE IMAGE imageResults
     FILENAME "Images/stylishyou_logo_main.png":U
     STRETCH-TO-FIT
     SIZE 12.8 BY 3.05.

DEFINE BUTTON btnBack-2 
     LABEL "<< Back" 
     SIZE 20 BY 2.

DEFINE BUTTON btnHomeResults-2  NO-FOCUS
     LABEL "Home" 
     SIZE 20 BY 2.

DEFINE VARIABLE edSearchQuery-2 AS CHARACTER 
     VIEW-AS EDITOR SCROLLBAR-VERTICAL
     SIZE 50 BY 5
     BGCOLOR 15 FONT 10 NO-UNDO.

DEFINE VARIABLE fiResultsBrand AS CHARACTER FORMAT "X(256)":U 
      VIEW-AS TEXT 
     SIZE 25 BY .62 NO-UNDO.

DEFINE IMAGE imageResults-2
     FILENAME "Images/stylishyou_logo_main.png":U
     STRETCH-TO-FIT
     SIZE 12.8 BY 3.05.

DEFINE BUTTON btnFind-2  NO-FOCUS
     LABEL "Find" 
     SIZE 50 BY 2.

DEFINE BUTTON btnHomeSearch-2  NO-FOCUS
     LABEL "<< Home" 
     SIZE 50 BY 2.

DEFINE VARIABLE cbColour2 AS CHARACTER FORMAT "X(256)":U INITIAL "Colour" 
     VIEW-AS COMBO-BOX INNER-LINES 5
     LIST-ITEMS "Colour","Beige","Black","Blue","Green","Grey","Multi","Orange","Pink","Purple","Red","Silver","White","Yellow","Gold" 
     DROP-DOWN-LIST
     SIZE 50 BY 1
     BGCOLOR 15  NO-UNDO.

DEFINE VARIABLE cbGender2 AS CHARACTER FORMAT "X(256)":U INITIAL "Gender" 
     VIEW-AS COMBO-BOX INNER-LINES 5
     LIST-ITEMS "Gender","Mens","Ladies","Boys","Girls" 
     DROP-DOWN-LIST
     SIZE 50 BY 1
     BGCOLOR 15  NO-UNDO.

DEFINE VARIABLE cbLocation2 AS CHARACTER FORMAT "X(256)":U INITIAL "Location" 
     VIEW-AS COMBO-BOX INNER-LINES 5
     LIST-ITEMS "Location","London","Manchester","Birmingham","Liverpool","Newcastle","Sheffield" 
     DROP-DOWN-LIST
     SIZE 50 BY 1
     BGCOLOR 15  NO-UNDO.

DEFINE VARIABLE cbProductType2 AS CHARACTER FORMAT "X(256)":U INITIAL "Product Type" 
     VIEW-AS COMBO-BOX INNER-LINES 5
     LIST-ITEMS "Product Type","Fleeces","Hoodies","Jackets and Coats","Jeans","Polo Shirts","Shirts","Shoes","Shorts","Sweatshirts","Tracksuit Bottoms","Tracksuits","Trousers","T-Shirts","Dresses & Skirts","Leggings & Tights" 
     DROP-DOWN-LIST
     SIZE 50 BY 1
     BGCOLOR 15  NO-UNDO.

DEFINE VARIABLE cbSize2 AS CHARACTER FORMAT "X(256)":U INITIAL "Size" 
     VIEW-AS COMBO-BOX INNER-LINES 5
     LIST-ITEMS "Size","S","M","L","XL","XXL" 
     DROP-DOWN-LIST
     SIZE 50 BY 1
     BGCOLOR 15  NO-UNDO.

DEFINE VARIABLE fiPriceMax2 AS DECIMAL FORMAT "£>>,>>9.99":U INITIAL 5000 
     VIEW-AS FILL-IN 
     SIZE 13 BY 1
     BGCOLOR 15  NO-UNDO.

DEFINE VARIABLE fiPriceMin2 AS DECIMAL FORMAT "£>>,>>9.99":U INITIAL .01 
     VIEW-AS FILL-IN 
     SIZE 13 BY 1
     BGCOLOR 15  NO-UNDO.

DEFINE VARIABLE fiSearchBrand AS CHARACTER FORMAT "X(256)":U 
      VIEW-AS TEXT 
     SIZE 25 BY .62 NO-UNDO.

DEFINE IMAGE imageSearch-2
     FILENAME "Images/stylishyou_logo_main.png":U
     STRETCH-TO-FIT
     SIZE 12.8 BY 3.05.

DEFINE BUTTON btnFind  NO-FOCUS
     LABEL "Find" 
     SIZE 50 BY 2.

DEFINE BUTTON btnHomeSearch  NO-FOCUS
     LABEL "<< Home" 
     SIZE 50 BY 2.

DEFINE VARIABLE cbBrand AS CHARACTER FORMAT "X(256)":U INITIAL "Brand" 
     VIEW-AS COMBO-BOX INNER-LINES 5
     LIST-ITEMS "Brand","Brand A","Brand B","Brand C","Brand D","Brand E" 
     DROP-DOWN-LIST
     SIZE 50 BY 1
     BGCOLOR 15  NO-UNDO.

DEFINE VARIABLE cbColour AS CHARACTER FORMAT "X(256)":U INITIAL "Colour" 
     VIEW-AS COMBO-BOX INNER-LINES 5
     LIST-ITEMS "Colour","Beige","Black","Blue","Green","Grey","Multi","Orange","Pink","Purple","Red","Silver","White","Yellow","Gold" 
     DROP-DOWN-LIST
     SIZE 50 BY 1
     BGCOLOR 15  NO-UNDO.

DEFINE VARIABLE cbLocation AS CHARACTER FORMAT "X(256)":U INITIAL "Location" 
     VIEW-AS COMBO-BOX INNER-LINES 5
     LIST-ITEMS "Location","London","Manchester","Birmingham","Liverpool","Newcastle","Sheffield" 
     DROP-DOWN-LIST
     SIZE 50 BY 1
     BGCOLOR 15  NO-UNDO.

DEFINE VARIABLE cbProductType AS CHARACTER FORMAT "X(256)":U INITIAL "Product Type" 
     VIEW-AS COMBO-BOX INNER-LINES 5
     LIST-ITEMS "Product Type","Fleeces","Hoodies","Jackets and Coats","Jeans","Polo Shirts","Shirts","Shoes","Shorts","Sweatshirts","Tracksuit Bottoms","Tracksuits","Trousers","T-Shirts","Dresses & Skirts","Leggings & Tights" 
     DROP-DOWN-LIST
     SIZE 50 BY 1
     BGCOLOR 15  NO-UNDO.

DEFINE VARIABLE cbSize AS CHARACTER FORMAT "X(256)":U INITIAL "Size" 
     VIEW-AS COMBO-BOX INNER-LINES 5
     LIST-ITEMS "Size","S","M","L","XL","XXL" 
     DROP-DOWN-LIST
     SIZE 50 BY 1
     BGCOLOR 15  NO-UNDO.

DEFINE VARIABLE fiPriceMax AS DECIMAL FORMAT "£>>,>>9.99":U INITIAL 5000 
     VIEW-AS FILL-IN 
     SIZE 13 BY 1
     BGCOLOR 15  NO-UNDO.

DEFINE VARIABLE fiPriceMin AS DECIMAL FORMAT "£>>,>>9.99":U INITIAL .01 
     VIEW-AS FILL-IN 
     SIZE 13 BY 1
     BGCOLOR 15  NO-UNDO.

DEFINE IMAGE imageSearch
     FILENAME "Images/stylishyou_logo_green.png":U
     STRETCH-TO-FIT
     SIZE 12.8 BY 3.05.

DEFINE BUTTON btnFind-3  NO-FOCUS
     LABEL "Find" 
     SIZE 50 BY 2.

DEFINE BUTTON btnHomeSearch-3  NO-FOCUS
     LABEL "<< Home" 
     SIZE 50 BY 2.

DEFINE VARIABLE cbBrand3 AS CHARACTER FORMAT "X(256)":U INITIAL "Brand" 
     VIEW-AS COMBO-BOX INNER-LINES 5
     LIST-ITEMS "Brand","Brand A","Brand B","Brand C","Brand D","Brand E" 
     DROP-DOWN-LIST
     SIZE 50 BY 1
     BGCOLOR 15  NO-UNDO.

DEFINE VARIABLE cbColour3 AS CHARACTER FORMAT "X(256)":U INITIAL "Colour" 
     VIEW-AS COMBO-BOX INNER-LINES 5
     LIST-ITEMS "Colour","Beige","Black","Blue","Green","Grey","Multi","Orange","Pink","Purple","Red","Silver","White","Yellow","Gold" 
     DROP-DOWN-LIST
     SIZE 50 BY 1
     BGCOLOR 15  NO-UNDO.

DEFINE VARIABLE cbGender3 AS CHARACTER FORMAT "X(256)":U INITIAL "Gender" 
     VIEW-AS COMBO-BOX INNER-LINES 5
     LIST-ITEMS "Gender","Mens","Ladies","Boys","Girls" 
     DROP-DOWN-LIST
     SIZE 50 BY 1
     BGCOLOR 15  NO-UNDO.

DEFINE VARIABLE cbLocation3 AS CHARACTER FORMAT "X(256)":U INITIAL "Location" 
     VIEW-AS COMBO-BOX INNER-LINES 5
     LIST-ITEMS "Location","London","Manchester","Birmingham","Liverpool","Newcastle","Sheffield" 
     DROP-DOWN-LIST
     SIZE 50 BY 1
     BGCOLOR 15  NO-UNDO.

DEFINE VARIABLE cbSize3 AS CHARACTER FORMAT "X(256)":U INITIAL "Size" 
     VIEW-AS COMBO-BOX INNER-LINES 5
     LIST-ITEMS "Size","S","M","L","XL","XXL" 
     DROP-DOWN-LIST
     SIZE 50 BY 1
     BGCOLOR 15  NO-UNDO.

DEFINE VARIABLE fiPriceMax3 AS DECIMAL FORMAT "£>>,>>9.99":U INITIAL 5000 
     VIEW-AS FILL-IN 
     SIZE 13 BY 1
     BGCOLOR 15  NO-UNDO.

DEFINE VARIABLE fiPriceMin3 AS DECIMAL FORMAT "£>>,>>9.99":U INITIAL .01 
     VIEW-AS FILL-IN 
     SIZE 13 BY 1
     BGCOLOR 15  NO-UNDO.

DEFINE VARIABLE fiSearchProductType AS CHARACTER FORMAT "X(256)":U 
      VIEW-AS TEXT 
     SIZE 25 BY .62 NO-UNDO.

DEFINE IMAGE imageSearch-3
     FILENAME "Images/stylishyou_logo_main.png":U
     STRETCH-TO-FIT
     SIZE 12.8 BY 3.05.

/* Query definitions                                                    */
&ANALYZE-SUSPEND
DEFINE QUERY brResults FOR 
      ttResults SCROLLING.

DEFINE QUERY brResults-2 FOR 
      ttResults SCROLLING.
&ANALYZE-RESUME

/* Browse definitions                                                   */
DEFINE BROWSE brResults
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _DISPLAY-FIELDS brResults wWin _FREEFORM
  QUERY brResults DISPLAY
      tProductDescription COLUMN-LABEL "Product Desc" WIDTH 16
    tBrand COLUMN-LABEL "Brand" WIDTH 7
    tQuantity COLUMN-LABEL "Quantity" WIDTH 10
    tAvailableInStore COLUMN-LABEL "In Store" WIDTH 9
/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME
    WITH NO-ROW-MARKERS SEPARATORS SIZE 50 BY 8
         BGCOLOR 15 FONT 10 FIT-LAST-COLUMN.

DEFINE BROWSE brResults-2
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _DISPLAY-FIELDS brResults-2 wWin _FREEFORM
  QUERY brResults-2 DISPLAY
      tProductDescription COLUMN-LABEL "Product Desc" WIDTH 23
    tQuantity COLUMN-LABEL "Quantity" WIDTH 10
    tAvailableInStore COLUMN-LABEL "In Store" WIDTH 9
/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME
    WITH NO-ROW-MARKERS SEPARATORS SIZE 50 BY 8
         BGCOLOR 15 FONT 10 FIT-LAST-COLUMN.


/* ************************  Frame Definitions  *********************** */

DEFINE FRAME fMain
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COL 1 ROW 1
         SIZE 60 BY 22 WIDGET-ID 100.

DEFINE FRAME fResults
     btnHomeResults AT ROW 20.29 COL 36 WIDGET-ID 28
     edSearchQuery AT ROW 5.76 COL 6 NO-LABEL WIDGET-ID 36
     brResults AT ROW 11.48 COL 6 WIDGET-ID 500
     btnBack AT ROW 20.29 COL 6 WIDGET-ID 38
     imageResults AT ROW 1.95 COL 24.6 WIDGET-ID 2
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COL 1 ROW 1
         SIZE 60 BY 22
         FONT 10 WIDGET-ID 400.

DEFINE FRAME fResultsBrand
     btnHomeResults-2 AT ROW 20.29 COL 36 WIDGET-ID 28
     edSearchQuery-2 AT ROW 5.76 COL 6 NO-LABEL WIDGET-ID 36
     brResults-2 AT ROW 11.48 COL 6 WIDGET-ID 500
     btnBack-2 AT ROW 20.29 COL 6 WIDGET-ID 40
     fiResultsBrand AT ROW 3.14 COL 29 COLON-ALIGNED NO-LABEL WIDGET-ID 38
     imageResults-2 AT ROW 1.95 COL 11.4 WIDGET-ID 2
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COL 1 ROW 1
         SIZE 60 BY 22
         FONT 10 WIDGET-ID 800.

DEFINE FRAME fHome
     btnSearch1 AT ROW 6.71 COL 7 WIDGET-ID 2
     btnSearch2 AT ROW 6.71 COL 35 WIDGET-ID 12
     btnSearch3 AT ROW 12.05 COL 7 WIDGET-ID 10
     btnSearch4 AT ROW 12.05 COL 35 WIDGET-ID 8
     btnSearch5 AT ROW 17.43 COL 7 WIDGET-ID 6
     btnSearch6 AT ROW 17.43 COL 35 WIDGET-ID 4
     IMAGE-1 AT ROW 1.95 COL 24.6 WIDGET-ID 14
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COL 1 ROW 1
         SIZE 60 BY 22 WIDGET-ID 200.

DEFINE FRAME fSearchGender
     btnFind AT ROW 17.43 COL 6 WIDGET-ID 30
     cbProductType AT ROW 5.76 COL 6 NO-LABEL WIDGET-ID 4
     cbSize AT ROW 7.67 COL 6 NO-LABEL WIDGET-ID 10
     cbColour AT ROW 9.57 COL 6 NO-LABEL WIDGET-ID 18
     fiPriceMin AT ROW 11.71 COL 4 COLON-ALIGNED NO-LABEL WIDGET-ID 20
     fiPriceMax AT ROW 11.71 COL 41 COLON-ALIGNED NO-LABEL WIDGET-ID 22
     cbBrand AT ROW 13.62 COL 6 NO-LABEL WIDGET-ID 24
     cbLocation AT ROW 15.52 COL 6 NO-LABEL WIDGET-ID 40
     btnHomeSearch AT ROW 20.29 COL 6 WIDGET-ID 28
     "Price Min" VIEW-AS TEXT
          SIZE 13 BY .62 AT ROW 11 COL 6 WIDGET-ID 42
     "Price Max" VIEW-AS TEXT
          SIZE 13 BY .62 AT ROW 11 COL 43 WIDGET-ID 44
     imageSearch AT ROW 1.95 COL 24.6 WIDGET-ID 32
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COL 1 ROW 1
         SIZE 60 BY 22
         FONT 10 WIDGET-ID 300.

DEFINE FRAME fSearchBrand
     btnFind-2 AT ROW 17.43 COL 6 WIDGET-ID 30
     cbGender2 AT ROW 5.76 COL 6 NO-LABEL WIDGET-ID 26
     cbProductType2 AT ROW 7.67 COL 6 NO-LABEL WIDGET-ID 4
     cbSize2 AT ROW 9.57 COL 6 NO-LABEL WIDGET-ID 10
     cbColour2 AT ROW 11.48 COL 6 NO-LABEL WIDGET-ID 18
     fiPriceMin2 AT ROW 13.62 COL 4 COLON-ALIGNED NO-LABEL WIDGET-ID 20
     fiPriceMax2 AT ROW 13.62 COL 39 COLON-ALIGNED NO-LABEL WIDGET-ID 22
     cbLocation2 AT ROW 15.52 COL 6 NO-LABEL WIDGET-ID 40
     btnHomeSearch-2 AT ROW 20.29 COL 6 WIDGET-ID 28
     fiSearchBrand AT ROW 3.14 COL 29 COLON-ALIGNED NO-LABEL WIDGET-ID 38
     "Price Min" VIEW-AS TEXT
          SIZE 13 BY .62 AT ROW 12.91 COL 6 WIDGET-ID 42
     "Price Max" VIEW-AS TEXT
          SIZE 13 BY .62 AT ROW 12.91 COL 41 WIDGET-ID 44
     imageSearch-2 AT ROW 1.95 COL 11.4 WIDGET-ID 32
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COL 1 ROW 1
         SIZE 60 BY 22
         FONT 10 WIDGET-ID 600.

DEFINE FRAME fSearchProductType
     btnFind-3 AT ROW 17.43 COL 6 WIDGET-ID 30
     cbGender3 AT ROW 5.76 COL 6 NO-LABEL WIDGET-ID 26
     cbBrand3 AT ROW 7.67 COL 6 NO-LABEL WIDGET-ID 24
     cbSize3 AT ROW 9.57 COL 6 NO-LABEL WIDGET-ID 10
     cbColour3 AT ROW 11.48 COL 6 NO-LABEL WIDGET-ID 18
     fiPriceMin3 AT ROW 13.62 COL 6 NO-LABEL WIDGET-ID 20
     fiPriceMax3 AT ROW 13.62 COL 41 COLON-ALIGNED NO-LABEL WIDGET-ID 22
     cbLocation3 AT ROW 15.52 COL 6 NO-LABEL WIDGET-ID 40
     btnHomeSearch-3 AT ROW 20.29 COL 6 WIDGET-ID 28
     fiSearchProductType AT ROW 3.19 COL 29 COLON-ALIGNED NO-LABEL WIDGET-ID 38
     "Price Min" VIEW-AS TEXT
          SIZE 13 BY .62 AT ROW 12.91 COL 6 WIDGET-ID 42
     "Price Max" VIEW-AS TEXT
          SIZE 13 BY .62 AT ROW 12.91 COL 43 WIDGET-ID 44
     imageSearch-3 AT ROW 1.95 COL 11.4 WIDGET-ID 32
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COL 1 ROW 1
         SIZE 60 BY 22
         FONT 10 WIDGET-ID 700.


/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Type: SmartWindow
   Allow: Basic,Browse,DB-Fields,Query,Smart,Window
   Container Links: Data-Target,Data-Source,Page-Target,Update-Source,Update-Target,Filter-target,Filter-Source
   Other Settings: COMPILE APPSERVER
 */
&ANALYZE-RESUME _END-PROCEDURE-SETTINGS

/* *************************  Create Window  ************************** */

&ANALYZE-SUSPEND _CREATE-WINDOW
IF SESSION:DISPLAY-TYPE = "GUI":U THEN
  CREATE WINDOW wWin ASSIGN
         HIDDEN             = YES
         TITLE              = " Stylish You Stock Management"
         HEIGHT             = 22
         WIDTH              = 60
         MAX-HEIGHT         = 28.81
         MAX-WIDTH          = 363.4
         VIRTUAL-HEIGHT     = 28.81
         VIRTUAL-WIDTH      = 363.4
         RESIZE             = no
         SCROLL-BARS        = no
         STATUS-AREA        = no
         BGCOLOR            = ?
         FGCOLOR            = ?
         THREE-D            = yes
         MESSAGE-AREA       = no
         SENSITIVE          = yes.
ELSE {&WINDOW-NAME} = CURRENT-WINDOW.
/* END WINDOW DEFINITION                                                */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _INCLUDED-LIB wWin 
/* ************************* Included-Libraries *********************** */

{src/adm2/containr.i}

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME




/* ***********  Runtime Attributes and AppBuilder Settings  *********** */

&ANALYZE-SUSPEND _RUN-TIME-ATTRIBUTES
/* SETTINGS FOR WINDOW wWin
  VISIBLE,,RUN-PERSISTENT                                               */
/* REPARENT FRAME */
ASSIGN FRAME fHome:FRAME = FRAME fMain:HANDLE
       FRAME fResults:FRAME = FRAME fMain:HANDLE
       FRAME fResultsBrand:FRAME = FRAME fMain:HANDLE
       FRAME fSearchBrand:FRAME = FRAME fMain:HANDLE
       FRAME fSearchGender:FRAME = FRAME fMain:HANDLE
       FRAME fSearchProductType:FRAME = FRAME fMain:HANDLE.

/* SETTINGS FOR FRAME fHome
                                                                        */
/* SETTINGS FOR FRAME fMain
   FRAME-NAME                                                           */

DEFINE VARIABLE XXTABVALXX AS LOGICAL NO-UNDO.

ASSIGN XXTABVALXX = FRAME fResultsBrand:MOVE-BEFORE-TAB-ITEM (FRAME fResults:HANDLE)
       XXTABVALXX = FRAME fHome:MOVE-BEFORE-TAB-ITEM (FRAME fResultsBrand:HANDLE)
       XXTABVALXX = FRAME fSearchGender:MOVE-BEFORE-TAB-ITEM (FRAME fHome:HANDLE)
       XXTABVALXX = FRAME fSearchBrand:MOVE-BEFORE-TAB-ITEM (FRAME fSearchGender:HANDLE)
       XXTABVALXX = FRAME fSearchProductType:MOVE-BEFORE-TAB-ITEM (FRAME fSearchBrand:HANDLE)
/* END-ASSIGN-TABS */.

/* SETTINGS FOR FRAME fResults
                                                                        */
/* BROWSE-TAB brResults edSearchQuery fResults */
ASSIGN 
       edSearchQuery:READ-ONLY IN FRAME fResults        = TRUE.

/* SETTINGS FOR FRAME fResultsBrand
                                                                        */
/* BROWSE-TAB brResults-2 edSearchQuery-2 fResultsBrand */
ASSIGN 
       edSearchQuery-2:READ-ONLY IN FRAME fResultsBrand        = TRUE.

/* SETTINGS FOR FILL-IN fiResultsBrand IN FRAME fResultsBrand
   NO-ENABLE                                                            */
/* SETTINGS FOR FRAME fSearchBrand
                                                                        */
/* SETTINGS FOR COMBO-BOX cbColour2 IN FRAME fSearchBrand
   ALIGN-L                                                              */
/* SETTINGS FOR COMBO-BOX cbGender2 IN FRAME fSearchBrand
   ALIGN-L                                                              */
/* SETTINGS FOR COMBO-BOX cbLocation2 IN FRAME fSearchBrand
   ALIGN-L                                                              */
/* SETTINGS FOR COMBO-BOX cbProductType2 IN FRAME fSearchBrand
   ALIGN-L                                                              */
/* SETTINGS FOR COMBO-BOX cbSize2 IN FRAME fSearchBrand
   ALIGN-L                                                              */
/* SETTINGS FOR FILL-IN fiSearchBrand IN FRAME fSearchBrand
   NO-ENABLE                                                            */
/* SETTINGS FOR FRAME fSearchGender
                                                                        */
/* SETTINGS FOR COMBO-BOX cbBrand IN FRAME fSearchGender
   ALIGN-L                                                              */
/* SETTINGS FOR COMBO-BOX cbColour IN FRAME fSearchGender
   ALIGN-L                                                              */
/* SETTINGS FOR COMBO-BOX cbLocation IN FRAME fSearchGender
   ALIGN-L                                                              */
/* SETTINGS FOR COMBO-BOX cbProductType IN FRAME fSearchGender
   ALIGN-L                                                              */
/* SETTINGS FOR COMBO-BOX cbSize IN FRAME fSearchGender
   ALIGN-L                                                              */
/* SETTINGS FOR FRAME fSearchProductType
                                                                        */
/* SETTINGS FOR COMBO-BOX cbBrand3 IN FRAME fSearchProductType
   ALIGN-L                                                              */
/* SETTINGS FOR COMBO-BOX cbColour3 IN FRAME fSearchProductType
   ALIGN-L                                                              */
/* SETTINGS FOR COMBO-BOX cbGender3 IN FRAME fSearchProductType
   ALIGN-L                                                              */
/* SETTINGS FOR COMBO-BOX cbLocation3 IN FRAME fSearchProductType
   ALIGN-L                                                              */
/* SETTINGS FOR COMBO-BOX cbSize3 IN FRAME fSearchProductType
   ALIGN-L                                                              */
/* SETTINGS FOR FILL-IN fiPriceMin3 IN FRAME fSearchProductType
   ALIGN-L                                                              */
/* SETTINGS FOR FILL-IN fiSearchProductType IN FRAME fSearchProductType
   NO-ENABLE                                                            */
IF SESSION:DISPLAY-TYPE = "GUI":U AND VALID-HANDLE(wWin)
THEN wWin:HIDDEN = yes.

/* _RUN-TIME-ATTRIBUTES-END */
&ANALYZE-RESUME


/* Setting information for Queries and Browse Widgets fields            */

&ANALYZE-SUSPEND _QUERY-BLOCK BROWSE brResults
/* Query rebuild information for BROWSE brResults
     _START_FREEFORM
OPEN QUERY {&SELF-NAME} FOR EACH ttResults.
     _END_FREEFORM
     _Query            is OPENED
*/  /* BROWSE brResults */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _QUERY-BLOCK BROWSE brResults-2
/* Query rebuild information for BROWSE brResults-2
     _START_FREEFORM
OPEN QUERY {&SELF-NAME} FOR EACH ttResults.
     _END_FREEFORM
     _Query            is OPENED
*/  /* BROWSE brResults-2 */
&ANALYZE-RESUME

 



/* ************************  Control Triggers  ************************ */

&Scoped-define SELF-NAME wWin
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL wWin wWin
ON END-ERROR OF wWin /*  Stylish You Stock Management */
OR ENDKEY OF {&WINDOW-NAME} ANYWHERE DO:
  /* This case occurs when the user presses the "Esc" key.
     In a persistently run window, just ignore this.  If we did not, the
     application would exit. */
  IF THIS-PROCEDURE:PERSISTENT THEN RETURN NO-APPLY.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL wWin wWin
ON WINDOW-CLOSE OF wWin /*  Stylish You Stock Management */
DO:
  /* This ADM code must be left here in order for the SmartWindow
     and its descendents to terminate properly on exit. */
  APPLY "CLOSE":U TO THIS-PROCEDURE.
  RETURN NO-APPLY.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define FRAME-NAME fResults
&Scoped-define SELF-NAME btnBack
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL btnBack wWin
ON CHOOSE OF btnBack IN FRAME fResults /* << Back */
DO:
  DO WITH FRAME {&FRAME-NAME}:

      /* Returns to the appropriate search screen for the search type */

      IF pvSearchType = 1 OR pvSearchType = 2 OR pvSearchType = 3 OR pvSearchType = 4 THEN
      DO:
          FRAME fSearchGender:MOVE-TO-TOP().
          FRAME fHome:MOVE-TO-BOTTOM().
          FRAME fSearchBrand:MOVE-TO-BOTTOM().
          FRAME fSearchProductType:MOVE-TO-BOTTOM().
          FRAME fResults:MOVE-TO-BOTTOM().
          FRAME fResultsBrand:MOVE-TO-BOTTOM().
      END.

      IF pvSearchType = 5 THEN
      DO:
          FRAME fSearchBrand:MOVE-TO-TOP().
          FRAME fHome:MOVE-TO-BOTTOM().
          FRAME fSearchGender:MOVE-TO-BOTTOM().
          FRAME fSearchProductType:MOVE-TO-BOTTOM().
          FRAME fResults:MOVE-TO-BOTTOM().
          FRAME fResultsBrand:MOVE-TO-BOTTOM().
      END.

      IF pvSearchType = 6 THEN
      DO:
          FRAME fSearchProductType:MOVE-TO-TOP().
          FRAME fHome:MOVE-TO-BOTTOM().
          FRAME fSearchBrand:MOVE-TO-BOTTOM().
          FRAME fSearchGender:MOVE-TO-BOTTOM().
          FRAME fResults:MOVE-TO-BOTTOM().
          FRAME fResultsBrand:MOVE-TO-BOTTOM().
      END.

  END.    
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define FRAME-NAME fResultsBrand
&Scoped-define SELF-NAME btnBack-2
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL btnBack-2 wWin
ON CHOOSE OF btnBack-2 IN FRAME fResultsBrand /* << Back */
DO:
  DO WITH FRAME {&FRAME-NAME}:

      /* Returns to the appropriate search screen for the search type */

      IF pvSearchType = 1 OR pvSearchType = 2 OR pvSearchType = 3 OR pvSearchType = 4 THEN
      DO:
          FRAME fSearchGender:MOVE-TO-TOP().
          FRAME fHome:MOVE-TO-BOTTOM().
          FRAME fSearchBrand:MOVE-TO-BOTTOM().
          FRAME fSearchProductType:MOVE-TO-BOTTOM().
          FRAME fResults:MOVE-TO-BOTTOM().
          FRAME fResultsBrand:MOVE-TO-BOTTOM().
      END.

      IF pvSearchType = 5 THEN
      DO:
          FRAME fSearchBrand:MOVE-TO-TOP().
          FRAME fHome:MOVE-TO-BOTTOM().
          FRAME fSearchGender:MOVE-TO-BOTTOM().
          FRAME fSearchProductType:MOVE-TO-BOTTOM().
          FRAME fResults:MOVE-TO-BOTTOM().
          FRAME fResultsBrand:MOVE-TO-BOTTOM().
      END.

      IF pvSearchType = 6 THEN
      DO:
          FRAME fSearchProductType:MOVE-TO-TOP().
          FRAME fHome:MOVE-TO-BOTTOM().
          FRAME fSearchBrand:MOVE-TO-BOTTOM().
          FRAME fSearchGender:MOVE-TO-BOTTOM().
          FRAME fResults:MOVE-TO-BOTTOM().
          FRAME fResultsBrand:MOVE-TO-BOTTOM().
      END.

  END.    
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define FRAME-NAME fSearchGender
&Scoped-define SELF-NAME btnFind
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL btnFind wWin
ON CHOOSE OF btnFind IN FRAME fSearchGender /* Find */
DO:
  DEFINE VARIABLE lvSuccess AS LOGICAL NO-UNDO.
  DEFINE VARIABLE lvMessage AS CHARACTER NO-UNDO.

  /* Runs the find procedure which validates the search fields and creates the database query,
  if validation fails the error message is displayed */

  RUN prFind IN THIS-PROCEDURE
      (OUTPUT lvSuccess,
       OUTPUT lvMessage).

  IF NOT lvSuccess THEN
      MESSAGE lvMessage
          VIEW-AS ALERT-BOX ERROR BUTTONS OK.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define FRAME-NAME fSearchBrand
&Scoped-define SELF-NAME btnFind-2
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL btnFind-2 wWin
ON CHOOSE OF btnFind-2 IN FRAME fSearchBrand /* Find */
DO:
    DEFINE VARIABLE lvSuccess AS LOGICAL NO-UNDO.
    DEFINE VARIABLE lvMessage AS CHARACTER NO-UNDO.

    /* Runs the find procedure which validates the search fields and creates the database query,
    if validation fails the error message is displayed */

    RUN prFind IN THIS-PROCEDURE
        (OUTPUT lvSuccess,
         OUTPUT lvMessage).

    IF NOT lvSuccess THEN
        MESSAGE lvMessage
            VIEW-AS ALERT-BOX ERROR BUTTONS OK.  
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define FRAME-NAME fSearchProductType
&Scoped-define SELF-NAME btnFind-3
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL btnFind-3 wWin
ON CHOOSE OF btnFind-3 IN FRAME fSearchProductType /* Find */
DO:
    DEFINE VARIABLE lvSuccess AS LOGICAL NO-UNDO.
    DEFINE VARIABLE lvMessage AS CHARACTER NO-UNDO.

    /* Runs the find procedure which validates the search fields and creates the database query,
    if validation fails the error message is displayed */

    RUN prFind IN THIS-PROCEDURE
        (OUTPUT lvSuccess,
         OUTPUT lvMessage).

    IF NOT lvSuccess THEN
        MESSAGE lvMessage
            VIEW-AS ALERT-BOX ERROR BUTTONS OK.  
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define FRAME-NAME fResults
&Scoped-define SELF-NAME btnHomeResults
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL btnHomeResults wWin
ON CHOOSE OF btnHomeResults IN FRAME fResults /* Home */
DO:

  /* Returns to the home screen */

  DO WITH FRAME {&FRAME-NAME}:
      FRAME fHome:MOVE-TO-TOP().
      FRAME fSearchGender:MOVE-TO-BOTTOM().
      FRAME fSearchBrand:MOVE-TO-BOTTOM().
      FRAME fSearchProductType:MOVE-TO-BOTTOM().
      FRAME fResults:MOVE-TO-BOTTOM().
      FRAME fResultsBrand:MOVE-TO-BOTTOM().
  END.  
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define FRAME-NAME fResultsBrand
&Scoped-define SELF-NAME btnHomeResults-2
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL btnHomeResults-2 wWin
ON CHOOSE OF btnHomeResults-2 IN FRAME fResultsBrand /* Home */
DO:

  /* Returns to the home screen */

  DO WITH FRAME {&FRAME-NAME}:
      FRAME fHome:MOVE-TO-TOP().
      FRAME fSearchGender:MOVE-TO-BOTTOM().
      FRAME fSearchBrand:MOVE-TO-BOTTOM().
      FRAME fSearchProductType:MOVE-TO-BOTTOM().
      FRAME fResults:MOVE-TO-BOTTOM().
      FRAME fResultsBrand:MOVE-TO-BOTTOM().
  END.  
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define FRAME-NAME fSearchGender
&Scoped-define SELF-NAME btnHomeSearch
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL btnHomeSearch wWin
ON CHOOSE OF btnHomeSearch IN FRAME fSearchGender /* << Home */
DO:

  /* Returns to the home screen */

  DO WITH FRAME {&FRAME-NAME}:
      FRAME fHome:MOVE-TO-TOP().
      FRAME fSearchGender:MOVE-TO-BOTTOM().
      FRAME fSearchBrand:MOVE-TO-BOTTOM().
      FRAME fSearchProductType:MOVE-TO-BOTTOM().
      FRAME fResults:MOVE-TO-BOTTOM().
      FRAME fResultsBrand:MOVE-TO-BOTTOM().
  END.  
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define FRAME-NAME fSearchBrand
&Scoped-define SELF-NAME btnHomeSearch-2
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL btnHomeSearch-2 wWin
ON CHOOSE OF btnHomeSearch-2 IN FRAME fSearchBrand /* << Home */
DO:

  /* Returns to the home screen */

  DO WITH FRAME {&FRAME-NAME}:
      FRAME fHome:MOVE-TO-TOP().
      FRAME fSearchGender:MOVE-TO-BOTTOM().
      FRAME fSearchBrand:MOVE-TO-BOTTOM().
      FRAME fSearchProductType:MOVE-TO-BOTTOM().
      FRAME fResults:MOVE-TO-BOTTOM().
      FRAME fResultsBrand:MOVE-TO-BOTTOM().
  END.  
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define FRAME-NAME fSearchProductType
&Scoped-define SELF-NAME btnHomeSearch-3
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL btnHomeSearch-3 wWin
ON CHOOSE OF btnHomeSearch-3 IN FRAME fSearchProductType /* << Home */
DO:

  /* Returns to the home screen */

  DO WITH FRAME {&FRAME-NAME}:
      FRAME fHome:MOVE-TO-TOP().
      FRAME fSearchGender:MOVE-TO-BOTTOM().
      FRAME fSearchBrand:MOVE-TO-BOTTOM().
      FRAME fSearchProductType:MOVE-TO-BOTTOM().
      FRAME fResults:MOVE-TO-BOTTOM().
      FRAME fResultsBrand:MOVE-TO-BOTTOM().
  END.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define FRAME-NAME fHome
&Scoped-define SELF-NAME btnSearch1
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL btnSearch1 wWin
ON CHOOSE OF btnSearch1 IN FRAME fHome /* Mens */
DO:
    /* When the Mens button on the home screen is pressed the search type is set
    and the appropriate search screen and logo are displayed */
    DEFINE VARIABLE lvImagePath AS CHARACTER NO-UNDO INITIAL "Images\StylishYou_Logo_Green.png".

    ASSIGN pvSearchType = 1.

    DO WITH FRAME {&FRAME-NAME}:

        FRAME fSearchGender:BGCOLOR = 22.
        FRAME fResults:BGCOLOR = 22.

        FRAME fSearchGender:MOVE-TO-TOP().
        FRAME fSearchBrand:MOVE-TO-BOTTOM().
        FRAME fSearchProductType:MOVE-TO-BOTTOM().

        imageSearch:LOAD-IMAGE(lvImagePath).
        imageResults:LOAD-IMAGE(lvImagePath) IN FRAME fResults.
    END.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME btnSearch2
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL btnSearch2 wWin
ON CHOOSE OF btnSearch2 IN FRAME fHome /* Ladies */
DO:
    /* When the Ladies button on the home screen is pressed the search type is set
    and the appropriate search screen and logo are displayed */

    DEFINE VARIABLE lvImagePath AS CHARACTER NO-UNDO INITIAL "Images\StylishYou_Logo_Red.png".

    ASSIGN pvSearchType = 2.

    DO WITH FRAME {&FRAME-NAME}:

        FRAME fSearchGender:BGCOLOR = 23.
        FRAME fResults:BGCOLOR = 23.

        FRAME fSearchGender:MOVE-TO-TOP().
        FRAME fSearchBrand:MOVE-TO-BOTTOM().
        FRAME fSearchProductType:MOVE-TO-BOTTOM().

        imageSearch:LOAD-IMAGE(lvImagePath).
        imageResults:LOAD-IMAGE(lvImagePath) IN FRAME fResults.
    END.  
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME btnSearch3
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL btnSearch3 wWin
ON CHOOSE OF btnSearch3 IN FRAME fHome /* Boys */
DO:
    /* When the Boys button on the home screen is pressed the search type is set
    and the appropriate search screen and logo are displayed */

    DEFINE VARIABLE lvImagePath AS CHARACTER NO-UNDO INITIAL "Images\StylishYou_Logo_Orange.png".

    ASSIGN pvSearchType = 3.

    DO WITH FRAME {&FRAME-NAME}:

        FRAME fSearchGender:BGCOLOR = 24.
        FRAME fResults:BGCOLOR = 24.

        FRAME fSearchGender:MOVE-TO-TOP().
        FRAME fSearchBrand:MOVE-TO-BOTTOM().
        FRAME fSearchProductType:MOVE-TO-BOTTOM().

        imageSearch:LOAD-IMAGE(lvImagePath).
        imageResults:LOAD-IMAGE(lvImagePath) IN FRAME fResults.
    END.    
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME btnSearch4
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL btnSearch4 wWin
ON CHOOSE OF btnSearch4 IN FRAME fHome /* Girls */
DO:
    /* When the Girls button on the home screen is pressed the search type is set
    and the appropriate search screen and logo are displayed */

    DEFINE VARIABLE lvImagePath AS CHARACTER NO-UNDO INITIAL "Images\StylishYou_Logo_Orange.png".

    ASSIGN pvSearchType = 4.

    DO WITH FRAME {&FRAME-NAME}:

        FRAME fSearchGender:BGCOLOR = 24.
        FRAME fResults:BGCOLOR = 24.

        FRAME fSearchGender:MOVE-TO-TOP().
        FRAME fSearchBrand:MOVE-TO-BOTTOM().
        FRAME fSearchProductType:MOVE-TO-BOTTOM().

        imageSearch:LOAD-IMAGE(lvImagePath).
        imageResults:LOAD-IMAGE(lvImagePath) IN FRAME fResults.
    END.    
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME btnSearch5
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL btnSearch5 wWin
ON CHOOSE OF btnSearch5 IN FRAME fHome /* Brand */
DO:
    /* When the Brand button on the home screen is pressed the search type is set
    and the selection dialog box is displayed. Then the appropriate search screen
    is displayed along with the selected brand name */

    DEFINE VARIABLE lvSelection AS CHARACTER NO-UNDO.
    DEFINE VARIABLE lvSuccess AS LOGICAL NO-UNDO.

    ASSIGN pvSearchType = 5.

    RUN "Program files\dgSelect.r"
        (INPUT pvSearchType,
         OUTPUT lvSelection,
         OUTPUT lvSuccess).

    IF NOT lvSuccess THEN
        LEAVE.

    ASSIGN fiSearchBrand:SCREEN-VALUE IN FRAME fSearchBrand = lvSelection.

    DO WITH FRAME {&FRAME-NAME}:

        FRAME fSearchBrand:BGCOLOR = 21.
        FRAME fResultsBrand:BGCOLOR = 21.

        FRAME fSearchBrand:MOVE-TO-TOP().
        FRAME fSearchGender:MOVE-TO-BOTTOM().
        FRAME fSearchProductType:MOVE-TO-BOTTOM().
    END.    
  
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME btnSearch6
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL btnSearch6 wWin
ON CHOOSE OF btnSearch6 IN FRAME fHome /* Product Type */
DO:
    /* When the Product Type button on the home screen is pressed the search type is set
    and the selection dialog box is displayed. Then the appropriate search screen and logo
    are displayed along with the selected product type */

    DEFINE VARIABLE lvSelection AS CHARACTER NO-UNDO.
    DEFINE VARIABLE lvSuccess AS LOGICAL NO-UNDO.

    DEFINE VARIABLE lvCount AS INTEGER NO-UNDO.
    DEFINE VARIABLE lvRegularSizes AS CHARACTER NO-UNDO.
    DEFINE VARIABLE lvShoeSizes AS CHARACTER NO-UNDO.

    DEFINE VARIABLE lvImagePath AS CHARACTER NO-UNDO INITIAL "Images\StylishYou_Logo_Main.png".

    ASSIGN pvSearchType = 6.

    RUN "Program files\dgSelect.r"
        (INPUT pvSearchType,
         OUTPUT lvSelection,
         OUTPUT lvSuccess).

    IF NOT lvSuccess THEN
        LEAVE.

    ASSIGN fiSearchProductType:SCREEN-VALUE IN FRAME fSearchProductType = lvSelection.

    /* Set the sizes based on the product type */
    ASSIGN
        lvRegularSizes = "Size,S,M,L,XL,XXL"
        lvShoeSizes = "Size,6,6.5,7,7.5,8,8.5,9,9.5,10,10.5,11,12,13".

    IF fiSearchProductType:SCREEN-VALUE IN FRAME fSearchProductType = "Shoes" THEN
    DO:
        DO WHILE cbSize3:NUM-ITEMS > 0:
           cbSize3:DELETE(1).
        END.

        DO lvCount = 1 TO NUM-ENTRIES(lvShoeSizes):
            cbSize3:ADD-LAST(ENTRY(lvCount, lvShoeSizes)).
        END.

        IF cbSize3:NUM-ITEMS > 0 THEN
           ASSIGN cbSize3:SCREEN-VALUE = cbSize3:ENTRY(1).
    END.
    ELSE
    DO:
        DO WHILE cbSize3:NUM-ITEMS > 0:
           cbSize3:DELETE(1).
        END.

        DO lvCount = 1 TO NUM-ENTRIES(lvRegularSizes):
            cbSize3:ADD-LAST(ENTRY(lvCount, lvRegularSizes)).
        END.

        IF cbSize3:NUM-ITEMS > 0 THEN
           ASSIGN cbSize3:SCREEN-VALUE = cbSize3:ENTRY(1).

    END.


    DO WITH FRAME {&FRAME-NAME}:

        FRAME fSearchProductType:BGCOLOR = 21.
        FRAME fResults:BGCOLOR = 21.

        FRAME fSearchProductType:MOVE-TO-TOP().
        FRAME fSearchBrand:MOVE-TO-BOTTOM().
        FRAME fSearchGender:MOVE-TO-BOTTOM().

        imageResults:LOAD-IMAGE(lvImagePath)  IN FRAME fResults.
    END.      
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define FRAME-NAME fSearchGender
&Scoped-define SELF-NAME cbProductType
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL cbProductType wWin
ON VALUE-CHANGED OF cbProductType IN FRAME fSearchGender
DO:
  DEFINE VARIABLE lvCount AS INTEGER NO-UNDO.
  DEFINE VARIABLE lvRegularSizes AS CHARACTER NO-UNDO.
  DEFINE VARIABLE lvShoeSizes AS CHARACTER NO-UNDO.

  ASSIGN
      lvRegularSizes = "Size,S,M,L,XL,XXL"
      lvShoeSizes = "Size,6,6.5,7,7.5,8,8.5,9,9.5,10,10.5,11,12,13".

  IF cbProductType:SCREEN-VALUE = "Shoes" THEN
  DO:
      DO WHILE cbSize:NUM-ITEMS > 0:
         cbSize:DELETE(1).
      END.

      DO lvCount = 1 TO NUM-ENTRIES(lvShoeSizes):
          cbSize:ADD-LAST(ENTRY(lvCount, lvShoeSizes)).
      END.

      IF cbSize:NUM-ITEMS > 0 THEN
         ASSIGN cbSize:SCREEN-VALUE = cbSize:ENTRY(1).
  END.
  ELSE
  DO:
      DO WHILE cbSize:NUM-ITEMS > 0:
         cbSize:DELETE(1).
      END.

      DO lvCount = 1 TO NUM-ENTRIES(lvRegularSizes):
          cbSize:ADD-LAST(ENTRY(lvCount, lvRegularSizes)).
      END.

      IF cbSize:NUM-ITEMS > 0 THEN
         ASSIGN cbSize:SCREEN-VALUE = cbSize:ENTRY(1).

  END.

END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define FRAME-NAME fSearchBrand
&Scoped-define SELF-NAME cbProductType2
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL cbProductType2 wWin
ON VALUE-CHANGED OF cbProductType2 IN FRAME fSearchBrand
DO:
    DEFINE VARIABLE lvCount AS INTEGER NO-UNDO.
    DEFINE VARIABLE lvRegularSizes AS CHARACTER NO-UNDO.
    DEFINE VARIABLE lvShoeSizes AS CHARACTER NO-UNDO.

    ASSIGN
        lvRegularSizes = "Size,S,M,L,XL,XXL"
        lvShoeSizes = "Size,6,6.5,7,7.5,8,8.5,9,9.5,10,10.5,11,12,13".

    IF cbProductType2:SCREEN-VALUE = "Shoes" THEN
    DO:
        DO WHILE cbSize2:NUM-ITEMS > 0:
           cbSize2:DELETE(1).
        END.

        DO lvCount = 1 TO NUM-ENTRIES(lvShoeSizes):
            cbSize2:ADD-LAST(ENTRY(lvCount, lvShoeSizes)).
        END.

        IF cbSize2:NUM-ITEMS > 0 THEN
           ASSIGN cbSize2:SCREEN-VALUE = cbSize2:ENTRY(1).
    END.
    ELSE
    DO:
        DO WHILE cbSize2:NUM-ITEMS > 0:
           cbSize2:DELETE(1).
        END.

        DO lvCount = 1 TO NUM-ENTRIES(lvRegularSizes):
            cbSize2:ADD-LAST(ENTRY(lvCount, lvRegularSizes)).
        END.

        IF cbSize2:NUM-ITEMS > 0 THEN
           ASSIGN cbSize2:SCREEN-VALUE = cbSize2:ENTRY(1).

    END.
  
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define FRAME-NAME fMain
&Scoped-define BROWSE-NAME brResults
&UNDEFINE SELF-NAME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK wWin 


/* ***************************  Main Block  *************************** */

/* Include custom  Main Block code for SmartWindows. */
{src/adm2/windowmn.i}

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* **********************  Internal Procedures  *********************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE adm-create-objects wWin  _ADM-CREATE-OBJECTS
PROCEDURE adm-create-objects :
/*------------------------------------------------------------------------------
  Purpose:     Create handles for all SmartObjects used in this procedure.
               After SmartObjects are initialized, then SmartLinks are added.
  Parameters:  <none>
------------------------------------------------------------------------------*/

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE disable_UI wWin  _DEFAULT-DISABLE
PROCEDURE disable_UI :
/*------------------------------------------------------------------------------
  Purpose:     DISABLE the User Interface
  Parameters:  <none>
  Notes:       Here we clean-up the user-interface by deleting
               dynamic widgets we have created and/or hide 
               frames.  This procedure is usually called when
               we are ready to "clean-up" after running.
------------------------------------------------------------------------------*/
  /* Delete the WINDOW we created */
  IF SESSION:DISPLAY-TYPE = "GUI":U AND VALID-HANDLE(wWin)
  THEN DELETE WIDGET wWin.
  IF THIS-PROCEDURE:PERSISTENT THEN DELETE PROCEDURE THIS-PROCEDURE.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE enable_UI wWin  _DEFAULT-ENABLE
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
  ENABLE btnSearch1 IMAGE-1 btnSearch2 btnSearch3 btnSearch4 btnSearch5 
         btnSearch6 
      WITH FRAME fHome IN WINDOW wWin.
  {&OPEN-BROWSERS-IN-QUERY-fHome}
  VIEW FRAME fMain IN WINDOW wWin.
  {&OPEN-BROWSERS-IN-QUERY-fMain}
  DISPLAY edSearchQuery 
      WITH FRAME fResults IN WINDOW wWin.
  ENABLE btnHomeResults imageResults edSearchQuery brResults btnBack 
      WITH FRAME fResults IN WINDOW wWin.
  {&OPEN-BROWSERS-IN-QUERY-fResults}
  DISPLAY edSearchQuery-2 fiResultsBrand 
      WITH FRAME fResultsBrand IN WINDOW wWin.
  ENABLE btnHomeResults-2 imageResults-2 edSearchQuery-2 brResults-2 btnBack-2 
      WITH FRAME fResultsBrand IN WINDOW wWin.
  {&OPEN-BROWSERS-IN-QUERY-fResultsBrand}
  DISPLAY cbGender2 cbProductType2 cbSize2 cbColour2 fiPriceMin2 fiPriceMax2 
          cbLocation2 fiSearchBrand 
      WITH FRAME fSearchBrand IN WINDOW wWin.
  ENABLE btnFind-2 imageSearch-2 cbGender2 cbProductType2 cbSize2 cbColour2 
         fiPriceMin2 fiPriceMax2 cbLocation2 btnHomeSearch-2 
      WITH FRAME fSearchBrand IN WINDOW wWin.
  {&OPEN-BROWSERS-IN-QUERY-fSearchBrand}
  DISPLAY cbProductType cbSize cbColour fiPriceMin fiPriceMax cbBrand cbLocation 
      WITH FRAME fSearchGender IN WINDOW wWin.
  ENABLE btnFind imageSearch cbProductType cbSize cbColour fiPriceMin 
         fiPriceMax cbBrand cbLocation btnHomeSearch 
      WITH FRAME fSearchGender IN WINDOW wWin.
  {&OPEN-BROWSERS-IN-QUERY-fSearchGender}
  DISPLAY cbGender3 cbBrand3 cbSize3 cbColour3 fiPriceMin3 fiPriceMax3 
          cbLocation3 fiSearchProductType 
      WITH FRAME fSearchProductType IN WINDOW wWin.
  ENABLE btnFind-3 imageSearch-3 cbGender3 cbBrand3 cbSize3 cbColour3 
         fiPriceMin3 fiPriceMax3 cbLocation3 btnHomeSearch-3 
      WITH FRAME fSearchProductType IN WINDOW wWin.
  {&OPEN-BROWSERS-IN-QUERY-fSearchProductType}
  VIEW wWin.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE exitObject wWin 
PROCEDURE exitObject :
/*------------------------------------------------------------------------------
  Purpose:  Window-specific override of this procedure which destroys 
            its contents and itself.
    Notes:  
------------------------------------------------------------------------------*/

  APPLY "CLOSE":U TO THIS-PROCEDURE.
  RETURN.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE initializeObject wWin 
PROCEDURE initializeObject :
/*------------------------------------------------------------------------------
  Purpose:     Super Override
  Parameters:  
  Notes:       
------------------------------------------------------------------------------*/

  /* Code placed here will execute PRIOR to standard behavior. */

  RUN SUPER.

  /* Code placed here will execute AFTER standard behavior.    */


  /* Shows the home screen when the window is first opened */
  FRAME fHome:MOVE-TO-TOP().

  /* Adds colours from the colour scheme to the colour table */
  DO WITH FRAME {&FRAME-NAME}:
        COLOR-TABLE:NUM-ENTRIES = 50.

        COLOR-TABLE:SET-DYNAMIC(20,TRUE).
        COLOR-TABLE:SET-RGB-VALUE(20,RGB-VALUE(1,22,39)).

        COLOR-TABLE:SET-DYNAMIC(21,TRUE).
        COLOR-TABLE:SET-RGB-VALUE(21,RGB-VALUE(253,255,252)).

        COLOR-TABLE:SET-DYNAMIC(22,TRUE).
        COLOR-TABLE:SET-RGB-VALUE(22,RGB-VALUE(46,196,182)).

        COLOR-TABLE:SET-DYNAMIC(23,TRUE).
        COLOR-TABLE:SET-RGB-VALUE(23,RGB-VALUE(231,29,54)).

        COLOR-TABLE:SET-DYNAMIC(24,TRUE).
        COLOR-TABLE:SET-RGB-VALUE(24,RGB-VALUE(255,159,28)).

        FRAME fHome:BGCOLOR = 20.
  END.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE prFind wWin 
PROCEDURE prFind :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/

    DEFINE OUTPUT PARAMETER lopSuccess AS LOGICAL NO-UNDO.
    DEFINE OUTPUT PARAMETER lopMessage AS CHARACTER NO-UNDO.

    DEFINE VARIABLE lvQuery AS CHARACTER NO-UNDO.
    DEFINE VARIABLE lvGender AS CHARACTER NO-UNDO.

    /* The data selected on the search screens is validated
    and then a query is made and sent to the results screen */

    MAINBLOCK:
    DO WITH FRAME {&FRAME-NAME}:

        CASE pvSearchType:


            /* When the search type is a gender */
            WHEN 1 OR WHEN 2 OR WHEN 3 OR WHEN 4 THEN

            DO WITH FRAME fSearchGender:

                /* Data in search fields is validated, if any are invalid an error
                message is created and the program leaves the validation block */
                VALIDATION:
                DO:
                    IF cbProductType:SCREEN-VALUE = "Product Type" THEN
                    DO:
                        ASSIGN lopMessage = "A Product Type must be selected.".
                        LEAVE VALIDATION.
                    END.

                    IF cbSize:SCREEN-VALUE = "Size" THEN
                    DO:
                        ASSIGN lopMessage = "A Size must be selected.".
                        LEAVE VALIDATION.
                    END.

                    IF cbColour:SCREEN-VALUE = "Colour" THEN
                    DO:
                        ASSIGN lopMessage = "A Colour must be selected.".
                        LEAVE VALIDATION.
                    END.

                    IF DECIMAL(TRIM(fiPriceMin:SCREEN-VALUE, "£")) < 0.01 OR DECIMAL(TRIM(fiPriceMin:SCREEN-VALUE, "£")) > DECIMAL(TRIM(fiPriceMax:SCREEN-VALUE, "£")) THEN
                    DO:
                        ASSIGN lopMessage = "Price Min cannot be less than than £0.01 or greater than Price Max.".
                        LEAVE VALIDATION.
                    END.
                        
                    IF DECIMAL(TRIM(fiPriceMax:SCREEN-VALUE, "£")) > 5000 OR DECIMAL(TRIM(fiPriceMax:SCREEN-VALUE, "£")) < DECIMAL(TRIM(fiPriceMin:SCREEN-VALUE, "£")) THEN
                    DO:
                        ASSIGN lopMessage = "Price Max cannot be greater than £5000 or less than Price Min.".
                        LEAVE VALIDATION.
                    END.

                    IF cbBrand:SCREEN-VALUE = "Brand" THEN
                    DO:
                        ASSIGN lopMessage = "A Brand must be selected.".
                        LEAVE VALIDATION.
                    END.

                    IF cbLocation:SCREEN-VALUE = "Location" THEN
                    DO:
                        ASSIGN lopMessage = "A Location must be selected.".
                        LEAVE VALIDATION.
                    END.

                    ASSIGN lopSuccess = TRUE.
                    
                END. /* VALIDATION */

                /* Return to search screen with error message if validation failed */
                IF NOT lopSuccess THEN
                    LEAVE MAINBLOCK.

                /* Gender to be used in the database query is set */
                IF pvSearchType = 1 THEN
                    lvGender = "Mens".
                ELSE IF pvSearchType = 2 THEN
                    lvGender = "Ladies".
                ELSE IF pvSearchType = 3 THEN
                    lvGender = "Boys".
                ELSE IF pvSearchType = 4 THEN
                    lvGender = "Girls".

                /* Database query to be displayed on the results screen is created */
                lvQuery = 'FOR EACH OurProducts WHERE OurProducts.Gender = "' + lvGender + '" AND OurProducts.ProductType = "' + cbProductType:SCREEN-VALUE
                    + '" AND LOOKUP("' + cbSize:SCREEN-VALUE + '", OurProducts.Size, "/") <> 0 AND OurProducts.Colour = "' + cbColour:SCREEN-VALUE
                    + '" AND OurProducts.Price > ' + REPLACE(TRIM(fiPriceMin:SCREEN-VALUE, "£"), ",", "") + ' OurPoducts.Price < ' + REPLACE(TRIM(fiPriceMax:SCREEN-VALUE, "£"), ",", "")
                    + ' AND OurProducts.Brand = "' + cbBrand:SCREEN-VALUE + '" AND OurProducts.Location = "' + cbLocation:SCREEN-VALUE + '".'.

            END.

            /* When the search type is brand,
            same as above but for the brand search and results screen */
            WHEN 5 THEN

            DO WITH FRAME fSearchBrand:

                VALIDATION:
                DO:
                    IF cbGender2:SCREEN-VALUE = "Gender" THEN
                    DO:
                        ASSIGN lopMessage = "A Gender must be selected.".
                        LEAVE VALIDATION.
                    END.

                    IF cbProductType2:SCREEN-VALUE = "Product Type" THEN
                    DO:
                        ASSIGN lopMessage = "A Product Type must be selected.".
                        LEAVE VALIDATION.
                    END.

                    IF cbSize2:SCREEN-VALUE = "Size" THEN
                    DO:
                        ASSIGN lopMessage = "A Size must be selected.".
                        LEAVE VALIDATION.
                    END.

                    IF cbColour2:SCREEN-VALUE = "Colour" THEN
                    DO:
                        ASSIGN lopMessage = "A Colour must be selected.".
                        LEAVE VALIDATION.
                    END.

                    IF DECIMAL(TRIM(fiPriceMin2:SCREEN-VALUE, "£")) < 0.01 OR DECIMAL(TRIM(fiPriceMin2:SCREEN-VALUE, "£")) > DECIMAL(TRIM(fiPriceMax2:SCREEN-VALUE, "£")) THEN
                    DO:
                        ASSIGN lopMessage = "Price Min cannot be less than than £0.01 or greater than Price Max.".
                        LEAVE VALIDATION.
                    END.
                        
                    IF DECIMAL(TRIM(fiPriceMax2:SCREEN-VALUE, "£")) > 5000 OR DECIMAL(TRIM(fiPriceMax2:SCREEN-VALUE, "£")) < DECIMAL(TRIM(fiPriceMin2:SCREEN-VALUE, "£")) THEN
                    DO:
                        ASSIGN lopMessage = "Price Max cannot be greater than £5000 or less than Price Min.".
                        LEAVE VALIDATION.
                    END.

                    IF cbLocation2:SCREEN-VALUE = "Location" THEN
                    DO:
                        ASSIGN lopMessage = "A Location must be selected.".
                        LEAVE VALIDATION.
                    END.

                    ASSIGN lopSuccess = TRUE.
                    
                END. /* VALIDATION */

                IF NOT lopSuccess THEN
                    LEAVE MAINBLOCK.

                lvQuery = 'FOR EACH OurProducts WHERE OurProducts.Gender = "' + cbGender2:SCREEN-VALUE + '" AND OurProducts.ProductType = "' + cbProductType2:SCREEN-VALUE
                    + '" AND LOOKUP("' + cbSize2:SCREEN-VALUE + '", OurProducts.Size, "/") <> 0 AND OurProducts.Colour = "' + cbColour2:SCREEN-VALUE
                    + '" AND OurProducts.Price > ' + REPLACE(TRIM(fiPriceMin2:SCREEN-VALUE, "£"), ",", "") + ' OurPoducts.Price < ' + REPLACE(TRIM(fiPriceMax2:SCREEN-VALUE, "£"), ",", "")
                    + ' AND OurProducts.Brand = "' + fiSearchBrand:SCREEN-VALUE + '" AND OurProducts.Location = "' + cbLocation2:SCREEN-VALUE + '".'.

            END.

            /* When the search type is product type,
            same as above but for the product type search screen */
            WHEN 6 THEN

            DO WITH FRAME fSearchProductType:

                VALIDATION:
                DO:
                    IF cbGender3:SCREEN-VALUE = "Gender" THEN
                    DO:
                        ASSIGN lopMessage = "A Gender must be selected.".
                        LEAVE VALIDATION.
                    END.

                    IF cbBrand3:SCREEN-VALUE = "Brand" THEN
                    DO:
                        ASSIGN lopMessage = "A Brand must be selected.".
                        LEAVE VALIDATION.
                    END.

                    IF cbSize3:SCREEN-VALUE = "Size" THEN
                    DO:
                        ASSIGN lopMessage = "A Size must be selected.".
                        LEAVE VALIDATION.
                    END.

                    IF cbColour3:SCREEN-VALUE = "Colour" THEN
                    DO:
                        ASSIGN lopMessage = "A Colour must be selected.".
                        LEAVE VALIDATION.
                    END.

                    IF DECIMAL(TRIM(fiPriceMin3:SCREEN-VALUE, "£")) < 0.01 OR DECIMAL(TRIM(fiPriceMin3:SCREEN-VALUE, "£")) > DECIMAL(TRIM(fiPriceMax3:SCREEN-VALUE, "£")) THEN
                    DO:
                        ASSIGN lopMessage = "Price Min cannot be less than than £0.01 or greater than Price Max.".
                        LEAVE VALIDATION.
                    END.
                        
                    IF DECIMAL(TRIM(fiPriceMax3:SCREEN-VALUE, "£")) > 5000 OR DECIMAL(TRIM(fiPriceMax3:SCREEN-VALUE, "£")) < DECIMAL(TRIM(fiPriceMin3:SCREEN-VALUE, "£")) THEN
                    DO:
                        ASSIGN lopMessage = "Price Max cannot be greater than £5000 or less than Price Min.".
                        LEAVE VALIDATION.
                    END.

                    IF cbLocation3:SCREEN-VALUE = "Location" THEN
                    DO:
                        ASSIGN lopMessage = "A Location must be selected.".
                        LEAVE VALIDATION.
                    END.

                    ASSIGN lopSuccess = TRUE.
                    
                END. /* VALIDATION */

                IF NOT lopSuccess THEN
                    LEAVE MAINBLOCK.

                lvQuery = 'FOR EACH OurProducts WHERE OurProducts.Gender = "' + cbGender3:SCREEN-VALUE + '" AND OurProducts.ProductType = "' + fiSearchProductType:SCREEN-VALUE
                    + '" AND LOOKUP("' + cbSize3:SCREEN-VALUE + '", OurProducts.Size, "/") <> 0 AND OurProducts.Colour = "' + cbColour3:SCREEN-VALUE
                    + '" AND OurProducts.Price > ' + REPLACE(TRIM(fiPriceMin3:SCREEN-VALUE, "£"), ",", "") + ' OurPoducts.Price < ' + REPLACE(TRIM(fiPriceMax3:SCREEN-VALUE, "£"), ",", "")
                    + ' AND OurProducts.Brand = "' + cbBrand3:SCREEN-VALUE + '" AND OurProducts.Location = "' + cbLocation3:SCREEN-VALUE + '".'.

            END.

        END CASE.

        /* The completed database query is displayed in the field on the correct results screen,
        the results screen is then displayed */

        IF pvSearchType = 5 THEN
        DO:
            /* The brand name is also displayed and the brand results screen */
            ASSIGN
                edSearchQuery-2:SCREEN-VALUE IN FRAME fResultsBrand = lvQuery
                fiResultsBrand:SCREEN-VALUE IN FRAME fResultsBrand = fiSearchBrand:SCREEN-VALUE IN FRAME fSearchBrand.
            FRAME fResultsBrand:MOVE-TO-TOP().
            FRAME fResults:MOVE-TO-BOTTOM().
            FRAME fSearchBrand:MOVE-TO-BOTTOM().
            FRAME fSearchGender:MOVE-TO-BOTTOM().
            FRAME fSearchProductType:MOVE-TO-BOTTOM().
            FRAME fHome:MOVE-TO-BOTTOM().
        END.
        ELSE
        DO:
            ASSIGN edSearchQuery:SCREEN-VALUE IN FRAME fResults = lvQuery.
            FRAME fResults:MOVE-TO-TOP().
            FRAME fResultsBrand:MOVE-TO-BOTTOM().
            FRAME fSearchBrand:MOVE-TO-BOTTOM().
            FRAME fSearchGender:MOVE-TO-BOTTOM().
            FRAME fSearchProductType:MOVE-TO-BOTTOM().
            FRAME fHome:MOVE-TO-BOTTOM().
        END.


    END. /* MAINBLOCK */

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

