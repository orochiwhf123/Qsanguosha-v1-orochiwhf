module("extensions.newbility", package.seeall)
extension = sgs.Package("newbility") 

function CreateCard(name,cards,skill)
	local ct={}
	if cards then
		if type(cards)=="userdata" and cards.at then 
			local ncards=sgs.QList2Table(cards)
			cards=ncards
		end
		if type(cards)=="table" then
			n=1
			for _,acard in ipairs(cards) do
				if type(acard)=="userdata" then ct[n]=acard end
				if type(acard)=="number" then ct[n]=sgs.Sanguosha:getCard(acard) end
				n=n+1
			end
			n=n-1
		end
		if type(cards)=="userdata" then ct[1]=cards end
		if type(cards)=="number" then ct[1]=sgs.Sanguosha:getCard(cards) end
	end
	local suit=nil
	local num=0
	for _,acard in ipairs(ct) do
		if suit and suit~=acard:getSuit() then suit=sgs.Card_NoSuit end
		if not suit then suit=acard:getSuit() end
		num=num+acard:getNumber()
	end
	if not suit then suit=sgs.Card_NoSuit end
	if num>13 then num=0 end
	local card
	if type(name)=="string" then
		card=sgs.Sanguosha:cloneCard(name,suit,num)
	else
		card=name:clone()
	end
	for _,acard in ipairs(ct) do
		card:addSubcard(acard)
	end
	if skill then card:setSkillName(skill) end
	return card
end
--添加触发技能
function TempSkill(skill)
	if not sgs.Sanguosha:getSkill(skill:objectName()) then
		local skillList=sgs.SkillList()
		skillList:append(skill)
		sgs.Sanguosha:addSkills(skillList)
	end
end

function NBattach(player,name,gn,detach,attach)
local card=nil
local room=player:getRoom()
 for _, cd in sgs.qlist(player:getHandcards()) do
if cd:objectName()==name then
card=cd
 end
end
 
if card~=nil then
local p=nil
for _, oth in sgs.qlist(room:getAlivePlayers()) do
if string.find(oth:getGeneralName(),gn) then
p=oth
  end
 end
if not p then
room:throwCard(card)
local log=sgs.LogMessage()
log.from=player
log.type="#Thrownb"
log.arg=card:objectName()
room:sendLog(log)
player:drawCards(1)
else
			local logx = sgs.LogMessage()
			logx.type = "#Nstandard"
			logx.from=p
			logx.arg=card:objectName()
			room:sendLog(logx)
 if attach==true then
room:acquireSkill(p,name)
 end 
if p:getArmor()~=nil then
room:throwCard(p:getArmor())
   end
p:addToPile("nbequip",card:getId())
room:acquireSkill(p,"nbequip")
if detach~="" and p:hasSkill(detach) then
local list=p:getVisibleSkillList()
local to
if p:getGeneral():isMale() then
to="sujiang"
else to="sujiangf"
end
p:setTag("generalh",sgs.QVariant(p:getGeneralName()))
room:setPlayerProperty(p,"general",sgs.QVariant(to))
for _,sk in sgs.qlist(list) do
if sk:objectName()==detach then
room:acquireSkill(p,name)
room:attachSkillToPlayer(p,detach)
room:detachSkillFromPlayer(p,detach)
else
room:acquireSkill(p,sk:objectName())
 end
end
 end
 end
end
end
function NBattach2(player,name,gn,detach,attach)
local card=nil
local room=player:getRoom()
 for _, cd in sgs.qlist(player:getHandcards()) do
if cd:objectName()==name then
card=cd
 end
end
 
if card~=nil then
local p=nil
for _, oth in sgs.qlist(room:getAlivePlayers()) do
if string.find(oth:getGeneralName(),gn) then
p=oth
  end
 end
if not p then
room:throwCard(card)
local log=sgs.LogMessage()
log.from=player
log.type="#Thrownb"
log.arg=card:objectName()
room:sendLog(log)
player:drawCards(1)
else
			local logx = sgs.LogMessage()
			logx.type = "$"..card:objectName()
			room:sendLog(logx)
 if attach==true then
room:acquireSkill(p,name)
 end 
if p:getArmor()~=nil then
room:throwCard(p:getArmor())
   end
p:addToPile("nbequip",card:getId())
room:acquireSkill(p,"nbequip")
if detach~="" and p:hasSkill(detach) then
local list=p:getVisibleSkillList()
local to
if p:getGeneral():isMale() then
to="sujiang"
else to="sujiangf"
end
p:setTag("generalh",sgs.QVariant(p:getGeneralName()))
room:setPlayerProperty(p,"general",sgs.QVariant(to))
for _,sk in sgs.qlist(list) do
if sk:objectName()==detach then
room:acquireSkill(p,name)
room:attachSkillToPlayer(p,detach)
room:detachSkillFromPlayer(p,detach)
else
room:acquireSkill(p,sk:objectName())
 end
end
 end
 end
end
end
miheng = sgs.General(extension, "miheng", "god", 3)
kanze=sgs.General(extension, "kanze", "wu", 4)

 stink = sgs.CreateSkillCard
{
	name = "stink",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
local cd1=nil
 for _, cd in sgs.qlist(source:getHandcards()) do
if cd:objectName()=="stink" then
cd1=cd
 end
end
room:throwCard(cd1)
local x=source:getNextAlive()
if not room:askForCard(x,"jink","haochou") then
room:swapSeat(x,x:getNextAlive())
end
end,
} 

local cd=stink:clone()
cd:setSuit(sgs.Card_Heart)
cd:setNumber(9)
cd:setParent(extension)

for var=1,5,1 do
local slash=sgs.Sanguosha:cloneCard("WushenSlash",sgs.Card_Spade,var)
slash:setParent(extension)
end

leiluo=sgs.CreateGameStartSkill{ --主公的主公技
name="leiluo",
	frequency=sgs.Skill_Compulsory,

on_gamestart=function(self,player)
	local room=player:getRoom()	
	
if player:getRole()=="renegade" then
player:setRole("loyalist")

end
end,
}

diezhivs=sgs.CreateViewAsSkill{
name="diezhi",
n=0,
view_as=function(self, cards)
	if #cards==0 then 
	local acard=DiezhiCard:clone()		
	acard:setSkillName("diezhi")
	return acard end
end,
enabled_at_play=function(self,player)
	if player:getMark("@drig")==1 then return true --判断标记
	else return false end
end,
enabled_at_response=function(self,pattern) 
	return false 
end
}

DiezhiCard=sgs.CreateSkillCard{
name="diezhi",
target_fixed=true,
on_use=function(self,room,source,targets)	
	source:loseMark("@drig",1)
	 for _,p in sgs.qlist(room:getOtherPlayers(source)) do
	 		if(p:isAlive()) then
            	room:cardEffect(self, source, p)
			 end			
	 end
end,
on_effect=function(self,effect)
		local room = effect.to:getRoom()
		local players = room:getOtherPlayers(effect.to)
		local distance_list=sgs.IntList()
local t=room:askForChoice(effect.to,"drig-guess","lord+loyalist+rebel+renegade")
        if  effect.from:getRole()~=t then
		local damage = sgs.DamageStruct()
				damage.card = nil
				damage.from = effect.to
				damage.to = effect.to
				damage.damage = 1
				damage.nature = sgs.DamageStruct_Fire
				room:damage(damage)
			local damage2 = sgs.DamageStruct()
				damage2.card = nil
				damage2.from = effect.to
				damage2.to = effect.to
				damage2.damage = 1
				damage2.nature = sgs.DamageStruct_Thunder
				room:damage(damage2)
				room:loseHp(effect.to)
				elseif  effect.from:getRole()==t then
				effect.to:drawCards(3)
				end
end

}
diezhi=sgs.CreateTriggerSkill{
name="diezhi",
events=sgs.GameStart, --游戏开始
view_as_skill=diezhivs, --添加视为
frequency=sgs.Skill_Limited, --限定
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
    player:gainMark("@drig",1) --给个标记
end,
}

jieao=sgs.CreateTriggerSkill{
	name="jieao",
	frequency = sgs.Skill_Compulsory,
	events={sgs.PhaseChange},

	on_trigger = function(self,event,player,data)
		local room = player:getRoom()
		if player:getPhase() == sgs.Player_Start and player:getHp() > player:getHandcardNum() then
			local log = sgs.LogMessage()
			log.type = "#TriggerSkill";
			log.from = player;
			log.arg = self:objectName();
			room:sendLog(log);
			player:drawCards(2);
		end
		return false
	end
}

yulucard=sgs.CreateSkillCard{
	name = "yulu",
	target_fixed = true,
	will_throw = false,
	on_use = function(self, room, source, targets)
		for _, word_id in sgs.qlist(self:getSubcards()) do
			source:addToPile("word", word_id)
		end
	end
}

