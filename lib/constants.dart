/// Installs a hook procedure that monitors low-level keyboard input events. For more information, see the LowLevelKeyboardProc hook procedure.
const int WH_KEYBOARD_LL = 13;

/// Installs a hook procedure that monitors low-level mouse input events. For more information, see the LowLevelMouseProc hook procedure.
const int WH_MOUSE_LL = 14;

/// Posted to the window with the keyboard focus when a nonsystem key is pressed. A nonsystem key is a key that is pressed when the ALT key is not pressed.
const int WM_KEYDOWN = 0x0100;

/// The uCode parameter is a virtual-key code and is translated into an unshifted character value in the low order word of the return value. Dead keys (diacritics) are indicated by setting the top bit of the return value. If there is no translation, the function returns 0.
const int MAPVK_VK_TO_CHAR = 2;

/// Copies the source rectangle directly to the destination rectangle.
const int SRCCOPY = 0x00CC0020;

/// A handle to a bitmap (HBITMAP).
const int CF_BITMAP = 2;

/// The coordinates for the left side of the virtual screen. The virtual screen is the bounding rectangle of all display monitors. The SM_CXVIRTUALSCREEN metric is the width of the virtual screen.
const int SM_XVIRTUALSCREEN = 76;

/// The coordinates for the top of the virtual screen. The virtual screen is the bounding rectangle of all display monitors. The SM_CYVIRTUALSCREEN metric is the height of the virtual screen.
const int SM_YVIRTUALSCREEN = 77;

/// The width of the virtual screen, in pixels. The virtual screen is the bounding rectangle of all display monitors. The SM_XVIRTUALSCREEN metric is the coordinates for the left side of the virtual screen.
const int SM_CXVIRTUALSCREEN = 78;

/// The height of the virtual screen, in pixels. The virtual screen is the bounding rectangle of all display monitors. The SM_YVIRTUALSCREEN metric is the coordinates for the top of the virtual screen.
const int SM_CYVIRTUALSCREEN = 79;
