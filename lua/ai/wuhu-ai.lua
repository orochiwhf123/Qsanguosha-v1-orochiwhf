--天将
sgs.ai_skill_invoke.tianjiang = function(self, data)
   local target = data:toPlayer()
	local zj = self.room:findPlayerBySkillName("guidao")
	if zj and self:isEnemy(zj) and self:canRetrial(zj) then
	    return false
	else
		return not self:isFriend(target)
	end
end

--骄兵
sgs.ai_skill_invoke.jiaobing = function(self, data) 
local damage = data:toDamage()
local source = damage.from
if source then
if (self:isFriend(source) and (not source:faceUp())) then
return true end
if ((not self:isFriend(source)) and (source:faceUp())) then
return true end
end
return false
end

--单骑
sgs.ai_skill_invoke.whdanji = true
