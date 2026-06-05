module("extensions.weimou",package.seeall)
extension=sgs.Package("weimou")

shengou = sgs.General(extension, "shengou", "wei", 3, true, false)

--[] 出牌阶段开始时，你可弃置X张牌，然后选择X项：1. 获得技能“驱虎”，直到回合结束 2. 获得技能“奇策”，直到回合结束。
LuaQuhuCard = sgs.CreateSkillCard{
	name = "LuaQuhuCard", 
	target_fixed = false, 
	will_throw = false, 
	filter = function(self, targets, to_select) 
		if #targets == 0 then
			local player = sgs.Self
			if to_select:getHp() > player:getHp() then
				return not to_select:isKongcheng()
			end
		end
		return false
	end,
	on_use = function(self, room, source, targets) 
		local tiger = targets[1]
		room:playSkillEffect("quhu",1)
		local success = source:pindian(tiger, self:objectName(), self)
		if success then
			local players = room:getOtherPlayers(tiger)
			local wolves = sgs.SPlayerList()
			for _,player in sgs.qlist(players) do
				if tiger:inMyAttackRange(player) then
					wolves:append(player)
				end
			end
			if wolves:isEmpty() then
				return
			end
			local wolf = room:askForPlayerChosen(source, wolves, self:objectName())
			local damage = sgs.DamageStruct()
			damage.from = tiger
			damage.to = wolf
			room:damage(damage)
			room:playSkillEffect("quhu",2)
		else
			local damage = sgs.DamageStruct()
			damage.from = tiger
			damage.to = source
			room:damage(damage)
		end
	end
}
LuaQuhu = sgs.CreateViewAsSkill{
	name = "LuaQuhu",
	n = 1,
	view_filter = function(self, selected, to_select)
		return not to_select:isEquipped()
	end,
	view_as = function(self, cards)
		if #cards == 1 then
			local card = LuaQuhuCard:clone()
			card:addSubcard(cards[1])
			card:setSkillName(self:objectName())
			return card
		end 
	end,
	enabled_at_play = function(self, player)
		if not player:hasUsed("#LuaQuhuCard") then
			return not player:isKongcheng()
		end
		return false
	end
}

thchuangxincard=sgs.CreateSkillCard{
	name="thchuangxincard",
	target_fixed=true,
	will_throw=true,	
	on_use = function(self, room, source, targets)
		room:throwCard(self)
		--room:playSkillEffect("quhu",1)
		room:playSkillEffect("thchuangxin")
		if self:subcardsLength()==1 then 
			local choice=room:askForChoice(source,"thchuangxin","LuaQuhu+qice")
			room:acquireSkill(source,choice)
		else
			room:acquireSkill(source,"LuaQuhu")
			room:acquireSkill(source,"qice")
		end
	end,
}

thchuangxinvs=sgs.CreateViewAsSkill{
	name="thchuangxinvs",
	n=2,
	view_filter = function(self, selected, to_select)
		return true
	end,
	view_as = function(self, cards)
		if #cards==0 then return end
		local CXcard=thchuangxincard:clone()
		CXcard:addSubcard(cards[1])
		if #cards==2 then
			CXcard:addSubcard(cards[2])
		end
		CXcard:setSkillName("thchuangxin")
		return CXcard
	end,
	enabled_at_play=function(self, player)
		return false
	end,
	enabled_at_response=function(self,player,pattern) 
		return pattern=="@@thchuangxin"
	end,
}

thchuangxin=sgs.CreateTriggerSkill{
	name="thchuangxin",
	frequency=sgs.Skill_NotFrequent,
	events={sgs.PhaseChange},
	view_as_skill=thchuangxinvs,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if player:getPhase()==sgs.Player_NotActive then
			room:detachSkillFromPlayer(player,"LuaQuhu")
			room:detachSkillFromPlayer(player,"qice")
		end
		if player:getPhase()~=sgs.Player_Play then return end
		if player:isNude() then return end
		if not player:askForSkillInvoke(self:objectName()) then return end
		room:askForUseCard(player,"@@thchuangxin","@thchuangxin")
	end,
}

local skill=sgs.Sanguosha:getSkill("LuaQuhu")
if not skill then
local skillList=sgs.SkillList()
skillList:append(LuaQuhu)
sgs.Sanguosha:addSkills(skillList)
end


--[] 每当你受到一次伤害后，可从牌堆顶亮出X张牌（X为存活角色的数量，且最多为5），将一种类别的牌交给一名角色，然后将其余的牌置入弃牌堆。
thshenzhou=sgs.CreateTriggerSkill{
	name="thshenzhou",
	frequency = sgs.Skill_NotFrequent,
	
	events={sgs.Damaged},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if not player:askForSkillInvoke(self:objectName()) then return end
		--local x=room:alivePlayerCount()
		--if x>5 then 
			--x=5
		--end
		local x= 3
		local card_ids=room:getNCards(x)
		room:fillAG(card_ids,nil)
		local card_id=room:askForAG(player, card_ids, false, self:objectName())
		for _,p in sgs.qlist(room:getPlayers()) do
			p:invoke("clearAG")
		end
		local acard_ids=sgs.IntList()
		local ctype=sgs.Sanguosha:getCard(card_id):getType()
		for _,id in sgs.qlist(card_ids) do
			if (sgs.Sanguosha:getCard(id)):getType()==ctype then
				acard_ids:append(id)
			else	
				room:throwCard(sgs.Sanguosha:getCard(id))
			end
		end
		local target=room:askForPlayerChosen(player,room:getAllPlayers(),self:objectName())
		local log= sgs.LogMessage()
			log.type = "#thshenzhou"
			log.from = player
			log.to:append(target)
			log.arg = tonumber(acard_ids:length())
			log.arg2 = ctype
		room:sendLog(log)
		for _,id in sgs.qlist(acard_ids) do
			target:obtainCard(sgs.Sanguosha:getCard(id))
			--room:playSkillEffect("jieming",1)
			room:playSkillEffect("thshenzhou")
		end
	end,
}


