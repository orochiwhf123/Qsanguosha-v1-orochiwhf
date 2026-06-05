--关凤
----巾帼
sgs.ai_filterskill_filter.luajg_fts=function(card,card_place)
	local suit=card:getSuitString()
	local number=card:getNumberString()
	local card_id=card:getEffectiveId()
	if card:inherits("Slash") and card:isRed() then return ("duel:luajg_fts[%s:%s]=%d"):format(suit,number,card_id) end
end
local luajg_fts={}
luajg_fts.name="luajg_fts"
table.insert(sgs.ai_skills,luajg_fts)
luajg_fts.getTurnUseCard=function(self)
	local mark=self.player:getMark("luajg_fts")
	local cards=self.player:getCards("h")
	cards=sgs.QList2Table(cards)
	local card
	self:sortByUseValue(cards,true)
	for _,acard in ipairs(cards) do
		if acard:inherits("Slash") and acard:isRed() then
			card=acard
			break
		end
	end
	if not card then return nil end
	local suit=card:getSuitString()
	local number=card:getNumberString()
	local card_id=card:getEffectiveId()
	local card_str=("duel:luajg_fts[%s:%s]=%d"):format(suit,number,card_id)
	local skillcard=sgs.Card_Parse(card_str)
	assert(skillcard)
	return skillcard
end

local luajg_trs={name="luajg_trs"}
table.insert(sgs.ai_skills,luajg_trs)
luajg_trs.getTurnUseCard=function(self)
	local cards = self.player:getCards("h")
	cards=sgs.QList2Table(cards)
	local card
	self:sortByUseValue(cards,true)
	for _,acard in ipairs(cards)  do
		if acard:inherits("Slash") and acard:isRed() then
			card = acard
			break
		end
	end
	if not card then return nil end
	local suit=card:getSuitString()
	local number = card:getNumberString()
	local card_id = card:getEffectiveId()
	local card_str = ("duel:luajg_vs[%s:%s]=%d"):format(suit,number, card_id)
	local skillcard = sgs.Card_Parse(card_str)
	assert(skillcard)
	return skillcard	
end

----银屏
sgs.ai_skill_invoke.luayp_trs=true
--张星彩
----甚贤
sgs.ai_skill_invoke.luashx_trs=function(self,data)
	return #self.friends>1
end
sgs.ai_skill_playerchosen.luashx_trs=function(self,targets)
	for _,player in sgs.qlist(targets) do
		if self:isFriend(player) then return player end
	end
end
----敬哀
local luaja_vs={}
luaja_vs.name="luaja_vs"
table.insert(sgs.ai_skills,luaja_vs)
luaja_vs.getTurnUseCard=function(self)
	if self.player:hasFlag("luaja_used") then return nil end
	for _,friend in ipairs(self.friends) do
		if friend:isWounded() then return sgs.Card_Parse("#luaja_effect:.:") end
	end
end
sgs.ai_skill_use_func["#luaja_effect"]=function(card,use,self)
	self:sort(self.friends,"defense")
	for _,friend in ipairs(self.friends) do
		if friend:isWounded() then
			cards=self.player:getHandcards()
			for _,card in sgs.qlist(cards) do
				if card:getSuit()==sgs.Card_Heart and card:getTypeId()==sgs.Card_Trick then
					use.card=sgs.Card_Parse("#luaja_effect:"..card:getId()..":")
					if use.to then use.to:append(friend) end
					return
				end
			end
			if self.player:getHp()>=3 then
				use.card=card
				if use.to then use.to:append(friend) end
				return
			end
		end
	end
end
--吕玲绮
----疾驰
sgs.ai_skill_invoke.luajch_trs=function(self,data)
	if self.player:containsTrick("indulgence") then return true end
	if self.player:getHandcardNum()+1>self.player:getHp() then return true end
	if not self:getCard("Slash") then return false end
	for _,enemy in ipairs(self.enemies) do
		if self.player:canSlash(enemy,true) then return true end
	end
	return false
end
----虎女
sgs.ai_skill_playerchosen.luahn_trs=function(self,targets)
	for _,player in sgs.qlist(targets) do
		if self:isEnemy(player) then return player end
	end
