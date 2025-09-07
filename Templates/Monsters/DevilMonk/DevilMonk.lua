function DevilMonk:OnInitTemplate()
	self:SetAIBrain()
end

function DevilMonk:OnCreateEntity()
	self._fx2 = self:BindFX(self.FX,0.3,'br1',-0.9,0,0)
end



function DevilMonk:CustomUpdate()
	if self._fx2 and not self._gibbed then
		if math.random(100) < 20 and self._AIBrain.Target then
			self._checkSpeed = 30/self.Poison.checkSpeed
			local x,y,z = ENTITY.GetPosition(self._fx2)
			local dist = Dist3D(x,y,z, self._AIBrain.Target._groundx,self._AIBrain.Target._groundy, self._AIBrain.Target._groundz)
			local distLast = 9999
			if self._fx_lastx then
				distLast = Dist3D(self._fx_lastx,self._fx_lasty,self._fx_lastz, self._AIBrain.Target._groundx,self._AIBrain.Target._groundy, self._AIBrain.Target._groundz)
			end
			if dist < self.Poison.Range or distLast < self.Poison.Range then
				if not SOUND2D.IsPlaying(self._AIBrain.Target._oldSND) then
					self._AIBrain.Target._oldSND = PlaySound2D("hero/hero_poison"..math.random(1,3),nil,nil,true)
				end

				self._AIBrain.Target._poisoned = self.Poison.TimeOut
				self._AIBrain.Target._poisonedTime = 0
				self._AIBrain.Target._poison = self.Poison
				self._AIBrain.Target._DrawColorQuad = true
				self._AIBrain.Target._ColorOfQuad = Color:New(255, 10, 10)
				self._AIBrain.Target._QuadAlphaMax = 50
			end

			self._fx_lastx = x
			self._fx_lasty = y
			self._fx_lastz = z
		end
	end
end

DevilMonk.CustomOnDeathUpdate = DevilMonk.CustomUpdate

