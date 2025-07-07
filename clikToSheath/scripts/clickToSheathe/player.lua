local self = require('openmw.self')
local types = require('openmw.types')
local ui = require('openmw.ui')

local selfObject = self

local function onMouseButtonPress(button)
   local idleStanceActive = types.Actor.getStance(selfObject) == types.Player.STANCE.Nothing
   if idleStanceActive then
      if button == 1 then
         types.Actor.setStance(self, types.Player.STANCE.Weapon)
      end   
   end
end

return {
   engineHandlers = {
      onMouseButtonPress = onMouseButtonPress
   }
}
