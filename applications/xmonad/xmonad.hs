import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
import XMonad.Util.EZConfig(additionalKeysP)
import XMonad.Actions.Navigation2D
import XMonad.Layout.Spacing
import XMonad.Hooks.ManageHelpers
import qualified XMonad.StackSet as W
import XMonad.Actions.CycleWS

myTerm :: String
myTerm = "alacritty"

-- The main function.
main:: IO () -- {{{1
main = (=<<) xmonad $ statusBar myBar myPP toggleStrutsKey $ withNavigation2DConfig myNavigation2DConfig $ fullscreenFix $ desktopConfig
        { terminal    = myTerm
        , modMask     = mod4Mask
        , borderWidth = 0
        , manageHook = myManageHooks <+> manageDocks <+> manageHook desktopConfig
        , layoutHook =  spacingRaw True (Border 10 10 10 10) True (Border 10 10 10 10) True $ avoidStruts $ layoutHook desktopConfig
        -- , startupHook = myStartupHook
        , handleEventHook = handleEventHook desktopConfig <+> fullscreenEventHook
        , focusFollowsMouse = False
        } `additionalKeysP` myKeys
-- }}}1

myWorkspaces :: [String]
myWorkspaces = ["1","2","3","4","5","6","7","8","9"]

myKeys :: [(String, X ())] -- {{{1
myKeys = [ ("M-h", windowGo L False)
         , ("M-l", windowGo R False)
         , ("M-j", windowGo D False)
         , ("M-k", windowGo U False)
         , ("M-S-h", windowSwap L False)
         , ("M-S-l", windowSwap R False)
         , ("M-S-j", windowSwap D False)
         , ("M-S-k", windowSwap U False)
         , ("M-m", do -- go borderless!
             sendMessage ToggleStruts
             toggleWindowSpacingEnabled
             toggleScreenSpacingEnabled
           )
         , ("M-<Return>", spawn myTerm)
         , ("M-e", spawn "emacsclient -nc")
         , ("M-f", spawn "launch firefox-developer-edition")
         , ("M-n", windows W.focusDown)
         , ("M-p", windows W.focusUp  )
         , ("M--", sendMessage Shrink) -- %! Shrink the master area
         , ("M-=", sendMessage Expand) -- %! Expand the master area
         , ("M-.", sendMessage (IncMasterN 1)) -- %! Increment the number of windows in the master area
         , ("M-,", sendMessage (IncMasterN (-1))) -- %! Deincrement the number of windows in the master area
         , ("M-v", windows W.focusMaster)
         , ("M-S-v", windows W.swapMaster)
         , ("M-C-n", nextScreen)
         , ("M-C-p", prevScreen)
         ] ++
             [ (otherModMasks ++ "M-" ++ [key], action tag)
           | (tag, key) <- zip myWorkspaces "123456789"
             , (otherModMasks, action) <- [ ("", windows . W.view)
                                          , ("S-", windows . W.shift) ]
             ]
        -- }}}1

-- come from https://github.com/mpv-player/mpv/issues/888#issuecomment-53065149
fullscreenFix :: XConfig a -> XConfig a -- {{{1
fullscreenFix c = c {
                      startupHook = startupHook c +++ setSupportedWithFullscreen
                    }
                  where x +++ y = mappend x y

setSupportedWithFullscreen :: X ()
setSupportedWithFullscreen = withDisplay $ \dpy -> do
    r <- asks theRoot
    a <- getAtom "_NET_SUPPORTED"
    c <- getAtom "ATOM"
    supp <- mapM getAtom ["_NET_WM_STATE_HIDDEN"
                         ,"_NET_WM_STATE_FULLSCREEN"
                         ,"_NET_NUMBER_OF_DESKTOPS"
                         ,"_NET_CLIENT_LIST"
                         ,"_NET_CLIENT_LIST_STACKING"
                         ,"_NET_CURRENT_DESKTOP"
                         ,"_NET_DESKTOP_NAMES"
                         ,"_NET_ACTIVE_WINDOW"
                         ,"_NET_WM_DESKTOP"
                         ,"_NET_WM_STRUT"
                         ]
    io $ changeProperty32 dpy r a c propModeReplace (fmap fromIntegral supp)

    setWMName "xmonad"

-- }}}1

-- myStartupHook :: X ()
-- myStartupHook = do
--     return ()

-- xmobar config {{{1
myBar :: String
myBar = "xmobar -w xmobar ~/.config/xmobar/xmobarrc"


myPP :: PP
myPP = xmobarPP
            { ppHidden = xmobarColor "#bdae93" "" --tag color
            , ppCurrent = xmobarColor "#fabd2f" "" . wrap "{" "}"
            , ppTitle = xmobarColor "#ebdbb2" "" . shorten 100 --window title color
            }

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
-- }}}1

-- 2d direction-based navigation config
myNavigation2DConfig :: Navigation2DConfig -- {{{1
myNavigation2DConfig = def
    { defaultTiledNavigation = sideNavigation
    , layoutNavigation = [("Full", centerNavigation)] }
-- }}}1

-- new Window callbacks {{{1
myManageHooks = composeAll [ title =? "Helm" --> doCenterFloat
                           ]
-- }}}1

-- vim: foldenable:foldmethod=marker