--[] 回合结束阶段开始时，你可以弃置一张手牌并选择两名角色，这两名角色须同时展示一张手牌，若这两张牌点数不同，你获得其中一张牌，所展示的牌点数大的角色获得另一张牌；若点数相同，你在此回合结束后须进行一个额外的回合（此额外的回合内你不可以发动“吞狼”）。
thexicard=sgs.CreateSkillCard{
	name="thexicard",
	target_fixed=false,
	will_throw=false,
	filter=function(self, targets, to_select, player)
		if to_select:objectName()==player:objectName() then
			return #targets<2 and player:getHandcardNum()>1
		else
			return #targets<2 and not to_select:isKongcheng()
		end
	end,
	on_use=function(self, room, source, targets)
		if #targets~=2 then return end
		room:throwCard(self)
		room:playSkillEffect("thexi")
		local card={}
		card[1]=room:askForCardShow(targets[1],source,"thexi")
		card[2]=room:askForCardShow(targets[2],source,"thexi")
		room:showCard(targets[1],card[1]:getId())
		room:showCard(targets[2],card[2]:getId())
		local canget=true
		local other
		local bigcard,smallcard
		if card[1]:getNumber()>card[2]:getNumber() then
			bigcard=card[1]
			smallcard=card[2]
			other=targets[1]
		elseif card[1]:getNumber()<card[2]:getNumber() then
			bigcard=card[2]
			smallcard=card[1]
			other=targets[2]
		elseif card[1]:getNumber()==card[2]:getNumber() then
			canget=false
		end
		if canget then
			local choice=room:askForChoice(source,self:objectName(),"exbig+exsma")
			local othercard
			if choice=="exbig" then
				room:moveCardTo(bigcard,source,sgs.Player_Hand,true)
				othercard=smallcard
			else
				room:moveCardTo(smallcard,source,sgs.Player_Hand,true)
				othercard=bigcard
			end
			room:moveCardTo(othercard,other,sgs.Player_Hand,true)
		else
			source:addMark("exi")
		end
	end,
}

thexivs=sgs.CreateViewAsSkill{
	name="thexivs",
	n=1,
	view_filter=function(self, selected, to_select)
		return not to_select:isEquipped()
	end,
	view_as=function(self, cards)
		if #cards~=1 then return end
		local EXcard=thexicard:clone()
		EXcard:addSubcard(cards[1])
		EXcard:setSkillName("thexi")
		return EXcard
	end,
	enabled_at_play=function(self, player)
		return false
	end,
	enabled_at_response=function(self,player,pattern) 
		return pattern=="@@thexi"
	end,
}
	

thexi=sgs.CreateTriggerSkill{
	name="thexi",
	frequency=sgs.Skill_NotFrequent,
	
	events={sgs.PhaseChange},
	view_as_skill=thexivs,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if player:getPhase()==sgs.Player_Finish then
			if player:isKongcheng() then return end
			if player:getMark("exiused")~=0 then 
				player:setMark("exiused",0) 
				return 
			end
			room:askForUseCard(player,"@@thexi","@thexi")
			return
		end
		if player:getPhase()==sgs.Player_NotActive then
			if player:getMark("exi")<=0 then return end
			player:setMark("exi",0)
			player:addMark("exiused")
			player:gainAnExtraTurn(player)
		end
	end,
}

mopai = sgs.CreateTriggerSkill{
name = "#mopai",
frequency = sgs.Skill_Compulsory,
priority = 998,
events = sgs.TurnStart,
on_trigger = function(self,event,player,data)
--if player:getRoom():askForSkillInvoke(player, self:objectName()) then	
local room=player:getRoom()
local x=player:getLostHp()
player:drawCards(x)
room:playSkillEffect("#mopai")


---end
end
}


shengou:addSkill(thchuangxin)
shengou:addSkill(thexi)
shengou:addSkill(thshenzhou)
--shengou:addSkill(mopai)

shenxunyou = sgs.General(extension, "shenxunyou", "wei", 3, true, false)

sctmp = {}


shence = sgs.CreateViewAsSkill
{
	name = "shence",
	n = 1,
	
	view_filter = function(self,selected,to_select)
		if(to_select:isEquipped())then return false end--只能选择手牌
		--if(sctmp[2] == "savage_assault")then return (to_select:isBlack())
		--else return (to_select:isRed())
		return true 
	end,
	
	view_as = function(self,cards)
		if #cards == 1 then
			local card = cards[1]
			if(card:isRed())then 
				sctmp[1]="archery_attack"
			elseif (card:isBlack())then 
				sctmp[1]="savage_assault"
			end
			local new_card = sgs.Sanguosha:cloneCard(sctmp[1],card:getSuit(),card:getNumber())
			new_card:addSubcard(card)
			new_card:setSkillName("shence")
			return new_card
			
			
			
			
		
		end
		
--room:playSkillEffect("qice")
	end,
	
	enabled_at_play= function()
		if(sgs.Self:getHandcardNum()>2)then return false end
		if sgs.Self:getMark("shenceused")>1 then return false end
		--sctmp[2]="slash"
		--return (sgs.Self:canSlashWithoutCrossbow()) or (sgs.Self:getWeapon() and sgs.Self:getWeapon():className()=="Crossbow")
		return true 
	end,
	
	enabled_at_response = function(self,player,pattern)
		if(sgs.Self:getHandcardNum()>2)then return false end
		--if (pattern=="jink") or (pattern=="slash") then 
		--sctmp[2]=pattern 
		return false
	end
}

shencelimit = sgs.CreateTriggerSkill
{--神策限制效果
	name = "#shencelimit",
	events = {sgs.PhaseChange,sgs.CardUsed}, 
	priority=4,
	can_trigger = function(self, player)
		return true
	end,
	
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		local owner = room:findPlayerBySkillName(self:objectName())
		if not owner or owner:isDead() then return false end
		
		if event == sgs.PhaseChange and owner:getPhase() == sgs.Player_Finish then
		room:setPlayerMark(owner, "shenceused", 0) -- 阶段转换时清除标记
		else
		
		local use=data:toCardUse()
		if use.card:getSkillName()~="shence" then return false end
			if use.from:objectName()==owner:objectName() then room:setPlayerMark(owner,"shenceused",owner:getMark("shenceused")+1) end
			--if damage.from:objectName()==owner:objectName() then owner:gainMark("zhanjuewin") end 这个写法会有获得标记的提示，哪怕是隐性标记
			end
	end,
}

--[[luan = sgs.CreateTriggerSkill{
name = "luan",
--frequency = sgs.Skill_Limited,
frequency=sgs.Skill_NotFrequent,
events = {sgs.CardUsed,sgs.CardResponsed},
view_as_skill = shence,
on_trigger = function(self, event, player, data)
local room = player:getRoom()
local card=data:toCard()
if card:inherits("Jink") or card:inherits("Slash") then 
room:playSkillEffect("qice")
 
 end
--player:gainMark("@chaos",1)



end,
}]]