yulu=sgs.CreateViewAsSkill{
	name = "yulu",
	n = 998,

	view_filter = function(self, selected, to_select)
		return not to_select:isEquipped()
	end,

	view_as = function(self, cards)
		if #cards > 0 then
			local Yulucard = yulucard:clone()
			local i = 0
			while(i < #cards) do
				i = i + 1
				Yulucard:addSubcard(cards[i]:getId())
			end
			Yulucard:setSkillName(self:objectName())
			return Yulucard
		else return nil
		end
	end,
}

ViewMyWordscard=sgs.CreateSkillCard{
	name = "viewmywords",
	target_fixed = true,
	on_use = function(self, room, source, targets)
		local words = source:getPile("word")
		if words:isEmpty() then return end
		room:fillAG(words, source)
		local card_id = room:askForAG(source, words, true, "viewmywords")
		if card_id > -1 then
			words:removeOne(card_id);
			room:moveCardTo(sgs.Sanguosha:getCard(card_id), source, sgs.Player_Hand, false)
		end
		source:invoke("clearAG");
	--	words:clear()
	end
}

ViewMyWords=sgs.CreateViewAsSkill{
	name = "numa",
	n = 0,

	view_as = function(self, cards)
		if #cards ~= 0 then return nil end
		local VMWcard = ViewMyWordscard:clone()
		return VMWcard
	end,

	enabled_at_play=function(self, player)
		return not player:getPile("word"):isEmpty()
	end,
}

numa=sgs.CreateTriggerSkill{
	name = "numa",
	frequency = sgs.Skill_NotFrequent,
	events = {sgs.PhaseChange},
	view_as_skill = ViewMyWords,

	on_trigger=function(self,event,player,data)
		local room = player:getRoom()
		if player:getPhase() ~= sgs.Player_Finish then return false end
		if player:getPile("word"):isEmpty() then return false end
		if not room:askForSkillInvoke(player, self:objectName()) then return false end

		local c, word = "", ""
		for _, i in sgs.qlist(player:getPile("word")) do
			c = string.sub(sgs.Sanguosha:getCard(i):getSuitString(), 1, 1)

			local log = sgs.LogMessage()
			log.type = "#Numasingle"
			log.from = player
			log.arg = self:objectName() .. c
			room:sendLog(log)
			word = word .. c
		end

		local gitlog = sgs.LogMessage()
		gitlog.type = "#Numa_" .. word
		gitlog.from = player
		gitlog.arg = "numa_notice"
		if word == "hc" then
			room:sendLog(gitlog)
			--womei:recover self
			local womei = sgs.RecoverStruct()
			womei.who = player
			room:recover(player, womei)
		elseif word == "dc" then
			room:sendLog(gitlog)
			--nimei:throw single player 2 cards
			local players = sgs.SPlayerList()
			for _, tmp in sgs.qlist(room:getAlivePlayers()) do
				if tmp:getHandcardNum() < 2 then
					if tmp:hasSkill("lianying") then
						players:append(tmp)
					elseif tmp:hasSkill("shangshi") and tmp:isWounded() then
						players:append(tmp)
					end
				else
				players:append(tmp)
				end
			end
			if not players:isEmpty() then
				room:askForDiscard(room:askForPlayerChosen(player, players, self:objectName()), self:objectName(), 2);
			end
		elseif word == "cc" then
			room:sendLog(gitlog)
			--meimei:clear single player's all judge_area
			local players = sgs.SPlayerList()
			for _, tmp in sgs.qlist(room:getAlivePlayers()) do
				if not tmp:getJudgingArea():isEmpty() then players:append(tmp) end
			end
			if not players:isEmpty() then
				local target = room:askForPlayerChosen(player, players, self:objectName())
				for _, c in sgs.qlist(target:getJudgingArea()) do
					room:throwCard(c:getId())
				end
			end
		elseif word == "sd" then
			room:sendLog(gitlog)
			--rini:let single player tribute a card and recover 1 hp
			local players = sgs.SPlayerList()
			for _, tmp in sgs.qlist(room:getOtherPlayers(player)) do
				if tmp:isWounded() and not tmp:isKongcheng() then players:append(tmp) end
			end
			if not players:isEmpty() then
				local target = room:askForPlayerChosen(player, players, self:objectName())
				local card = room:askForCardShow(target, player, self:objectName())
				player:obtainCard(card)
				local rini = sgs.RecoverStruct()
				rini.card = card
				rini.who = player
				room:recover(target, rini)
			end
		elseif word == "hs" then
			room:sendLog(gitlog)
			--wori:get skill fanchun
			local judge = sgs.JudgeStruct()
			judge.pattern = sgs.QRegExp("(Peach|GodSalvation):(.*):(.*)")
			judge.good = true
			judge.reason = self:objectName()
			judge.who = player
			room:judge(judge)
			if judge:isGood() then room:acquireSkill(player, "fanchun") end
		elseif word == "hsc" or word == "hsd" then
			room:sendLog(gitlog)
			--worimei&worini:recover hp with a girl or a boy
			local players = sgs.SPlayerList()
			for _, tmp in sgs.qlist(room:getOtherPlayers(player)) do
				if ((word == "hsc" and tmp:getGeneral():isFemale()) or
				   (word == "hsd" and tmp:getGeneral():isMale())) and tmp:isWounded() then
					players:append(tmp)
				end
			end
			if not players:isEmpty() then
				local target = room:askForPlayerChosen(player, players, self:objectName())
				local worimei = sgs.RecoverStruct()
				worimei.card = nil
				worimei.who = player
				room:recover(target, worimei)
				room:recover(player, worimei)
			end
		elseif word == "dsh" then
			room:sendLog(gitlog)
			--niriwo:call slash me! or taking away all his cards
			local players = sgs.SPlayerList()
			for _, tmp in sgs.qlist(room:getAlivePlayers()) do
				if tmp:canSlash(player) then players:append(tmp) end
			end
			local target = room:askForPlayerChosen(player, players, self:objectName())
			local slash = room:askForCard(target, "slash", self:objectName())
			if slash then
				local niriwo = sgs.CardUseStruct()
				niriwo.card = slash
				niriwo.to:append(player)
				niriwo.from = target
				room:useCard(niriwo)
			elseif not target:isNude() then
				local cards = target:getCards("hej")
				for _, tmp in sgs.qlist(cards) do
					room:moveCardTo(tmp, player, sgs.Player_Hand, false)
				end
			end
		elseif word == "shc" then
			room:sendLog(gitlog)
			--riwomei:let single player damage myself and recover himself
			local riwmei = sgs.DamageStruct()
			local target = room:askForPlayerChosen(player, room:getAlivePlayers(), self:objectName())
			riwmei.from = target
			riwmei.to = player
			room:damage(riwmei)

			local riwomei = sgs.RecoverStruct()
			riwomei.card = nil
			riwomei.who = player
			room:recover(target, riwomei)
		elseif word == "hhh" then
			room:sendLog(gitlog)
			--wowowo:the same to Jushou
			player:turnOver()
			player:drawCards(3)
		elseif word == "sss" then
			room:sendLog(gitlog)
			--ririri:the same to Fangzhu
			local target = room:askForPlayerChosen(player, room:getAlivePlayers(), self:objectName())
			target:turnOver()
			target:drawCards(player:getMaxHp() - player:getHp())
		elseif word == "ddd" then
			room:sendLog(gitlog);
			--ninini:let a player obtain word-card
			local target = room:askForPlayerChosen(player, room:getAlivePlayers(), self:objectName())
			for _, i in sgs.qlist(player:getPile("word")) do
				room:moveCardTo(sgs.Sanguosha:getCard(i), target, sgs.Player_Hand)
			end
		elseif word == "ccc" then
			room:sendLog(gitlog)
			--meimeimei:clear single player's all equip_area
			local target = room:askForPlayerChosen(player, room:getAlivePlayers(), self:objectName())
			target:throwAllEquips()
		elseif word == "dcdc" then
			room:sendLog(gitlog)
			--nimeinimei:make a extra turn
			local target = room:askForPlayerChosen(player, room:getAlivePlayers(), self:objectName())
			for _, i in sgs.qlist(player:getPile("word")) do
				room:throwCard(i)
			end
			target:gainAnExtraTurn(player)
		elseif word == "sdc" or word == "hsdc" then
			room:sendLog(gitlog)
			--rinimei:slash
			--worinimei:drank and slash
			if word == "hsdc" then room:setPlayerFlag(player, "drank") end

			local players = sgs.SPlayerList()
			for _, tmp in sgs.qlist(room:getAlivePlayers()) do
				if player:canSlash(tmp, false) then players:append(tmp) end
			end
			local target = room:askForPlayerChosen(player, players, self:objectName())

			local slashtype = sgs.Sanguosha:getCard(player:getPile("word"):first()):getNumber()

			if not players:isEmpty() then
				local worinimei = sgs.CardUseStruct()
				local card;
				if word == "sdc" and slashtype < 5 then
					card = sgs.Sanguosha:cloneCard("thunder_slash", sgs.Card_NoSuit, 0)
				elseif word == "sdc" and slashtype > 9 then
					card = sgs.Sanguosha:cloneCard("fire_slash", sgs.Card_NoSuit, 0)
				else
					card = sgs.Sanguosha:cloneCard("slash", sgs.Card_NoSuit, 0)
				end
				card:setSkillName(self:objectName())
				worinimei.card = card
				worinimei.from = player
				worinimei.to:append(target)
				room:useCard(worinimei)
			end
		elseif word == "ccsh" then
			room:sendLog(gitlog)
			--nimeiriwo:hp full
			local mei2riwo = sgs.RecoverStruct()
			mei2riwo.who = player
			mei2riwo.recover = player:getLostHp()
			room:recover(player, mei2riwo)
			room:setPlayerProperty(player, "hp", sgs.QVariant(player:getMaxHp()))
		elseif word == "dsdc" then
			room:sendLog(gitlog);
			--nimeiriwo:show one player's handcard to other one
			local source = room:askForPlayerChosen(player, room:getAlivePlayers(), self:objectName())
			local target = room:askForPlayerChosen(player, room:getAlivePlayers(), self:objectName())

			local log=sgs.LogMessage()
			log.type = "#Info_dsdc"
			log.from = source
			log.to:append(target)
			room:sendLog(log)

			room:showAllCards(target, source)
		elseif word == "dshc" then
			room:sendLog(gitlog)
			--niriwomei:kill-self
			--[[if Config.FreeChoose and room:askForChoice(player, "numat", "kno+kyes") == "kno" then
				gitlog.type = "#Numa_tequan"
				gitlog.from = player
				room:sendLog(gitlog)
			else]]
			local damage = sgs.DamageStruct()
			damage.from = player
			room:killPlayer(player, damage)
		elseif word == "hhhhh" then
			room:sendLog(gitlog);
			--niriwomei:goto dengai
			if sgs.Sanguosha:getGeneral("dengai") then
				room:transfigure(player, "dengai", true)
				for _, i in sgs.qlist(player:getPile("word")) do
					room:throwCard(i)
					player:addToPile("field", i)
				end
			end
		elseif word == "dshcc" then
			room:sendLog(gitlog);
			--niriwomeimei:throw other 4 card and make 2 damage to self
			local target = room:askForPlayerChosen(player, room:getAlivePlayers(), self:objectName())
			for i=4, i > 0, -1 do
				room:throwCard(room:askForCardChosen(player, target, "he", self:objectName()))
			end
			local niriwomm = sgs.DamageStruct()
			niriwomm.from = player
			niriwomm.to = player
			niriwomm.damage = 2
			room:damage(niriwomm)
		elseif word == "hsdcc" and player:getMark("hsdcc") == 0 then
			room:sendLog(gitlog)
			--worinimeimei:Limited-Skill, like GreatYeyan
			local target = room:askForPlayerChosen(player, room:getAlivePlayers(), self:objectName())
			local worinimm = sgs.DamageStruct()
			worinimm.from = player
			worinimm.to = target
			worinimm.nature = sgs.DamageStruct_Thunder
			room:damage(worinimm)
			worinimm.nature = sgs.DamageStruct_Fire
			room:damage(worinimm)
			worinimm.nature = sgs.DamageStruct_Normal;
			room:damage(worinimm)
			room:loseHp(player, 2)
			player:addMark("hsdcc")
		elseif word == "dcshc" and player:getMark("dcshc") == 0 then
			room:sendLog(gitlog)
			--worinimeimei:Limited-Skill, like Guixin
			room:loseHp(player)
			for _, tmp in sgs.qlist(room:getAllPlayers()) do
				if not tmp:isKongcheng() then
					local card_id = tmp:getRandomHandCardId()
					room:obtainCard(player, card_id)
				end
			end
			player:turnOver()
			player:addMark("dcshc")
		elseif word == "ssdcc" and player:getMark("ssdcc") == 0 then
			room:sendLog(gitlog)
			--ririnimeimei:lightning
			local players = sgs.SPlayerList()
			for _, tmp in sgs.qlist(room:getAlivePlayers()) do
				for _, lightning in sgs.qlist(tmp:getJudgingArea()) do
					if lightning:objectName() == "lightning" then
						players:append(tmp)
						break
					end
				end
			end
			if not players:isEmpty() then
				local target = room:askForPlayerChosen(player, players, self:objectName())
				for _, lightning in sgs.qlist(target:getJudgingArea()) do
					if lightning:objectName() == "lightning" then
						room:throwCard(lightning:getId())
						break
					end
				end
				local damage = sgs.DamageStruct()
				damage.to = target
				damage.nature = sgs.DamageStruct_Thunder
				damage.damage = 3
				room:damage(damage)

				player:addMark("ssdcc")
			end
		elseif word == "ssscc" and player:getMark("ssscc") == 0 then
			room:sendLog(gitlog)
			--riririmeimei:let single player acquire benghuai or wumou
			local players = sgs.SPlayerList()
			for _, tmp in sgs.qlist(room:getOtherPlayers(player)) do
				if tmp:getMaxHp() > player:getMaxHp() then players:append(tmp) end
			end
			if not players:isEmpty() then
				local target = room:askForPlayerChosen(player, players, self:objectName())
				local choice = room:askForChoice(target, self:objectName(), "benghuai+wumou")
				room:setPlayerProperty(target, "maxhp", sgs.QVariant(target:getMaxHp() + 1))
				if sgs.Sanguosha:getSkill("benghuai") then
					room:acquireSkill(target, choice)
				end
				player:addMark("ssscc");
			end
		elseif string.len(word) == 4 then
			gitlog.type = "#Numa_4wd"
			gitlog.from = player
			room:sendLog(gitlog)
			--worinimeimei:Wake-Skill, lost all skills
			--[[if Config.FreeChoose and room:askForChoice(player, "numat", "suno+suyes") == "suno" then
				gitlog.type = "#Numa_tequan"
				gitlog.from = player
				room:sendLog(gitlog)
			else]]
				for _, skill in sgs.qlist(player:getVisibleSkillList()) do
					room:detachSkillFromPlayer(player, skill:objectName())
				end
				room:setPlayerProperty(player, "general", sgs.QVariant("sujiang"))
				room:setPlayerProperty(player, "general2", sgs.QVariant("sujiangf"))
				room:setPlayerProperty(player, "maxhp", sgs.QVariant(player:getMaxHp() + 2))
		elseif string.len(word) == 5 and player:getMark("fivewd") == 0 then
			gitlog.type = "#Numa_5wd"
			gitlog.from = player
			room:sendLog(gitlog)
			--worinimeimei:Wake-Skill, learn longhun
			--[[if(Config.FreeChoose && room:askForChoice(player, "numat", "lhno+lhyes") == "lhno" then
				gitlog.type = "#Numa_tequan";
				gitlog.from = player;
				room:sendLog(gitlog);
			}
			else{]]
				room:loseMaxHp(player);
				if player:isAlive() then
					if sgs.Sanguosha:getSkill("longhun") then
						room:acquireSkill(player, "longhun")
					end
					player:addMark("fivewd")
				end
		elseif string.len(word) > 5 and player:getMark("othwd") == 0 then
			gitlog.type = "#Numa_wds"
			gitlog.from = player
			room:sendLog(gitlog)
			--worinimeimei:Wake-Skill, learn wuyan and buqu
			room:loseMaxHp(player, 2)
			if player:isAlive() then
				if sgs.Sanguosha:getSkill("wuyan") then
					room:acquireSkill(player, "wuyan")
				end
				if sgs.Sanguosha:getSkill("buqu") then
					room:acquireSkill(player, "buqu")
				end
				player:addMark("othwd")
			end
		else
			gitlog.type = "#Numa_git"
			gitlog.from = player
			room:sendLog(gitlog)
		end
		for _, i in sgs.qlist(player:getPile("word")) do
			room:throwCard(i)
		end
		return false;
	end,
}

fanchun=sgs.CreateTriggerSkill
{
	name = "fanchun",
	frequency = sgs.Skill_NotFrequent,
	events={sgs.Damaged},

	on_trigger=function(self,event,player,data)
		local room = player:getRoom()
		local card = data:toDamage().card
		local data = sgs.QVariant(0)
		data:setValue(card)
		if room:askForSkillInvoke(player, self:objectName(), data) then
			if not card:getSubcards():isEmpty() then
				for _, cd in sgs.qlist(card:getSubcards()) do
					player:addToPile("word", cd)
				end
			else
				player:addToPile("word", card:getEffectiveId())
			end
		end
	end
}

miheng:addSkill(yulu)
miheng:addSkill(numa)
miheng:addSkill(jieao)
kanze:addSkill(leiluo)
kanze:addSkill(diezhi)
local skills = sgs.SkillList()
if not sgs.Sanguosha:getSkill("fanchun") then skills:append(fanchun) end
sgs.Sanguosha:addSkills(skills)


Corrfluid = sgs.CreateViewAsSkill
{--鬼才Viewas by roxiel
	name = "corrfluid",
	n = 1,
	
	view_filter = function(self, selected, to_select)        
		return true
	end,
	
	view_as = function(self, cards)
		if #cards == 1 then 
		local acard = sgs.Sanguosha:cloneSkillCard("GuicaiCard")       
		acard:addSubcard(cards[1])        
		acard:setSkillName("guicai")
		return acard end
	end,
	
	enabled_at_play = function()
		return false        
	end,
	
	enabled_at_response = function(self, player, pattern)
		return pattern == "@guicai" --仅响应 要求一张luaguicai_card        
	end
}

Landrover = sgs.CreateViewAsSkill
{
	name = "landrover",
	n = 0,
	
	view_as = function(self, cards)
		local acard = sgs.Sanguosha:cloneSkillCard("ShensuCard")       
		return acard
	end,
	
	enabled_at_play = function()
		return false        
	end,
	
	enabled_at_response = function(self, player, pattern)
		return pattern == "@@shensu2" --仅响应 要求一张luaguicai_card        
	end
}


linctus = sgs.CreateSkillCard
{
	name = "linctus",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"linctus","guojia","",false) 
end,
} 

local cd=linctus:clone()
cd:setSuit(sgs.Card_Diamond)
cd:setNumber(10)
cd:setParent(extension)

 stimulant = sgs.CreateSkillCard
{
	name = "stimulant",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"stimulant","caocao","",true) 
end,
} 

local cd=stimulant:clone()
cd:setSuit(sgs.Card_Club)
cd:setNumber(5)
cd:setParent(extension)

 dustbin = sgs.CreateSkillCard
{
	name = "dustbin",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"dustbin","luxun","",true) 
end,
} 

local cd=dustbin:clone()
cd:setSuit(sgs.Card_Club)
cd:setNumber(8)
cd:setParent(extension)


 redsunglasses = sgs.CreateSkillCard
{
	name = "redsunglasses",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"redsunglasses","guanyu","",true) 
end,
} 

local cd=redsunglasses:clone()
cd:setSuit(sgs.Card_Heart)
cd:setNumber(6)
cd:setParent(extension)

 towel = sgs.CreateSkillCard
{
	name = "towel",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"towel","lvmeng","",false) 
