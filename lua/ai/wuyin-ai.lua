--步炼师
--不妒
local Y_budu_skill={}
Y_budu_skill.name="Y_budu"
table.insert(sgs.ai_skills,Y_budu_skill)
Y_budu_skill.getTurnUseCard=function(self)
	if self.player:hasUsed("#budum_card") then return nil end
        return sgs.Card_Parse("#budum_card:.:") 
	end
	
sgs.ai_skill_use_func["#budum_card"]=function(card,use,self)
	self:sort(self.friends,"defense")
	for _,friend in ipairs(self.friends) do
	    if not friend:containsTrick("indulgence") then
	        local cards=self.player:getHandcards()
		    for _,card in sgs.qlist(cards) do
			    if not card:inherits("Peach") and not card:inherits("Shit") then
			        use.card=sgs.Card_Parse("#budum_card:"..card:getId()..":")
			        if use.to then 
				        use.to:append(friend) 
				    end
			        return
				end
            end
        end
	end	
end

sgs.ai_skill_discard.Y_budu = function(self, discard_num,optional, include_equip)
	local to_discard = {} 
    local cards = self.player:getCards("he")
	local x = self.player:getCardCount(true)
    local i,j = 0,0
    for _, acard in sgs.qlist(cards) do
		if acard:inherits("Peach") or acard:inherits("Exnihilo") or acard:inherits("Indulgence") or acard:inherits("Dismantlement") then
			i = i +1
		end
	end
	if (x-i) > discard_num then
	    for _, card in sgs.qlist(cards) do
            if not card:inherits("Peach") and not card:inherits("Exnihilo") and not card:inherits("Indulgence") and not card:inherits("Dismantlement") then
			    table.insert(to_discard, card:getId())
				j=j+1
                if j == discard_num then 
                    return to_discard
				end
			end
		end
    end	
end 
sgs.ai_use_value.budum_card = 9
sgs.ai_use_priority.budum_card =4.2
sgs.dynamic_value.benefit.budum_card = true

--马云鹭
--戎装
local Y_rongzhuang_skill = {}
Y_rongzhuang_skill.name="Y_rongzhuang"
table.insert(sgs.ai_skills, Y_rongzhuang_skill)
Y_rongzhuang_skill.getTurnUseCard=function(self)
	local hcards = self.player:getCards("h")
	local ecards = self.player:getCards("e")
	local x = self.player:getEquips():length()
	if x==0 then return nil end
	local slashcard
	for _,hcard in sgs.qlist(hcards) do
		for _,ecard in sgs.qlist(ecards) do
            if ecard:getSuit() == hcard:getSuit() then
                slashcard = hcard 
                local suit = slashcard:getSuitString()
                local number = slashcard:getNumberString()
	            local card_id = slashcard:getEffectiveId()
	            local card_str =("slash:Y_rongzhuang[%s:%s]=%d"):format(suit, number, card_id) 
	            local slash = sgs.Card_Parse(card_str)
                assert(slash)
                return slash			
			end
		end
	end
end

sgs.ai_view_as.Y_rongzhuang = function(card, player, card_place)
	if card_place ~= sgs.Player_Hand then return nil end
	local suit = card:getSuitString()
	local number = card:getNumberString()
	local card_id = card:getEffectiveId() 
	local hcards = player:getCards("h")
	local ecards= player:getCards("e")
	local x = player:getEquips():length()
	if player:getMark("RzMark")==2 then
	    if x > 0 then
		    local i=0
			for _,hcard in sgs.qlist(hcards) do
				for _,ecard in sgs.qlist(ecards) do
				    if ecard:getSuit() == hcard:getSuit() then
					    i=0 break
					end
                    if ecard:getSuit() ~= hcard:getSuit() then
                        i=i+1
				    end	
				end
				if i==x then
	                card=hcard
					return ("jink:Y_rongzhuang[%s:%s]=%d"):format(suit, number, card_id)
				end
			end
			return nil
		else
		    for _,hcard in sgs.qlist(hcards) do
			    card = hcard
			    return ("jink:Y_rongzhuang[%s:%s]=%d"):format(suit, number, card_id)
			end
		end
	elseif player:getMark("RzMark")==1 then 
		if x == 0 then return nil end
		for _,acard in sgs.qlist(hcards) do
			for _,bcard in sgs.qlist(ecards) do
                if bcard:getSuit() == acard:getSuit() then
                    card = acard  
					return ("slash:Y_rongzhuang[%s:%s]=%d"):format(suit, number, card_id)
				end
			end
		end	
	end
end

--冲骑
sgs.ai_skill_invoke.Y_chongqi = function(self, data)
    local effect=data:toSlashEffect()
	return self:isEnemy(effect.to)
end

sgs.Y_mayunlu_keep_value = 
{
    Peach = 6,
    Analeptic = 5.4,
    ExNihilo = 5.9,
	snatch = 5.3,
	EightDiagram = 5.7,
	RenwangShield = 5.8,
	OffensiveHorse = 5.1,
	DefensiveHorse = 5.2,
	Indulgence = 5.6,
	Nullification = 5.5,
	Dismantlement = 5.1,
	Crossbow = 5.0,
	Jink = 4,
    Slash = 4.1,
    ThunderSlash = 4.5,
    FireSlash = 4.9,

}

local Y_wusheng_skill = {}
Y_wusheng_skill.name="Y_wusheng"
table.insert(sgs.ai_skills, Y_wusheng_skill)
Y_wusheng_skill.getTurnUseCard=function(self)
    if self.player:canSlashWithoutCrossbow() or (self.player:getWeapon() and self.player:getWeapon():className() == "Crossbow") then
	    return sgs.Card_Parse("#Y_wusheng_card:.:")
    end		
end

sgs.ai_skill_use_func["#Y_wusheng_card"]=function(card,use,self)
    local cards = self.player:getCards("he")
	cards=sgs.QList2Table(cards)
    self:sortByUseValue(cards,true)
	local i = 0
	local slashcard={}
	self:sort(self.enemies,"defense")
	for _,card in ipairs(cards) do
	    if i==0 then
		    if card:isRed() and self:getUseValue(card)<=sgs.ai_use_value.Slash then
			    table.insert(slashcard, card:getId())
                i=i+1
			end
		elseif i>=1 then					
		    if card:isBlack() --[[and self:getUseValue(card)<=sgs.ai_use_value.Slash]] then
			    table.insert(slashcard, card:getId())
		        i=i+1
			end
		end
		if i~=0 then
            for _,enemy in ipairs(self.enemies) do
                if self.player:distanceTo(enemy) <= ((self.player:getAttackRange())+(i-1)) then
				    if self.player:hasWeapon("qinggang_sword") then
					    use.card=sgs.Card_Parse("#Y_wusheng_card:"..table.concat(slashcard, "+")..":")
			            if use.to then 
				            use.to:append(enemy) 
				        end
			            return
	                elseif not enemy:hasArmorEffect("vine") then
			            use.card=sgs.Card_Parse("#Y_wusheng_card:"..table.concat(slashcard, "+")..":")
			            if use.to then 
				            use.to:append(enemy) 
				        end
			        return
					end
				end
			end
		end
	end
end

sgs.ai_view_as.Y_wusheng = function(card, player, card_place)
	local suit = card:getSuitString()
	local number = card:getNumberString()
	local card_id = card:getEffectiveId()
    if card:isRed() and not card:inherits("Peach") then
		return ("slash:Y_wusheng[%s:%s]=%d"):format(suit, number, card_id)
	end
end

--姜维	
--志继		
sgs.ai_skill_invoke.Y_zhiji = function(self, data)
        return true 
	end
--挑衅	
local Y_tiaoxin_skill={}
Y_tiaoxin_skill.name="Y_tiaoxin"
table.insert(sgs.ai_skills,Y_tiaoxin_skill)
Y_tiaoxin_skill.getTurnUseCard=function(self)
	if self.player:hasUsed("#tiaoxinm_card") then return nil end
	for _,enemy in ipairs(self.enemies) do
	    if enemy:distanceTo(self.player) <= enemy:getAttackRange() then
		    return sgs.Card_Parse("#tiaoxinm_card:.:")
        end			
	end
end
	
sgs.ai_skill_use_func["#tiaoxinm_card"]=function(card,use,self)
	self:sort(self.enemies,"threat")
	for _,enemy in ipairs(self.enemies) do
	    if enemy:distanceTo(self.player) <= enemy:getAttackRange() and
	    (self:getCardsNum("Slash", enemy) == 0 or self:getCardsNum("Jink") > 0 or self:getHp()>=2) and not enemy:isNude() then
	        use.card=sgs.Card_Parse("#tiaoxinm_card:"..card:getId()..":")
		        if use.to then use.to:append(enemy) 
	            end
	        return
		end
	end
end
	
--甘倩
--神智
sgs.ai_skill_invoke.Y_shenzhi = function(self, data)
    local x = self.player:getHp()
	local y = self.player:getHandcardNum()
	local cards = self.player:getCards("h")
	local p,s = 0, 0
	for _,card in sgs.qlist(cards) do
		if card:inherits("Peach") or card:inherits("Exnihilo") or card:inherits("EightDiagram") or card:inherits("RenwangShield") then
			p=p+1
		end
		if card:inherits("Slash") or card:inherits("Jink") or card:inherits("Analeptic") or card:inherits("Weapon") then
		    s=s+1  
		end
	end
	if p>(y-x) then return false end
	if x>=3 then 
	    if s<=x then 
		    local lord = self.room:getLord()
            if self:isFriend(lord) and not sgs.isLordHealthy() and lord:isWounded() then return true 
			else return false end
		end
	end
	for _, friend in ipairs(self.friends) do
	    if friend:isWounded() and p<=(y-x) then    
	        return true
		end 
	end
	return false
end
   
sgs.ai_skill_playerchosen.Y_shenzhi = function(self, targets)
    local lord = self.room:getLord()
    if self:isFriend(lord) and not sgs.isLordHealthy() and lord:isWounded() then return true end
    self:sort(self.friends,"defense"--[["hp"]])
	for _, friend in ipairs(self.friends) do
	    if  friend:isWounded() then 
	        return friend
		end
    end
end

--淑慎
sgs.ai_skill_invoke.Y_shushen = function(self, data)
    for _, friend in ipairs(self.friends) do
	    if friend:getHandcardNum()<friend:getHp() and not (friend:hasSkill("kongcheng") and friend:isKongcheng())then
		    return true
		end
    end	
    for _, enemy in ipairs(self.enemies) do
		if enemy:hasSkill("kongcheng") and enemy:isKongcheng() then
            return true
		end
	end
end

sgs.ai_skill_playerchosen.Y_shushen = function(self, targets)
    self:sort(self.friends,"defense")
	for _, friend in ipairs(self.friends) do
	    if friend:getHandcardNum()<friend:getHp() and not (friend:hasSkill("kongcheng") and friend:isKongcheng())then
		    return friend
		end
    end	
	for _, enemy in ipairs(self.enemies) do
		if enemy:hasSkill("kongcheng") and enemy:isKongcheng() then
            return enemy
		end
	end
end

sgs.ai_skill_invoke.Y_baiyi = function(self, data)
    if self.player:isNude() then return false end
    if (self:getCardsNum("JinK")==1 or self:getCardsNum("Peach")==1) and self.player:getHandcardNum()==1 then return false end
	return true
end

sgs.ai_skill_invoke.Y_baiyier = function(self, data)
	for _, enemy in ipairs(self.enemies) do 
        if not enemy:isNude() then
            return true
		end
	end
	for _, friend in ipairs(self.friends) do
        if friend:containsTrick("indulgence") or friend:containsTrick("supply_shortage") or friend:containsTrick("lightning") then
		    return true
		end
	end
	return false
end

sgs.ai_skill_playerchosen.Y_baiyi = function(self, targets)
	for _, friend in ipairs(self.friends) do
        if friend:containsTrick("indulgence") or friend:containsTrick("supply_shortage") then
            return friend
		end
		if friend:containsTrick("lightning") then
		    for _, enemy in ipairs(self.enemies) do
			    if enemy:hasSkill("guicai") or enemy:hasSkill("guidao") or enemy:hasSkill("guanxing") then				
			        return friend
				end
			end
		end
	end
	self:sort(self.enemies,"defense")
	for _, en in ipairs(self.enemies) do
		if not en:isNude() then
		    return en
		end
	end
end

--周泰
--援救
sgs.ai_skill_invoke.Y_yuanjiuts = function(self, data)
    local x = self.player:getPile("Y_yuanjiuPile"):length()
	local pcards=self.player:getPile("Y_yuanjiuPile")
	local can_peach=true
	if x>0 then 
		for _, acard in sgs.qlist(pcards) do
            for _, bcard in sgs.qlist(pcards) do
		        if acard~=bcard and sgs.Sanguosha:getCard(acard):getNumber()==sgs.Sanguosha:getCard(bcard):getNumber() then
					can_peach = false break
				end
			end
			if can_peach==false then break end
		end
	end
    local cards=self.player:getCards("h")
	local y = self.player:getHandcardNum()
	local fr,en=999,999
	for i=1, 998, 1 do
	    for _, friend in ipairs(self.friends) do
	        if friend:getMark("Y_yjmark")==i then
				fr=i break
		    end
	    end
		if fr==i then break end
	end
	for j=1, 998, 1 do
	    for _, enemy in ipairs(self.enemies) do
	        if enemy:getMark("Y_yjmark")==i then
		        en=j break
		    end
	    end
		if en==j then break end
	end
	if can_peach==true then
	    if fr<en then 
	        if y>0 then
	            for _, card in sgs.qlist(cards) do
	                if card:inherits("Peach") then return false end
		            if card:inherits("Analeptic") and self.player:getMark("Y_yjmark")==fr then return false end
	            end
	        end
	        return true
	    else return false
		end
	elseif can_peach==false then
	    return true
	end
end
			
sgs.ai_skill_cardchosen.Y_yuanjiuts = function(self, who, flags)
    local hcard = self.player:getCards("h")
	local pcard = self.player:getPile("Y_yuanjiuPile")
	local x = self.player:getPile("Y_yuanjiuPile"):length()
	local i=0
    for _, acard in sgs.qlist(hcard) do
		for _, bcard in sgs.qlist(pcard) do
		    local ccard = sgs.Sanguosha:getCard(bcard)
			if ccard:getNumber()~=acard:getNumber() then
				i=i+1
                if i==x then
                    self:setCardFlag(acard:getId(),"pcard")				
					return card_for_Y_yuanjiu(self, who, "pcard")
				end
			end
		end
	end
end

sgs.ai_skill_askforag.Y_yuanjiuts = function(self, card_ids)
    for _, card_id in ipairs(card_ids) do
	    if sgs.Sanguosha:getCard(card_id):inherits("Peach")then
			return card_id
        end 
		if sgs.Sanguosha:getCard(card_id):inherits("Analeptic") and self.player:getHp()==1 then
		    return card_id
		end
    end	
    for i, card_id2 in ipairs(card_ids) do
        for j, card_id3 in ipairs(card_ids) do
            if i ~= j and sgs.Sanguosha:getCard(card_id2):getNumber() == sgs.Sanguosha:getCard(card_id3):getNumber() then
                return card_id2
            end
        end
    end
end

--韩当
--解烦
local Y_jiefan_skill={}
Y_jiefan_skill.name="Y_jiefan"
table.insert(sgs.ai_skills,Y_jiefan_skill)
Y_jiefan_skill.getTurnUseCard=function(self)
    if self.player:hasUsed("#Y_jiefan_card") then return nil end
    return sgs.Card_Parse("#Y_jiefan_card:.:") 
end
    
