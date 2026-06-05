--ÆÕ¾»
--³¬¶È
sgs.ai_skill_invoke.luachd_trs=function(self,data)
	local dying=self.player:getTag("luachd_tmp"):toDying()
	return self:isFriend(dying.who)	
end
--·´Á÷Àë
sgs.ai_skill_invoke.LuaFanLiuLi=function(self,data)
	local effect=data:toCardEffect()
	local to=effect.to
	local slash=effect.card
	if self:isEnemy(to) and not self:slashProhibit(slash,to) then return false end
	if self:slashProhibit(slash,self.player) then return false end
	return true
end