end,
} 

local cd=towel:clone()
cd:setSuit(sgs.Card_Diamond)
cd:setNumber(11)
cd:setParent(extension)

 whip = sgs.CreateSkillCard
{
	name = "whip",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"whip","huanggai","",true) 
end,
} 

local cd=whip:clone()
cd:setSuit(sgs.Card_Club)
cd:setNumber(8)
cd:setParent(extension)

 corrfluid = sgs.CreateSkillCard
{
	name = "corrfluid",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"corrfluid","simayi","",true) 
end,
} 

local cd=corrfluid:clone()
cd:setSuit(sgs.Card_Heart)
cd:setNumber(8)
cd:setParent(extension)

cologne = sgs.CreateSkillCard
{
	name = "cologne",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"cologne","zhouyu","fanjian",false) 
end,
} 

local cd=cologne:clone()
cd:setSuit(sgs.Card_Spade)
cd:setNumber(10)
cd:setParent(extension)
underwear= sgs.CreateSkillCard
{
	name = "underwear",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"underwear","daqiao","",true) 
end,
} 

local cd=underwear:clone()
cd:setSuit(sgs.Card_Diamond)
cd:setNumber(4)
cd:setParent(extension)

underwear_card = sgs.CreateSkillCard
{--流离技能卡 by hypercross
	name = "liuli",
	target_fixed = false,
	will_throw = true,
	
	filter = function(self, targets, to_select)
		if #targets > 0 then return false end
		if to_select:hasFlag("slash_source") then return false end
	
		return true
	end,
	
	on_effect = function(self, effect)
		effect.to:getRoom():setPlayerFlag(effect.to, "liuli_target")
	end
}



Underwear = sgs.CreateViewAsSkill
{--突袭视为技 by ibicdlcod
	name = "underwear",	
	n = 1,
		view_filter = function(self, selected, to_select)
		return true
	end,
	view_as=function(self,cards)
		if #cards ~= 1 then return nil end
		local new_card = underwear_card:clone()
		new_card:addSubcard(cards[1])
		new_card:setSkillName(self:objectName())
		return new_card
	end,
	
	enabled_at_play = function()
		return false
	end,
	
	enabled_at_response = function(self, player, pattern)
		return pattern == "@@liuli"
	end
}


flashlight = sgs.CreateSkillCard
{
	name = "flashlight",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"flashlight","zhangliao","",true) 
end,
} 

local cd=flashlight:clone()
cd:setSuit(sgs.Card_Spade)
cd:setNumber(8)
cd:setParent(extension)

flashlight_card = sgs.CreateSkillCard
{--突袭技能卡 by ibicdlcod
	name = "flashlight_use",	
	target_fixed = false,	
	will_throw = false,
	
	filter = function(self, targets, to_select)
		if(#targets > 2) then return false end
		
		if(to_select == self) then return false end
		
		return not to_select:isKongcheng()
	end,
		
	on_effect = function(self, effect)
		local from = effect.from
		local to = effect.to
		local room = to:getRoom()
		local card_id = room:askForCardChosen(from, to, "h", "tuxi")
		local card = sgs.Sanguosha:getCard(card_id)
		room:moveCardTo(card, from, sgs.Player_Hand, false)
		
		room:setEmotion(to, "bad")
		room:setEmotion(from, "good")
	end,
}

Flashlight = sgs.CreateViewAsSkill
{--突袭视为技 by ibicdlcod
	name = "flashlight",	
	n = 0,
	
	view_as = function()
		return flashlight_card:clone()		
	end,
	
	enabled_at_play = function()
		return false
	end,
	
	enabled_at_response = function(self, player, pattern)
		return pattern == "@@tuxi"
	end
}

Deathrisk = sgs.CreateTriggerSkill
{
	name = "deathrisk",
	frequency = sgs.Skill_Compulsory,
	events = {sgs.Death},
	can_trigger = function(self, player)
		return player:getMark("deathrisk")>2
	end,
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		local damage = data:toDamageStar()
	local x=room:findPlayerBySkillName("jijiu")
	if x~=nil and x:getPile("nbequip"):length()>0 then
	x:drawCards(3)
	end
	end,
}


sophie = sgs.CreateSkillCard
{
	name = "sophie",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"sophie","zhenji","",false) 
end,
} 

local cd=sophie:clone()
cd:setSuit(sgs.Card_Spade)
cd:setNumber(7)
cd:setParent(extension)
rollingpin= sgs.CreateSkillCard
{
	name = "rollingpin",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"rollingpin","sunshangxiang","",true) 
end,
} 

local cd=rollingpin:clone()
cd:setSuit(sgs.Card_Spade)
cd:setNumber(6)
cd:setParent(extension)

Rollingpin_card = sgs.CreateSkillCard
{
	name = "rollingpin_use",
	target_fixed = true,
	will_throw = true,
	once = true,
	
	on_use = function(self, room,source,target)
		local use=sgs.CardUseStruct()
use.card=sgs.Sanguosha:cloneSkillCard("JieyinCard")
use.from=source
use.to:append(source)
room:useCard(use)
	end
}

Rollingpin = sgs.CreateViewAsSkill
{
	name = "rollingpin",
	n = 2,
	
	enabled_at_play = function(self,player)
		return player:isWounded() and not player:hasUsed("JieyinCard")
	end,
	
	view_filter = function(self, selected, to_select)
		return not to_select:isEquipped()
	end,
	
	view_as = function(self, cards)
		if #cards ~= 2 then return nil end
		local new_card = Rollingpin_card:clone()
		new_card:addSubcard(cards[1])
		new_card:addSubcard(cards[2])
		new_card:setSkillName(self:objectName())
		return new_card
	end
}



harley= sgs.CreateSkillCard
{
	name = "harley",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"harley","machao","",false) 
end,
} 

local cd=harley:clone()
cd:setSuit(sgs.Card_Heart)
cd:setNumber(10)
cd:setParent(extension)
animals= sgs.CreateSkillCard
{
	name = "animals",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"animals","lvbu","",true) 
end,
} 

local cd=animals:clone()
cd:setSuit(sgs.Card_Club)
cd:setNumber(3)
cd:setParent(extension)
dummycard=sgs.CreateSkillCard{
name="dummy",
target_fixed=true,
will_throw=true,
}

Dustbin = sgs.CreateViewAsSkill
{
	name = "dustbin",
	n = 1,
	
	view_filter = function(self, selected, to_select)
		return not to_select:isEquipped()
	end,
	enabled_at_play=function(self,player)
	return not player:hasUsed("#dummy")
	end,
	view_as = function(self, cards)
		if #cards == 1 then
			local card = cards[1]
			local new_card = dummycard:clone()
			new_card:addSubcard(card:getId())
			new_card:setSkillName(self:objectName())
			return new_card
		end
	end
}


Animals = sgs.CreateViewAsSkill
{--国色 by ibicdlcod
	name = "animals",
	n = 1,
	
	view_filter = function(self, selected, to_select)
		return to_select:getSuit() == sgs.Card_Spade and to_select:inherits("TrickCard")
	end,
	
	view_as = function(self, cards)
		if #cards == 1 then
			local card = cards[1]
			local new_card = sgs.Sanguosha:cloneCard("duel", card:getSuit(), card:getNumber())
			new_card:addSubcard(card:getId())
			new_card:setSkillName(self:objectName())
			return new_card
		end
	end
}
urban= sgs.CreateSkillCard
{
	name = "urban",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"urban","ganning","",false) 
end,
} local cd=urban:clone()
cd:setSuit(sgs.Card_Diamond)
cd:setNumber(2)
cd:setParent(extension)
warmbaby= sgs.CreateSkillCard
{
	name = "warmbaby",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"warmbaby","xuchu","",false) 
end,
} local cd=warmbaby:clone()
cd:setSuit(sgs.Card_Club)
cd:setNumber(5)
cd:setParent(extension)



madamfeng = sgs.CreateSkillCard
{
	name = "madamfeng",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"madamfeng","huangyueying","",false) 
end,
} 

local cd=madamfeng:clone()
cd:setSuit(sgs.Card_Club)
cd:setNumber(8)
cd:setParent(extension)

eyedrops = sgs.CreateSkillCard
{
	name = "eyedrops",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"eyedrops","liubei","",false) 
end,
} 

local cd=eyedrops:clone()
cd:setSuit(sgs.Card_Spade)
cd:setNumber(4)
cd:setParent(extension)

brainplatinum = sgs.CreateSkillCard
{
	name = "brainplatinum",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"brainplatinum","sunquan","",false) 
end,
} 

local cd=brainplatinum:clone()
cd:setSuit(sgs.Card_Diamond)
cd:setNumber(1)
cd:setParent(extension)

speakers = sgs.CreateSkillCard
{
	name = "speakers",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"speakers","zhangfei","",false) 
end,
} 

local cd=speakers:clone()
cd:setSuit(sgs.Card_Club)
cd:setNumber(11)
cd:setParent(extension)


deathrisk = sgs.CreateSkillCard
{
	name = "deathrisk",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"deathrisk","huatuo","",true) 
end,
} 

local cd=deathrisk:clone()
cd:setSuit(sgs.Card_Diamond)
cd:setNumber(2)
cd:setParent(extension)
Cologne = sgs.CreateViewAsSkill
{--反间 by ibicdlcod
	name = "cologne",
	n = 0,
	
	enabled_at_play = function(self,player)
		return not player:hasFlag("luafanjianused") 
	end,
	
	view_as = function(self, cards)
		local card = cologne_card:clone()
		card:setSkillName(self:objectName())
		return card
	end
}

cologne_card = sgs.CreateSkillCard
{--反间技能卡 by ibicdlcod
	name = "cologne_use",
	target_fixed = false,
	will_throw = false,
	once = true,
	
	on_effect = function(self, effect)
		local zhouyu = effect.from
		local target = effect.to
		local room = zhouyu:getRoom()

		local card_id = room:askForCardChosen(zhouyu,zhouyu,"h","fanjian")
		local card=sgs.Sanguosha:getCard(card_id)
		local suit = room:askForSuit(target,"fanjian")
		
		local log = sgs.LogMessage()  --LOG 以下是改判定专用的TYPE
		log.type = "#ChooseSuit"
		log.from = target
		log.arg = sgs.Card_Suit2String(suit)
		room:sendLog(log)
		
		room:getThread():delay()
		
		if(OMEGAERA) then
			room:showCard(zhouyu, card_id)
		else
			target:obtainCard(card)
			room:showCard(target, card_id)
		end
		if(card:getSuit() ~= suit) then
			local ddata = sgs.DamageStruct()
			ddata.card = nil
			ddata.from = zhouyu
			ddata.to = target
			
			room:damage(ddata)
		end
		if(OMEGAERA) then
			if(target:isAlive()) then target:obtainCard(card) end
		end
		room:setPlayerFlag(zhouyu, "luafanjianused")
	end,
	
	enabled_at_play = function()
		return true
	end
}



Whip = sgs.CreateViewAsSkill
{--苦肉 by ibicdlcod
	name = "whip",
	n = 0,
	
	view_as = function(self, cards)
		local card = whip_card:clone()		
		card:setSkillName(self:objectName())
		return card
	end
}

whip_card = sgs.CreateSkillCard
{--苦肉技能卡 by ibicdlcod
	name = "whip_yes",
	target_fixed = true,
	will_throw = false,
	
	on_use = function(self, room, source, targets)
		room:loseHp(source,2)
		if(source:isAlive()) then
			room:drawCards(source, 5)
		end
	end,
	
	enabled_at_play = function()
		return true
	end
}

