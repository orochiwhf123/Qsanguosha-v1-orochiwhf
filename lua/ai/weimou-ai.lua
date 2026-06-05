--刚戾
sgs.ai_skill_invoke.gangshang = function(self, data) 
local damage = data:toDamage()
local source = damage.from
if source then
return not self:isFriend(source)
end
return false
end

--王佐
sgs.ai_skill_invoke.thshenzhou = true
sgs.ai_skill_playerchosen.thshenzhou = function(self, targets)
	for _,p in sgs.qlist(targets) do
			if self:isFriend(p) then
				return p
			end
			end
	return targets:first()
end

