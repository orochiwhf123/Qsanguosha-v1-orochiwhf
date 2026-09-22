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

-- 青龙：五虎关羽装备青龙偃月刀后，不主动用其他武器替换
local old_blade_value = sgs.ai_weapon_value.blade

sgs.ai_weapon_value.blade = function(self, enemy)
    -- 只有拥有“青龙”技能的五虎关羽才生效
    if self.player:hasSkill("luaqinglong") then
        -- 无 enemy 参数时是整体评估，返回一个极高的值
        -- 有 enemy 参数时不再额外叠加，避免重复累加
        if not enemy then
            return 10000
        end
        return 0
    end

    -- 其他角色沿用原有评估逻辑
    if old_blade_value then
        return old_blade_value(self, enemy)
    end
    return 0
end

-- 青龙：五虎关羽装备青龙偃月刀后，不主动用其他武器替换
local old_blade_value = sgs.ai_weapon_value.blade

sgs.ai_weapon_value.blade = function(self, enemy)
    if self.player:hasSkill("luaqinglong") then
        if not enemy then
            return 10000
        end
        return 0
    end
    if old_blade_value then
        return old_blade_value(self, enemy)
    end
    return 0
end

-- 调整出牌优先级，确保青龙刀优先装备
local old_getDynamicUsePriority = SmartAI.getDynamicUsePriority

function SmartAI:getDynamicUsePriority(card)
    local value = old_getDynamicUsePriority(self, card)
    if self.player:hasSkill("luaqinglong") then
        -- 青龙刀本身优先级极高
        if card:inherits("Blade") then
            return value + 10000
        end
        -- 如果手牌中有青龙刀，则其他武器优先级降低，避免先装其他武器
        local has_blade = false
        for _, c in sgs.qlist(self.player:getHandcards()) do
            if c:inherits("Blade") then
                has_blade = true
                break
            end
        end
        if has_blade and card:inherits("Weapon") then
            return value - 10000
        end
    end
    return value
end