Yaiba = sgs.CreateViewAsSkill
{--离间 by ibicdlcod
	name = "yaiba",
	n = 1,
	
	enabled_at_play = function(self,player)
		return not player:hasUsed("LijianCard")
	end,
	
	view_filter = function()
		return true
	end,
	
	view_as = function(self, cards)
		if(#cards ~= 1) then return nil end
		local lcard = yaiba_card:clone()
		lcard:addSubcard(cards[1])
		lcard:setSkillName(self:objectName())
		return lcard
	end
}

yaiba_card = sgs.CreateSkillCard
{--离间技能卡 by hypercross and ibicdlcod
	name = "yaiba_use",
	once = true,
	target_fixed = false,
	will_throw = true,
	
	filter = function(self, targets, to_select)
		if #targets > 1 then return false end
		if(#targets == 0 and to_select:hasSkill("kongcheng") and to_select:isKongcheng()) then return false end
		return true
	end,
	
	on_use = function(self, room, source, targets)
local use=sgs.CardUseStruct()
use.card=sgs.Sanguosha:cloneSkillCard("LijianCard")
use.from=source
use.to:append(targets[1])
use.to:append(targets[2])
room:useCard(use,true)
	end
}



Stimulant=sgs.CreateProhibitSkill{ --谦逊EX
name = "stimulant",
is_prohibited=function(self,from,to,card)
    if (sgs.Sanguosha:getCard(to:getPile("nbequip"):first()):objectName()=="stimulant") then
        return (card:inherits("Indulgence")) --不能成为过河拆桥和乐不思蜀的目标 
    end
end,
}


nbskill=sgs.CreateTriggerSkill{
name="nbequip",
events={sgs.Dying,sgs.SlashProceed,sgs.Predamaged,sgs.Damage,sgs.SlashHit,sgs.CardFinished,sgs.CardEffected,sgs.CardUsed,sgs.Damaged,sgs.CardAsked,sgs.FinishJudge,sgs.CardEffect,sgs.CardDiscarded,sgs.PhaseChange,sgs.Predamage,sgs.CardGot,sgs.CardLost},	
can_trigger=function(self,player)
return player:getPile("nbequip"):length()==1 and not player:hasFlag("wuqian") and player:getMark("qinggang")==0
end,
on_trigger=function(self,event,player,data)
	local room=player:getRoom()
	local c=sgs.Sanguosha:getCard(player:getPile("nbequip"):first())
	if event==sgs.CardGot or event==sgs.CardLost then
	local move=data:toCardMove()
	local card=sgs.Sanguosha:getCard(move.card_id)
	if move.to_place==sgs.Player_Equip and move.to:getSeat()==player:getSeat() then
	if card:inherits("Armor") then
	room:throwCard(c)
	 if player:hasSkill(c:objectName()) then
 room:detachSkillFromPlayer(player,c:objectName())
 end
 if player:getMark("@chaos")>0 then
 player:loseMark("@chaos")
 end
 local hp=player:getHp()
	 if player:getGeneralName()=="sujiang" or player:getGeneralName()=="sujiangf" then
 			room:transfigure(player,player:getTag("generalh"):toString(),false,false)	
			local data=sgs.QVariant(hp)
   room:setPlayerProperty(player, "hp", data)
    end
 end
	end
	elseif event==sgs.Predamaged then
		if player:hasSkill("luanji") and player:getPhase()~=sgs.Player_NotActive then
	player:speak("有本事肛裂我啊!!!")
	return true
	end
	elseif event==sgs.Dying then
	if player:hasSkill("niepan") and player:getMark("@nirvana")==1 and player:askForSkillInvoke("niepan") then
	local x = player:getMaxHP()
   if x > 3 then x = 3 end
   local data=sgs.QVariant(x)
   room:setPlayerProperty(player, "hp", data)
	player:throwAllCards()
	room:throwCard(c)
	player:drawCards(3)
	   if player:isChained() then 
    if (not dying.damage) or dying.damage.nature == sgs.DamageStruct_Normal then
     room:setPlayerProperty(player, "chained", sgs.QVariant(false))
    end
   end
   if (not player:faceUp()) then
    player:turnOver()
   end
   return true 

	end
	elseif event==sgs.Damage then
	local damage = data:toDamage()
 if (damage.from:distanceTo(damage.to) < 2) and damage.from:getHp()==damage.from:getMaxHp() and damage.to:getSeat()~=damage.from:getSeat() and (damage.from:hasSkill("kuanggu"))then
damage.from:drawCards(2)
end
	elseif event==sgs.CardEffect then
	local effect=data:toCardEffect()
if effect.card:inherits("FangzhuCard") and c:objectName()=="hydrogen" then
room:playSkillEffect("fangzhu")
player:drawCards(player:getLostHp())
effect.to:turnOver()
return true
end
	if effect.card:inherits("TianxiangCard") and player:askForSkillInvoke("chanel5") then
	local damage=effect.from:getTag("TianxiangDamage"):toDamage()
	    damage.to = effect.to
    damage.chain = true
    room:damage(damage)
	local x=room:askForPlayerChosen(player, room:getAlivePlayers(), "tianxiang")
	x:drawCards(effect.to:getMaxHp()-effect.to:getHp())
	return true
	end
	if player:hasSkill("qixi") and data:toCardEffect().card:getSuit()==sgs.Card_Club then
	local acard=sgs.Sanguosha:cloneCard("snatch",sgs.Card_Club,0)
				acard:addSubcard(effect.card:getEffectiveId())
			acard:setSkillName("qixi")
			effect.card = acard
			data:setValue(effect)
	end
	elseif event==sgs.SlashHit then
	if player:hasSkill("liegong") then
	local effect=data:toSlashEffect()
	room:throwCard(effect.to:getWeapon())
		room:throwCard(effect.to:getArmor())
	room:throwCard(effect.to:getDefensiveHorse())
	room:throwCard(effect.to:getOffensiveHorse())
	end
	elseif event==sgs.Predamage then
	local damage=data:toDamage()
		local card=data:toDamage().card
	if card~=nil and card:inherits("Slash") and player:getMark("speakers")==2 then
	damage.damage=damage.damage+1
	data:setValue(damage)
	end
	elseif event==sgs.SlashProceed then
	if player:hasSkill("liegong") and player:getPhase()==sgs.Player_NotActive then
  if (effect.to:getHandcardNum() >= player:getHp()) or (effect.to:getHandcardNum() <= player:getAttackRange()) then 
  	  if (room:askForSkillInvoke(player,"liegong") ~=true) then return false end 
   room:slashResult(effect, nil) 
   return true
  end
end
	if player:hasSkill("tieji") then
	if (not room:askForSkillInvoke(player, "harley")) then return false end 
				local effect = data:toSlashEffect()
				room:slashResult(effect, nil)      
				return true end
	elseif event==sgs.PhaseChange then
		if player:hasSkill("luanji") and player:getPhase()==sgs.Player_Start  then
	player:drawCards(2) 
	end
	if player:getMark("shensudraw")==1 then
	return player:getPhase()~=sgs.Player_Draw
	end
		if player:getPhase()==sgs.Player_Draw and player:hasSkill("buqu") and player:getHp()<1 then
		player:drawCards(2)
end
	if player:getPhase()==sgs.Player_Draw and player:hasSkill("luoyi") and player:askForSkillInvoke("warmbaby") then
	room:setPlayerFlag(player,"luoyi")
	elseif player:getPhase()==sgs.Player_Discard then
	if player:hasSkill("buqu") and player:getHp()<1 then
	room:askForDiscard(player, "buqu", player:getHandcardNum()-2, false, false)
	return true
	end
return	player:hasSkill("keji")
elseif player:getPhase()==sgs.Player_Finish then
if player:hasSkill("rende") then
player:drawCards(2)
 end
 player:loseAllMarks("speakers")
end
	elseif event==sgs.CardDiscarded then
	local card=data:toCard()
	if player:getPhase()==sgs.Player_Discard and player:hasSkill("qicai") and card:getSubcards():length()>2 then
	local list=sgs.SPlayerList()
	for _,p in sgs.qlist(room:getAlivePlayers()) do
	if p:isWounded() then
	list:append(p)
     	   end
		end
	if list:length()>0 and player:askForSkillInvoke("madamfeng") then
	     local t = room:askForPlayerChosen(player, list, "madamfeng")  
		 local r=sgs.RecoverStruct()
		 r.who=player
		 room:recover(t,r)
	end
	end
	elseif event==sgs.FinishJudge then
	local judge=data:toJudge()
	if judge.reason=="luoshen" and judge.card:isRed() then
	room:throwCard(judge.card)
	while(player:askForSkillInvoke("luoshen")) do
			
				room:playSkillEffect("luoshen")
				
				local judge1 = sgs.JudgeStruct()
				judge1.pattern = sgs.QRegExp("(.*):(spade|club):(.*)")
				judge1.good = true
				judge1.reason = "sophie"
				judge1.who = player
				room:judge(judge1)
				if(judge1:isBad()) then break end
				player:obtainCard(judge1.card)
			end

	end
	if player:hasSkill("wusheng") and judge.card:isBlack() then
	if judge.card:getSuit()==sgs.Card_Spade then suit=sgs.Card_Heart else suit=sgs.Card_Diamond end

	local card=sgs.Sanguosha:cloneCard(judge.card:objectName(),suit,judge.card:getNumber())
	card:addSubcard(judge.card)
	judge.card=card
	end
	elseif event==sgs.Damaged then
	local from=data:toDamage().from
	if data:toDamage().card:inherits("WushenSlash") then
	room:throwCard(c)
	 if player:hasSkill(c:objectName()) then
 room:detachSkillFromPlayer(player,c:objectName())
 end
  if player:getMark("@chaos")>0 then
 player:loseMark("@chaos")
 end
  local hp=player:getHp()

 if player:getGeneralName()=="sujiang" or player:getGeneralName()=="sujiangf" then
 			room:transfigure(player,player:getTag("generalh"):toString(),false,false)	
						local data=sgs.QVariant(hp)
   room:setPlayerProperty(player, "hp", data)
 end
	end
	if player:hasSkill("jushou") and not player:faceUp() then
	player:turnOver()
	player:drawCards(2)
	end
		if player:hasSkill("yiji") then
	player:drawCards(1)
		local hnum = player:getHandcardNum() --手牌数
			local cdlist = sgs.IntList()   --Int类型的list
			cdlist:append(player:handCards():at(hnum-1))   --插入刚摸的
			room:askForYiji(player, cdlist)
	end
	if player:hasSkill("fankui") and player:askForSkillInvoke("corrfluid") then
	local t = room:askForPlayerChosen(player, room:getOtherPlayers(from), "fankui")   
	if not t:isNude() then
				local card_id = room:askForCardChosen(player, t, "he", "fankui")
			if(room:getCardPlace(card_id) == sgs.Player_Hand) then
				room:moveCardTo(sgs.Sanguosha:getCard(card_id), player, sgs.Player_Hand, false)
			else
				room:obtainCard(player, card_id)
			end
			room:playSkillEffect("fankui")
end
	end
	elseif event==sgs.CardEffected then
		local effect=data:toCardEffect()
		if effect.card:inherits("Slash") and effect.card:isBlack() and effect.to:hasSkill("bazhen") then
			local log=sgs.LogMessage() --以下是无效的LOGTYPE
	log.type ="#SkillNullify"
	log.from=effect.to
	log.arg="renwang_shield" --技能名
	log.arg2=effect.card:objectName()
	room:sendLog(log)
		return true
		end
	if (effect.card:inherits("Dismantlement") or effect.card:inherits("Snatch")) and effect.from:askForSkillInvoke("nbequip") then		
if effect.card:inherits("Snatch") then
effect.from:obtainCard(c) 
else room:throwCard(c)
 end
  if player:getMark("@chaos")>0 then
 player:loseMark("@chaos")
 end
 if player:hasSkill(c:objectName()) then
 room:detachSkillFromPlayer(player,c:objectName())
 end
  local hp=player:getHp()

 if player:getGeneralName()=="sujiang" or player:getGeneralName()=="sujiangf" then
 			room:transfigure(player,player:getTag("generalh"):toString(),false,false)	
						local data=sgs.QVariant(hp)
   room:setPlayerProperty(player, "hp", data)
 end
	end
	elseif event==sgs.CardAsked and data:toString()=="jink" and player:hasSkill("longdan") then
	local as=room:askForCard(player,"peach","banana-ask")
	if (as:getEffectiveId()>-1) then
    local jink_card = sgs.Sanguosha:cloneCard("jink",sgs.Card_NoSuit,0)
    jink_card:setSkillName("longdan")
	jink_card:addSubcard(as)
    room:provide(jink_card)
    room:setEmotion(player, "good")
    return true
end
	elseif event==sgs.CardFinished then
	local card=data:toCardUse().card
	if card:getSkillName()=="shensu" and player:getPhase()==sgs.Player_Judge then
	player:drawCards(2)
	end
	elseif event==sgs.CardUsed then
	local effect=data:toCardUse()
	local card=data:toCardUse().card
			if card:inherits("LuanwuCard") and c:objectName()=="voodoo" then
			room:throwCard(c)
end
		if card:inherits("TianyiCard") and c:objectName()=="apple" then
		room:playSkillEffect("tianyi")
if effect.from:pindian(effect.to:first(),"tianyi",effect.card) then
player:obtainCard(effect.card)
room:setPlayerFlag(player,"tianyi_success")
end
return true
end
	if card:getSkillName()=="jijiu" and data:toCardUse().to:first():getSeat()~=player:getSeat() then
	data:toCardUse().to:first():gainMark("deathrisk")
	end
	if card:inherits("ZhihengCard") then
	player:drawCards(1)
	end
	if string.find(player:getGeneralName(),"zhangfei") and card:inherits("Slash") then
	player:gainMark("speakers")
	end
	end
end
}

Redsunglasses=sgs.CreateFilterSkill{
	name="redsunglasses",
	view_filter=function(self,to_select)
		return to_select:isBlack()
	end,
	view_as=function(self,card)
local suit
if card:getSuit()==sgs.Card_Spade then suit=sgs.Card_Heart else suit=sgs.Card_Diamond end
		local filtered=sgs.Sanguosha:cloneCard(card:objectName(), suit, card:getNumber())
		filtered:addSubcard(card)
		filtered:setSkillName(self:objectName())
		return filtered
	end
}
banana = sgs.CreateSkillCard
{
	name = "banana",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"banana","zhaoyun","",true) 
end,
} 

local cd=banana:clone()
cd:setSuit(sgs.Card_Spade)
cd:setNumber(10)
cd:setParent(extension)

sgs.NosLonghunPattern = {"slash", "peach"}
Banana = sgs.CreateViewAsSkill{
name = "banana", 
n = 1, 
view_filter = function(self, selected, to_select)
if #selected < 1 then
if sgs.NosLonghunPattern[1] == "true" and to_select:inherits("Peach") then
return true
elseif sgs.NosLonghunPattern[2] == "true" and (to_select:inherits("Slash") or to_select:inherits("Jink")) then
return true
end
end
return false
end, 
view_as = function(self, cards) 
if #cards == 1 then
local card = cards[1]
local new_card = nil
local suit = card:getSuit()
local number = card:getNumber()
if card:inherits("Peach") then
new_card = sgs.Sanguosha:cloneCard("slash", suit, number)
elseif card:inherits("Slash") or card:inherits("Jink") then
new_card = sgs.Sanguosha:cloneCard("peach", suit, number)
end
if new_card then
new_card:setSkillName("longdan")
new_card:addSubcard(card)
end
return new_card
end
end, 
enabled_at_play = function(self, player)
sgs.NosLonghunPattern = {"false", "false"}
local flag = false
if player:isWounded() then
sgs.NosLonghunPattern[2] = "true"
flag = true
end
if sgs.Slash_IsAvailable(player) then
sgs.NosLonghunPattern[1] = "true"
flag = true
end
return flag
end, 
enabled_at_response = function(self, player, pattern)
sgs.NosLonghunPattern = {"false", "false"}
if pattern == "slash" then
sgs.NosLonghunPattern[1] = "true"
return true
elseif string.find(pattern, "peach") then
sgs.NosLonghunPattern[2] = "true"
return true
end
return false
end,
}
lubricatingoil = sgs.CreateSkillCard
{
	name = "lubricatingoil",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"lubricatingoil","xiahoudun","ganglie",false) 
end,
} 

local cd=lubricatingoil:clone()
cd:setSuit(sgs.Card_Spade)
cd:setNumber(13)
cd:setParent(extension)

Lubricatingoil = sgs.CreateTriggerSkill
{
	name = "lubricatingoil",
	events = {sgs.Damaged},
	
	on_trigger=function(self, event, player, data)
		local room = player:getRoom()
		local from = data:toDamage().from
		source = sgs.QVariant(0)
		source:setValue(from)
		
		if(from and from:isAlive() and room:askForSkillInvoke(player, "lubricatingoil", source)) then
			room:playSkillEffect("lubricatingoil")
			
				if(not room:askForDiscard(from, "lubricatingoil", 2, true)) then
					local damage = sgs.DamageStruct()
					damage.from = player
					damage.to = from
					
					room:damage(damage)
				end
				room:setEmotion(player, "good")
			else
				room:setEmotion(player, "bad")
			end
	end
}
yaiba = sgs.CreateSkillCard
{
	name = "yaiba",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"yaiba","diaochan","",true) 
