local self = require('openmw.self')
local core = require('openmw.core')
local UI = require('openmw.interfaces').UI
local types = require('openmw.types')
local configPlayer = require('scripts.clickToPrepareWeapon.config.player')
local l10n = core.l10n('clickToPrepareWeapon')

local selfObject = self

local function tableContains(table, value)
   for i = 1, #table do
      if table[i] == value then
         return true
      end
   end
   return false
end

local function preparingWeaponIsPossible()
   local currentMode = UI.getMode()   
   return currentMode == nil
end

local function onMouseButtonPress(button)
   local idleStanceActive = types.Actor.getStance(selfObject) == types.Player.STANCE.Nothing
   
   if idleStanceActive and preparingWeaponIsPossible() then
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
