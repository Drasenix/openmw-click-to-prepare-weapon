local self = require('openmw.self')
local core = require('openmw.core')
local types = require('openmw.types')
local ui = require('openmw.ui')
local configPlayer = require('scripts.clickToPrepareWeapon.config.player')
local l10n = core.l10n('clickToPrepareWeapon')

local selfObject = self

local function onMouseButtonPress(button)
   local idleStanceActive = types.Actor.getStance(selfObject) == types.Player.STANCE.Nothing
   local windowOpened = core.isWorldPaused()
   
   
   if idleStanceActive and not windowOpened then
      local clickNameForPreparingWeapon = l10n(configPlayer.options.s_Click)
      local clickIdEquivalent
      if clickNameForPreparingWeapon == "Left" then
         clickIdEquivalent = 1
      elseif clickNameForPreparingWeapon == "Middle" then
         clickIdEquivalent = 2
      elseif clickNameForPreparingWeapon == "Right" then
         clickIdEquivalent = 3
      else
         return
      end
      if button == clickIdEquivalent then
         types.Actor.setStance(self, types.Player.STANCE.Weapon)
      end   
   end
end

return {
   engineHandlers = {
      onMouseButtonPress = onMouseButtonPress
   }
}