end,
} 

local cd=yaiba:clone()
cd:setSuit(sgs.Card_Heart)
cd:setNumber(4)
cd:setParent(extension)

telescope= sgs.CreateSkillCard
{
	name = "telescope",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach(source,"telescope","zhugeliang","guanxing",false) 
end,
} 
local cd=telescope:clone()
cd:setSuit(sgs.Card_Heart)
cd:setNumber(12)
cd:setParent(extension)
Telescope=sgs.CreateTriggerSkill{
 name = "telescope",
 events = {sgs.PhaseChange},
 frequency = sgs.Skill_Frequent,
 on_trigger=function(self,event,player,data)
  local room = player:getRoom()
  if (player:getPhase() == sgs.Player_Start) then
   if (not room:askForSkillInvoke(player,"telescope")) then return false end
    local x = room:alivePlayerCount()+1
    if x > 6 then 
     x = 6 
    end 
    room:doGuanxing(player,room:getNCards(x),false)
  end
 end,
}

amazonston= sgs.CreateSkillCard
{
	name = "amazonston",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach2(source,"amazonston","huangzhong","",false) 
end,
} 

local cd=amazonston:clone()
cd:setSuit(sgs.Card_Heart)
cd:setNumber(5)
cd:setParent(extension)
drum = sgs.CreateSkillCard
{
	name = "drum",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach2(source,"drum","zhoutai","",false) 
end,
} 

local cd=drum:clone()
cd:setSuit(sgs.Card_Diamond)
cd:setNumber(9)
cd:setParent(extension)

landrover= sgs.CreateSkillCard
{
	name = "landrover",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach2(source,"landrover","xiahouyuan","",true) 
end,
} 

local cd=landrover:clone()
cd:setSuit(sgs.Card_Club)
cd:setNumber(9)
cd:setParent(extension)


chiropter= sgs.CreateSkillCard
{
	name = "chiropter",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach2(source,"chiropter","weiyan","",false) 
end,
} 

local cd=chiropter:clone()
cd:setSuit(sgs.Card_Heart)
cd:setNumber(11)
cd:setParent(extension)
gnat= sgs.CreateSkillCard
{
	name = "gnat",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach2(source,"gnat","caoren","",false) 
end,
} 

local cd=gnat:clone()
cd:setSuit(sgs.Card_Club)
cd:setNumber(8)
cd:setParent(extension)

saw= sgs.CreateSkillCard
{
	name = "saw",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach2(source,"saw","zhangjiao","",true) 
end,
} 

--视为技 红牌
Saw=sgs.CreateViewAsSkill{
name="saw",
n=1,
view_filter=function(self, selected, to_select)        
        return to_select:inherits("BasicCard") --红牌即可 装备也行 若要过滤掉装备区的牌则要加 and not to_select:isEquiped()

end,
view_as=function(self, cards)
        if #cards==1 then 
        local acard=sgs.Sanguosha:cloneSkillCard("GuidaoCard")  
        acard:addSubcard(cards[1])        
        acard:setSkillName("guidao")
        return acard end
end,
enabled_at_play=function()
        return false        
end,
enabled_at_response=function(self,player,pattern)
        return pattern=="@guidao"     
end
}
--[[
Saw=sgs.CreateTriggerSkill{
        name="saw",
        events=sgs.AskForRetrial,--听说这个事件不需要cantrigger
        view_as_skill=Sawv,
        --frequency=sgs.Skill_Compulsory,
        on_trigger=function(self,event,player,data)
                local room=player:getRoom()
                local simashi=room:findPlayerBySkillName(self:objectName())
                local judge=data:toJudge()                --获取判定结构体        
                simashi:setTag("Judge",data)                --SET技能拥有者TAG

                local card=room:askForCard(simashi,"@@guide","@guidao",data)                --要求一张jicai_card   别忘了@jicai是询问字符串     
                if card~=nil then  -- 如果打出了        
                room:throwCard(judge.card) --原判定牌丢弃 
 simashi:obtainCard(judge.card)
        judge.card = sgs.Sanguosha:getCard(card:getEffectiveId()) --判定牌更改
        room:moveCardTo(judge.card, nil, sgs.Player_Special) --移动到判定区
            local log=sgs.LogMessage()  --LOG 以下是改判定专用的TYPE
            log.type = "$ChangedJudge"
            log.from = player
            log.to:append(judge.who)
            log.card_str = card:getEffectIdString()
            room:sendLog(log)
            room:sendJudgeResult(judge) 
                end
                return false --要FALSE~~
        end,        
}]]
local cd=saw:clone()
cd:setSuit(sgs.Card_Spade)
cd:setNumber(5)
cd:setParent(extension)
guhuoEXtypes={"Basic","Single","Multiple","EQW","EQA","EQH","EDT"} --类型
guhuoEXBasic={"slash","thunder_slash","fire_slash","jink","peach","analeptic"} --基本
guhuoEXSingle={"shit","collateral","ex_nihilo","duel","snatch","dismantlement","nullification","fire_attack"} --单体
guhuoEXMultiple={"amazing_grace","savage_assault","archery_attack","god_salvation","iron_chain"} --多目标锦囊
guhuoEXEQWeapon={"crossbow","double_sword","qinggang_sword","blade","spear","axe","halberd","kylin_bow","fan","guding_blade","moon_spear","sp_moonspear","yx_sword"} --武器
guhuoEXEQArmor={"eight_diagram","renwang_shield","vine","silver_lion","gale-shell"} --防具
guhuoEXEQHorse={"jueying","dilu","zhuahuangfeidian","chitu","dayuan","zixing","hualiu","monkey"} --马。。。猴
guhuoEXDT={"indulgence","lightning","supply_shortage","deluge","typhoon","earthquake","volcano","mudslide"}
guhuoPattern={} --日后扩展用


function invokelog(room,player,skillname)
	local log=sgs.LogMessage() --技能发动用的LOGTYPE,直接用
	log.from =player
	log.type="#InvokeSkill"
	log.arg=skillname
	room:sendLog(log)		
end

function guhuoEXlog(room,player,choice) --玩家是否质疑的结果LOG
        local log=sgs.LogMessage() 
        log.type = "#GuhuoQuery"
        log.from = player
        log.arg = choice
        room:sendLog(log)
end

function isStartswith(str,startchar) --判断pattern不是要求打出技能牌
	assert(type(str) == "string")
	assert(type(startchar) == "string")
	string.find(string.sub(str,1,1),startchar) 
end



function guhuoEXcore(room,splayer,card,user_string)    --询问质疑的流程及返回蛊惑EX的结果真假
	local log=sgs.LogMessage()	
    splayer:addToPile("guhuo_pile",card:getEffectiveId(), false)
    --room:moveCardTo(card, splayer, sgs.Player_Special, false)	  
    local questioned=sgs.SPlayerList()    
    for _,p in sgs.qlist(room:getOtherPlayers(splayer)) do
    	if(p:getHp() <= 0) then  --死的不质疑          
            log.type = "#GuhuoCannotQuestion"
            log.from = splayer
            log.arg = tostring(p:getHp())
            room:sendLog(log)
            room:setEmotion(p,"no-question")           
        else --询问
        	local choice =room:askForChoice(p,"magicwand","question+noquestion")
        	if(choice == "question")then
           		 room:setEmotion(p,"question")
				 questioned:append(p)            
        	else
            	 room:setEmotion(p,"no-question")
			end
			guhuoEXlog(room,p,choice)	--蛊惑选择LOG		
		end		 
    end	
    local success = false
    if(questioned:isEmpty())then --没人质疑就结果为真
        success = true
        for _,p in sgs.qlist(room:getOtherPlayers(splayer)) do
            room:setEmotion(p,".")
		end		
    else        
        local real =false
        if(user_string == "peach")then --桃的情况包括桃和酒
            real = (card:objectName() == "peach" or card:objectName() == "analeptic")
        else
            real = card:match(user_string)
		end
		if (real) then 
        success =(card:getSuit() == sgs.Card_Heart) --符合牌且为红桃
		end
        for _,p in sgs.qlist(questioned) do
            room:setEmotion(p,".")            
            if(real) then --是真牌流失
                room:loseHp(p)
            else
                p:drawCards(1) --假牌摸牌
            end
        end
	end	
    log.type = "$GuhuoResult" --蛊惑结果LOG
    log.from = splayer
    log.card_str = tostring(card:getId())
    room:sendLog(log)    
	if (not success) then room:throwCard(card) end
	return success
end

function guhuoEXvalidate(use,user_string) --修改USE
    local room = use.from:getRoom()
    room:playSkillEffect("guhuo")
    local log=sgs.LogMessage()
    if use.to:isEmpty() then --有无目标的LOGTPYE
	log.type = "#GuhuoNoTarget"
		else log.type = "#Guhuo"
	end
    log.from =use.from
    log.to =use.to
    log.arg =user_string
    room:sendLog(log)
	log=nil	
    if(guhuoEXcore(room,use.from,use.card,user_string)==true) then  --若牌真且红桃      
        local usecard = sgs.Sanguosha:cloneCard(user_string,use.card:getSuit(),use.card:getNumber())
        usecard:setSkillName("guhuo")
        usecard:addSubcard(use.card)
		use.card=usecard	
        return use --返回修改的CARDUSE结构体
    else
        return nil --否则返回空
	end	
end

function guhuoEXchosecard(room,player) --选择卡		
		local typelist="" --空串
		local cardlist="" --空串
		for v,t in ipairs(guhuoEXtypes) do
			if v==#guhuoEXtypes then typelist=typelist..t break end
			typelist=typelist..t.."+"						
		end
		local typemain= room:askForChoice(player,"guhuo",typelist) --要求选类型
		local cardtb={}		
		if typemain==guhuoEXtypes[1] then
			cardtb=guhuoEXBasic
		elseif typemain==guhuoEXtypes[2] then
			cardtb=guhuoEXSingle
        elseif typemain==guhuoEXtypes[3] then
			cardtb=guhuoEXMultiple
		elseif typemain==guhuoEXtypes[4] then
			cardtb=guhuoEXEQWeapon
		elseif typemain==guhuoEXtypes[5] then
			cardtb=guhuoEXEQArmor
		elseif typemain==guhuoEXtypes[6] then
			cardtb=guhuoEXEQHorse
		elseif typemain==guhuoEXtypes[7] then
			cardtb=guhuoEXDT			
        end	
		for v,cd in ipairs(cardtb) do
			if v==#cardtb then cardlist=cardlist..cd break end
			cardlist=cardlist..cd.."+"						
		end		
		local cname=room:askForChoice(player,"guhuo",cardlist) --要求选卡		
		return cname				
end


EXcard=sgs.CreateSkillCard{
name="EXcard",
will_throw=false,
target_fixed=false, 
filter=function(self,targets,to_select,player) --如果target_fixed~=true 此处返回第一张牌的targetFilter函数结果
	local card=sgs.Sanguosha:getCard(self:getSubcards():first())						
	local pl=sgs.PlayerList() --类型转换 targetFilter括号内的第一个参数是PlayerList类型
	for _,p in ipairs(targets) do
		pl:append(p)				
	end
   	return card:targetFilter(pl,player,to_select) and not player:isProhibited(to_select, card)
end,
on_use=function(self,room,source,targets)	
	    invokelog(room,source,"magicwand")				
		room:setTag("Guhuoing", sgs.QVariant(true))
		local cname=guhuoEXchosecard(room,source)	
		local use=sgs.CardUseStruct() --卡牌使用结构体
		use.card = sgs.Sanguosha:getCard(self:getSubcards():first())
		use.from = source
		for _,p in ipairs(targets) do
			use.to:append(p)				
		end			    
		local newuse=guhuoEXvalidate(use,cname)
		if newuse~=nil then
			room:useCard(newuse,false)  --如果原牌				
		end
		room:setTag("Guhuoing", sgs.QVariant(false))		
		if #guhuoPattern>0 then table.remove(guhuoPattern) end		
end		
}



Magicwand=sgs.CreateViewAsSkill{
name="magicwand", --这里改成跟原蛊惑一样就不会出错，否则只能2人局不崩溃 费解
n=1,
view_filter=function(self,selected,to_select)
	return(not to_select:isEquipped())--非装备区	
end,
view_as=function(self,cards)
	if #cards==1 then
		local acard=EXcard:clone()
   	 	acard:addSubcard(cards[1])	 --添加子卡		 	
		acard:setSkillName("guhuo")	--子卡技能名
		if cards[1]:targetFixed() then acard:setTargetFixed(true) acard.filter=nil end 	--根据使用的子卡更改目标选取范围	
		return acard
	end	
end,
enabled_at_play=function(self,player)       	
	return not player:isKongcheng() --有牌
end,
enabled_at_response=function(self,player,pattern)	
	 if (not player:isKongcheng()) and not (isStartswith(pattern,"@") or isStartswith(pattern,".")) then --有牌且不是要求打出技能牌等
	 table.insert(guhuoPattern,pattern)
	 return true
	 else return false end
end,
}


magicwand= sgs.CreateSkillCard
{
	name = "magicwand",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach2(source,"magicwand","yuji","",true) 
end,
} 

local cd=magicwand:clone()
cd:setSuit(sgs.Card_Spade)
cd:setNumber(10)
cd:setParent(extension)

chanel5= sgs.CreateSkillCard
{
	name = "chanel5",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach2(source,"chanel5","xiaoqiao","",false) 
end,
} 

local cd=chanel5:clone()
cd:setSuit(sgs.Card_Diamond)
cd:setNumber(13)
cd:setParent(extension)

switchbd= sgs.CreateSkillCard
{
	name = "switchbd",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach2(source,"switchbd","wolong","",false) 
end,
} 

local cd=switchbd:clone()
cd:setSuit(sgs.Card_Heart)
cd:setNumber(13)
cd:setParent(extension)

reijyutsu= sgs.CreateSkillCard
{
	name = "reijyutsu",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach2(source,"reijyutsu","pangtong","",false) 
end,
} 

local cd=reijyutsu:clone()
cd:setSuit(sgs.Card_Club)
cd:setNumber(12)
cd:setParent(extension)