--[[luazhiyu=sgs.CreateTriggerSkill{
	name="luazhiyu",
	frequency=sgs.Skill_NotFrequent,
	priority = 3,
	events={sgs.Damaged,sgs.PhaseChange},
	
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local miao=room:findPlayerBySkillName(self:objectName())
		--if not player:hasSkill("luazhiyu") then  return false end
		if event==sgs.Damaged then 
			local damage=data:toDamage()
			if damage.to:objectName()~=miao:objectName() then return end
			if not damage.from then return end	

			--for i=1,damage.damage,1 do --即“每点伤害”
			if miao:isNude() then return end
			if  not(damage.from:getMark("@jiaotu")==0 and damage.from:getMark("@sanku")==0 )then  return end--防止无意义的重复询问
				if not room:askForSkillInvoke(miao,self:objectName(),data) then return end
				local choise = room:askForChoice(miao,self:objectName(), "yu+zhi")
				if choise == "yu" then
					if not damage.from:hasSkill("wumou")or not damage.from:hasSkill("shiyong") then
					
					room:setPlayerFlag(damage.from,"luazhiyu")
						damage.from:gainMark("@jiaotu")
						room:acquireSkill(damage.from,"wumou")
						room:acquireSkill(damage.from,"shiyong")
						room:playSkillEffect(self:objectName(),1)
				end
				else 
				if not damage.from:hasSkill("jizhi")or not damage.from:hasSkill("kanpo") then
					
					room:setPlayerFlag(damage.from,"luazhiyu")
						damage.from:gainMark("@sanku")
						room:acquireSkill(damage.from,"jizhi")
						room:acquireSkill(damage.from,"kanpo")
						room:playSkillEffect(self:objectName(),2)
				--end
				end
				end
				return false
			
			
		elseif player:getPhase()==sgs.Player_NotActive then
			if player:hasFlag("luazhiyu") then 
				room:setPlayerFlag(player,"-luazhiyu")
			elseif player:getMark("@jiaotu")~=0 then 
				player:loseAllMarks("@jiaotu")
				room:detachSkillFromPlayer(player,"wumou")
				room:detachSkillFromPlayer(player,"shiyong")
				elseif player:getMark("@sanku")~=0 then 
				player:loseAllMarks("@sanku")
				room:detachSkillFromPlayer(player,"jizhi")
				room:detachSkillFromPlayer(player,"kanpo")
				
			end
		end
	end,
	
	can_trigger=function(self,target)
		return true
	end,
}]]

--[智愚] 其他角色的出牌阶段开始时，若你已受伤，你可以弃一张手牌，令其在出牌阶段使用【杀】指定目标时须弃置一张牌，否则此【杀】无效。
--[[luazhiy=sgs.CreateTriggerSkill{
	name="luazhiy",
	frequency=sgs.Skill_NotFrequent,
	priority = 6,
	events={sgs.PhaseChange},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if player:hasFlag("luazhiyudis") then
			room:setPlayerFlag(player,"-luazhiyudis")
		end
		local splayer=room:findPlayerBySkillName(self:objectName())
		if not splayer then return end
		if not splayer:isWounded() then return end
		if splayer:isKongcheng() then return end
		if player:getPhase()~=sgs.Player_Play then return end
		if player:objectName()==splayer:objectName() then return end
		--if player:getHandcardNum()<4 then return end
		if not splayer:askForSkillInvoke(self:objectName()) then return end
		local card=room:askForCard(splayer,".","hd~~")
	    if card==nil then return false end
	        room:throwCard(card)
			room:playSkillEffect(self:objectName())
			room:setPlayerFlag(player,"luazhiyudis")
	end,
	can_trigger=function(self,target)
		return true
	end,
}

luazhiyu1_buff=sgs.CreateTriggerSkill{
	name="#luazhiyu1_buff",
	frequency=sgs.Skill_Compulsory,
	events={sgs.CardUsed},
	on_trigger=function(self,event,player,data)
		local use=data:toCardUse()
		local room=player:getRoom()
		if not player:hasFlag("luazhiyudis") then return end
		if not use.card:inherits("Slash") then return end
		if (use.card:subcardsLength()~=0 or use.card:getEffectiveId()~=-1) then
			room:moveCardTo(use.card,nil,sgs.Player_DiscardedPile,true)
		end
		local log= sgs.LogMessage()
			log.type = "#luazhiyutr"
			log.from = room:findPlayerBySkillName("luazhiy")
			log.to:append(player)
			log.arg  = "luazhiy"
		room:sendLog(log)
		if player:isNude() then return true end
		if room:askForDiscard(player,"luazhiy",1,true,true) then return end
		return true
	end,
	can_trigger=function(self,target)
		return true
	end,
}]]

--[智愚2] 出牌阶段，你可以弃置一张牌并选择一名角色，该角色可观看另一名角色的手牌，每阶段限一次。
--[[ZHYucard=sgs.CreateSkillCard{
	name="ZHYucard",
	target_fixed=false,
	filter=function(self, targets, to_select, player)
		return #targets==0
	end,	
	on_use=function(self, room, source, targets)
		room:throwCard(self)
		local target=room:askForPlayerChosen(targets[1],room:getOtherPlayers(targets[1]),"ZHYu")
		local log= sgs.LogMessage()
			log.type = "#ZHYu"
			log.from = targets[1]
			log.to:append(target)
		room:sendLog(log)
		room:showAllCards(target,targets[1])
		room:playSkillEffect("ZHYu")
	end,
}

ZHYu=sgs.CreateViewAsSkill{
	name="ZHYu",
	n=1,
	view_filter=function(self, selected, to_select)
		return true
	end,
	view_as=function(self, cards)
		if #cards~= 1 then return end
		local LDcard=ZHYucard:clone()
		LDcard:addSubcard(cards[1])
		LDcard:setSkillName(self:objectName())
		return LDcard
	end,
	enabled_at_play=function(self, player)
		return not player:hasUsed("#ZHYucard")
	end,
}]]