end
--王元姬
----花卜（修改guanxing-ai，见尾部）--add by sunny
function SmartAI:huabu(self,cards)
	local function huabusuit(cdfor,reason)--没有办法解决八卦阵的问题，因为guanxing函数缺少data
		if reason=="indulgence" then return cdfor:getSuit()==sgs.Card_Heart end
		if reason=="supply_shortage" then return cdfor:getSuit()==sgs.Card_Club end
		if reason=="lightning" then return cdfor:getSuit()~=sgs.Card_Spade or cdfor:getNumber()<2 or cdfor:getNumber()>9 end
		if reason=="eight_diagram" then return cdfor:isRed() end
		return false
	end
	local judge=self.player:getTag("huabu"):toJudge()
	judge.who:speak(judge.reason)
	local room=self.player:getRoom()
	local cdup={}
	local cddown={}
	for _,for_judge in ipairs(cards) do
		self.player:speak(sgs.Sanguosha:getCard(for_judge):getSuitString())
		--b=huabusuit(sgs.Sanguosha:getCard(for_judge),judge.reason)--使第一张判定得到解决，待完善
		b=judge:isGood(sgs.Sanguosha:getCard(for_judge))		
		if self:isEnemy(judge.who) then b=not b	end
		if b then self.player:speak("true") else self.player:speak("false") end
		if b then
			table.insert(cdup,for_judge)
			self.player:speak("up")
		else
			table.insert(cddown,for_judge)
			self.player:speak("down")
		end
	end
	return cdup,cddown
end

--中闱
sgs.ai_skill_invoke.luazhw_trs=true

--马云禄
----戎装 默认发动 弃牌同寒冰
sgs.ai_skill_invoke.luarzh_trs=true--[[function(self,data)
	local effect=data:toSlashEffect()
	local to=effect.to
	local room=self.player:getRoom()
	room:setPlayerFlag(self.player,"-rongzhuangblack")
	if to:getCards("h"):length()>=3 then return true end
	if to:getArmor() and to:getArmor():inherits("EightDiagram") then return true end
	local function black(self,to)
		if self.player:hasFlag("drank") then return false end
		if self:isFriend(to) then
			if self:isWeak(to) then
				return true
			else
				if to:getLostHp()<1 then return false end
				return true
			end
		else
			if self:isWeak(to) then return false end
			if to:getArmor() and self:evaluateArmor(to:getArmor(),to)>3 then return true end
			if to:getCards("he"):length()<4 and to:getCards("he"):length()>1 then return true end
			return false
		end
	end
	if black(self,to) then
		room:setPlayerFlag(self.player,"rongzhuangblack")
		return true
	end
	return false
end
sgs.ai_skill_choice.luarzh_trs=function(self,choices,data)
	if self.player:hasFlag("rongzhuangblack") then
		return "rzh_choice1"
	else
		return "rzh_choice2"
	end
end]]
sgs.ai_skill_choice.luarzh_trs=function(self,choices)
	if sgs.ai_skill_invoke.ice_sword(self,self.player:getTag("luarzh_slasheffect")) then
		return "rzh_choice1"
	else
		return "rzh_choice2"
	end
end
--sgs.ai_skill_cardchosen.luarzh_trs=function(self,who,flags)
	--self.player:speak("cdchosen")
	--return sgs.Sanguosha:getCard(self:askForCardChosen(who,flags,"luarzh_trs"))
--end



----良姻
sgs.ai_skill_invoke.lualy_trs=function(self,data)
	if self.player:getRole()=="rebel" then
		if self.room:getLord():getKingdom()=="qun" then return true end
	end
	if self.player:getRole()=="renegade" then return true end
	if self.player:getRole()=="loyalist" then
		if self.room:getLord():getKingdom()=="shu" then return true end
		if self.room:getLord():getKingdom()=="qun" then return false end
	end
	return false
end
--夏侯懋
--治生
local luazhsh_vs={}
luazhsh_vs.name="luazhsh_vs"
table.insert(sgs.ai_skills,luazhsh_vs)
luazhsh_vs.getTurnUseCard=function(self)
	if self.player:hasFlag("luazhsh_used") then return nil end
	if self.player:getHandcardNum()<2 then return nil end
	if #self.friends==1 then return nil end
	
	local cards = self.player:getHandcards()
	cards=sgs.QList2Table(cards)	
	self:sortByKeepValue(cards)
	local card_str = ("#luazhsh_effect:%d+%d:"):format(cards[1]:getId(),cards[2]:getId())
	return sgs.Card_Parse(card_str)
	--for _,friend in ipairs(self.friends) do
		--if friend:isWounded() then return sgs.Card_Parse("#luaja_effect:.:") end
	--end
end
sgs.ai_skill_use_func["#luazhsh_effect"]=function(card,use,self)
	self:sort(self.friends_noself,"defense")
	for _,friend in ipairs(self.friends_noself) do
		use.card=card
		if use.to then use.to:append(friend) end
		return
	end
end
sgs.ai_skill_invoke.luazhsh_vs=true

--蓄伎
--[[sgs.ai_skill_cardask["@@luaxj_trs"]=function(self,prompt)
	local all_cards=self.player:getCards("h")
	local cards={}
	for _,card in sgs.qlist(all_cards) do
		if card:getSuit()~=sgs.Card_Heart then
			table.insert(cards,card)
		end
	end
	self:sortByUseValue(cards,true)
	return "#luaxj_effect:"..cards[1]:getId()..":"
end]]--
sgs.ai_skill_cardask["@luaxj_trs"]=function(self)
	--local judge = self.player:getTag("Judge"):toJudge()
	--if self:needRetrial(judge) then
		--local cards = sgs.QList2Table(self.player:getHandcards())
		--local card_id = self:getRetrialCardId(cards, judge)
		--if card_id ~= -1 then
			--return "@GuicaiCard=" .. card_id
		--end
	--end
	--return "."	
	local all_cards=self.player:getCards("h")
	local cards={}
	for _,card in sgs.qlist(all_cards) do
		if card:getSuit()~=sgs.Card_Heart then
			table.insert(cards,card)
		end
	end
	self:sortByUseValue(cards,true)
	local card_id=cards[1]:getId()
	return card_id	
end

--蔡瑁张允
--枉死水师无
--列阵 修改smart-ai hastrickeffective aoeiseffective 效果不明

--曹姬
--浸润 优先友方翻面
sgs.ai_skill_invoke.luajr_trs=function(self,data)
	self:sort(self.friends, "defense")
	self:sort(self.friends_noself,"defense")
	self:sort(self.enemies, "threat")
	for var=1,#self.friends,1 do
		if (not self.friends[var]:faceUp()) and (self.friends[var]:getHandcardNum()>self.friends[var]:getHp()) then
			return true
		end
	end	
	local b1=false
	local b2=false
	for var=1,#self.friends_noself,1 do
		if self.friends_noself[var]:getHandcardNum()<=self.friends_noself[var]:getHp() then
			b1=true
		end
	end
	for var=1,#self.enemies,1 do
		if (self.enemies[var]:getHandcardNum()>self.enemies[var]:getHp()) and (self.enemies[var]:faceUp()) then
			b2=true
		end
	end
	return (b1 or b2)
end

sgs.ai_skill_choice.luajr_trs=function(self,choices)
	self:sort(self.friends,"defense")
	for var=1,#self.friends,1 do
		if (not self.friends[var]:faceUp()) and (self.friends[var]:getHandcardNum()>self.friends[var]:getHp()) then
			return "jr_choice2"
		end
	end	
	
	self:sort(self.friends_noself, "defense")
	self:sort(self.enemies, "threat")
	local b1=false
	local b2=false
	for var=1,#self.friends_noself,1 do
		if self.friends_noself[var]:getHandcardNum()<=self.friends_noself[var]:getHp() then
			b1=true
		end
	end
	for var=1,#self.enemies,1 do
		if (self.enemies[var]:getHandcardNum()>self.enemies[var]:getHp()) and (self.enemies[var]:faceUp()) then
			b2=true
		end
	end
	if (not b1) and (not b2) then return "jr_choice1" end
	if not b1 then return "jr_choice2" end
	if not b2 then return "jr_choice1" end	
	if math.random(1,2)==1 then return "jr_choice1"
	else return "jr_choice2" end
end

sgs.ai_skill_playerchosen.luajr_trs=function(self,targets)
	if self.player:getMark("luajr_tmp")==1 then
		self:sort(self.friends_noself, "defense")
		for var=1,#self.friends_noself,1 do
			if (self.friends_noself[var]:getHandcardNum()<=self.friends_noself[var]:getHp()) then
				return self.friends_noself[var]
			end
		end
	elseif self.player:getMark("luajr_tmp")==2 then
		self:sort(self.friends,"defense")
		for var=1,#self.friends,1 do
			if (not self.friends[var]:faceUp()) and (self.friends[var]:getHandcardNum()>self.friends[var]:getHp()) then
				return self.friends[var]
			end
		end
		self:sort(self.enemies,"threat")
		for var=1,#self.enemies,1 do
			if (self.enemies[var]:getHandcardNum()>self.enemies[var]:getHp()) and (self.enemies[var]:faceUp()) then
				return self.enemies[var]
			end
		end
	end
end

--谮构 转反人头和忠人头
sgs.ai_skill_invoke.luazg_trs=function(self,data)
	local damage=self.player:getTag("luazg_tmp"):toDamage()
	if damage.to:getHp()<=damage.damage then
		if damage.to:getRole()=="rebel" then
			return (damage.from==nil) or (not self:isFriend(damage.from))			
		end
		if damage.to:getRole()=="loyalist" then
			return self:isEnemy(self.room:getLord()) and damage.from and not damage.from:isLord()
		end
	end	
	return false
end
sgs.ai_skill_discard.luazg_trs=function(self, discard_num, optional, include_equip)
	return self:askForDiscard("gamerule", 1,false,true)
