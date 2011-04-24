; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "FallingUp"
!define PRODUCT_VERSION "0.0.4b"
!define PRODUCT_PUBLISHER "Erif Software"
!define PRODUCT_WEB_SITE "http://erif.org/code/fallingup/"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\FallingUp.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define PRODUCT_STARTMENU_REGVAL "NSIS:StartMenuDir"

SetCompressor lzma

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Start menu page
var ICONS_GROUP
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "FallingUp"
!define MUI_STARTMENUPAGE_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "${PRODUCT_STARTMENU_REGVAL}"
!insertmacro MUI_PAGE_STARTMENU Application $ICONS_GROUP
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\FallingUp.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; Reserve files
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "FallingUpSetup${PRODUCT_VERSION}.exe"
InstallDir "$PROGRAMFILES\Erif\FallingUp"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Section "MainSection" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite try
  File "FallingUp.exe"
  File "resources\dll\glut32.dll"
  File "resources\dll\OpenAL32.dll"

  SetOutPath "$INSTDIR\resources\images"
  File "resources\images\background.raw"
  File "resources\images\mainscreen.raw"

  SetOutPath "$INSTDIR\resources\images\tiles"
  File "resources\images\tiles\bauble.raw"
  File "resources\images\tiles\gem.raw"
  File "resources\images\tiles\glass.raw"
  File "resources\images\tiles\pencil.raw"
  File "resources\images\tiles\stripes.raw"
  File "resources\images\tiles\swiss.raw"

  SetOutPath "$INSTDIR\resources\sounds"
  File "resources\sounds\beat.wav"
  File "resources\sounds\bert.wav"
  File "resources\sounds\drop.wav"
  File "resources\sounds\gameover.wav"
  File "resources\sounds\highscore.wav"
  File "resources\sounds\keystroke.wav"
  File "resources\sounds\line.wav"
  File "resources\sounds\move.wav"
  File "resources\sounds\ready.wav"
  File "resources\sounds\thunk.wav"
  File "resources\sounds\water.wav"
  File "resources\sounds\welcome.wav"

  SetOutPath "$INSTDIR"

; Shortcuts
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateDirectory "$SMPROGRAMS\$ICONS_GROUP"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\FallingUp.lnk" "$INSTDIR\FallingUp.exe"
  CreateShortCut "$DESKTOP\FallingUp.lnk" "$INSTDIR\FallingUp.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -AdditionalIcons
  SetOutPath $INSTDIR
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Uninstall.lnk" "$INSTDIR\uninst.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\FallingUp.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\FallingUp.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all of its components?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  !insertmacro MUI_STARTMENU_GETFOLDER "Application" $ICONS_GROUP
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"

  Delete "$INSTDIR\resources\sounds\beat.wav"
  Delete "$INSTDIR\resources\sounds\bert.wav"
  Delete "$INSTDIR\resources\sounds\drop.wav"
  Delete "$INSTDIR\resources\sounds\gameover.wav"
  Delete "$INSTDIR\resources\sounds\highscore.wav"
  Delete "$INSTDIR\resources\sounds\keystroke.wav"
  Delete "$INSTDIR\resources\sounds\line.wav"
  Delete "$INSTDIR\resources\sounds\move.wav"
  Delete "$INSTDIR\resources\sounds\ready.wav"
  Delete "$INSTDIR\resources\sounds\thunk.wav"
  Delete "$INSTDIR\resources\sounds\water.wav"
  Delete "$INSTDIR\resources\sounds\welcome.wav"

  Delete "$INSTDIR\resources\images\mainscreen.raw"
  Delete "$INSTDIR\resources\images\background.raw"

  Delete "$INSTDIR\resources\images\tiles\bauble.raw"
  Delete "$INSTDIR\resources\images\tiles\gem.raw"
  Delete "$INSTDIR\resources\images\tiles\glass.raw"
  Delete "$INSTDIR\resources\images\tiles\pencil.raw"
  Delete "$INSTDIR\resources\images\tiles\stripes.raw"
  Delete "$INSTDIR\resources\images\tiles\swiss.raw"

  Delete "$INSTDIR\OpenAL32.dll"
  Delete "$INSTDIR\glut32.dll"
  Delete "$INSTDIR\FallingUp.exe"


  Delete "$SMPROGRAMS\$ICONS_GROUP\Uninstall.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Website.lnk"
  Delete "$DESKTOP\FallingUp.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\FallingUp.lnk"

  RMDir "$SMPROGRAMS\$ICONS_GROUP"
  RMDir "$INSTDIR\resources\images\tiles"
  RMDir "$INSTDIR\resources\images"
  RMDir "$INSTDIR\resources"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd
