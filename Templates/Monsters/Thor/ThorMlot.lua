function o:OnInitTemplate()
    self:ReplaceFunction("Update", nil)
    self:ReplaceFunction("Synchronize", nil)
end



function ThorMlot:OnCreateEntity()
	--self:PO_Create(BodyTypes.Simple)--FromMesh)	-- "mlot", "mlot1"
	--self:PO_Create(BodyTypes.Simple,0.01, ECollisionGroups.Noncolliding)
	--ENTITY.PO_Enable(self._Entity, false)

	MDL.SetAnim(self._Entity, "idle" ,true)
	MDL.SetBlendAlpha(self._Entity, 0)
	self._HealthMax = self.Health
	self._alpha = 0
end

function o:Tick(delta)
	if self._alpha > 0 then
		self._alpha = self._alpha - delta * self.BlendOutSpeed
		if self._alpha <= 0 then
			self._alpha = 0
			MDL.SetMaterial(self._Entity, "")
		end
		MDL.SetBlendAlpha(self._Entity, self._alpha)
	end
end

function o:OnDamage(damage, owner, attacktype)
	--Game:Print(self._Name.." mlot damage "..damage.." "..self.Health)
	if owner and (owner.Animation == "atak1" or owner.Animation == "atak2") then
		--Game:Print("thor charging, damage canceled")
		return
	end
    if self.Health > 0 then
		MDL.SetMaterial(self._Entity, self.effect)
		self._alpha = 1

        self.Health = self.Health - damage
        if damage > 8 and owner then
			owner._AIBrain._lastHitByEnemyPos = Vector:New(self._AIBrain.Target._groundx,self._AIBrain.Target._groundy,self._AIBrain.Target._groundz)
			owner._AIBrain._lastHitByEnemyTime = owner._AIBrain._currentTime
		end
        if self.Health <= 0 then
			if owner then
				owner._weaponDied = true
			end
        end
    end

end

function o:OnRelease()
	if debugMarek then Game:Print("mlot on release") end
end

function o:RestoreFromSave()
    RemoveObjFromTable(GObjects.UpdateListItems,self)
    RemoveObjFromTable(GObjects.SynchronizeList,self)
end