end
sgs.ai_skill_playerchosen.luazg_trs=function(self,targets)
	local data=self.player:getTag("luazg_tmp")
	local damage=data:toDamage()
	if damage.to:getRole()=="rebel" then
		self:sort(self.friends,"defense")
		if self.friends[1]:objectName()~=damage.to:objectName() then return self.friends[1]
		elseif #self.friends>1 then return self.friends[2]
		else return self.player
		end			
	end
	if damage.to:getRole()=="loyalist" then
		return self.room:getLord()
	end
	return self.player
end



--赵广
--椒图
sgs.ai_skill_invoke.luajt_trs=function(self,data)
	local pfc=self.room:getOtherPlayers(self.player)
	local pfc_t=self.room:getOtherPlayers(self.player)
	for _,p in sgs.qlist(pfc_t) do
		--if not self.player:canSlash(p) then pfc:removeOne(p) end
        if not self.player:inMyAttackRange(p) then pfc:removeOne(p) end		
	end
	return pfc:length()~=0
end
sgs.ai_skill_playerchosen.luajt_trs=function(self,targets)
	local ps=sgs.QList2Table(targets)
	self:sort(ps,"threat")
	for var=1,#ps,1 do
		if not self:isFriend(ps[var]) then return ps[var] end
	end
end

--诸葛恪
--英才 手牌小于体力一半发动
sgs.ai_skill_invoke.luayc_trs=function(self,data)
	return self.player:getHandcardNum()<(self.player:getHp()/2) 
end

--奇兵
local luaqb_vs={}
luaqb_vs.name="luaqb_vs"
table.insert(sgs.ai_skills,luaqb_vs)
luaqb_vs.getTurnUseCard=function(self)
	if not self.player:canSlashWithoutCrossbow() then return nil end
	if self.player:hasFlag("tianyi_failed") then return nil end
	
	local cards = self.player:getHandcards()
	cards=sgs.QList2Table(cards)	
	self:sortByKeepValue(cards)
	for var=1,#cards,1 do
		if cards[var]:inherits("Slash") and cards[var]:isRed() then
			local card_str = ("#luaqb_effect:%d:"):format(cards[var]:getId())
			return sgs.Card_Parse(card_str)	
		end
	end
	--for _,friend in ipairs(self.friends) do
		--if friend:isWounded() then return sgs.Card_Parse("#luaja_effect:.:") end
	--end
end
sgs.ai_skill_use_func["#luaqb_effect"]=function(card,use,self)
	self:sort(self.enemies,"threat")
	for _,enemy in ipairs(self.enemies) do
		use.card=card
		if use.to then use.to:append(enemy) end
		return
	end
end

--孙鲁班
--诬言
local luawy_vs={}
luawy_vs.name="luawy_vs"
table.insert(sgs.ai_skills,luawy_vs)
luawy_vs.getTurnUseCard=function(self)
	if self.player:hasFlag("luawy_used") then return nil end
	if self.player:isKongcheng() then return nil end
	local max_card = self:getMaxCard()
	local card_str = ("#luawy_effect:%d:"):format(max_card:getId())
	return sgs.Card_Parse(card_str)	
	--for _,friend in ipairs(self.friends) do
		--if friend:isWounded() then return sgs.Card_Parse("#luaja_effect:.:") end
	--end
end
sgs.ai_skill_use_func["#luawy_effect"]=function(card,use,self)
	self:sort(self.enemies,"threat")
	local max_card = self:getMaxCard()
	local max_point = max_card:getNumber()
	
	for _, enemy in ipairs(self.enemies) do
			local enemy_max_card = self:getMaxCard(enemy)
			if enemy_max_card and max_point > enemy_max_card:getNumber() then
				for _, enemy2 in ipairs(self.enemies) do
					if (enemy:objectName() ~= enemy2:objectName()) and enemy:inMyAttackRange(enemy2) then
						if use.to then
							use.to:append(enemy)
						end
						use.card = card
						return
					end
				end
			end		
	end
end
--[[sgs.ai_skill_playerchosen.luawy=function(self,targets)
	if targets:length()==0 then return nil end
	local ts1=sgs.QList2Table(targets)
	local i = 1
	while i <= #ts1 do
		if not self:isEnemy(ts1[i]) then
			table.remove(ts1, i)
		else
			i = i + 1
		end
	end
	if #ts1>0 then
		self:sort(ts1,"threat")
		return ts1[1]
	end
	
	local ts2=sgs.QList2Table(targets)
	local i = 1
	while i <= #ts2 do
		if self:isFriend(ts2[i]) then
			table.remove(ts2, i)
		else
			i = i + 1
		end
	end
	if #ts2>0 then
		self:sort(ts2,"threat")
		return ts2[1]
	end
end]]--
sgs.ai_skill_playerchosen.luawy = sgs.ai_skill_playerchosen.damage
sgs.ai_skill_discard.luawy=sgs.ai_skill_discard.ganglie

