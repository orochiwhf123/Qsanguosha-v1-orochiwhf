--雙雄
sgs.ai_skill_invoke.wqshuangxiong = function(self, data)
    return not self:isFriend(data:toPlayer())
end

-- 方天：五霸吕布装备方天画戟后，不主动用其他武器替换
local old_halberd_value = sgs.ai_weapon_value.blade

sgs.ai_weapon_value.halberd = function(self, enemy)
    -- 只有拥有“方天”技能才生效
    if self.player:hasSkill("fangtian") then
        -- 无 enemy 参数时是整体评估，返回一个极高的值
        -- 有 enemy 参数时不再额外叠加，避免重复累加
        if not enemy then
            return 10000
        end
        return 0
    end

    -- 其他角色沿用原有评估逻辑
    if old_halberd_value then
        return old_halberd_value(self, enemy)
    end
    return 0
end



-- 调整出牌优先级，确保方天画戟优先装备
local new_getDynamicUsePriority = SmartAI.getDynamicUsePriority

function SmartAI:getDynamicUsePriority(card)
    local value = new_getDynamicUsePriority(self, card)
    if self.player:hasSkill("fangtian") then
        -- 方天画戟本身优先级极高
        if card:inherits("Halberd") then
            return value + 10000
        end
        -- 如果手牌中有方天画戟，则其他武器优先级降低，避免先装其他武器
        local has_halberd = false
        for _, c in sgs.qlist(self.player:getHandcards()) do
            if c:inherits("Halberd") then
                has_halberd = true
                break
            end
        end
        if has_halberd and card:inherits("Weapon") then
            return value - 10000
        end
    end
    return value
end