--刘表
--自守
sgs.ai_skill_invoke.Y_zishou = function(self,data)
    local x = self.player:getLostHp()
	local y = self.player:getHp()
	local j,s,p,n= 0,0,0,0
    for _,card in sgs.qlist(self.player:getHandcards()) do
		if card:inherits("Jink") then 
		    j = j + 1
		elseif card:inherits("Slash") then
		    s = s + 1
		elseif card:inherits("Nullification") then
			n = n + 1
		elseif card:inherits("Peach") then
			p = p + 1
		end
	end
	if x>=2 then return true
	elseif x==1 then
	    if s>0 and self.player:canSlash() then
		    if y>=(j+s+n) then 
			    return true 
			end
        elseif y>(j+s+n) then 
		    return true
        end			
    elseif x<1 then
		if s>0 and self.player:canSlash() then
			if (y-(j+s+n+p))>=2 then 
			    return true 
			end
		elseif (y-(j+s+n+p))>2 then 
		    return true
		end
	end
	return false
end

--养政
sgs.ai_skill_invoke.Y_yangzheng = function(self, data)
    if #self.friends_noself >0 then
        local x = self.player:getHandcardNum()
		local y = self.player:getHp()
        if x >=y then
            return true
		end
    end
    return false	
end

sgs.ai_skill_use["@@Y_yangzheng"] = function(self, prompt)
    if self.player:getMark("Y_yzRec")==1 then return nil end
	local cards = self.player:getCards("h")
	self:sort(self.friends_noself,"defense")
	for _,friend in ipairs(self.friends_noself) do
		if not friend:containsTrick("indulgence")then
			for _,card in sgs.qlist(cards) do
			    return "#Y_yangzhengcard:"..card:getId()..":->".. friend:objectName()
			end
		end
	end
end
-------------------界关羽-义绝

--	分析：为了能让电脑玩家主动使用这个视为技，依然要对信息表和getTurnUseCard函数进行相应的处理：
local jiexian_yijue_skill = {}
jiexian_yijue_skill.name = "jiexian_yijue"
table.insert(sgs.ai_skills, jiexian_yijue_skill)
jiexian_yijue_skill.getTurnUseCard = function(self, inclusive)
end


jiexian_yijue_skill.getTurnUseCard = function(self, inclusive)
	if not self.player:hasUsed("#jiexian_yijueCard") then
		return sgs.Card_Parse("#jiexian_yijueCard:.:")
	end
end


--	接下来就可以填充卡牌使用结构体use参数了，方法是：
sgs.ai_skill_use_func["#jiexian_yijueCard"] = function(card, use, self)
	local target = nil
	self:sort(self.enemies)
	target = self.enemies[1]
	if target and (not target:isKongcheng()) then
		local card_str = "#jiexian_yijueCard:.:->"..target:objectName()
		local acard = sgs.Card_Parse(card_str)
		assert(acard)
		use.card = acard
		if use.to then
			use.to:append(target)
		end
	end
end
-------------------------------------------------

function sgs.ai_skill_pindian.jiexian_yijue(minusecard, self, requestor)
	if self:isFriend(requestor) then return end
	if (requestor:getHandcardNum() >= 1) then return minusecard end
end

sgs.ai_cardneed.jiexian_yijue = sgs.ai_cardneed.bignumber

sgs.ai_card_intention.jiexian_yijueCard = 50

sgs.dynamic_value.control_card.jiexian_yijueCard = true

sgs.ai_use_value.jiexian_yijueCard = 9.9

sgs.ai_use_priority.jiexian_yijueCard = 9.9

sgs.ai_chaofeng.jiexian_guanyu = 2
--	至此，电脑玩家就可以正确使用技能卡发动技能了。

--	至于为什么在添加卡牌使用目标时，先要判断use.to是否存在，那涉及到了更多AI系统处理机制的问题，
--	简单地说就是，这个表sgs.ai_skill_use_func在AI系统的其他部分也会用到，
--	而use.to只是在具体使用技能卡的这部分内容中存在，为了区别和避免出错，才要有如此写法。