--私通
local luast_vs={}
luast_vs.name="luast_vs"
table.insert(sgs.ai_skills,luast_vs)
luast_vs.getTurnUseCard=function(self)
	if self.player:hasFlag("luast_used") then return nil end
	--if self.player:isKongcheng() then return nil end
	--local max_card = self:getMaxCard()
	local card_str = ("#luast_effect:.:")
	return sgs.Card_Parse(card_str)	
	--for _,friend in ipairs(self.friends) do
		--if friend:isWounded() then return sgs.Card_Parse("#luaja_effect:.:") end
	--end
end
sgs.ai_skill_use_func["#luast_effect"]=function(card,use,self)
	self:sort(self.enemies,"threat")	
	local x=self.player:getLostHp()
	local diff=0	
	for var=1,#self.enemies,1 do
		diff=self.enemies[var]:getHandcardNum()-self.player:getHandcardNum()
		if (diff>0) and (diff<=x) and ((self.player:getGeneral():isMale() and self.enemies[var]:getGeneral():isFemale()) or (self.player:getGeneral():isFemale() and self.enemies[var]:getGeneral():isMale())) then
			use.card=card
			if use.to then use.to:append(self.enemies[var]) end
			return
		end
	end
end






--太史昭容
--天娇
sgs.ai_skill_invoke.luatj_trs=function(self,data)
	self.player:speak("invoke")
	self:sort(self.enemies,"threat")
	
	local cards = sgs.QList2Table(self.player:getHandcards())
	local compare_func = function(a, b)
		return a:getNumber() < b:getNumber()
	end
	table.sort(cards, compare_func)
	local maxcard, mincard, minusecard
	for _, card in ipairs(cards) do
		if self:getUseValue(card) < 6 then mincard = card break end
	end
	for _, card in ipairs(sgs.reverse(cards)) do
		if self:getUseValue(card) < 6 then maxcard = card break end
	end
	self:sortByUseValue(cards, true)
	minusecard = cards[1]
	maxcard = maxcard or minusecard
	mincard = mincard or minusecard	--copied from smart-ai
	
	
	local b=false
	for var=1,#self.enemies,1 do
		self.enemies[var]:speak(self.enemies[var]:objectName())
		if (not self.enemies[var]:isKongcheng()) and (self:getMaxCard(self.enemies[var]):getNumber()<maxcard:getNumber()) then
			b=true
			self.enemies[var]:speak("invoke_true")
		end						
	end
	return b
end
sgs.ai_skill_playerchosen.luatj_trs=function(self,targets)
	local cards = sgs.QList2Table(self.player:getHandcards())
	local compare_func = function(a, b)
		return a:getNumber() < b:getNumber()
	end
	table.sort(cards, compare_func)
	local maxcard, mincard, minusecard
	for _, card in ipairs(cards) do
		if self:getUseValue(card) < 6 then mincard = card break end
	end
	for _, card in ipairs(sgs.reverse(cards)) do
		if self:getUseValue(card) < 6 then maxcard = card break end
	end
	self:sortByUseValue(cards, true)
	minusecard = cards[1]
	maxcard = maxcard or minusecard
	mincard = mincard or minusecard --copied from smart-ai	
	local ps={}
	local ps_t=sgs.QList2Table(targets)
	for var=1,#ps_t,1 do
		if (not ps_t[var]:isKongcheng()) and (self:isEnemy(ps_t[var])) then table.insert(ps,ps_t[var]) end
	end
	self:sort(ps,"threat")
	for var=1,#ps,1 do
		if self:getMaxCard(ps[var]):getNumber()<maxcard:getNumber() then return ps[var] end
	end
	return targets:at(0)
end

--文鸯
--神弓

--文鸳
--比翼
sgs.ai_skill_invoke.luaby_trs=function(self,data)
	local b=false
	for _,p in sgs.qlist(self.room:getOtherPlayers(self.player)) do
		if p:getGeneral():isMale() and self:isFriend(p) then b=true end				
	end
	return b
end
sgs.ai_skill_playerchosen.luaby_trs=function(self,targets)
	self:sort(self.friends_noself,"defense")
	for var=1,#self.friends_noself,1 do
		if self.friends_noself[var]:getGeneral():isMale() then return self.friends_noself[var] end
	end
end

local luaby_slash_vs={name="luaby_slash_vs"}
table.insert(sgs.ai_skills, luaby_slash_vs)
luaby_slash_vs.getTurnUseCard = function(self)
	--local slash = sgs.Sanguosha:cloneCard("slash", sgs.Card_NoSuit, 0)
	
	if (self.player:getMark("@luaby_biyi")>0) and self.player:canSlashWithoutCrossbow() and not self.player:hasFlag("tianyi_failed") then

	return sgs.Card_Parse("#luaby_slash_effect:.:") end
end

sgs.ai_skill_use_func["#luaby_slash_effect"] = function(card, use, self)
	if self.player:hasUsed("#luaby_slash_effect") then return end
	--local slash = sgs.Sanguosha:cloneCard("slash", sgs.Card_NoSuit, 0)
	--self:useBasicCard(slash, use)
	--if use.card then use.card = card end
	local plist=self.room:getAlivePlayers()
	for _,p in sgs.qlist(self.room:getAlivePlayers()) do
		if not self.player:canSlash(p) then plist:removeOne(p) end				
	end
	if use.to then use.to:append(sgs.ai_skill_playerchosen.zero_card_as_slash(self,plist)) end
	use.card=card
	return
end

sgs.ai_use_value["#luaby_slash_effect"] = 8.5
sgs.ai_use_priority["#luaby_slash_effect"] = 2.65

--羊祜
--博学
sgs.ai_skill_invoke.luabx_trs=function(self,data)
	return self:isWeak() or self.player:getHandcardNum()<self.player:getHp() or self.player:getPile("field"):length()> self.room:getAlivePlayers():length()/2
end

--卑弥呼
--妖惑
local luayaohuo_trs={}
luayaohuo_trs.name="luayaohuo_trs"
table.insert(sgs.ai_skills,luayaohuo_trs)
luayaohuo_trs.getTurnUseCard=function(self)
	if self.player:hasFlag("luayaohuo_used") then return end
	local cards = self.player:getCards("h")
	cards=sgs.QList2Table(cards)
	local card
	self:sortByUseValue(cards,true)
	for _,acard in ipairs(cards)  do
		if (acard:getSuit() == sgs.Card_Club) then
			card = acard
			break
		end
	end
	if not card then return nil end
	local card_id = card:getEffectiveId()
	local card_str = ("#luayaohuo_trs:%d:"):format(card_id)
	return sgs.Card_Parse(card_str)
end
sgs.ai_skill_use_func["#luayaohuo_trs"] = function(card, use, self)
	--local slash = sgs.Sanguosha:cloneCard("slash", sgs.Card_NoSuit, 0)
	--self:useBasicCard(slash, use)
	--if use.card then use.card = card end
	local plist=self.room:getAlivePlayers()
	for _,p in sgs.qlist(self.room:getAlivePlayers()) do
		if (not p:getGeneral():isMale()) or (self.player:distanceTo(p)>1) or self:isFriend(p) or p:getMark("@luayaohuo_yaohuo")>0 then plist:removeOne(p) end
				
	end
	if plist:isEmpty() then return end
	local ptable=sgs.QList2Table(plist)
	self:sort(ptable,"threat")
	if use.to then use.to:append(ptable[1]) end	
	use.card=card
	return
end
--[[
以下为需要添加到其他文件中的语句

【花卜】
添加到guanxing-ai.lua的函数local function GuanXing(self, cards)开头
if self.player:getTag("huabu") then return SmartAI:huabu(self,cards) end

]]

--姻缘
local LuaYinYuan_skill={}
LuaYinYuan_skill.name="LuaYinYuan"
table.insert(sgs.ai_skills,LuaYinYuan_skill)
LuaYinYuan_skill.getTurnUseCard=function(self,inclusive)
	if not self.player:hasFlag("LuaYinYuanUsed") and not self.player:isKongcheng() then
		local cards=self.player:getCards("h")
		cards=sgs.QList2Table(cards)
		self:sortByUseValue(cards)
		return sgs.Card_Parse("#LuaYinYuanCard:"..cards[1]:getId()..":")
	end
end
sgs.ai_skill_use_func["#LuaYinYuanCard"]=function(card,use,self)
	self:sort(self.enemies,"handcard")
	for _,enemy in ipairs(self.enemies) do
		if enemy:getGeneral():isMale() then
			use.card=card
			if use.to then use.to:append(enemy) end
			return
		end
	end
end
sgs.ai_skill_askforag.LuaYinYuan=function(self,card_ids)
	local cards={}
	for _,card_id in ipairs(card_ids) do
		table.insert(cards,sgs.Sanguosha:getCard(card_id))
	end
	self:sortByUseValue(cards,true)
	local hcards=self.player:getCards("h")
	hcards=sgs.QList2Table(hcards)
	self:sortByUseValue(hcards)
	for var1=1,#cards,1 do
		for var2=1,#hcards,1 do
		self.player:speak(cards[var1]:getId().." "..cards[var1]:getSuit().." "..hcards[var2]:getId().." "..hcards[var2]:getSuit())
			if cards[var1]:getSuit()==hcards[var2]:getSuit() then return cards[var1]:getId() end
		end
	end
	return -1