sgs.ai_skill_use_func["#Y_jiefan_card"]=function(card,use,self)
    use.card=card
    for _, friend in ipairs(self.friends) do
        if friend:containsTrick("indulgence") or friend:containsTrick("supply_shortage") or friend:containsTrick("lightning") then
			if use.to then
                use.to:append(friend)
			end
			return
		end
		if friend:isWounded() then
		    if friend:getArmor() and friend:getArmor():inherits("SilverLion") then
			    if use.to then
                    use.to:append(friend)
				end
			    return
			end
		end
		if friend:hasSkill("xiaoji") or friend:hasSkill("xuanfeng") then
		    if friend:getEquips():length()>0 then
			    if use.to then
                    use.to:append(friend)
				end
			    return
			end
		end
		if (friend:hasSkill("buqu") and friend:getPile("buqu"):length()>0) or (friend:hasSkill("Y_yuanjiu") and friend:getPile("Y_yuanjiuPile"):length()>0) then
		    if use.to then
                use.to:append(friend)
			end
			return
		end
	end
	for _, enemy in ipairs(self.enemies) do
	    if (enemy:hasSkill("quanji") and enemy:getPile("power"):length()>0) or (enemy:hasSkill("tuntian") and enemy:getPile("field"):length()>0 ) then
		    if use.to then
                use.to:append(enemy)
			end
			return
		end
		if enemy:getEquips():length()>0 then
		    if not enemy:hasSkill("xiaoji") and not enemy:hasSkill("xuanfeng") then
	            for _,ecard in sgs.qlist(enemy:getCards("e")) do
		            if ecard:inherits("Armor") or ecard:inherits("DefensiveHorse") or ecard:inherits("Weapon")then
			            if use.to then
                            use.to:append(enemy)
						end
			            return
					end
				end
		    end
		end
	end
	if use.to then
        use.to:append(self.player)
	end
	return
end