Sansyouuo=sgs.CreateViewAsSkill{ --强袭EX视为技能
name="sansyouuo",
n=1,
view_filter=function(self, selected, to_select)
        return not to_select:isEquipped() --已经选择了0张 ，目标是武器
end,
view_as=function(self, cards)
if #cards==1 then
      local acard=sgs.Sanguosha:cloneSkillCard("QiangxiCard")
                acard:addSubcard(cards[1])
            acard:setSkillName(self:objectName())     
                return acard
        end
end,
enabled_at_play=function(self,player) 
return not player:hasUsed("QiangxiCard")
end,
enabled_at_response=function(self,player,pattern) 
        return false 
end
}
sansyouuo= sgs.CreateSkillCard
{
	name = "sansyouuo",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach2(source,"sansyouuo","dianwei","",true) 
end,
} 

local cd=sansyouuo:clone()
cd:setSuit(sgs.Card_Heart)
cd:setNumber(2)
cd:setParent(extension)

jiemingEXcard=sgs.CreateSkillCard{ --节命EX技能卡
name="jiemingEXcard",
filter=function(self,targets,to_select)
	if (#targets>=1) then return false end    
    return to_select:getHandcardNum()<to_select:getMaxHP()
end,
on_effect=function(self,effect)	--效果
	local room=effect.from:getRoom()
	local upper = effect.to:getMaxHP()
    local x = upper-effect.to:getHandcardNum()
	if x<1 then x=1 end
    effect.to:drawCards(x) --不超过补牌
end
}


Flack=sgs.CreateViewAsSkill{ --节命EX视为
name="flack",
n=0,
view_as=function(self, cards)
	if #cards==0 then 
	local acard=jiemingEXcard:clone()		
	return acard end
end,
enabled_at_play=function()
	return false 
end,
enabled_at_response=function(self,player,pattern) 
	return pattern == "@@jieming"
end
}

flack= sgs.CreateSkillCard
{
	name = "flack",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach2(source,"flack","xunyu","",true) 
end,
} 

local cd=flack:clone()
cd:setSuit(sgs.Card_Heart)
cd:setNumber(3)
cd:setParent(extension)
apple= sgs.CreateSkillCard
{
	name = "apple",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach2(source,"apple","taishici","",false) 
end,
} 

local cd=apple:clone()
cd:setSuit(sgs.Card_Club)
cd:setNumber(10)
cd:setParent(extension)

goldlock= sgs.CreateSkillCard
{
	name = "goldlock",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach2(source,"goldlock","yuanshao","",false) 
end,
} 

local cd=goldlock:clone()
cd:setSuit(sgs.Card_Spade)
cd:setNumber(11)
cd:setParent(extension)
Coffinlid = sgs.CreateTriggerSkill
{
	frequency=sgs.Skill_NotFrequent,
	name = "coffinlid",
	events = {sgs.SlashMissed},
	on_trigger=function(self,event,player,data)
		if event ==sgs.SlashMissed then
			local room = player:getRoom()
			local effect = data:toSlashEffect()
			if effect.to:isNude() then return false end
		if player:askForSkillInvoke("mengjin",data) then
local card_id = room:askForCardChosen(effect.from, effect.to, "he", "mengjin")
room:throwCard(card_id)
player:obtainCard(sgs.Sanguosha:getCard(card_id))
		end
		end
	end,		
}
coffinlid= sgs.CreateSkillCard
{
	name = "coffinlid",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach2(source,"coffinlid","pangde","mengjin",false) 
end,
} 

local cd=coffinlid:clone()
cd:setSuit(sgs.Card_Spade)
cd:setNumber(3)
cd:setParent(extension)
Tanbiv = sgs.CreateViewAsSkill
{--国色 by ibicdlcod
	name = "tanbi",
	n = 1,
	enabled_at_play=function(self,player)
	return player:getMark("shuangxiong")>0
	end,
	view_filter = function(self, selected, to_select)
	local value = sgs.Self:getMark("shuangxiong")
	local suit
	if value==2 and sgs.Self:hasFlag("tb") then
	suit=sgs.Card_Club
	elseif value==2 and not sgs.Self:hasFlag("tb") then
	suit=sgs.Card_Spade
	elseif value==1 and not sgs.Self:hasFlag("tb") then
	suit=sgs.Card_Heart
	elseif value==1 and sgs.Self:hasFlag("tb") then
	suit=sgs.Card_Diamond
	else
	suit=sgs.Card_NoSuit
	end
		return to_select:getSuit() == suit and not to_select:isEquipped()
	end,
	
	view_as = function(self, cards)
		if #cards == 1 then
			local card = cards[1]
			local new_card = sgs.Sanguosha:cloneCard("duel", card:getSuit(), card:getNumber())
			new_card:addSubcard(card:getId())
			new_card:setSkillName(self:objectName())
			return new_card
		end
	end
}

Tanbi = sgs.CreateTriggerSkill
{--洛神 by ibicdlcod
	name = "tanbi",
	view_as_skill=Tanbiv,
	events = {sgs.FinishJudge},
	priority=4,
	on_trigger = function(self, event, player, data)
local room=player:getRoom()
			local judge = data:toJudge()
	if judge.reason=="shuangxiong" then
	player:speak("fuck")
	if judge.card:getSuit()==sgs.Card_Spade or judge.card:getSuit()==sgs.Card_Heart then
	room:setPlayerFlag(player,"tb")
	end
	end
end
}





tanbi= sgs.CreateSkillCard
{
	name = "tanbi",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach2(source,"tanbi","yanliangwenchou","",true) 
end,
} 

local cd=tanbi:clone()
cd:setSuit(sgs.Card_Club)
cd:setNumber(7)
cd:setParent(extension)


hydrogen= sgs.CreateSkillCard
{
	name = "hydrogen",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach2(source,"hydrogen","caopi","",false) 
end,
} 

local cd=hydrogen:clone()
cd:setSuit(sgs.Card_Heart)
cd:setNumber(1)
cd:setParent(extension)

voodoo= sgs.CreateSkillCard
{
	name = "voodoo",	
	target_fixed = true,	
	will_throw = true,
on_use=function(self,room,source,target)
 NBattach2(source,"voodoo","jiaxu","",true) 
 source:gainMark("@chaos")
end,
} 

local cd=voodoo:clone()
cd:setSuit(sgs.Card_Diamond)
cd:setNumber(1)
cd:setParent(extension)

TempSkill(Underwear)
TempSkill(Dustbin)
TempSkill(nbskill)
TempSkill(Whip)
TempSkill(Stimulant)
TempSkill(Corrfluid)
TempSkill(Cologne)
TempSkill(Redsunglasses)
TempSkill(Animals)
TempSkill(Flashlight)
TempSkill(Lubricatingoil)
TempSkill(Rollingpin)
TempSkill(Yaiba)
TempSkill(Deathrisk)
TempSkill(Telescope)
TempSkill(Banana)
TempSkill(Saw)
TempSkill(Landrover)
TempSkill(Magicwand)
TempSkill(Sansyouuo)
TempSkill(Flack)
TempSkill(Coffinlid)
TempSkill(Tanbi)

sgs.LoadTranslationTable{
	["newbility"] = "牛逼神装", 
	["newbility_general"] = "牛逼神将",
	["skill_card"] = "牛逼牌",
	["nbequip"] = "牛逼神装",
	["niubi-getout:player"] = "只加载登场武将的神装",
	["niubi-getout:player2"] = "只加载登场武将的神装(含双将)",
	["niubi-getout:package"] = "只加载所选扩展包的神装",
	["niubi-getout:cancel"] = "加载全部神装",
	["#NiubiSelect"] = "您现在玩的是<font color=red><b>牛逼神装系列<b></font>重阳版扩充包。 by:宇文天启<br/>%from 选择了 %arg",
	["niubiplayer"] = "只加载登场武将的神装",
	["niubiplayer2"] = "只加载登场武将(包括副将)的神装",
	["niubipackage"] = "只加载所选扩展包的神装",
	["niubicancel"] = "加载全部神装",

	["shixie"] = "士燮", 
	["designer:shixie"] = "宇文天启",
	["cv:shixie"] = "",
	["wutian"] = "无天",
	[":wutian"] = "回合结束阶段，若你已受伤或手牌数为全场最少，你可以分别展示1~2名拥有两张以下墙牌的角色的一张牌，视为该角色将这张牌当做【墙】使用", 
	["@wutian"] = "你可以指定1~2名合理的角色并分别展示他们的一张牌",
	["wuzheng"] = "无争",
	[":wuzheng"] = "主公技，游戏开始时，你可以选择和任意一名角色交换身份牌",
	["wuzheng:yes"] = "将主公身份转交给其他角色",
	["wuzheng-info"] = "你的身份(你要牢记你现在的身份)",

	["kanze"] = "阚泽", 
	["designer:kanze"] = "宇文天启",
	["cv:kanze"] = "",
	["leiluo"] = "磊落",
	[":leiluo"] = "内奸技，锁定技，你的身份视为忠臣", 
	["diezhi"] = "谍智",
	[":diezhi"] = "限定技，出牌阶段，你可令除你之外的每名角色依次猜你的身份，若猜对，该角色摸3张牌，若猜错，先受到来自你的一点火焰伤害，再受到来自自己的一点雷电伤害，最后失去一点体力",
	["$diezhi"] = "古今多少事，都付笑谈中",
	["@drig"] = "浮标",
	["drig-guess"] = "阚泽身份猜猜看",

	["miheng"] = "祢衡",
	["designer:miheng"] = "Log67、宇文天启",
	["cv:miheng"] = "",
	["yulu"] = "语录",
	[":yulu"] = "出牌阶段，你可以将2~5张手牌按一定顺序移出游戏作为语录的词汇：红桃视为〖我〗，黑桃视为〖日〗，方片视为〖你〗，梅花视为〖妹〗",
	["numa"] = "怒骂",
	[":numa"] = "回合结束阶段，你可以大声朗读（使用）当前语录（见详解）",
	["jieao"] = "桀骜",
	[":jieao"] = "锁定技，回合开始阶段，若你的手牌数小于当前体力值，立即摸2张牌",
	["word"] = "语录表",
	["yuluword"] = "请选择一张手牌加入语录表",
	["numah"] = "我",
	["numas"] = "日",
	["numad"] = "你",
	["numac"] = "妹",
	["#Numasingle"] = "%from 说：%arg",
	["#Numa_hc"] = "语录词汇匹配成功！效果：回复1点体力",
	["#Numa_dc"] = "语录词汇匹配成功！效果：令一名角色弃掉两张手牌",
	["#Numa_cc"] = "语录词汇匹配成功！效果：清空一名角色的判定区",
	["#Numa_sd"] = "语录词汇匹配成功！效果：令一名其他角色给你一张手牌，然后其回复1点体力",
	["#Numa_hs"] = "语录词汇匹配成功！效果：做一次判定，若为桃或桃园结义，你永久获得技能【反唇】（你可以把对你造成伤害的牌加入语录）",
	["fanchun"] = "反唇",
	[":fanchun"] = "祢衡专用隐藏技，你可以把对你造成伤害的牌加入语录表",
	["#Numa_hsc"] = "语录词汇匹配成功！效果：指定一名其他女性角色，你和她各回复1点体力",
	["#Numa_hsd"] = "语录词汇匹配成功！效果：指定一名其他男性角色，你和他各回复1点体力",
	["#Numa_dsh"] = "语录词汇匹配成功！效果：令一名角色对你使用【杀】，否则将所有牌给你",
	["#Numa_sdc"] = "语录词汇匹配成功！效果：视为对任意一名角色使用一张【杀】；若〖日〗牌点数小于5，此杀为雷杀，若大于9，此杀为火杀",
	["#Numa_shc"] = "语录词汇匹配成功！效果：令一名角色对自己造成1点伤害，然后其回复一点体力",
	["#Numa_hhh"] = "语录词汇匹配成功！效果：将自己翻面并摸三张牌",
	["#Numa_sss"] = "语录词汇匹配成功！效果：令一名角色翻面并摸X张牌，X为你损失的体力",
	["#Numa_ddd"] = "语录词汇匹配成功！效果：将自己当前语录表的词汇牌给一名角色",
	["#Numa_ccc"] = "语录词汇匹配成功！效果：清空一名角色的装备区",
	["#Numa_dcdc"] = "语录词汇匹配成功！效果：指定一名角色开始一个额外的回合",
	["#Numa_hsdc"] = "语录词汇匹配成功！效果：视为喝酒后对任意一名角色使用一张【杀】",
	["#Numa_ccsh"] = "语录词汇匹配成功！效果：回复体力至体力上限",
	["#Numa_dsdc"] = "语录词汇匹配成功！效果：令一名角色观看另一名角色的手牌",
	["#Info_dsdc"] = "%from 观看了 %to 的手牌",
	["#Numa_dshc"] = "语录词汇匹配成功！效果：自杀",
	["numat"] = "测试员特权",
	["numat:kno"] = "不，还不能死！",
	["numat:kyes"] = "不想活了……",
	["#Numa_dshcc"] = "语录词汇匹配成功！效果：弃掉一名角色四张牌，之后对自己造成2点伤害",
	["#Numa_hsdcc"] = "语录词汇匹配成功！效果：限定技，对一名角色连续造成1点雷电伤害、1点火焰伤害、1点无属性伤害，之后自己流失2点体力",
	["#Numa_dcshc"] = "语录词汇匹配成功！效果：限定技，自减1点体力并从每名角色那里获得一张手牌，然后将你的武将牌翻面",
	["#Numa_ssdcc"] = "语录词汇匹配成功！效果：限定技，立即激活场上存在的一个【闪电】",
	["#Numa_ssscc"] = "语录词汇匹配成功！效果：限定技，指定一名体力上限比你多的角色并令其进行二选一：1.增加2点体力上限并永久获得技能【崩坏】；2.增加1点体力上限并永久获得技能【无谋】",
	["numa:bthx"] = "MaxHP+2，获得【崩坏】",
	["numa:wump"] = "MaxHP+1，获得【无谋】",
	["#Numa_4wd"] = "语录词汇貌似匹配完成……效果：觉醒技，增加2点体力上限并失去当前的所有技能",
	["#Numa_tequan"] = "%from 使用了测试员特权，取消了当前语法的效果",
	["numat:suno"] = "我不要变素将！",
	["numat:suyes"] = "变素将？我喜欢~",
	["#Numa_5wd"] = "语录词汇匹配紊乱……效果：觉醒技，减去1点体力上限并永久获得技能【龙魂】",
	["numat:lhno"] = "龙魂神马的最讨厌了！",
	["numat:lhyes"] = "龙魂？神技啊，我喜欢~",
	["#Numa_wds"] = "语录系统故障，原因为负载过多……效果：觉醒技，减去2点体力上限并永久获得技能【无言】和【不屈】",
	["#Numa_git"] = "语录词汇匹配失败！你没有获得任何效果",

	["ganmi"] = "甘氏﹠糜氏",
	["designer:ganmi"] = "塞克洛",
	["cv:ganmi"] = "",
	["yuren"] = "玉人",
	[":yuren"] = "弃牌阶段，你可以将弃牌交给一名男性角色，则直到你的下回合开始前，该男性角色回复体力时你也回复等量体力",
	["@yuren"] = "囍字",
	["#Yuren_rov"] = "%from 触发了【%arg】，%to 受到影响",
	["zhenlie"] = "贞烈",
	[":zhenlie"] = "当你进入濒死状态时，你可以将你的所有牌交给一名男性角色，并令其进行一个额外的回合。若如此做，你立刻死亡",


	["tensb"] = "十常侍",
	["designer:tensb"] = "宇文天启",
	["cv:tensb"] = "",
	["nongquan"] = "弄权",
	[":nongquan"] = "游戏开始时，获得10枚“权”标记；当你濒死时，可以弃掉一枚“权”标记，将体力设为1点，并摸三张牌后重置你的武将牌",
	["@quan"] = "权",
	["beigong"] = "被宫",
	[":beigong"] = "锁定技，你永远跳过摸牌阶段和弃牌阶段",
	["yinfu"] = "隐伏",
	[":yinfu"] = "隐藏技，当某个条件触发后，你获得一枚“权”标记，一共两次",
	["#Yinfu"] = "%from 触发了隐藏技能【%arg2】，还可以触发 %arg 次",

	["yanbh"] = "严白虎",
	["designer:yanbh"] = "俊逸不凡",
	["cv:yanbh"] = "",
	["jielue"] = "劫掠",
	[":jielue"] = "出牌阶段，你使用的【杀】指定目标后，可先附带拼点的效果，若你赢，你获得目标角色的拼点牌",

--card
	["juice_peach"] = "水桃",
	[":juice_peach"] = "出牌时机：1、出牌阶段。2、有角色处于濒死状态时<br/>使用目标：1、任意一名已受伤角色。2、处于濒死状态的一名角色<br/>作用效果：目标角色回复1点体力<br/>★触发连环后的效果：被连环的角色依次解除连环状态并回复1点体力",
	["#IronChainRecover"] = "%from 处于铁索连环状态，将受到铁索的传导回复",

	["stink"] = "屁",
	[":stink"] = "出牌阶段对下家使用，除非目标角色打出一张【闪】，否则必须和自己的下家（你的下下家）交换位置",
	["haochou"] = "你的上家对你放了一个臭屁，除非你打出一张【闪】来抵挡，否则就赶紧逃吧……",

	["wall"] = "墙",
	[":wall"] = "出牌阶段对自己使用，将墙移出游戏，视为墙牌。锁定技，当你拥有墙牌时，若受到不小于1点的伤害时，自动弃掉一张墙，令伤害-1；回合外无法流失体力<br/>★无论你一次受到多少点伤害，只能抵消1点<br/>★伤害为0也是伤害，和抵消伤害不同，于是反馈，刚烈等技能依然可以发动",
	["$WallProtect"] = "%to 的 墙牌 %card 承受了 %from 对 %to 的 <b>1</b> 点伤害",
	["#WallForbidden"] = "%from 有墙护身，体力流失对其无效",
    ["WushenSlash"]="冰杀",
	[":WushenSlash"]="出牌时机：出牌阶段\
使用目标：除你外，你攻击范围内的一名角色\
作用效果：【杀】对目标角色造成1点伤害，若对方装有牛逼神装，你可以弃置之",
	["poison"] = "毒",
	[":poison"] = "出牌阶段，对和你距离为1以内的一名角色使用，令其进入中毒状态或解除中毒状态。进入中毒状态的角色有以下负面效果：<br/>1、回合开始阶段受到自己对自己的一点伤害。<br/>2、使用酒时立即死亡<br/>使用方块桃可以为自己解毒；黑桃桃自动中毒；毒的有效期为3回合",
	["#Poison_in"] = "%from 不幸中毒，脸色青紫，看起来情况不是很好",
	["#Poison_out"] = "%from 解毒成功，身体恢复了健康",
	["#Poison_hurt"] = "%from 毒发，剧痛难忍，将自己抓出了条条血痕",
	["#Poison_auto"] = "%from 用惊人的毅力战胜了毒瘾，自我救赎成功！",
	["#Poison_die"] = "%from 身中剧毒还喝酒，不幸毒发，周身溃烂，眼见是不能活了",

	["clear_shirt"] = "渌水罗衣",
	[":clear_shirt"] = "锁定技，装备在你下家的装备区内，装备者对其上家造成的伤害始终无效",
	["#CSProtect"] = "因为【%arg2】的影响，%from 受到的 %arg 点伤害无效",

	["sacrifice"] = "舍己为人",
	[":sacrifice"] = "出牌时机：出牌阶段。\
使用目标：任意一名已受伤的角色。\
作用效果：你失去一点体力，令目标回复一点体力",

--standard
	["#Thrownb"] = "%from 拾金不昧，将 %arg 交了公",

	["corrfluid"] = "修正液", 
	["stimulant"] = "兴奋剂", 
	["madamfeng"] = "励志照片",
	["cologne"] = "古龙水",
	["harley"] = "哈雷摩托",
	["dustbin"] = "垃圾桶",
	["telescope"] = "天文望远镜",
	["flashlight"] = "手电筒",
	["speakers"] = "扩音喇叭",
	["rollingpin"] = "擀面杖",
	["warmbaby"] = "暖宝宝",	
	["linctus"] = "止咳糖浆",
	["deathrisk"] = "死亡险",
	["towel"] = "毛巾",
	["lubricatingoil"] = "润滑油",
	["underwear"] = "爱心内衣",
	["whip"] = "皮鞭",
	["eyedrops"] = "眼药水",
	["animals"] = "禽兽图",
	["urban"] = "神秘装备",
	["redsunglasses"] = "红色墨镜",
	["brainplatinum"] = "脑白金",
	["sophie"] = "苏菲夜用",
	["yaiba"] = "面具",
	["banana"] = "香蕉",
	["Basic"]= "基本牌",
	["Single"]= "单体锦囊",
	["Multiple"]= "多目标锦囊",
	["EQW"]= "武器",
	["EQA"]= "防具",
	["EQH"]= "草泥马",
	["EDT"]= "延时类锦囊",

	["whip_yes"] = "重重鞭挞",
	["whip:no"] = "一般鞭挞",
	["red-slash"] = "你可以发动神装特效，对目标攻击范围内的另一目标追杀",
	["red-damage"] = "你可以发动神装特效，指定目标距离为1的另一目标",
	["#PaoxiaoBuff"] = "%from 使用了扩音喇叭，将伤害从 %arg 点扩大至 %arg2 点",

	[":corrfluid"] = "<br/><font color='blue' size='5' face='华文新魏'>司马改改专用</font>：<br/>【鬼才】可以使用已装备的装备牌；每次发动【反馈】可以从包括伤害来源在内的两名角色那里各获得一张牌",
	[":stimulant"] = "<br/><font color='blue' size='5' face='华文新魏'>曹收收专用</font>：<br/>不受【乐不思蜀】影响", 
	[":madamfeng"] = "<br/><font color='red' size='5' face='华文新魏'>黄哼哼专用</font>：<br/>若弃牌阶段弃掉的牌数大于两张，可指定一名角色回复1点体力",
	[":harley"] = "<br/><font color='red' size='5' face='华文新魏'>马突突专用</font>：<br/>【铁骑】不需判定直接生效",
	[":telescope"] = "<br/><font color='red' size='5' face='华文新魏'>诸葛看看专用</font>：<br/>【观星】可多看一张牌",
	[":flashlight"] = "<br/><font color='blue' size='5' face='华文新魏'>张抢抢专用</font>：<br/>【突袭】可额外指定一个目标",
	[":warmbaby"] = "<br/><font color='blue' size='5' face='华文新魏'>许破破专用</font>：<br/>【裸衣】无需少摸一张牌（发动暖宝宝后不要发动“裸衣”！）",	
	[":linctus"] = "<br/><font color='blue' size='5' face='华文新魏'>郭咳咳专用</font>：<br/>【遗计】每点伤害可额外摸一张牌",
	[":towel"] = "<br/><font color='green' size='5' face='华文新魏'>吕憋憋专用</font>：<br/>【克己】无条件限制",
	[":lubricatingoil"] = "<br/><font color='blue' size='5' face='华文新魏'>夏侯爆爆专用</font>：<br/>【刚烈】不需判定直接生效",
	[":underwear"] = "<br/><font color='green' size='5' face='华文新魏'>乔乐乐专用</font>：<br/>【流离】无条件限制",
	[":whip"] = "<br/><font color='green' size='5' face='华文新魏'>黄鞭鞭专用</font>：<br/>【苦肉】时可直接选择失去2点体力并摸5张牌",
	[":eyedrops"] = "<br/><font color='red' size='5' face='华文新魏'>刘发发专用</font>：<br/>你的回合结束后，摸两张牌",
	[":urban"] = "<br/><font color='green' size='5' face='华文新魏'>甘拆拆专用</font>：<br/>若你使用的【过河拆桥】是梅花花色，则可以获得被拆掉的牌",
	[":redsunglasses"] = "<br/><font color='red' size='5' face='华文新魏'>关红红专用</font>：<br/><b>锁定技<b/>，你的黑桃牌视为红桃，梅花牌视为方片。",
	[":brainplatinum"] = "<br/><font color='green' size='5' face='华文新魏'>孙换换专用</font>：<br/>【制衡】可额外摸一张牌",
	[":sophie"] = "<br/><font color='blue' size='5' face='华文新魏'>甄洛洛专用</font>：<br/>【洛神】判定出的第一张红牌无效",
	[":yaiba"] = "<br/><font color='black' size='5' face='华文新魏'>貂失失专用</font>：<br/>【离间】可指定任意性别角色",
	[":banana"] = "<br/><font color='red' size='5' face='华文新魏'>赵喝喝专用</font>：<br/>你每打出一张【闪】，视为对任意一名角色使用了一张【杀】",
	[":speakers"] = "<br/><font color='red' size='5' face='华文新魏'>张吼吼专用</font>：<br/>若你的第2张【杀】没有被闪避，则伤害+1",	
	[":cologne"] = "<br/><font color='green' size='5' face='华文新魏'>周选选专用</font>：<br/>【反间】可以自行选择亮出的手牌（附加功能：【反间】的流程恢复一桃三血经典流程）",

	[":dustbin"] = "<br/><font color='green' size='5' face='华文新魏'>陆连连专用</font>：<br/>出牌阶段你可以主动弃掉一张手牌",
	[":animals"] = "<br/><font color='black' size='5' face='华文新魏'>吕双双专用</font>：<br/>你可以将黑桃锦囊牌当【决斗】使用",
	[":deathrisk"] = "<br/><font color='black' size='5' face='华文新魏'>华救救专用</font>：<br/>当一名被你使用两次以上【急救】的角色死亡时，可以摸三张牌",
	[":rollingpin"] = "<br/><font color='green' size='5' face='华文新魏'>孙睡睡专用</font>：<br/>【结姻】可不指定目标",

	["#Nstandard"] = "%from 得到了 %arg", 
--wind
	["saw"] = "电锯",
	["amazonston"] = "天河石",
	["gnat"] = "白纹伊蚊",
	["magicwand"] = "魔术棒",
	["chanel5"] = "香奈儿5号",
	["landrover"] = "陆虎",
	["chiropter"] = "青翼蝙蝠",
	["drum"] = "破铁桶",

	[":saw"] = "<br/><font color='black' size='5' face='华文新魏'>妙脆角专用</font>：<br/>【鬼道】可使用全部基本牌",
	[":amazonston"] = "<br/><font color='red' size='5' face='华文新魏'>穿羊忠专用</font>：<br/>【烈弓】可以回合外发动；你的【杀】命中后，自动弃掉目标装备区里的所有装备",
	[":gnat"] = "<br/><font color='blue' size='5' face='华文新魏'>蹲坑仁专用</font>：<br/>当你的武将牌背面朝上状态时受到伤害，可立即翻回正面并摸两张牌",
	[":magicwand"] = "<br/><font color='black' size='5' face='华文新魏'>骗子吉专用</font>：\
	<b><font color='blue'>★你【蛊惑】的目标选取范围为你用来蛊惑的卡牌的目标选取范围</font></b>\
<b><font color='green'>★你可以【蛊惑】你的装备及马匹任及延时类锦囊</font></b>",
	[":chanel5"] = "<br/><font color='green' size='5' face='华文新魏'>天香乔专用</font>：<br/>发动【天香】后可自由选择摸牌的角色",
	[":landrover"] = "<br/><font color='blue' size='5' face='华文新魏'>二刀渊专用</font>：<br/>【神速1】只跳过判定阶段；【神速2】不用弃装备牌",
	[":chiropter"] = "<br/><font color='red' size='5' face='华文新魏'>吸血延专用</font>：<br/>发动【狂骨】前若你没有受伤，立即摸两张牌",
	[":drum"] = "<br/><font color='green' size='5' face='华文新魏'>僵尸泰专用</font>：<br/>当你处于不屈状态时，摸牌阶段额外摸2张牌，弃牌阶段可以保留2张手牌",
 
    ["EXcard"] = "蛊惑强化版",

	["$saw"] = "我的雷公锯呢？谁偷走了我的雷公锯？(角哥哭泣)",
	["$amazonston"] = "就在这块石头中，藏着神秘的力量……(老黄钻研)",
	["$gnat"] = "什么？白纹伊蚊是国家五级保护动物，不能打？(仁哥纳闷)",
	["$magicwand"] = "你们的命运掌握在你们自己手中。(于爷耸肩)",
	["$chanel5"] = "这不是传说中的世界著名香水么？公瑾我爱你……(小乔幸福)",
	["$landrover"] = "都让开！我爸是夏侯刚！(二刀嚣张)",
	["$chiropter"] = "再努力修炼几年，我就能变成青翼蝠王！(小魏憧憬)",
	["$drum"] = "僵尸也需要社会去关爱！植物神马的最讨厌了(老周宣布)",

--thicket
	["hydrogen"] = "氢气球",
	["tranqgun"] = "麻醉枪",
	["ghostcar"] = "鬼车",
	["snake"] = "蛇",
	["voodoo"] = "巫毒娃娃",
	["tombstone"] = "墓碑",
	["snapshot"] = "还原卡",
	["fuckav"] = "AV终结者",

	[":hydrogen"] = "<br/><font color='blue' size='5' face='华文新魏'>曹痞子专用</font>：<br/>发动【放逐】后，你自己摸放逐牌",
	[":tranqgun"] = "<br/><font color='blue' size='5' face='华文新魏'>徐城管专用</font>：<br/>在任意角色摸牌阶段摸牌前，你可以弃掉一张梅花手牌，令该角色做一次判定，若不为梅花，其跳过摸牌阶段",
	["tranqgun_ask"] = "请弃掉一张梅花牌",
	[":ghostcar"] = "<br/><font color='green' size='5' face='华文新魏'>孙厉鬼专用</font>：<br/>【英魂】改为摸0张弃X张或摸X+1张弃1张",
	[":snake"] = "<br/><font color='green' size='5' face='华文新魏'>鲁农夫专用</font>：<br/>【好施】可以指定任意角色，若如此做，本回合发动【缔盟】需额外弃1张牌",
	[":voodoo"] = "<br/><font color='black' size='5' face='华文新魏'>贾巫妖专用</font>：<br/>装备后，【巫毒娃娃】可视为一个乱武标记",
	[":tombstone"] = "<br/><font color='black' size='5' face='华文新魏'>董魔王专用</font>：<br/>你每回合无条件崩坏且只崩体力；你使用【杀】或【屎】造成的伤害统统+1",
	["#TombBuff"] = "%from 的墓碑产生效果，伤害从 %arg 点上升至 %arg2 点",
	[":snapshot"] = "<br/><font color='red' size='5' face='华文新魏'>孟不服专用</font>：<br/>每次发动【再起】时的摸牌数为你的体力上限",
	[":fuckav"] = "<br/><font color='red' size='5' face='华文新魏'>祝你妹专用</font>：<br/>【巨象】可以回收【万箭齐发】；【烈刃】拼点失败后可将对方武将牌翻面",

	["$hydrogen"] = "痞极再来：再见了您那~~",
	["$tranqgun"] = "城管执法：此山是我栽，此树是我开，草上不开花，休想摸此牌！",
	["$ghostcar"] = "化鬼成车：犯我江东，虽远必诛！",
	["$snake"] = "鲁肃有约：别以为我有了蛇就是农夫了……",
	["$voodoo"] = "蛊毒天下：为我而疯狂、为我而战斗吧……",
	["$tombstone"] = "六道魔王：神罗之躯，君临天征！",
	["$snapshot"] = "还原精灵：推倒重来~这次我一定赢！",
	["$fuckav"] = "AV你妹：渗入，破坏，妙哉妙哉~~ ps:防火防盗防自来也……",

--fire
	["switchbd"] = "交换机",
	["reijyutsu"] = "通灵术卷轴",
	["apple"] = "苹果",
	["goldlock"] = "金锁",
	["tanbi"] = "耽美小说",
	["sansyouuo"] = "山椒鱼",
	["flack"] = "长颈瓶",
	["coffinlid"] = "棺材盖",

	[":switchbd"] = "<br/><font color='red' size='5' face='华文新魏'>窝窝龙专用</font>：<br/>此装备同时拥有八卦阵和仁王盾的功能",
	[":reijyutsu"] = "<br/><font color='red' size='5' face='华文新魏'>胖大桶专用</font>：<br/>若你拥有涅槃标记，则取消涅槃的限定技效果",
	[":apple"] = "<br/><font color='green' size='5' face='华文新魏'>瓷师太专用</font>：<br/>【天义】拼点成功可以收回你的拼点牌；拼点失败没有负面影响",
	[":goldlock"] = "<br/><font color='black' size='5' face='华文新魏'>圆勺子专用</font>：<br/>回合开始阶段摸两张牌；回合内任何伤害对你无效",
	[":tanbi"] = "<br/><font color='black' size='5' face='华文新魏'>熊一双专用</font>：<br/>【双雄】判定后，你可以将不同花色的牌当决斗使用",
	[":sansyouuo"] = "<br/><font color='blue' size='5' face='华文新魏'>微电波专用</font>：<br/>发动【强袭】时，你可以用弃掉一张手牌代替失去的1点体力",
	[":flack"] = "<br/><font color='blue' size='5' face='华文新魏'>狗不惑专用</font>：<br/>【节命】改为摸体力上限张数的牌，没有最大值限制",
	[":coffinlid"] = "<br/><font color='black' size='5' face='华文新魏'>公德榜专用</font>：<br/>【猛进】可以获得弃掉的那张牌",

	["$switchbd"] = "主公且看亮的新发明！(孔明兴奋)",
	["$reijyutsu"] = "忍法·三千凤凰之术！(士元结印)",
	["$apple"] = "谁偷了我的爱疯……(子义抓狂)",
	["$goldlock"] = "不离不弃，名门永继！(本初祷告)",
	["$tanbi"] = "哥，我们好久没那个了……好吧，今晚来我家……(颜文密谋)",
	["$sansyouuo"] = "我要的是傀儡山椒鱼啊……把这个大鲵拿走！(恶来发飙)",
	["$flack"] = "一瓶在手，卖血无忧~(文若狂笑)",
	["$coffinlid"] = "再看，再看我就一棺材盖拍死你！(令明怒目)",

--mountain
	["nunchaku"] = "双截棍",
	["ruan"] = "阮",
	["globe"] = "地球仪",
	["wookon"] = "大圣旗",
	["greatmug"] = "紫金钵盂",
	["goooo"] = "炼妖壶",
	["hundan"] = "魂淡",
	["tizanidine"] = "替扎尼定",

	[":nunchaku"] = "<br/><font color='blue' size='5' face='华文新魏'>张合理专用</font>：<br/>当你发动【巧变】跳过出牌阶段时，你依然拥有出牌阶段",
	[":ruan"] = "<br/><font color='black' size='5' face='华文新魏'>蔡妹纸专用</font>：<br/>你可以无条件发动【悲歌】",
	[":globe"] = "<br/><font color='green' size='5' face='华文新魏'>张经纬专用</font>：<br/>你始终无视【直谏】的限制条件",
	[":wookon"] = "<br/><font color='blue' size='5' face='华文新魏'>邓大圣专用</font>：<br/>出牌阶段，你可以将一张牌移出游戏，视为“田”",
	[":greatmug"] = "<br/><font color='red' size='5' face='华文新魏'>姜某人专用</font>：<br/>发动【挑衅】成功后，可以获得被弃掉的牌",
	[":goooo"] = "<br/><font color='black' size='5' face='华文新魏'>左大仙专用</font>：<br/>当你在回合外失去牌时，自动获得一张化身牌",
	[":hundan"] = "<br/><font color='green' size='5' face='华文新魏'>孙老大专用</font>：<br/>回合开始阶段，你可以立即激活自己的觉醒技【魂姿】",
	[":tizanidine"] = "<br/><font color='red' size='5' face='华文新魏'>刘产儿专用</font>：<br/>发动【放权】时不用弃牌",

	["$nunchaku"] = "什么叫合理？我说的就叫合理！(张郃声明)",
	["$ruan"] = "如怨如慕，如泣如诉……(文姬悲歌)",
	["$globe"] = "老夫是慈善家，不是捡破烂的……(经纬直言)",
	["$wookon"] = "搜囊探宝，飞龙探云！(邓艾巡视)",
	["$greatmug"] = "这个不是唐僧用的么……(姜维疑惑)",
	["$goooo"] = "有此壶方能定天下。(左慈颔首)",
	["$hundan"] = "谁能告诉我这是什么东西？(孙策不解)",
	["$tizanidine"] = "啊，什么好吃的东西？(刘禅嘴馋)",
	
--sp	
	["nailclippers"] = "指甲刀",
	["morin_khuur"] = "马头琴",
	["greatchair"] = "龙椅",
	
	[":nailclippers"] = "<br/><font color='blue' size='5' face='华文新魏'>杨小儿专用</font>：<br/>当你被指定为单体锦囊的目标时，立即摸一张牌",
	[":morin_khuur"] = "<br/><font color='black' size='5' face='华文新魏'>公孙小白专用</font>：<br/>你始终拥有【义从】的两种效果",
	[":greatchair"] = "<br/><font color='black' size='5' face='华文新魏'>袁大头专用</font>：<br/>摸牌阶段你至少摸3张【庸肆】牌，弃牌阶段你至多弃2张【庸肆】牌",

	["$nailclippers"] = "这真是一个伟大的发明！(德祖赞叹)",
	["$morin_khuur"] = "好歹弄个白马啊，这个黑的有损我的形象！(小白抓狂)",
	["$greatchair"] = "我要龙（轮）椅！龙（轮）椅！哈哈哈……(大头得意)",
	
--一装坑爹
	["hawksbill"] = "山蛭",
	[":hawksbill"] = "<br/><font color='blue' size='5' face='华文新魏'>专坑于禁</font>：<br/>无效果",
	["$hawksbill"] = "仁王禁：这是什么……别贴在我身上……",
	["torture"] = "老虎凳",
	[":torture"] = "<br/><font color='blue' size='5' face='华文新魏'>专坑</font><font color='red' size='5' face='华文新魏'>徐庶</font>：<br/>【无言】改为：你使用的【杀】对其他角色无效，其他角色使用的锦囊对你有效",
	["$torture"] = "哑巴庶：求求你别打了……我说就是了……",
	["rotate"] = "陀螺",
	[":rotate"] = "<br/><font color='green' size='5' face='华文新魏'>专坑凌统</font>：<br/>你不能发动【旋风2】",
	["$rotate"] = "芭蕾统：我突然感觉有点累……",
	["totocar"] = "神经突击车",
	[":totocar"] = "<br/><font color='black' size='5' face='华文新魏'>专坑陈宫</font>：<br/>【智迟】改为只有杀对你无效；【明策】没有后续效果",
	["$totocar"] = "大明宫：神经突击~~~",
	["ch3oh"] = "甲醇",
	[":ch3oh"] = "<br/><font color='blue' size='5' face='华文新魏'>专坑曹植</font>：<br/>发动【酒诗1】时失去1点体力；无法发动【酒诗2】",
	["$ch3oh"] = "酒鬼植：这个酒……有问题……",
	["teardan"] = "催泪弹",
	[":teardan"] = "<br/><font color='red' size='5' face='华文新魏'>专坑马谡</font>：<br/>【心战】少看一张牌；丧失【挥泪】技能",
	["$teardan"] = "杯具谡：我是谁？我在哪里？",
	["nanafist"] = "七伤拳谱",
	[":nanafist"] = "<br/><font color='green' size='5' face='华文新魏'>专坑徐盛</font>：<br/>发动【破军】后翻面的是你自己",
	["$nanafist"] = "人体盛：五行之气调阴阳，损心伤肺催肝肠！",
	["lrzt9hh"] = "考场屏蔽器",
	[":lrzt9hh"] = "<br/><font color='black' size='5' face='华文新魏'>专坑高顺</font>：<br/>【陷阵】中你每使用一张【杀】，需弃掉一张手牌或失去一点体力",
	["$lrzt9hh"] = "气不顺：奶奶的，手机没信号了……",
	["mushroom"] = "反噬菇",
	[":mushroom"] = "<br/><font color='red' size='5' face='华文新魏'>专坑法正</font>：<br/>【恩怨】改为：其他角色每令你恢复1点体力，自己失去1点体力；其他角色每对你造成1点伤害，立即摸两张牌",
	["$mushroom"] = "雷没正：老虎，老鼠，555分不清楚了……",
	["aofrog"] = "青蛙",
	[":aofrog"] = "<br/><font color='black' size='5' face='华文新魏'>专坑吴国太</font>：<br/>你的回合外，不能发动【补益】",
	["$aofrog"] = "小青蛙：呱~~呱~~呱~~",
	["coptis"] = "黄连",
	[":coptis"] = "<br/><font color='yellow' size='5' face='华文新魏'>专坑张春华</font>：<br/>【伤逝】改为【连营】的效果",
	["$coptis"] = "张坑爹：其实坑爹的不是我，是yoka！",

--plus
	["chunhua"] = "张春华",
	["jon"] = "囧",
	["designer:chunhua"] = "JZHIEI, 宇文天启",
	["cv:chunhua"] = "",
	["shangshi"] = "伤逝",
	[":shangshi"] = "除弃牌阶段外，每当你的手牌数小于你已损失的体力值时，可立即将手牌数补至等同于你已损失的体力值。",
	["qiecai"] = "切菜",
	[":qiecai"] = "锁定技，你对山包武将造成的伤害均为体力流失。\
	★切菜张春华是牛逼神装系列专属隐藏武将；原版张春华永远不会在太阳神平台以及神装系列里出现。",
	["#Qiecai"] = "%from 发现 %to 是山包武将，对其造成的 %arg 点伤害变为体力流失",

--run a way
	["runaway_mode"] = "跑路模式",
	["#Runprex"] = "%from 翻开一张跑路牌，但由于其点数 %arg 不小于场上存活角色数，本次不得跑路",
	["#Runpre"] = "%from 翻开一张跑路牌，他需要跑 %arg 步路",
	["#Runaway2"] = "%arg 位 %from 和 %arg2 位 %to 交换了位置",
	["#Runaway"] = "%arg 位 %from 跑到了 %arg2 位 的位置",
	["runbyhorse"] = "良驹助我",
	["runbyhorse:fast"] = "快马加鞭（暴走）",
	["$runfast"] = "%from 装备有 %card ，多跑了一步路",
	["runbyhorse:slow"] = "铁马金戈（龟速）",
	["$runslow"] = "%from 装备有 %card ，少跑了一步路",
	["runbyhorse:kao"] = "厉兵秣马（^o^）",
}