end
--招亲
local LuaZhaoQin_skill={}
LuaZhaoQin_skill.name="LuaZhaoQin"
table.insert(sgs.ai_skills,LuaZhaoQin_skill)
LuaZhaoQin_skill.getTurnUseCard=function(self,inclusive)
	if self.player:getMark("@LuaZhaoQin")==1 and self.player:isWounded() then
		local friendc=0
		local enemyc=0
		for _,friend in ipairs(self.friends) do
			if friend:getGeneral():isMale() and not friend:isKongcheng() then friendc=friendc+1 end
		end
		for _,enemy in ipairs(self.enemies) do
			if enemy:getGeneral():isMale() and not enemy:isKongcheng() then enemyc=enemyc+1 end
		end
		if friendc<=enemyc then return sgs.Card_Parse("#LuaZhaoQinCard:.:") end
	end
end
sgs.ai_skill_use_func["#LuaZhaoQinCard"]=function(card,use,self)
	use.card=card
end
--飞刀
local feidaostr_skill={}
feidaostr_skill.name="feidaostr"
table.insert(sgs.ai_skills,feidaostr_skill)
feidaostr_skill.getTurnUseCard=function(self,inclusive)
	if self.player:getSlashCount()>=1 then return nil end
	local cards=self.player:getCards("he")
	for _,card in sgs.qlist(cards) do
		if card:inherits("Weapon") then return sgs.Card_Parse("#feidaoscard:"..card:getId()..":") end
	end
end
sgs.ai_skill_use_func["#feidaoscard"]=function(card,use,self)
	self:sort(self.enemies,"hp")
	for _,enemy in ipairs(self.enemies) do
		if not (enemy:hasSkill("kongcheng") and enemy:isKongcheng()) then
			if not (enemy:hasSkill("luajx_prs") and enemy:getHp()==1) then--排除龙凤后传【九锡】司马昭--飞刀技能修复：之语
				if not self:isEquip("Vine",enemy) then
					use.card=card
					if use.to then use.to:append(enemy) end
					return
				end
			end
		end
	end
end
--从军
sgs.ai_skill_cardask["askforLUACongJun"]=function(self,data)
	local effect=data:toSlashEffect()
	local to=effect.to
	if not self:isEnemy(to) then return "." end
	return nil
end
--远见【未完成】
sgs.ai_skill_use["@LUAYuanJian"]=function(self,prompt)
	self.player:speak("check1")
	local cards=self.player:getCards("h")
	cards=sgs.QList2Table(cards)
	self:sortByUseValue(cards)
	local card=cards[1]
	self.player:speak(card:getId())
	if self.player:hasFlag("LUAYuanJianCard:"..card:getId()) then
		local str="#LUAYuanJian_card:"..card:getId()..":->."
		self.player:speak(str)
		return str
	end
end
--针神
sgs.ai_skill_playerchosen.luazhenshen_trs=function(self,targets)
	for _,player in sgs.qlist(targets) do
		if self:isFriend(player) and player:isChained() and player:isWounded() then return player end
	end
	for _,player in sgs.qlist(targets) do
		if self:isFriend(player) and player:isChained() then return player end
	end
	for _,player in sgs.qlist(targets) do
		if self:isEnemy(player) and not player:isChained() then return player end
	end
	for _,player in sgs.qlist(targets) do
		if player:getSeat()==self.player:getSeat() then return player end
	end
end

--劫掠
sgs.ai_skill_invoke.luajielue_trs=true
--九锡
function sgs.ai_slash_prohibit.luajx_prs(self,to,card)
	return to:getHp()==1
end

xuanhu_skill={name="LuaXuanHu"}
table.insert(sgs.ai_skills, xuanhu_skill)
function xuanhu_skill.getTurnUseCard()
	if self.player:getMark("LuaXuanHuTemp")>0 then return end
	return LuaXuanHuCard:clone()
end

sgs.ai_skill_use_func["#LuaXuanHuCard"]=function(card, use)
	self:sort(self.friends, "hp")
	local friend = self.friends[1]
	if friend:getHp()<3 then
		use.card = card
		if use.to then use.to:append(friend) end
		return
	end
end

jishi_skill={name="LuaJiShi"}
table.insert(sgs.ai_skills, jishi_skill)
function jishi_skill.getTurnUseCard()
	if self.player:isNude() then return end
	local cards = sgs.QList2Table(self.player:getCards("he"))
	self:sortByUseValue(cards, true)
	local scard = hcards[1]
	local jishi_card = LuaJiShiCard:clone()
	jishi_card:addSubcard(scard)
	return jishi_card
end

sgs.ai_skill_use_func["#LuaJiShiCard"]=function(card, use)
	for _,theplayer in ipairs(self.friends) do
		if theplayer:getMark("@LuaXuanHuBlack")+theplayer:getMark("@LuaXuanHuRed")>0 then
			if theplayer:isWounded() then
				use.card = card
				return
			end
		end
	end
end