luazhiy_card = sgs.CreateSkillCard
{   name = "luazhiy_card",	
	filter = function(self,targets,to_select,player)
		if  #targets>0 then return false			
		--else return to_select:getSeat()~=player:getSeat() and not to_select:isAllNude() end
		else return not to_select:isAllNude() end
	
	end,
	on_use=function(self,room,player,targets)
	if #targets==1 then 
	--room:obtainCard(player,room:askForCardChosen(player,targets[1],"h","luazhiy"))--前面加对象是获得
		room:throwCard(room:askForCardChosen(player,targets[1],"hej","luazhiy"),targets[1])--后面加,targets[?]是弃置
		room:playSkillEffect("luazhiy")
	----if targets[1]:isAllNude() then return end 
	--room:obtainCard(player,room:askForCardChosen(player,targets[1],"h","luazhiy"))
	    ----room:throwCard(room:askForCardChosen(player,targets[1],"hej","luazhiy"),targets[1])
		----room:playSkillEffect("luazhiy")
	----elseif #targets==2 then 
	----for var=1,2,1 do
	--room:obtainCard(player,room:askForCardChosen(player,targets[var],"h","luazhiy"))
		----room:throwCard(room:askForCardChosen(player,targets[var],"hej","luazhiy"),targets[var])
		----room:playSkillEffect("luazhiy")
	----end
	end
end,
}

luazhiyVS=sgs.CreateViewAsSkill{
	name="luazhiyVS",
	view_as = function(self, cards)
        return luazhiy_card:clone()
	end,
	enabled_at_play=function(self,player,pattern)
		return false 
	end,
	enabled_at_response=function(self,player,pattern)
		return pattern=="@@luazhiy"
	end,
}

luazhiy = sgs.CreateTriggerSkill
{
	name = "luazhiy",
	events={sgs.Predamaged},
	view_as_skill=luazhiyVS,
	frequency=sgs.Skill_NotFrequent,
	priority = 2,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if not room:askForSkillInvoke(player,"luazhiy") then return end
		player:drawCards(1)
		if not room:askForUseCard(player,"@@luazhiy","askforluazhiy") then return end
	end,
}


shenxunyou:addSkill(shence)
shenxunyou:addSkill(shencelimit)
shenxunyou:addSkill(luazhiy)
--shenxunyou:addSkill(luazhiyu1_buff)
--shenxunyou:addSkill(ZHYu)

shenguojia = sgs.General(extension, "shenguojia", "wei", 3, true, false)

thtianliu=sgs.CreateTriggerSkill{
	name="thtianliu",
	frequency=sgs.Skill_Compulsory,
	priority = 998,
	events={sgs.PhaseChange},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if player:getPhase()~=sgs.Player_Draw then return end
		room:playSkillEffect("tiandu")
		local log= sgs.LogMessage()
			log.type = "#TriggerSkill"
			log.from = player
			log.arg  = self:objectName()
		room:sendLog(log)
		local judge=sgs.JudgeStruct()
			judge.pattern=sgs.QRegExp("(.*):(spade|club):(.*)")
			judge.good=false
			judge.reason=self:objectName()
			judge.who=player
		room:judge(judge)
		if judge:isGood() then
			room:setEmotion(player,"good")
			room:playSkillEffect("thtianliu")
		else
			room:setEmotion(player,"bad")
		end
		if judge.card:getSuit()==sgs.Card_Heart then
			player:drawCards(5)
		elseif judge.card:getSuit()==sgs.Card_Diamond then
			player:drawCards(4)
		elseif judge.card:getSuit()==sgs.Card_Club then
			player:drawCards(3)
		elseif judge.card:getSuit()==sgs.Card_Spade then
			player:drawCards(2)
		end
		return true
	end,
}

binliang = sgs.CreateProhibitSkill
{
name = "#binliang",
is_prohibited = function(self, from, to, card)
if(to:hasSkill(self:objectName())) then
return (card:inherits("SupplyShortage")) 
end
end
}

--出牌阶段，你可以与一名其他角色拼点。双方区域内有牌时，若你赢，你须选择一项：对其造成1点伤害或获得其区域内的一张牌;若你没赢，你须选择一项：交给其你区域内的一张牌或受到其对你造成的1点伤害。每阶段限一次。
qimoucard=sgs.CreateSkillCard{
	name="qimoucard",
	target_fixed=false,
	will_throw=false,
	filter=function(self, targets, to_select, player)
		return #targets==0 and not to_select:isKongcheng() and to_select:objectName()~=player:objectName()
	end,
	on_use=function(self, room, source, targets)
		local win=source:pindian(targets[1],"qimou",sgs.Sanguosha:getCard(self:getEffectiveId()))
		local choice
		--if targets[1]:isAllNude() then return false end
		--if source:isAllNude() then return false end
		if win then
			--choice="baoju"
			if  targets[1]:isAllNude() then
			local damage=sgs.DamageStruct()
				damage.damage=1
				damage.from=source
				damage.to=targets[1]
			room:damage(damage)
			room:playSkillEffect("qimou",2)	
						return false--这句非常重要，检测裸奔后直接造成伤害不继续弹窗choice，否则会造成无法拿牌导致崩溃的BUG
else
			choice=room:askForChoice(source,"qimou","baoju+napai")	

			end	
			
		else
			--choice="beibaoju"
			if  source:isAllNude() then
			local damage=sgs.DamageStruct()
				damage.damage=1
				damage.from=targets[1]
				damage.to=source
			room:damage(damage)
				return false--这句非常重要，检测裸奔后直接造成伤害不继续弹窗choice，否则会造成无法拿牌导致崩溃的BUG
	
				
else
		choice=room:askForChoice(source,"qimou","geipai+beibaoju")	
	
		end
		
			end
	--------------------------------------------------------		
		local card_id
		if choice=="geipai" then
			card_id=room:askForCardChosen(source,source,"hej","qimou")
			--room:moveCardTo(sgs.Sanguosha:getCard(card_id),targets[1],sgs.Player_Hand,false)
			room:obtainCard(targets[1],card_id)
			room:playSkillEffect("qimou",1)	
		elseif choice=="beibaoju" then
			local damage=sgs.DamageStruct()
				damage.damage=1
				damage.from=targets[1]
				damage.to=source
			room:damage(damage)
		elseif choice=="baoju" then
			local damage=sgs.DamageStruct()
				damage.damage=1
				damage.from=source
				damage.to=targets[1]
			room:damage(damage)
			room:playSkillEffect("qimou",2)	
		else
			card_id=room:askForCardChosen(source,targets[1],"hej","qimou")
			--if(room:getCardPlace(card_id)==sgs.Player_Hand) then
				--room:moveCardTo(sgs.Sanguosha:getCard(card_id),source,sgs.Player_Hand,false)
			--else
				room:obtainCard(source,card_id)
				room:playSkillEffect("qimou",3)	
			--end
		end
	end,
}

qimou=sgs.CreateViewAsSkill{
	name="qimou",
	n=1,
	view_filter=function(self, selected, to_select)
		return not to_select:isEquipped()
	end,
	view_as=function(self, cards)
		if #cards~=1 then return end
		local qmcard=qimoucard:clone()
		qmcard:addSubcard(cards[1])
		qmcard:setSkillName(self:objectName())
		return qmcard
	end,
	enabled_at_play=function(self, player)
		return not player:hasUsed("#qimoucard") and not player:isKongcheng()
	end,
}
shenguojia:addSkill(thtianliu)
--shenguojia:addSkill("yiji")
shenguojia:addSkill(binliang)
shenguojia:addSkill(qimou)

shenjiaxu = sgs.General(extension, "shenjiaxu", "wei", 3, true)

pijia=sgs.CreateTriggerSkill
{
	name="pijia",
	events={sgs.Predamaged,sgs.CardEffected},
	frequency=sgs.Skill_Compulsory,
	priority = 4,
	on_trigger=function(self,event,player,data)
	    local room = player:getRoom()
		local damage=data:toDamage()
		local effect=data:toCardEffect()
		
		if event == sgs.Predamaged and damage.card:isRed() then
        local log=sgs.LogMessage()
        log.from = player
		log.arg = self:objectName()
        log.type ="#pijia1"
        room:sendLog(log)
		room:playSkillEffect("pijia",1)
		return true
	end   		
	 --if event == sgs.CardEffected and not player:getArmor() and effect.card:isBlack() then
	    if event == sgs.CardEffected and effect.card:inherits("TrickCard") and effect.card:isBlack() then
		local log=sgs.LogMessage()
        log.from = player
		log.arg = self:objectName()
        log.type ="#pijia2"
        room:sendLog(log)
		room:playSkillEffect("pijia",2)
		return true
	end
	
	end,
}
----------------------------------
shengsha=sgs.CreateTriggerSkill
{
	name="shengsha",
	events={sgs.AskForPeaches},
	--events={sgs.Dying},
	frequency = sgs.Skill_NotFrequent,
	priority = -2,
	--can_trigger = function(self, target)
		--return (target ~= nil)--修改触发条件：有处于濒死的目标存在
		--return true
	--end,
	on_trigger=function(self,event,player,data)
	   local dying = data:toDying()--濒死结构体
		local dest = dying.who--濒死中的武将
		local room = dest:getRoom()
		--查找具有“生杀”技能的武将
		local source = room:findPlayerBySkillName("shengsha")
		--不能对自己发动技能，要“其他角色”
		if source:objectName() == dest:objectName() then return false end
		if not room:askForSkillInvoke(source, "shengsha", data) then return false end
			--if room:askForSkillInvoke(source, "shengsha", data) then
			--local use=sgs.CardUseStruct()
	       --use.card=sgs.Sanguosha:cloneCard("peach",sgs.Card_NoSuit,0)
	       --use.from=source
	       --use.to:append(dest)
	       --room:useCard(use,false)
			local recover = sgs.RecoverStruct()
				recover.who = dest
				recover.recover = 99999
				room:recover(dest,recover)
			end
			
}
--------------------------------------生杀
LuaWeimu = sgs.CreateProhibitSkill{
	name = "LuaWeimu", 
	is_prohibited = function(self, from, to, card)
	   if(to:hasSkill(self:objectName())) then
	     return(card:isKindOf("TrickCard") and card:isBlack() and card:getSkillName()~="guhuo") or (card:isKindOf("Slash") and card:isBlack() and card:getSkillName()~="guhuo")	
			end
	end
}

luaweimuaudio=sgs.CreateTriggerSkill{
	name="#luaweimuaudio",
	frequency=sgs.Skill_Compulsory,
	events={sgs.CardUsed},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local splayer=room:findPlayerBySkillName(self:objectName())
		if not splayer then return end
		--if splayer:getPhase()~=sgs.Player_NotActive then return end
		local use=data:toCardUse()
		if  use.from:getGeneralName()==splayer:getGeneralName() then return end--识别角色名字，而不是通常用的objectName()
		if (use.card:isKindOf("TrickCard") and use.card:isBlack() and use.card:getSkillName()~="guhuo") or (use.card:isKindOf("Slash") and use.card:isBlack() and use.card:getSkillName()~="guhuo")  then 
		local log=sgs.LogMessage()
        log.from = splayer
		log.arg = self:objectName()
        log.type ="#luaweimutip"
        room:sendLog(log)
		room:playSkillEffect("luaweimuaudio")
		end
		end,
		
	can_trigger=function(self,target)
		return true
	end,
}
jingshenskill={}
jingshen=sgs.CreateTriggerSkill{
	name="jingshen",
	frequency=sgs.Skill_NotFrequent,
	--priority = 10,
	events={sgs.PhaseChange,sgs.Death,sgs.Predamaged},
	on_trigger=function(self,event,player,data)
	local room=player:getRoom()
	
	if (event == sgs.PhaseChange and player:getPhase() == sgs.Player_RoundStart) then
		for _,p in sgs.qlist(room:getAllPlayers()) do
		room:setPlayerFlag(p,"TanhuTarget")
	end
        local log=sgs.LogMessage()
        log.from = player
		log.arg = self:objectName()
        log.type ="#jingshen1"
        room:sendLog(log)
		room:playSkillEffect("jingshen",1)
	end   		
	
	    if(event == sgs.Death or (event == sgs.PhaseChange and player:getPhase() == sgs.Player_NotActive)) then
		for _,p in sgs.qlist(room:getAllPlayers()) do
		if (p:hasFlag("TanhuTarget")) then
		room:setPlayerFlag(p,"-TanhuTarget")
	end
	end
		local log=sgs.LogMessage()
        log.from = player
		log.arg = self:objectName()
        log.type ="#jingshen2"
        room:sendLog(log)
		room:playSkillEffect("jingshen",2)
	end
	
	
	if event == sgs.Predamaged then
        local damage=data:toDamage()
		if damage.from:objectName()==player:objectName() then return end
		if not player:askForSkillInvoke(self:objectName(),data) then return end
		local skilllist={}
			for _,skill in sgs.qlist(damage.from:getVisibleSkillList()) do
				local name=skill:objectName()
				if not(name=="axe" or name=="fan" or name=="spear" or name=="huangtianv" or name=="zhiba_pindian" or skill:getFrequency() == sgs.Skill_Limited or skill:getFrequency() == sgs.Skill_Wake)  then
					table.insert(skilllist,name)
				end
			end
		if #skilllist~=0 then
			--if #jingshenskill~=0 then
			--room:detachSkillFromPlayer(player,jingshenskill[1])
			--table.remove(jingshenskill)
		    --end
			local skill=room:askForChoice(player,self:objectName(),table.concat(skilllist,"+"))
			table.insert(jingshenskill,skill)
			room:acquireSkill(player,skill)
			room:playSkillEffect("jingshen",3)
		end
		end
	end,
}

--------------------------------

--出牌阶段限一次：若手牌颜色相同，你令一名角色失去1点体力或获得一名角色区域内的一张牌；若颜色不同，视为使用了一张【南蛮入侵】/【万箭齐发】。

quanbiancard=sgs.CreateSkillCard{
	name="quanbiancard",
	target_fixed=true,
	on_use=function(self, room, source, targets)
		local list = room:getAlivePlayers()
		local cards = source:getHandcards()
		local color = cards:first():isBlack()
						local same_color = true
						for _,card in sgs.qlist(cards) do
							if card:isBlack() ~= color then
								same_color = false
								break
							end
						end
						
							
					if (same_color==true) then
						local choise = room:askForChoice(source,self:objectName(), "shiqutili+huodeyizhangpai")
						if choise == "shiqutili" then
						local target=room:askForPlayerChosen(source, room:getAlivePlayers(), "shiqutilixuanren")
        	            room:loseHp(target)
						room:playSkillEffect("quanbian",1)
						else
						local targets = sgs.SPlayerList()
					    for _,p in sgs.qlist(room:getAllPlayers()) do
						if not p:isAllNude() then
							targets:append(p)
						end
					    end
						local target=room:askForPlayerChosen(source, targets, "huodeyizhangpaixuanren")
						local card_id=room:askForCardChosen(source, target, "hej", "huodeyizhangpaitip")
            	        room:obtainCard(source, card_id)
						room:playSkillEffect("quanbian",2)
						end
					end
						
					if (same_color == false) then
						local choise = room:askForChoice(source,self:objectName(), "wjqfclone+nmrqclone")
		                if choise == "wjqfclone" then
						room:playSkillEffect("quanbian",3)
		                --room:playSkillEffect("xinghe",1)
		                local wanjianpai=sgs.Sanguosha:cloneCard("archery_attack", sgs.Card_NoSuit, 0)
		
		                local use = sgs.CardUseStruct()
		                use.from = source
		                for _,p in sgs.qlist(room:getAlivePlayers()) do
		                use.to:append(p)
		                end
		                use.card = wanjianpai
		                room:useCard(use)
		   
		
		                else
						room:playSkillEffect("quanbian",4)
		                --room:playSkillEffect("xinghe",2)
		                local nanmanpai=sgs.Sanguosha:cloneCard("savage_assault", sgs.Card_NoSuit, 0)

		                local use = sgs.CardUseStruct()
		                use.from = source
		                for _,p in sgs.qlist(room:getAlivePlayers()) do
		                use.to:append(p)
		                end
		                use.card = nanmanpai
		                room:useCard(use)
						end
						
					end
		
	end,
}

quanbian=sgs.CreateViewAsSkill{
	name="quanbian",
	n=0,
	view_as=function(self, cards)
		if(#cards~=0) then return nil end
		local ZXcard=quanbiancard:clone()
			ZXcard:setSkillName(self:objectName())
		return ZXcard
	end,
	enabled_at_play=function(self, player)
        return not player:hasUsed("#quanbiancard") and player:getHandcardNum()>0
	end,
}

-------------------

shenjiaxu:addSkill(quanbian)
--shenjiaxu:addSkill(jingshen)
--shenjiaxu:addSkill(LuaWeimu)
--shenjiaxu:addSkill(luaweimuaudio)
shenjiaxu:addSkill("wansha")
--shenjiaxu:addSkill(shengsha)


shenchengyu = sgs.General(extension, "shenchengyu", "wei", 3, true, false)

baoquan = sgs.CreateTriggerSkill
{
	name = "baoquan",
	frequency = sgs.Skill_NotFrequent,
	--priority = 999,
	events = {sgs.CardLost},
	--, sgs.PhaseChange
	can_trigger=function(self, player)
		local room=player:getRoom()
			local selfplayer=room:findPlayerBySkillName(self:objectName())
			
			if selfplayer==nil then return false end
			return selfplayer:isAlive() 
	end,	
	on_trigger = function(self, event, player, data)
		local room=player:getRoom()
		local pl=room:findPlayerBySkillName("baoquan")
		if event == sgs.CardLost then 
		if pl:isKongcheng() then return false end
		if not player:isAlive() then return false end 
		--if player:getHandcardNum()<1 then return false end
        if player:getPhase()~=sgs.Player_NotActive then return false end
			if player:objectName()==pl:objectName() then return end
		local move = data:toCardMove()
		local card = sgs.Sanguosha:getCard(move.card_id)
		if card:isVirtualCard() then return end
		--if room:getCardPlace(card:getEffectiveId()) == sgs.Player_DiscardedPile and (card:inherits("EquipCard") )then
		--or card:inherits("BasicCard")) and not card:inherits("analeptic") 
		if room:getCardPlace(card:getEffectiveId()) == sgs.Player_DiscardedPile and (card:inherits("EquipCard")) then
		
		if not room:askForSkillInvoke(pl, "baoquan") then return false end 	

		local cardd=room:askForCard(pl,".","h~~")
	if cardd==nil then return false end
	room:throwCard(cardd)		
	
		room:moveCardTo(card,player,sgs.Player_Hand,true)	
        room:playSkillEffect("baoquan")		
		end
		end		
			
	end
}


gangshang=sgs.CreateTriggerSkill{--触发技
	name="gangshang",
	events=sgs.Damaged,--受到伤害时
	
	on_trigger=function(self,event,player,data)--要执行的动作
		local room=player:getRoom()--获取房间
		local damage=data:toDamage()--获取伤害结构体
		local from=damage.from--获取来源
		local x=damage.damage----获取伤害数值
		if(from and from:isAlive() and from~=player) then
		player:drawCards(1)
		--有来源，来源未死，不是自己
		if(from:isKongcheng()) then return false end--对方没手牌不刚戾
			if(not from:isKongcheng()) then--对方有手牌，要拼点
				if(player:isKongcheng()) then return end--自己没有手牌，不能拼点
				if(not room:askForSkillInvoke(player,"gangshang",data)) then return end--询问是否拼点
				--local log1=sgs.LogMessage()
				--log1.type="$gangshang"
				--room:sendLog(log1)--发送信息，无实际意义
				local success=player:pindian(from,"gangshang",NULL)--拼点，记录结果
				if(not success) then 
				room:playSkillEffect("gangshang",2)
                room:loseHp(player,1)
                room:loseHp(from,1)				
				return end--拼输了技能终止
			end
			--if(not room:askForSkillInvoke(player,"gangshang")) then return end--询问是否伤害
			--local log2=sgs.LogMessage()
			--log2.type="$gangshang"
			--room:sendLog(log2)--发送信息，无实际意义
			local damagex=sgs.DamageStruct()--创建新的伤害结构体
			damagex.damage=1--点数
			damagex.from=player--来源是自己
			damagex.to=from--伤害对象
			room:damage(damagex)--执行伤害
			room:playSkillEffect("gangshang",1)	
		end
	end,
}

diandan_vs = sgs.CreateViewAsSkill
{
	name = "diandan",
	n = 0,

	enabled_at_play = function()
		return sgs.Self:getMark("@diandan") > 0
	end,

	view_as = function(self, cards)
		local card = diandan_card:clone()
		card:setSkillName(self:objectName())
		return card
	end
}

diandan_card = sgs.CreateSkillCard
{
	name = "diandan",
	target_fixed = false,
	will_throw = false,
	once = true,
filter=function(self,targets,to_select,player)
    if #targets >= 1 then return false end
          return to_select:getEquips():length() > 0 and to_select:objectName()~=player:objectName()
end,
	on_effect = function(self, effect)
	local room = effect.from:getRoom()
	room:loseMaxHp(effect.from)
	room:playSkillEffect("diandan")
	for _,id in sgs.qlist(effect.to:getEquips()) do
            room:throwCard(id)
	end
	effect.from:loseMark("@diandan")
	end,
}

diandan=sgs.CreateTriggerSkill
{
	name="diandan",
	frequency = sgs.Skill_Limited,
	events={sgs.GameStart},
	view_as_skill = diandan_vs,
	on_trigger=function(self,event,player,data)
		player:gainMark("@diandan")
	end,
}

fangle = sgs.CreateProhibitSkill
{
name = "#fangle",
is_prohibited = function(self, from, to, card)
if(to:hasSkill(self:objectName())) then
return (card:inherits("Indulgence")) 
end
end
}

shenchengyu:addSkill(baoquan)
shenchengyu:addSkill(gangshang)
shenchengyu:addSkill(diandan)
--shenchengyu:addSkill(fangle)
sgs.LoadTranslationTable{
    ["weimou"] = "五谋英智",
	["shenxunyou"] = "五谋荀攸",
    [":shence"] = "出牌阶段限两次，你的手牌数≤2时，黑色手牌可当南蛮，红色手牌可当万剑。",
    ["luazhiy"]="愚乱",
	--["$luazhiyu"]="哼!鼠辈",
	--[":luazhiyu"]="你每受到1次伤害，可令伤害来源获得“无谋”“恃勇”或者“集智“看破”直到其下一个回合结束。",
	[":luazhiy"]="你受到伤害时，可摸１张牌，然后弃置一名角色区域内的１张牌。",
	["askforluazhiy"] = "请选择一名角色",
	["~luazhiy"] = "愚乱：你受到伤害时，可摸１张牌，然后弃置一名角色区域内的１张牌",
	["luazhiy_card"] = "愚乱",
	["hd~~"] = "请选择一张手牌",
	["@jiaotu"]="愚",
	["@sanku"]="智",
	["yu"] = "无谋恃勇",
	["zhi"] = "集智看破",
    ["shence"] = "神策",
	["$shence"] = "方今天下大乱，智士劳心之时也",
    ["$luazhiy"] = "以此先机，断汝后路",
	["@luazhiy"]="请选择一手牌或者装备",
	--["$luazhiyu2"] = "此计尚有后招。",
	["#luazhiyutr"]="受 %from 的技能【%arg】的效果影响，%to 需要额外弃一张牌，否则此【杀】无效",
	
    ["~shenxunyou"] = "主公何日再得无忧···", 
    ["#shenxunyou"] = "奇策百出",
	
	["shenguojia"] = "五谋郭嘉",
    ["~shenguojia"] = "咳咳···咳咳咳咳···", 
    ["#shenguojia"] = "天妒鬼才",
	
	["qimou"]="奇谋",
	[":qimou"]="<font color=\"blue\"><b>出牌阶段限一次</b></font>：你可与一名其他角色拼点。若你赢，你须选择一项：对其造成１点伤害或获得其区域内的一张牌;若你没赢，你须选择一项：交给其你区域内的一张牌或受到其对你造成的１点伤害",
	["qimoucard"]="奇谋",
	["geipai"]="给他牌",
	["beibaoju"]="被爆菊",
	["baoju"]="爆他菊",
	["napai"]="拿他牌",
	["$qimou1"] = "就这样吧···",
	["$qimou2"] = "就这样吧···",
	["$qimou3"] = "就这样吧···",
	["thtianliu"]="天妒",
	["$thtianliu"] = "就这样吧···",
	[":thtianliu"]="<b>锁定技</b>，你不能成为兵粮寸断的目标；摸牌阶段，你须放弃摸牌，改为进行一次判定，若结果为红桃，摸５张牌；若结果为方块，摸４张牌；若结果为梅花，摸３张牌，若结果为黑桃，摸２张牌",

	["shenjiaxu"] = "五谋贾诩",
	["#shenjiaxu"] = "算无遗策",
	["illustrator:shenjiaxu"] = "神喵",
	["shengsha"] = "救救救救救",
	[":shengsha"]="一名其他角色求桃时，你可以救满。",
	["LuaWeimu"] = "帷幕",
	["luaweimuaudio"] = "帷幕",
	["$luaweimuaudio1"] = "此计伤不到我",
	["$luaweimuaudio2"] = "你奈我何？",
	["$pijia1"] = "你奈我何？",
	["$pijia2"] = "此计伤不到我",
	[":LuaWeimu"]="<b>锁定技</b>，你不能成为黑色【杀或锦囊】的目标",
	[":luaweimuaudio"]="<b>锁定技</b>，你不能成为黑色【杀或锦囊】的目标",
	["#luaweimutip"] = "%from 的技能 %arg 被触发，<font color=\"yellow\"><b>不能成为黑色【杀或锦囊】的目标</b></font>",
	["#pijia1"] = "%from 的技能【%arg】被触发，<font color=\"yellow\"><b>防止了此红色牌造成的伤害！</b></font>",
	["#pijia2"] = "%from 的技能【%arg】被触发，<font color=\"yellow\"><b>此黑色锦囊对其无效！</b></font>",
	["jingshen"] = "鬼谋",
	["$jingshen1"] = "算无遗策，不动如山",
	["$jingshen2"] = "巧变制敌，谋定而动",
	["$jingshen3"] = "我的是我的，你的，还是我的",
	[":jingshen"] = "①你的回合内，即时锦囊不可被无懈抵消\n②你受到其他角色造成的伤害时，可获得其一项技能（限定技、觉醒技除外）",
	["#jingshen1"] = "回合开始：%from 的技能【%arg】被触发，<font color=\"yellow\"><b>即时锦囊不可被无懈抵消！</b></font>",
	["#jingshen2"] = "回合结束：%from 的技能【%arg】被触发，<font color=\"yellow\"><b>不可被无懈的效果已消失！</b></font>",
	["quanbian"] = "权变",
	["quanbiancard"] = "权变",
	["$quanbian1"] = "哼，只有这种程度吗",
	["$quanbian2"] = "就凭你？哼哼哼哼",
	["$quanbian3"] = "努力活下去吧，在这乱世之中",
	["$quanbian4"] = "只有靠自己，才是强者",
	[":quanbian"]="<font color=\"blue\"><b>出牌阶段限一次</b></font>：若手牌颜色相同，你令一名角色失去１点体力或获得一名角色区域内的一张牌；若颜色不同，视为使用了一张【万箭齐发】/【南蛮入侵】",
	["wjqfclone"] = "使用一张【万箭齐发】",
	["nmrqclone"] = "使用一张【南蛮入侵】",
	["shiqutili"] = "令一名角色失去１点体力",
	["huodeyizhangpai"] = "获得一名角色区域内的一张牌",
	["shiqutilixuanren"] = "【权变·同色】★技能效果：该角色失去１点体力",
	["huodeyizhangpaixuanren"] = "【权变·同色】★技能效果：你获得该角色区域内的一张牌",
	["huodeyizhangpaitip"] = "请选择该角色区域内的一张牌",
	["~shenjiaxu"]="大势已去，吾不能自保矣",
   
	["shenchengyu"]="五谋程昱",
	["#shenchengyu"]="刚戾不阿", 
	["baoquan"]="尽辅",	
	["h~~"] = "请弃掉一张手牌",
	["$baoquan"] = "不忙，吾有一计在此。",
	[":baoquan"]="其他角色的装备牌因弃置而进入弃牌堆时，你可以弃一张手牌令其返回持有者手中。",
	["gangshang"] = "刚戾",
	[":gangshang"]="受到他人伤害后，你可以摸１张牌并选择与其拼点，若赢则你对其造成１点伤害,否则双方共同流失１点体力。", 
	["$gangshang1"] = "休想全身而退！",
	["$gangshang2"] = "闪过了？",
	["diandan"] = "遗志",
	["$diandan"] = "赴汤蹈火，在所不辞！",
	["@diandan"] = "遗志",
	[":diandan"] = "<b>限定技</b>，出牌阶段，你可以减１点体力上限，然后令一名其他角色弃置其装备区里的所有牌。",
	["~shenchengyu"]="辞官回乡罢了···",

	["thchuangxin"]="双计", 
	[":thchuangxin"]="出牌阶段开始时，你可弃置Ｘ张牌，然后选择Ｘ项：1. 获得技能“驱虎”，直到回合结束 2. 获得技能“奇策”，直到回合结束。",
	["thchuangxinvs"]="双计", 
	["thchuangxincard"]="双计", 
	["LuaQuhu"]="驱虎",
	["LuaQuhuCard"]="驱虎",
	[":LuaQuhu"]="<font color=\"blue\"><b>出牌阶段限一次</b></font>：你可以与一名体力比你多的角色拼点，若你赢，则该角色对其攻击范围内你指定的另一名角色造成１点伤害；若你没赢，则其对你造成１点伤害。",
	["@thchuangxin"]="请弃置至多２张牌（包括装备；弃两张可以同时获得两个技能）",
	["shengou"]="五谋荀彧", 
	["#shengou"]="我是狗货",
	["thshenzhou"]="王佐",
	[":thshenzhou"]="你受到伤害后，可从牌堆顶亮出３张牌，将其中一种类别的牌交给一名角色，然后将其余的牌置入弃牌堆。",
	["#thshenzhou"]="%from 选择了 %to , %to 将得到 %arg 张 %arg2",
	["$thshenzhou"]="为守汉节，不惜吾命。",
	["thexi"]="吞狼",
	["$thexi"]="以守为攻，后发制人。",
	[":thexi"]="回合结束阶段，你可以弃一张手牌，选择两名角色，这两名角色须同时展示一张手牌，若这两张牌点数不同，你获得其中一张牌，所展示的牌点数大的角色获得另一张牌；若点数相同，你在此回合结束后进行一个额外的回合（此额外的回合内你不可再发动“吞狼”）。",
	["thexivs"]="吞狼",
	["thexicard"]="吞狼",
	["exbig"]="我要大的那张",
	["exsma"]="我要小的那张",
	["@thexi"]="是否发动技能【吞狼】？",
	["mopai"]="奇略",
	[":mopai"]="回合开始阶段，你摸两张牌。",
	["$mopai"]="集军资之粮，通漕运之道。",
	["~shengou"] = "身为汉臣，至死不渝···", 
	["$thchuangxin"] = "主公莫忧，吾有一计。",
	

	
}