--诸葛瑾
--缓释		   
Y_huanshi_skill={}
Y_huanshi_skill.name="Y_huanshi"
table.insert(sgs.ai_skills,Y_huanshi_skill)
Y_huanshi_skill.getTurnUseCard=function(self)
	if self.player:hasUsed("#Y_huanshicard") then return nil end
	if (#self.friends_noself + #self.enemies)<2 then return nil end
	return sgs.Card_Parse("#Y_huanshicard:.:")
end

sgs.ai_skill_use_func["#Y_huanshicard"]=function(card,use,self)
    use.card=card
	if #self.friends_noself>=1 then
	    local friends={}
	    for _,friend in ipairs(self.friends_noself) do
		    if not friend:isNude() then
		        table.insert(friends, friend)
			end
	    end
        if #friends>=2 then
	        if use.to then
			    use.to:append(friends[1])
			    use.to:append(friends[2])
				return
		    end
	    elseif #friends==1 then
	        self:sort(self.enemies,"defense")
		    for _,enemy in ipairs(self.enemies) do
			    if not enemy:isNude() then
				    if use.to then
					    use.to:append(enemy)
					    use.to:append(friends[1])
					    return
					end
				end
			end
		end
	end
	return nil 
end

sgs.ai_skill_choice.Y_huanshi1 = function(self,choices)
    local target=self.room:getCurrent() 
	if self:isFriend(target) then
	    return "Y_Give"
	end
	return "Y_NoGi"
end

sgs.ai_skill_choice.Y_huanshi2 = function(self,choices)
    return "Y_Give"
end


--弘援
sgs.ai_skill_invoke.Y_hongyuan = function(self,data)
    return true
end

sgs.ai_skill_use["@@Y_hongyuan"] = function(self, prompt)
	local targets={}
	for _, friend in ipairs(self.friends) do
		if self.player:inMyAttackRange(friend) then
		    table.insert(targets, friend:objectName())
		end
	end
	return "#Y_hongyuancard:.:->".. table.concat(targets, "+")
end



--陆逊
--神君
local Y_shenjun_skill={}
Y_shenjun_skill.name="Y_shenjun"
table.insert(sgs.ai_skills,Y_shenjun_skill)
Y_shenjun_skill.getTurnUseCard=function(self)
    if not self.player:isWounded() then return nil end
	local x=self.player:getHandcardNum() 
	local y=self.player:getHp()
    if y<0 then y=0 end
	if x<=y then return nil end
	local cards=self.player:getCards("h")
	local pcard={}
	local i=0
	for _,card in sgs.qlist(cards) do
        if not card:inherits("Peach") then
            table.insert(pcard, card:getId())
			i=i+1
		end
	end
	if i<(x-y) then return nil end
	local card_str 
	if (x-y)==1 then
        card_str = ("peach:Y_shenjun[%s:%s]=%d"):format(sgs.Sanguosha:getCard(pcard[1]):getSuitString(),sgs.Sanguosha:getCard(pcard[1]):getNumberString(),pcard[1])
	end
	if (x-y)==2 then
		card_str =("peach:Y_shenjun[%s:%s]=%d+%d"):format("nosuit",0,pcard[1],pcard[2])
	end
	if (x-y)==3 then
		card_str =("peach:Y_shenjun[%s:%s]=%d+%d+%d"):format("nosuit",0,pcard[1],pcard[2],pcard[3])
	end
	if (x-y)==4 then
		card_str =("peach:Y_shenjun[%s:%s]=%d+%d+%d+%d"):format("nosuit",0,pcard[1],pcard[2],pcard[3],pcard[4])
	end
	if (x-y)==5 then
		card_str =("peach:Y_shenjun[%s:%s]=%d+%d+%d+%d+%d"):format("nosuit",0,pcard[1],pcard[2],pcard[3],pcard[4],pcard[5])
	end
	if (x-y)==6 then
		card_str =("peach:Y_shenjun[%s:%s]=%d+%d+%d+%d+%d+%d"):format("nosuit",0,pcard[1],pcard[2],pcard[3],pcard[4],pcard[5],pcard[6])
	end	
	--不知道简便的该怎么写，只好枚举了，7张以上有待添加
	local peach = sgs.Card_Parse(card_str)
    assert(peach)
    return peach
end

sgs.ai_view_as.Y_shenjun = function(card, player, card_place)
    local cards = player:getCards("h")
	local x = player:getHandcardNum()
	local y = player:getHp()
	if y<0 then y=0 end
	if x<=y then return nil end 
	local pcard={}
	local i=0
	for _, card in sgs.qlist(cards) do
        if not card:inherits("Peach") then
			table.insert(pcard, card:getId())
			i=i+1
		end
	end
    if i<(x-y) then return nil end
	if (x-y)==1 then
	    return ("peach:Y_shenjun[%s:%s]=%d"):format(sgs.Sanguosha:getCard(pcard[1]):getSuitString(),sgs.Sanguosha:getCard(pcard[1]):getNumberString(),pcard[1])
	end
	if (x-y)==2 then
		return ("peach:Y_shenjun[%s:%s]=%d+%d"):format("nosuit",0,pcard[1],pcard[2])
	end
	if (x-y)==3 then
		return ("peach:Y_shenjun[%s:%s]=%d+%d+%d"):format("nosuit",0,pcard[1],pcard[2],pcard[3])
	end
	if (x-y)==4 then
		return ("peach:Y_shenjun[%s:%s]=%d+%d+%d+%d"):format("nosuit",0,pcard[1],pcard[2],pcard[3],pcard[4])
	end
	if (x-y)==5 then
		return ("peach:Y_shenjun[%s:%s]=%d+%d+%d+%d+%d"):format("nosuit",0,pcard[1],pcard[2],pcard[3],pcard[4],pcard[5])
	end
	if (x-y)==6 then
		return ("peach:Y_shenjun[%s:%s]=%d+%d+%d+%d+%d+%d"):format("nosuit",0,pcard[1],pcard[2],pcard[3],pcard[4],pcard[5],pcard[6])				
	end
end

--度势
sgs.ai_skill_invoke.Y_dushi= function(self, data)
    for _, fr in ipairs(self.friends) do
	    if fr:getMark("Y_dushi")==1 then
		    if fr:getKingdom()=="wu" then return true 
			else return false
		    end
		end
	end
    return true	
end

sgs.ai_skill_use["@@Y_dushi"] = function(self, prompt)
	local cards = self.player:getCards("he")
	for _, card in sgs.qlist(cards) do
	    if card:inherits("EquipCard") then
			return "#Y_dushi_card:"..card:getId()..":->"
		end
	end
end