local ask_for_single_peach = SmartAI.askForSinglePeach
function SmartAI:askForSinglePeach(dying)
	if self:isFriend(dying) and not self:needDeath(dying) and self.player:hasSkill("LuaJiShi") and self.player:hasFlag("LuaJiShiCanUse") then
		local cards = sgs.QList2Table(self.player:getCards("he"))
		self:sortByUseValue(cards, true)
		local scard = hcards[1]
		local jishi_card = LuaJiShiCard:clone()
		jishi_card:addSubcard(scard)
		return jishi_card:toString()
	end
	return ask_for_single_peach(self,dying)
end

--内助
sgs.ai_skill_use["#LuaNeiZhuCard"]=function(self,prompt)
	if #self.friends_noself==0 or self.player:isKongcheng() then return "." end
	self:sort(self.friends_noself,"handcard")
	local cards=sgs.QList2Table(self.player:getCards("he"))
	self:sortByUseValue(cards,true)
	local target=self.friends_noself[1]
	local card=cards[1]
	return "#LuaNeiZhuCard:"..card:getId()..":->"..target:objectName()
end
--辅君
sgs.ai_skill_invoke.LuaFuJun=function(self,data)
	local from=self.room:getCurrent()
	return self:isEnemy(from) and (from:getPhase()==sgs.Player_Draw or from:getPhase()==sgs.Player_Play)
end
--节俭
sgs.ai_skill_choice.jiejians=function(self,choices)
	local from=self.room:getCurrent()
	if self:isEnemy(from) then
		return "to_turnover"
	else
		return "to_gain"
	end
end


--退守
local tuishouvs_skill={}
tuishouvs_skill.name="tuishouvs"
table.insert(sgs.ai_skills,tuishouvs_skill)
tuishouvs_skill.getTurnUseCard=function(self)
	local cards=self.player:getCards("h")
	if cards:length()~=1 then return nil end
	local card=cards:at(0)
	local suit=card:getSuitString()
	local number=card:getNumberString()
	local card_id=card:getEffectiveId()
	local card_str=("slash:tuishouvs[%s:%s]=%d"):format(suit,number,card_id)
--	self.player:speak(card_str)
	local slash=sgs.Card_Parse(card_str)
	return slash
end
sgs.ai_view_as.tuishouvs=function(card,player,card_place)
	if player:getHandcardNum()~=1 then return nil end
	local suit=card:getSuitString()
	local number=card:getNumberString()
	local card_id=card:getEffectiveId()
	local str
	if player:hasFlag("LuaTuiShouJink") then str=("jink:tuishouvs[%s:%s]=%d"):format(suit,number,card_id) end
	if player:hasFlag("LuaTuiShouSlash") then str=("slash:tuishouvs[%s:%s]=%d"):format(suit,number,card_id) end
--	player:speak(str)
	return str
end

--隽美
sgs.ai_view_as.juanmeis=function(card,player,card_place)
	local cards=sgs.QList2Table(player:getCards("h"))
	if #cards<2 then return nil end
--	SmartAI:sortByUseValue(cards,true)
	return "jink:juanmeis[no_suit:0]="..cards[1]:getId().."+"..cards[2]:getId()
end
--天时
sgs.ai_skill_invoke.luatsh_trs=true
--专权
local luazhq_trs_skill={}
luazhq_trs_skill.name="luazhq_trs"
table.insert(sgs.ai_skills,luazhq_trs_skill)
luazhq_trs_skill.getTurnUseCard=function(self,inclusive)
	if not self.player:faceUp() then return sgs.Card_Parse("#luazhq_effect:.:") end
end
sgs.ai_skill_use_func["#luazhq_effect"]=function(card,use,self)
	use.card=card
end
sgs.ai_skill_choice.luazhq_effect=function(self,choices)
	if self.player:hasFlag("luatsh_thunder") then
		return "thunder_slash"
	else
		return "fire_slash"
	end
end
sgs.ai_skill_suit.luazhq_trs=function()
	return sgs.Card_Diamond
end
--[[sgs.ai_filterskill_filter.luazhq_fts=function(card,card_place)
	local int2suit={sgs.Card_Spade,sgs.Card_Club,sgs.Card_Heart,sgs.Card_Diamond}
	if card:getSuit()==int2suit[player:getMark("luazhq_suit")] then
		local suit=card:getSuitString()
		local number=card:getNumberString()
		local card_id=card:getEffectiveId()
		local int2basic={"slash","thunder_slash","fire_slash","jink","peach","analeptic"}
		return int2basic[player:getMark("luazhq_basic")]..(":luazhq_fts[%s:%s]=%d"):format(suit,number,card_id)
	end
end]]

--文鸯
--绝尘 非友方发动
sgs.ai_skill_invoke.luashg_trs=function(self,data)
	local damage = data:toDamage()
	return not self:isFriend(damage.to)
end


