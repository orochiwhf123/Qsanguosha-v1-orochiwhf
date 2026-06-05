--黄承彦
--奇门 随机技能
sgs.ai_skill_choice.luaqm_trs=function(self,choices)
	local choice_table = choices:split("+");
	return choice_table[math.random(1,#choice_table-1)]
end

--马腾
--密诏 仿青囊
local luamzh_trs={}
luamzh_trs.name="luamzh_trs"
table.insert(sgs.ai_skills,luamzh_trs)
luamzh_trs.getTurnUseCard=function(self)
	if self.player:getHandcardNum()<1 then return nil end
	if self.player:hasFlag("luamzh_used") then return nil end	
	local cards = self.player:getHandcards()
	cards=sgs.QList2Table(cards)	
	self:sortByKeepValue(cards)
	local card_str = ("#luamzh_effect:%d:"):format(cards[1]:getId())
	return sgs.Card_Parse(card_str)	
	--for _,friend in ipairs(self.friends) do
		--if friend:isWounded() then return sgs.Card_Parse("#luaja_effect:.:") end
	--end
end
sgs.ai_skill_use_func["#luamzh_effect"]=function(card,use,self)
	self:sort(self.friends,"defense")
	for _,friend in ipairs(self.friends) do
		use.card=card
		if use.to then use.to:append(friend) end
		return
	end
end
sgs.ai_skill_choice.luamzh_trs=function(self,choices)
	return "mzh_choice1"
end

sgs.ai_use_priority["#luamzh_effect"] = 4.2
sgs.ai_card_intention["#luamzh_effect"] = -100
sgs.dynamic_value.benefit["#luamzh_effect"] = true

--潘凤
--骁勇 非友方发动
sgs.ai_skill_invoke.luaxy_trs=function(self,data)
	local damage = data:toDamage()
	return not self:isFriend(damage.to)
end

--司马徽
--水镜 默认对非友方发动
sgs.ai_skill_invoke.luashj_trs=function(self,data)
	if self.player:isKongcheng() then return false end
	local b=false
	for _,p in sgs.qlist(self.room:getAlivePlayers()) do
		if self.player:canSlash(p) and (not self:isFriend(p)) then
			b=true
		end		
	end
	return b
end
sgs.ai_skill_discard.luashj_trs=function(self, discard_num, optional, include_equip)
	return self:askForDiscard("gamerule", 1,false,false)
end
sgs.ai_skill_playerchosen.luashj_trs=function(self,targets)
	local ps=sgs.QList2Table(targets)
	self:sort(ps,"threat")
	for var=1,#ps,1 do
		if not self:isFriend(ps[var]) then return ps[var] end
	end
end

--举贤 随机发动
sgs.ai_skill_invoke.luajx_trs=function(self,data)
	if #self.friends==1 then return false end
	return (math.random(1,2)==1) 
end
sgs.ai_skill_playerchosen.luajx_trs=function(self,targets)
	self:sort(self.friends_noself,"defense")
	return self.friends_noself[1]
end
--木鹿大王
--驭兽
local luaysh_trs={}
luaysh_trs.name="luaysh_trs"
table.insert(sgs.ai_skills,luaysh_trs)
luaysh_trs.getTurnUseCard=function(self)
	if self.player:getHandcardNum()<2 then return nil end
	--local cards = self.player:getHandcards()
	local b1=false
	local b2=false
	local clublist={}
	local spadelist={}
	for _,cd in sgs.qlist(self.player:getHandcards()) do
		if cd:getSuit()==sgs.Card_Club then
			table.insert(clublist,cd)
		elseif cd:getSuit()==sgs.Card_Spade then
			table.insert(spadelist,cd)
		end		
	end
	b1=(#clublist>1)
	b2=(#spadelist>1)
	if not b1 and not b2 then return nil end	
	
	local cd1=nil
	local cd2=nil
	if b1 and b2 then
		if math.random(1,2)==1 then
			self:sortByKeepValue(clublist)
			cd1=clublist[1]
			cd2=clublist[2]
		else
			self:sortByKeepValue(spadelist)
			cd1=spadelist[1]
			cd2=spadelist[2]
		end
	elseif b1 then
		self:sortByKeepValue(clublist)
		cd1=clublist[1]
		cd2=clublist[2]
	else
		self:sortByKeepValue(spadelist)
		cd1=spadelist[1]
		cd2=spadelist[2]
	end
	--self:sortByKeepValue(cards)
	local card_str = ("savage_assault:luaysh_vs[%s:-]=%d+%d"):format(cd1:getSuitString(),cd1:getId(),cd2:getId())
	return sgs.Card_Parse(card_str)	
	--for _,friend in ipairs(self.friends) do
		--if friend:isWounded() then return sgs.Card_Parse("#luaja_effect:.:") end
	--end
end

--妖术
sgs.ai_skill_invoke.luayaoshu_trs=function(self,data)
	local damage=data:toDamage()
	return true
end
sgs.ai_skill_askforag.luayaoshu_trs=function(self,card_ids)
	local cds={}
	for var=1,#card_ids,1 do
		table.insert(cds,sgs.Sanguosha:getCard(card_ids[var]))
	end
	self:sortByUseValue(cds,true)
	return cds[1]:getId()
end
sgs.ai_skill_playerchosen.luayaoshu_trs=function(self,targets)
	self:sort(self.enemies,"threat")
	return self.enemies[1]
end
--余音
sgs.ai_skill_invoke.luayuyin=function(self,data)
	return #self.friends-1>=data:toInt()--有队友
end
sgs.ai_skill_playerchosen.luayuyin=function(self,targets)
	for _,player in sgs.qlist(targets) do
		if self:isFriend(player) then return player end--最早行动的队友
	end
end
--老骥
local LuaLaoJi_skill={}
LuaLaoJi_skill.name="LuaLaoJi"
table.insert(sgs.ai_skills,LuaLaoJi_skill)
LuaLaoJi_skill.getTurnUseCard=function(self,inclusive)
	if self.player:isKongcheng() then return nil end
	local cards=sgs.QList2Table(self.player:getCards("h"))
	self:sortByUseValue(cards,true)
	if #cards<=self.player:getHp() then return nil end
	local scard=cards[1]
	local card=sgs.Card_Parse("#LuaLaoJiCard:"..scard:getId()..":")
	return card
end
sgs.ai_skill_use_func["#LuaLaoJiCard"]=function(card,use)
	use.card=card
end
--游离
sgs.ai_skill_invoke.youlis=true
sgs.ai_skill_playerchosen.youlis=function(self,targets)
	local targets=sgs.QList2Table(targets)
	self:sort(targets,"defense")
	if sgs.getDefense(targets[1])>=8 then self:sort(targets,"threat") end
	local hasLion, target
	for _,enemy in ipairs(targets) do
		if self:isEnemy(enemy) then
			if not enemy:isNude() then
				if self:getDangerousCard(enemy) then return enemy end
			end
		end
	end
	for _, friend in ipairs(friends) do
		if self:isFriend(enemy) then
			if self:isEquip("SilverLion",friend) and friend:isWounded() and (friend:hasSkill("benghuai") or (friend:getHp()<4 and not friend:hasSkill("longhun"))) then return friend end
		end
	end
	for _,enemy in ipairs(targets) do
		if self:isEnemy(enemy) then
			if not enemy:isNude() then
				if self:getValuableCard(enemy) then return enemy end
			end
		end
	end
	for _,enemy in ipairs(targets) do
		if self:isEnemy(enemy) then
			if not enemy:isNude() and not self:needKongcheng(enemy) and not enemy:hasSkill("kongcheng") then
				if enemy:getHandcardNum()==1 then return enemy end
			end
		end
	end
	for _,enemy in ipairs(targets) do
		if self:isEnemy(enemy) then
			local equips = enemy:getEquips()
			if not enemy:isNude() and not enemy:hasSkill("tuntian") and not (self:hasSkills(sgs.lose_equip_skill,enemy) and enemy:getHandcardNum()==0) and not (enemy:getCards("he"):length() ==1 and self:isEquip("GaleShell",enemy)) and not (enemy:getHandcardNum()==1 and (self:needKongcheng(enemy) or self:hasSkills("kongcheng|lianying",enemy))) then return enemy end
		end
	end
	return self.player
end