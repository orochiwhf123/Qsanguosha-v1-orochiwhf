module("extensions.myz", package.seeall)
extension = sgs.Package("myz")

jiping=sgs.General(extension, "jiping", "qun", "3", true)

luaduanzhi = sgs.CreateTriggerSkill--断指
{
	name = "luaduanzhi",
	frequency = sgs.Skill_Compulsory,
	events = {sgs.GameStart},
	on_trigger = function(self,event,player,data)
		local room=player:getRoom()
		room:setPlayerCardLock(player,"slash")	
	end,
}
----------------------------------------------------------------------------------------------------
luagudu_card = sgs.CreateSkillCard
{--蛊毒技能卡
	name = "luagudu_card",	
	target_fixed = false,	
	will_throw = false,
	
	filter = function(self, targets, to_select,player)
		return #targets < sgs.Self:getMark("@gu") and to_select:objectName()~=player:objectName()
	end,
				
	on_use=function(self,room,player,targets)
	
	player:loseMark("@gu",#targets)
	for var=1,#targets,1 do	
    targets[var]:gainMark("@du",1)
    room:setEmotion(targets[var], "bad")
	end
	
	end,
}

luagudu_viewas = sgs.CreateViewAsSkill
{
	name = "luagudu_viewas",	
	n = 0,
	
	view_as = function(self, cards)
		return luagudu_card:clone()
	end,
	
	enabled_at_play = function()
		return false
	end,
	
	enabled_at_response = function(self, player, pattern)
		return pattern == "@@luagudu"
	end
}



luagudu=sgs.CreateTriggerSkill{
	name="luagudu",
	view_as_skill = luagudu_viewas,
	frequency = sgs.Skill_NotFrequent, 
	events={sgs.PhaseChange,sgs.AskForPeaches,sgs.PhaseEnd},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if (event==sgs.PhaseChange) and (player:getPhase()==sgs.Player_Discard) then
        local cards = player:getHandcards()
		for _,card in sgs.qlist(cards) do
			if card:inherits("Slash") then
				room:throwCard(card,player)
				player:gainMark("@gu")
			end
		end
		end
		
		if (event==sgs.AskForPeaches) then
		local dying=data:toDying()
		if dying.who:objectName()~=player:objectName() then return end
		while (player:getHp()<1 and player:getMark("@gu")>0 and player:askForSkillInvoke(self:objectName(),data)) do
		player:loseMark("@gu",1)
		local peach=sgs.Sanguosha:cloneCard("peach",sgs.Card_NoSuit,0)
		peach:setSkillName(self:objectName())
		local use=sgs.CardUseStruct()
		use.card=peach
		use.from=player
		use.to:append(player)
		room:useCard(use)
		end
		end
		
		if (event==sgs.PhaseEnd) and (player:getPhase()==sgs.Player_Discard) and player:getMark("@gu")>0 then
		room:askForUseCard(player, "@@luagudu", "askforgudu")
		end
	end,
}
-------------------------------------------------------------------------
luagudueffect=sgs.CreateTriggerSkill{
	name="#luagudueffect",
	events={sgs.PhaseChange},
	priority = 7,
	can_trigger = function(self, player)
		return true
	end,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if (event==sgs.PhaseChange) and (player:getPhase()==sgs.Player_RoundStart) then
        if player:getMark("@du")>0 then
		room:loseHp(player,player:getMark("@du"))
		player:loseAllMarks("@du")
		end
		end
	end,
}

-------------------------------------------------
luasaveeffect=sgs.CreateTriggerSkill{
	name="#luasaveeffect",
	events={sgs.CardEffect},
	priority = 7,
	can_trigger = function(self, player)
		return true
	end,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local effect=data:toCardEffect()
		if not effect.to:hasFlag("dying") or effect.to:getPhase()~=sgs.Player_RoundStart or effect.to:getMark("@du")==0 then return end
		if (effect.card:inherits("Peach") or effect.card:inherits("Analeptic")) then
		local log = sgs.LogMessage()
				log.type = "$peachtip"
				room:sendLog(log)
		effect.to:loseAllMarks("@du")
		return true end
		  	
	end,
}
------------------------------------------------------------
jiping:addSkill(luaduanzhi)
jiping:addSkill(luagudu)
jiping:addSkill(luagudueffect)
jiping:addSkill(luasaveeffect)
------------------------------------
zhangyi = sgs.General(extension, "zhangyi", "wei",3)

lianheng=sgs.CreateTriggerSkill{
	name="lianheng",
	frequency = sgs.Skill_NotFrequent, 
	events={sgs.PhaseChange},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()

		if (event==sgs.PhaseChange) and (player:getPhase()==sgs.Player_RoundStart) then
		if player:isAllNude() then return end
		if not player:askForSkillInvoke(self:objectName(),data) then return end
        local target=room:askForPlayerChosen(player,room:getOtherPlayers(player),"lianheng")
		local hej = player:getCards("hej")
		local x=player:getCardCount(true)--包括装备区，不包括判定区
		local y=hej:length()
		local y=hej:length()
	for _,c in sgs.qlist(hej) do
		room:moveCardTo(c, target, sgs.Player_Hand, true)
	    end
	    local value = sgs.QVariant()
	    value:setValue(target)
		---以下是返还
		local card_ids = sgs.IntList()
	    for _,d in sgs.qlist(target:getCards("hej")) do
		local id = d:getEffectiveId()
		card_ids:append(id)
	end
	for var = 1,y,1 do
		room:fillAG(card_ids, target)
		local cdid = room:askForAG(target, card_ids, false, self:objectName())
		room:moveCardTo(sgs.Sanguosha:getCard(cdid), player, sgs.Player_Hand, true)
		card_ids:removeOne(cdid)
		target:invoke("clearAG")
	end
		
		return false
		end
	end,
}
----------------------

taolue=sgs.CreateTriggerSkill{
        name="taolue",
		frequency = sgs.Skill_Frequent,
        events={sgs.CardEffected},
        on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		local effect = data:toCardEffect()
		if  effect.from:objectName() ~= player:objectName() and (effect.card:inherits("TrickCard") or effect.card:inherits("Slash")) and player:askForSkillInvoke(self:objectName()) then
		
			local judge=sgs.JudgeStruct()
			judge.pattern=sgs.QRegExp("(.*):(spade):(.*)")
			judge.good=true
			judge.reason=self:objectName()
			judge.who=player
		    room:judge(judge)
		if judge:isGood() then
		room:setEmotion(player,"good")
		room:playSkillEffect("taolue")
		else
			room:setEmotion(player,"bad")
			return
		end
				local log = sgs.LogMessage()
				log.type = "$taoluetip"
				room:sendLog(log)
		
        --if (effect.card:inherits("TrickCard") or effect.card:inherits("Slash")) and math.random()<=0.25 then
		
         return true end
	end,
}
------------------------
zhangyi:addSkill(lianheng)
zhangyi:addSkill(taolue)
--------------------------------
newhyy = sgs.General(extension, "newhyy", "shu",3,false)

newjizhi = sgs.CreateTriggerSkill
{
	name = "newjizhi",
	events={sgs.PhaseChange},
	frequency=sgs.Skill_NotFrequent,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if player:getPhase()~=sgs.Player_Draw then return end
		if not room:askForSkillInvoke(player,"newjizhi") then return end
		    room:playSkillEffect("newjizhi")
			local use=sgs.CardUseStruct()
	        use.card=sgs.Sanguosha:cloneCard("ex_nihilo",sgs.Card_NoSuit,0)
	        use.from=player
	        room:useCard(use,false)
			return true
	end,
}

----------------------------------

newqicaiextra=sgs.CreateTargetModSkill{
name="#newqicaiextra",
--pattern="Slash,TrickCard",
pattern="TrickCard",
--distance_limit_func=function(self,player)
	--if player:hasSkill(self:objectName()) then
		--return 1000
	--else
		--return 0
	--end
--end,
extra_target_func=function(self,player,card)
	if player:hasSkill(self:objectName()) and card:isNDTrick() then
		return 1
	else
		return 0
	end
end
}
-------------------------
newqicai=sgs.CreateTriggerSkill{
	name="newqicai",
	frequency=sgs.Skill_NotFrequent,
	--events={sgs.CardUsed,sgs.CardEffected},
	events={sgs.CardEffected},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()

		--[[if (event==sgs.CardUsed) then
		local use=data:toCardUse()
		
		if use.card:isNDTrick() then
		room:playSkillEffect("newqicai")
		end
		
		if use.card:inherits("ExNihilo") then
		if not player:askForSkillInvoke("qiaojianmubiao") then return end
		room:playSkillEffect("newqicai")
		local duixiang = sgs.SPlayerList()
			for _,p in sgs.qlist(room:getAlivePlayers()) do
				if (p:objectName()~=player:objectName()) and (not room:isProhibited(player, p, use.card)) then
					duixiang:append(p)
				end
			end
			if duixiang==nil then return end
			mubiao = room:askForPlayerChosen(player, duixiang, "newqicaitip")
			
	        use.to:append(mubiao)
			use.to:append(player)
			data:setValue(use)
		end
		
		if use.card:inherits ("IronChain") then
		if not player:askForSkillInvoke("qiaojianmubiao") then return end
		room:playSkillEffect("newqicai",1)
		local duixiang = sgs.SPlayerList()
			for _,p in sgs.qlist(room:getAlivePlayers()) do
			if not room:isProhibited(player, p, use.card) then
					duixiang:append(p)
					end
			end
			if duixiang==nil then return end
			mubiao = room:askForPlayerChosen(player, duixiang, "newqicaitip")
			
	        use.to:append(mubiao)
			data:setValue(use)
		end
		
        end--]]
		
		if (event==sgs.CardEffected) then
		local effect = data:toCardEffect()
		if not effect.card:isNDTrick() then return end
		if not player:askForSkillInvoke("qiaojianmopai") then return end
		
		local targets = sgs.SPlayerList()
					all = room:getAllPlayers()
					for _,p in sgs.qlist(all) do
							targets:append(p)
					end
							local target=room:askForPlayerChosen(player,targets,"qiaojianxuanren")
							
							
		room:playSkillEffect("newqicai")
	    target:drawCards(1)--摸牌
		end
		
	end,

}

newhyy:addSkill(newjizhi)
newhyy:addSkill(newqicai)
--newhyy:addSkill(newqicaiextra)
----------------------------------------------
newsmy = sgs.General(extension, "newsmy", "wei",3,true)

newfankui = sgs.CreateTriggerSkill
{
	name = "newfankui",
	events={sgs.HpLost,sgs.Damaged},
	frequency=sgs.Skill_NotFrequent,
	priority=-1,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		
		if event==sgs.HpLost then
		if not room:askForSkillInvoke(player,"newfankui") then return end
		    local lost = data:toInt()
			if lost==0 then return end
			
			for var=1,lost,1 do
			local targets=sgs.SPlayerList()
		    for _,p in sgs.qlist(room:getAllPlayers()) do
			if not p:isNude() then
				targets:append(p)
			end
			end
			if targets==nil then return end
			room:playSkillEffect("newfankui",2)
			local target=room:askForPlayerChosen(player,targets,self:objectName())
		    local card_id=room:askForCardChosen(player,target,"he",self:objectName())
			room:obtainCard(player,card_id)
		    end
		end
		
		if event==sgs.Damaged then
		if not room:askForSkillInvoke(player,"newfankui") then return end
		    local damage=data:toDamage()
			if damage==0 then return end
			
			for var=1,damage.damage,1 do
		    local targets=sgs.SPlayerList()
		    for _,p in sgs.qlist(room:getAllPlayers()) do
			if not p:isNude() then
				targets:append(p)
			end
			end
			if targets==nil then return end
			local target=room:askForPlayerChosen(player,targets,self:objectName())
			if target:objectName() == damage.from:objectName() then
			room:playSkillEffect("newfankui",1)
			else
			room:playSkillEffect("newfankui",2)
			end
			if damage.from==nil then
			room:playSkillEffect("newfankui",2)
			end
		    local card_id=room:askForCardChosen(player,target,"he",self:objectName())
			room:obtainCard(player,card_id)
		    end	
		end
    end,
}
--------------------
newguicai_card=sgs.CreateSkillCard{
name="newguicai_card",
target_fixed=true,
will_throw=false,
}
--视为技 红牌
newguicai_vs=sgs.CreateViewAsSkill{
name="newguicai_vs",
n=1,
view_filter=function(self, selected, to_select)        
       return true
end,
view_as=function(self, cards)
        if #cards==1 then 
        local acard=newguicai_card:clone()        
        acard:addSubcard(cards[1])        
        acard:setSkillName(self:objectName())
        return acard end
end,
enabled_at_play=function()
        return false        
end,
enabled_at_response=function(self,pattern)
        return pattern=="@newguicai"      
end
}
--主技能
newguicai=sgs.CreateTriggerSkill{
        name="newguicai",
        events=sgs.AskForRetrial,--听说这个事件不需要cantrigger
        view_as_skill=newguicai_vs,
        --frequency=sgs.Skill_Compulsory,
        on_trigger=function(self,event,player,data)
                local room=player:getRoom()
                local selfplayer=room:findPlayerBySkillName(self:objectName())
                local judge=data:toJudge()                --获取判定结构体        
                selfplayer:setTag("Judge",data)                --SET技能拥有者TAG
                --if (room:askForSkillInvoke(selfplayer,self:objectName())~=true) then return false end        --询问发动 可以去掉
                if selfplayer:isNude() then return false end
                local card=room:askForCard(selfplayer,"@newguicai","newguicaitip")            
            if card~=nil then  -- 如果打出了 
			
			if judge.who:objectName() == selfplayer:objectName() then
			room:playSkillEffect("newguicai",1)
			else
			room:playSkillEffect("newguicai",2)
			end
			
			if sgs.Sanguosha:getCard(card:getEffectiveId()):getType() == judge.card:getType() then
                selfplayer:drawCards(1)	
            end				
                room:throwCard(judge.card) --原判定牌丢弃 
				
--如果是想要鬼道那样的替换回来就应该改为selfplayer:obtainCard(judge.card)
        	judge.card = sgs.Sanguosha:getCard(card:getEffectiveId()) --判定牌更改
       		room:moveCardTo(judge.card, nil, sgs.Player_Special) --移动到判定区
            local log=sgs.LogMessage()  --LOG 以下是改判定专用的TYPE
            log.type = "$ChangedJudge"
            log.from = selfplayer
            log.to:append(judge.who)
            log.card_str = card:getEffectIdString()
            room:sendLog(log)
            room:sendJudgeResult(judge) 
				end
                return false --要FALSE~~
        end,        
}
-------------------
newsmy:addSkill(newfankui)
newsmy:addSkill(newguicai)
----------------------------------------------------------


zhangxingcai = sgs.General(extension, "zhangxingcai", "shu",3,false)

function getshenxian(card)
-- 本函数用于获取甚贤的基本牌，因为有些基本牌是在技能卡的子卡列表里，不能直接获得，比如举荐、缔盟
        local shenxianpai = {}
        if not card:isVirtualCard() then
                if card:inherits("BasicCard") then
                        table.insert(shenxianpai, card)
                end
                return shenxianpai
        end
        for _, card_id in sgs.qlist(card:getSubcards()) do
                local c = sgs.Sanguosha:getCard(card_id)
                if c:inherits("BasicCard") then
                        table.insert(shenxianpai, c)
                end
        end
        return shenxianpai
end

shenxian=sgs.CreateTriggerSkill{
-- 甚贤主代码
        name="shenxian",
        frequency = sgs.Skill_Frequent,
        default_choice = "no",
        priority = -1,
        events={sgs.CardDiscarded},

        can_trigger = function(self, player)
                return not player:hasSkill(self:objectName())
        end,

        on_trigger = function(self,event,player,data)
                local room = player:getRoom()
				local shenxianpai = {}
				local zhangxingcai = room:findPlayerBySkillName(self:objectName())
				if zhangxingcai:getPhase()~=sgs.Player_NotActive then return end
                if event == sgs.CardUsed then
                        local use = data:toCardUse()
                        if use.card and 
						use.card:subcardsLength() > 0 and 
						use.card:willThrow() and 
						not use.card:isOwnerDiscarded() then --非自由弃牌
						shenxianpai = getshenxian(use.card)
						end
                        if ( #shenxianpai > 0 and (not room:getCurrent():hasFlag("shenxianflag")) and zhangxingcai and zhangxingcai:askForSkillInvoke(self:objectName(), data)) then 
						room:playSkillEffect("shenxian",1)
						zhangxingcai:drawCards(1) 
						room:setPlayerFlag(room:getCurrent(),"shenxianflag") 
						end
   
                elseif event == sgs.CardDiscarded then
				        local card = data:toCard()
						shenxianpai = getshenxian(card)
						if ( #shenxianpai > 0 and (not room:getCurrent():hasFlag("shenxianflag")) and zhangxingcai and zhangxingcai:askForSkillInvoke(self:objectName(), data))
						then 
						room:playSkillEffect("shenxian",2)
						zhangxingcai:drawCards(1)
                        room:setPlayerFlag(room:getCurrent(),"shenxianflag")
						end
           
                end
        end
}
-----------------------------------
--[[local a

qiangwucard=sgs.CreateSkillCard{
	name="qiangwucard",
	target_fixed = true,
	will_throw = false,
	on_use=function(self, room, source, targets)
		local judge=sgs.JudgeStruct() 
        judge.who=source 
        judge.pattern = sgs.QRegExp("(.*)")
        room:judge(judge) 
        a=judge.card:getNumber()
		
	end,
}
]]
--[[qiangwu=sgs.CreateViewAsSkill{
	name="qiangwu",
	n=1,
	view_filter=function(self, selected, to_select)
		return to_select:inherits("Slash") and to_select:getNumber() > 7
	end,
	view_as=function(self, cards)
		local QYcard=qiangwucard:clone()
		QYcard:setSkillName((self:objectName()))
		return QYcard
	end,
	enabled_at_play=function(self, player)
		return player:isAlive()
	end,
}

qiangwucard = sgs.CreateSkillCard
{
	name = "qiangwucard",	
	target_fixed = false,	
	will_throw = false,
	
		filter = function(self, targets, to_select, player)
		return #targets == 0 and player:canSlash(to_select,true) and to_select:objectName()~=player:objectName() and  player:inMyAttackRange(to_select)
	end,
	
on_use = function(self, room, source, targets)
            local room = source:getRoom()
			local use=sgs.CardUseStruct()
	        use.card=sgs.Sanguosha:getCard(self:getEffectiveId())
	        use.from=source
	        use.to:append(targets[1])
	        room:useCard(use,true)
end,
}

qiangwu = sgs.CreateTriggerSkill{
	name = "qiangwu" ,
	--view_as_skill = qiangwuvs ,
	events = {sgs.CardUsed},
	frequency = sgs.Skill_Compulsory,
	can_trigger = function(self, player)
		return player
	end ,
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		if event == sgs.CardUsed then
			local use = data:toCardUse()
			if use.card and use.card:inherits("Slash") 
					and (use.card:getNumber() > 7) then
			room:askForUseCard(player,"slash","qiangwutip")
			end
			end
	end
}]]

qiangwu=sgs.CreateTriggerSkill{

	name = "qiangwu",
	
 	frequency = sgs.Skill_Compulsory,
	priority = 5,
	
 	events = {sgs.SlashProceed,sgs.Predamage},
	
 	on_trigger=function(self,event,player,data)
	  	local room = player:getRoom()
		if event==sgs.SlashProceed then
				if not player:getWeapon():isKindOf("Spear") then return end
     			local effect=data:toSlashEffect()
				room:playSkillEffect("qiangwu",1)			
			    local log=sgs.LogMessage()
			    log.type="#qiangwutip1"
			    log.from=player
			    log.to:append(effect.to)
			    room:sendLog(log)
     			room:slashResult(effect, nil) 
				
     			return true
		end
		
		if event==sgs.Predamage then
		    local damage=data:toDamage()
		    if (damage.card:getNumber() ~= 7 or (not damage.card:inherits("Slash"))) then return end
			damage.damage=damage.damage+1
			data:setValue(damage)
            room:playSkillEffect("qiangwu",2)			
			local log=sgs.LogMessage()
			log.type="#qiangwutip2"
			log.from=player
			log.to:append(damage.to)
			log.arg=damage.damage
			room:sendLog(log)
		end
	end
}

qiangwubuff = sgs.CreateSlashSkill
{
	name = "#qiangwubuff",
-- 攻击范围
	s_range_func = function(self, from, to, slash)
		if from:hasSkill("#qiangwubuff") and slash and slash:getNumber()<7 then
			return -998 -- 注意这里因为是锁定攻击范围，所以前面要加个负号，如果不加，则累加攻击范围
		end
	end,
	
	s_extra_func = function(self, from, to, slash) -- from：使用者；to：目标；slash：所用的杀。这三个参数除了from，其余都是可有可无的
		if from:hasSkill("#qiangwubuff") and slash and slash:getNumber()>7 then --注意必须先判断from是否有这个技能，否则谁都会发动的
			return 1 -- 这张杀可以指定一个额外目标，注意加上原本的，一共两个目标
		end
	end,
	
}
--------------------------------------------
zhangxingcai:addSkill(shenxian)
zhangxingcai:addSkill(qiangwu)
zhangxingcai:addSkill(qiangwubuff)

---------------------------------------------------------
zhangxiu = sgs.General(extension, "zhangxiu", "qun",4)

qiangwang=sgs.CreateTriggerSkill{
	name="#qiangwang",
	frequency=sgs.Skill_NotFrequent,
	events={sgs.Damage},	
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local damage=data:toDamage()
		if event==sgs.Damage and not damage.card:inherits("Slash") or damage.to:isDead() then return end
		room:playSkillEffect("#qiangwang")
		--player:drawCards(1)
		local slash=room:askForCard(player,"slash","@#qiangwang")
		if slash then
			--slash:setSkillName(self:objectName())
			local use=sgs.CardUseStruct()
			 	use.card = slash
			 	use.from = player
			 	use.to:append(damage.to)
			    room:useCard(use,false)
		end
	end,
}


local skill=sgs.Sanguosha:getSkill("#qiangwang")
if not skill then
local skillList=sgs.SkillList()
skillList:append(qiangwang)
sgs.Sanguosha:addSkills(skillList)
end


xiongluanslash = sgs.CreateSlashSkill
{
	name = "#xiongluanslash",
-- 额外出杀（返回还能再使用的杀的数量）
	s_residue_func = function(self, from)
		if from:hasSkill("#xiongluanslash") and from:getMark("@xiongluan") == 0 then
            return 998
        else
            return 0
		end
	end,
}

xiongluanbiaoji=sgs.CreateTriggerSkill{
	name="#xiongluanbiaoji",
	frequency=sgs.Skill_Limited,
	events={sgs.GameStart},
	on_trigger=function(self,event,player,data)
		player:gainMark("@xiongluan",1)
	end,
}

xiongluan = sgs.CreateTriggerSkill
{
name = "xiongluan",
events = {sgs.PhaseChange},
frequency=sgs.Skill_Limited,
on_trigger = function(self, event, player, data)
    local room = player:getRoom()
	
	if player:getPhase()==sgs.Player_Play and player:getMark("@xiongluan")> 0 and room:askForSkillInvoke(player,"xiongluan") then
	
	    player:loseAllMarks("@xiongluan")
		room:playSkillEffect("xiongluan",1)
	    --player:skip(sgs.Player_Judge)
		--room:loseHp(player, 1)
		room:loseMaxHp(player,1)
		local target=room:askForPlayerChosen(player,room:getOtherPlayers(player),"xuanzedaomeidan")
		room:setPlayerMark(target,"@xiongluan",1)
		player:addMark("xiongluanused")
		
		--room:setPlayerCardLock(target,"Card")
		  target:jilei("Card")
		  --target:invoke("jilei", "Card")
		  target:setFlags("jilei")
								
		--local choice = room:askForChoice(player, self:objectName(), "basic+equip+trick")
				--target:jilei("basic")
				--target:jilei("equip")
				--target:jilei("trick")
				--target:invoke("jilei", "basic")
				--target:invoke("jilei", "equip")
				--target:invoke("jilei", "trick")

		--room:setPlayerFlag(player, "xianzhen_success")
        room:setFixedDistance(player, target, 1)
		room:acquireSkill(player,"#qiangwang")
		room:detachSkillFromPlayer(player,"xiongluan")
		--player:gainAnExtraTurn()--额外回合实现有问题


		--player:setTag("XianzhenTarget", sgs.QVariant(target))
		
		    --[[local hp = target:getHp()
            local maxhp = target:getMaxHp()
			
			target:setTag("hided",sgs.QVariant(target:getGeneralName()))
			if target:isMale() then
			room:transfigure(target,"sujiang",false,false)
			room:setPlayerProperty(target,"hp",sgs.QVariant(hp))
			else
			room:transfigure(target,"sujiangf",false,false)
			room:setPlayerProperty(target,"hp",sgs.QVariant(hp))
			end
			
			if target:getGeneral2() then
			
			target:setTag("hided2",sgs.QVariant(target:getGeneral2Name()))
			if target:getGeneral2():isMale() then
			room:setPlayerProperty(target,"general2",sgs.QVariant("sujiang"))
			room:setPlayerProperty(target,"maxhp",sgs.QVariant(maxhp))
			else
			room:setPlayerProperty(target,"general2",sgs.QVariant("sujiangf"))
			room:setPlayerProperty(target,"maxhp",sgs.QVariant(maxhp))
			end
			
			end]]
			
			
			end
			end
		
}


xiongluanclear = sgs.CreateTriggerSkill{
	name = "#xiongluanclear",
	events = {sgs.PhaseChange,sgs.Death},
    can_trigger = function(self, target)
    return target:hasSkill(self:objectName())
    end,
	
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
	if ((event == sgs.PhaseChange and player:getPhase() == sgs.Player_NotActive) or event == sgs.Death) and player:getMark("xiongluanused")>0 then
	--room:detachSkillFromPlayer(player,"xiongluan")
	room:detachSkillFromPlayer(player,"#qiangwang")
		
		for _,p in sgs.qlist(room:getOtherPlayers(player)) do
		        if p:getMark("@xiongluan")>0 and  p:hasFlag("jilei") then
				--room:setPlayerProperty(player, "maxhp", sgs.QVariant(player:getMaxHp()+1))
				--room:clearPlayerCardLock(p)
				p:jilei(".")
				--p:invoke("jilei", ".")
				room:setPlayerMark(p, "@xiongluan", 0)
				room:setFixedDistance(player, p, -1)
				--player:removeTag("XianzhenTarget")
				
			--[[local hp = p:getHp()	
			local maxhp = p:getMaxHp()
            room:transfigure(p,p:getTag("hided"):toString(),false,false)
            room:setPlayerProperty(p,"hp",sgs.QVariant(hp))			
			p:setTag("hided",sgs.QVariant())
			
			if p:getGeneral2() then
 			room:setPlayerProperty(p, "general2", sgs.QVariant(p:getTag("hided2"):toString()))
			room:setPlayerProperty(p,"maxhp",sgs.QVariant(maxhp))
            p:setTag("hided2",sgs.QVariant())
			end]]
			end
		end
	end
	
		return false
	end,
}


congjian=sgs.CreateTriggerSkill{
	name="congjian",
	frequency = sgs.Skill_Frequent,
	events={sgs.CardUsed},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local splayer=room:findPlayerBySkillName(self:objectName())
		if not splayer then return end
		--if splayer:getPhase()~=sgs.Player_NotActive then return end
		local use=data:toCardUse()
		if  use.from:getGeneralName()==splayer:getGeneralName() then return end--识别角色名字，而不是通常用的objectName()
		if not (use.card:isNDTrick() and use.card:getSuit()==sgs.Card_Spade) then return end
		if not splayer:askForSkillInvoke(self:objectName()) then return end
		room:playSkillEffect("congjian")
		use.from:drawCards(1)--摸牌
		splayer:drawCards(1)--摸牌
		
		local huanpai = room:askForCardChosen(use.from,use.from, "he" ,"congjian")
		room:obtainCard(splayer,sgs.Sanguosha:getCard(huanpai),room:getCardPlace(huanpai)~=sgs.Player_Hand)
		--room:moveCardTo(sgs.Sanguosha:getCard(huanpai),splayer,sgs.Player_Hand,false)
		--特别要注意moveCardTo的末位参数是“是否强制显示（会造成移动装备到手牌后UI不记录刷新）”，obtainCard则是“是否隐藏显示不让人看（例如司马懿反馈手牌区和装备区的不同，司马懿如果连续反馈两种区域的牌，是不可以一概用move的，否则要么反馈装备区不强制显示造成BUG，要么反馈手牌区强制显示与描述不符，用obtain则没这个问题，声明是不是手牌区即可，因为它的参数是让不让人看，装备区的本来就看得到）
		local huanpaii = room:askForCardChosen(splayer,splayer, "he" ,"congjian")
		room:obtainCard(use.from,sgs.Sanguosha:getCard(huanpaii),room:getCardPlace(huanpaii)~=sgs.Player_Hand)--最后一个参数指的是哪种类型明牌，这儿就是指非手牌明牌（其实非手牌本来就是可见的，目的是实现单手牌不可见）
		--room:moveCardTo(sgs.Sanguosha:getCard(huanpaii),use.from,sgs.Player_Hand,false)
		--同上原因
		end,
		
	can_trigger=function(self,target)
		return true
	end,
}

--[[local skills = sgs.SkillList()
if not sgs.Sanguosha:getSkill("beidixiaoxiong") then skills:append(beidixiaoxiong) end
sgs.Sanguosha:addSkills(skills)]]

zhangxiu:addSkill(xiongluan)
--zhangxiu:addSkill(xiongluanslash)
zhangxiu:addSkill(xiongluanbiaoji)
zhangxiu:addSkill(xiongluanclear)
zhangxiu:addSkill(congjian)
----------------------------------------------------------------------------

niufu = sgs.General(extension, "niufu", "qun",5)

wujian=sgs.CreateTriggerSkill{
	name="wujian",
	frequency = sgs.Skill_Frequent,
	priority = 9,
	events={sgs.Damage,sgs.Damaged,sgs.SlashProceed,sgs.SlashEffect},
	view_as_skill=dnfjingtongvs,
	
	on_trigger=function(self,event,player,data)
		local room = player:getRoom()		
		local effect		
		if(event == sgs.SlashProceed) then
			effect = data:toSlashEffect()
			if not effect.from:hasSkill(self:objectName()) then return false end 
			
			local card=room:askForCard(effect.from, "Slash", "@wujianone-discard",data)
                    if card~=nil then 	
                    room:throwCard(card)				   
					room:slashResult(effect, nil)
					room:playSkillEffect("wujian",1)
					return true
					end
				 
			return

			--【岩石之箭】你使用杀指定目标后，可弃置1张杀强制命中
			elseif event == sgs.Damage then
			local damage = data:toDamage()
			if not damage.from:hasSkill(self:objectName()) then return false end 
			if not damage.to:isAlive() then return end 

		    --【烈焰之箭】你造成雷属性伤害后，可流失1点体力追加1点火属性伤害
			if (damage.nature==sgs.DamageStruct_Thunder) and damage.from:askForSkillInvoke("@wujiantwo") then 
			room:playSkillEffect("wujian",2)
			    room:loseHp(damage.from,1)
				
				damage.from = damage.from
				damage.to = damage.to
				damage.damage = 1
				damage.nature=sgs.DamageStruct_Fire 
				room:damage(damage)
				
		        end
				
--[[第一部分为 classname 即通常使用 inherits 用到的名字
第二部分为 花色 即 Heart ………………
第三部分为 点数 （此处注释说明了数字可以用“~”符号作为区间选择）
第四部分为 位置 即 equip（装备区） 或者 hand（手牌区）
第五部分为 颜色 即 red（红）black（黑）

了解了这些，我们就可以使用自定义pattern来更方便的编写技能
例如：要求一张 点数 2~9 的红色杀或者装备牌 的手牌 可以写成 "Slash,EquipCard|.|2~9|hand|red"]]

		    if damage.card:inherits("TrickCard") and damage.card:isBlack() then 
			local card=room:askForCard(damage.from, "TrickCard|.|.|hand|black", "@wujianthree-discard",data)
			if card==nil then return false end
			room:throwCard(card)
			room:playSkillEffect("wujian",3)
			--【洪水之箭】你使用黑色锦囊造成伤害后，可弃置1张黑色锦囊清空对方装备区
		    room:throwCard(damage.to:getWeapon(), damage.to, damage.from)
	        room:throwCard(damage.to:getArmor(), damage.to, damage.from)
            room:throwCard(damage.to:getDefensiveHorse(), damage.to, damage.from)
            room:throwCard(damage.to:getOffensiveHorse(), damage.to, damage.from)
		        end
				
			if damage.card:inherits("TrickCard") and damage.card:isRed() then 
			local card=room:askForCard(damage.from, "TrickCard|.|.|hand|red", "@wujianfour-discard",data)
			if card==nil then return false end
				--【苍月之箭】你使用红色锦囊造成伤害后，可弃置1张红色锦囊令双方依次失去1点体力（从你开始）
				room:throwCard(card)
				room:playSkillEffect("wujian",4)
                room:loseHp(damage.from,1)
				room:loseHp(damage.to,1)
		        end
	            return
				
			elseif event == sgs.Damaged then	
			local damage = data:toDamage()
			if not damage.to:hasSkill(self:objectName()) then return false end 
			if not damage.to:isAlive() then return end 
			--【伤心之箭】你受到AOE伤害后，可弃置1张装备牌，视为使用了一张万箭齐发
			if damage.card:inherits("AOE") then
			local card=room:askForCard(damage.to, "EquipCard|.|.|.|.", "@wujianfive-discard",data)
			if card==nil then return false end
			room:throwCard(card)
			room:playSkillEffect("wujian",5)
			local niufuwanjian=sgs.Sanguosha:cloneCard("archery_attack", sgs.Card_NoSuit, 0)
		    local use = sgs.CardUseStruct()
		    use.from = damage.to
		    for _,p in sgs.qlist(room:getAlivePlayers()) do
		    use.to:append(p)
		    end
		    use.card = niufuwanjian
		    room:useCard(use)
			
			end
			end
			
				
	end,
	
	can_trigger=function(self,target)
		return true
	end,
}

--------------------------------
liujian = sgs.CreateTriggerSkill
{
name = "liujian",
events = {sgs.PhaseChange,sgs.PreDeath},
frequency=sgs.Skill_Limited,
on_trigger = function(self, event, player, data)
    local room = player:getRoom()
	
	
			if event==sgs.PreDeath and player:getMark("@liujian")> 0 then
			if player:hasSkill("liujian") then
				room:setPlayerProperty(player,"maxhp",sgs.QVariant(5))
				room:setPlayerProperty(player,"hp",sgs.QVariant(1))
				player:drawCards(5)
				player:loseAllMarks("@liujian")
			    player:gainAnExtraTurn(player)
				return true
			end
			end
			
	if ((event == sgs.PhaseChange and player:getPhase() == sgs.Player_NotActive)  and  player:getMark("@liujian")==0)  then
	   room:killPlayer(player)
       end
	   
	   end
		
}

liujianbiaoji=sgs.CreateTriggerSkill{
	name="#liujianbiaoji",
	frequency=sgs.Skill_Limited,
	events={sgs.GameStart},
	on_trigger=function(self,event,player,data)
		player:gainMark("@liujian",1)
	end,
}


-----------------------
niufu:addSkill(wujian)
--niufu:addSkill(liujian)
--niufu:addSkill(liujianbiaoji)
-----------------------------------------
quyi = sgs.General(extension, "quyi", "qun",4)

fuqibuff = sgs.CreateTriggerSkill
{
name = "#fuqibuff",
events = {sgs.PhaseChange,sgs.CardUsed,sgs.CardLost},
frequency=sgs.Skill_Compulsory,
on_trigger = function(self, event, player, data)
    local room = player:getRoom()
	local use=data:toCardUse()
    local quyi=room:findPlayerBySkillName("fuqi")	
	if (event == sgs.PhaseChange or event ==sgs.CardUsed or event == sgs.CardLost) then
	for _,p in sgs.qlist(room:getOtherPlayers(quyi)) do
	   if (quyi:distanceTo(p) == 1 or p:distanceTo(quyi)== 1) then
	   room:setPlayerMark(p, "fuqi", 1)
       end
	end   
	
	for _,p in sgs.qlist(room:getOtherPlayers(quyi)) do
	   if (quyi:distanceTo(p) ~= 1 or p:distanceTo(quyi)~= 1) then
	   room:setPlayerMark(p, "fuqi", 0)
	   --p:jilei(".")
	   --p:setFlags("-jilei")
       end
	end
	
	end
	
	end,
	   
	can_trigger=function(self,target)
		return true
	end,
		
}
---------------
fuqi = sgs.CreateTriggerSkill
{
name = "fuqi",
events = {sgs.CardEffect,sgs.SlashProceed},
frequency=sgs.Skill_Compulsory,
on_trigger = function(self, event, player, data)
    local room = player:getRoom()
	--if (event == sgs.CardUsed and use.from:hasSkill("fuqi") and use.to:getMark("fuqi") > 0) then
	if event == sgs.CardEffect then  
	local effect=data:toCardEffect()
	if effect.from:getPhase()~=sgs.Player_NotActive and effect.from:hasSkill("fuqi") then--麹义回合内使用的卡牌作用时封锁距离1
	   for _,p in sgs.qlist(room:getOtherPlayers(effect.from)) do
	   if ((p:getState() == "robot") and (effect.from:distanceTo(p) == 1 or p:distanceTo(effect.from)== 1)) then
		  p:jilei("Card")

		  end
		  end
		  end
		  end
		  
		  ----------------------
		  
	if event==sgs.SlashProceed then
	local effect=data:toSlashEffect()
	if ((effect.from:getPhase()==sgs.Player_NotActive) or (not effect.from:hasSkill("fuqi"))) then return end

	   if ((effect.to:getState() == "robot") and (effect.from:distanceTo(effect.to) == 1 or effect.to:distanceTo(effect.from)== 1)) then
		  room:slashResult(effect, nil)
	      return true  --取消杀的结算，对距离1使用杀直接命中 
		  end
		  
		  end

		  end
							
}

------------
jiaozi = sgs.CreateTriggerSkill{
	frequency = sgs.Skill_Compulsory,
	name = "jiaozi",
	events = {sgs.Predamage,sgs.Predamaged,sgs.PhaseChange,sgs.Death},
	
    can_trigger = function(self, target)
    return target:hasSkill(self:objectName())
    end,
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		local qy = room:findPlayerBySkillName("jiaozi")
		if qy == nil then return false end
		if ((event == sgs.PhaseChange and qy:getPhase() == sgs.Player_NotActive) or event == sgs.Death) then
		for _,p in sgs.qlist(room:getAllPlayers()) do
			p:jilei(".")

			end
			room:playSkillEffect("fuqi",2)
		end	
		
		if event == sgs.Predamage then--造成伤害即解除封锁
		local damage = data:toDamage()
		for _,p in sgs.qlist(room:getAllPlayers()) do
			p:jilei(".")
			--p:setFlags("-jilei")
		end
			
		for _,p in sgs.qlist(room:getOtherPlayers(qy)) do
		if p:getHandcardNum() > qy:getHandcardNum()  then return false end
		end
		--[[local log = sgs.LogMessage()
			log.from = player
			log.to:append(damage.to)
			log.arg = tonumber(damage.damage)
			log.arg2 = log.arg+1
			room:sendLog(log)]]
			damage.damage = damage.damage+1
			data:setValue(damage)
			room:playSkillEffect("fuqi",1)
			end
			
		if event == sgs.Predamaged then
		local damage = data:toDamage()
			for _,p in sgs.qlist(room:getOtherPlayers(qy)) do
			p:jilei(".")
			--room:setPlayerCardLock(p,"--")
			end
		for _,p in sgs.qlist(room:getOtherPlayers(qy)) do
		if p:getHandcardNum() > qy:getHandcardNum()  then return false end
		
		end
		--[[local log = sgs.LogMessage()
			log.from = player
			log.to:append(damage.to)
			log.arg = tonumber(damage.damage)
			log.arg2 = log.arg+1
			room:sendLog(log)]]

			damage.damage = damage.damage+1
			data:setValue(damage)
			room:playSkillEffect("jiaozi",2)
		end
	end,
}

--quyi:addSkill(fuqibuff)
quyi:addSkill(fuqi)
quyi:addSkill(jiaozi)			
--------------------------------------------
--狄青
diqing = sgs.General(extension, "diqing", "qun",4)

--骁勇
xiaoyong=sgs.CreateTriggerSkill{
name="xiaoyong",
events={sgs.Predamage,sgs.Predamaged},
frequency=sgs.Skill_Compulsory,
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	if event==sgs.Predamage then
		local damage=data:toDamage()
		if not damage.from:hasSkill(self:objectName()) then return false end
		if damage.card==nil then return false end
         --if (damage.card:inherits("Duel") or damage.card:inherits("FireSlash") or damage.card:inherits("ThunderSlash")) then
		 if (damage.card:getSuit() == sgs.Card_Club) then
		
				damage.damage=damage.damage+1
				data:setValue(damage)
				room:playSkillEffect("xiaoyong",1)
				local log=sgs.LogMessage()
				log.from=selfplayer
				log.to:append(damage.to)
				log.type="#xiaoyong"
				log.arg=tonumber(damage.damage-1)
				log.arg2=log.arg+1
				room:sendLog(log)
			end
		end
		
		if event==sgs.Predamaged then
		local damage=data:toDamage()
		if not damage.to:hasSkill(self:objectName()) then return false end
		if damage.card==nil then return false end
		--if (damage.card:inherits("Duel") or damage.card:inherits("FireSlash") or damage.card:inherits("ThunderSlash")) then
		if (damage.card:getSuit() == sgs.Card_Club) then
		damage.damage=damage.damage-1
		data:setValue(damage)
		room:playSkillEffect("xiaoyong",2)
		end
		end
end,
}
-----------------------
--定略
dinglue_card = sgs.CreateSkillCard{
	name="dinglue",
	target_fixed=true,
	on_use=function(self,room,source,targets)
		if source:isAlive() then
			room:throwCard(self)
			room:drawCards(source,self:subcardsLength())
		end
	end,
}
dinglueVS=sgs.CreateViewAsSkill{
	name="dinglueVS",
	n=998,
	view_filter=function(self,selected,to_select)
		return sgs.Self:hasFlag("dinglueCard:"..to_select:getId())
	end,
	view_as=function(self,cards)
		if #cards==0 then return nil end
		local new_card=dinglue_card:clone()
		local i=0
		local card=nil
		while i<#cards do
			i=i+1
			card=cards[i]
			new_card:addSubcard(card:getId())
		end
		new_card:setSkillName("dinglue")
		return new_card
	end,
	enabled_at_play=function()
		return false
	end,
	enabled_at_response=function(self,player,pattern)
		return pattern=="@dinglue"
	end,
}
dinglue=sgs.CreateTriggerSkill{
	name="dinglue",
	events={sgs.CardGot,sgs.PhaseChange,sgs.CardDrawnDone},
	priority=-1,
	view_as_skill=dinglueVS,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if event==sgs.PhaseChange then
			if player:getPhase()==sgs.Player_Draw then
				--player:speak("phase")
				room:setPlayerFlag(player,"dinglueusing")
				room:askForUseCard(player,"@dinglue","dinglue")
			end
			return false
		end
		if player:getPhase()~=sgs.Player_Draw then return false end
		if player:hasFlag("dinglueusing") then return false end
		local id=0
		local str=""
		if event==sgs.CardDrawnDone then
			--player:speak("drawndone")
			local x=data:toInt()
			local hnum=player:getHandcardNum()--手牌数
			for var=1,x,1 do
				id=player:handCards():at(hnum-var)
				str="dinglueCard:"..id
				--player:speak(str)
				room:setPlayerFlag(player,str)
			end
		end
		if event==sgs.CardGot then
			--player:speak("got")
			local move=data:toCardMove()
			local id=move.card_id
			if not sgs.Sanguosha:getCard(id):isVirtualCard() then
				for _,id_t in sgs.qlist(sgs.Sanguosha:getCard(id):getSubcards()) do
					str="dinglueCard:"..id
					--player:speak(str)
					room:setPlayerFlag(player,str)
				end
			end
		end
	end,
}
----------------
--整军
zhengjun=sgs.CreateDistanceSkill{
name= "zhengjun",
correct_func=function(self,from,to)
	--if from:hasFlag("skillnumbersix_heart") and not to:hasFlag("skillnumbersix_fixed")
	--then return -9
	--else return 0
	--end
	--local dis=from:distanceTo(to)
	if from:hasSkill(self:objectName()) then
		if to:getDefensiveHorse()~=nil then
			--return dis-1
			return -1
		end
	elseif to:hasSkill(self:objectName()) then
		if from:getOffensiveHorse()~=nil then
			--return dis+1
			return 1
		end
	end
end
}

diqing:addSkill(xiaoyong)
--diqing:addSkill(zhengjun)
diqing:addSkill(dinglue)

---------------------------------------------------------------------------------------
--刘谌
liuchen = sgs.General(extension, "liuchen", "shu",4)

--战绝
zhanjuevs=sgs.CreateViewAsSkill{
name="zhanjuevs",
n=998, 
view_filter=function(self, selected, to_select)
	return not to_select:isEquipped() --非装备
end,
view_as=function(self, cards)

    if #cards == sgs.Self:getHandcardNum() then
        local acard=sgs.Sanguosha:cloneCard("duel",sgs.Card_NoSuit, 0)      --克隆一张无颜色无点数的决斗
		local i = 0
		while(i < #cards) do
			i = i + 1
			acard:addSubcard(cards[i])--X张牌成为子卡，这样选择的牌才能正常扔掉
		end
		acard:setSkillName(self:objectName())
		return acard ----返回这个决斗
	end		
end,
enabled_at_play=function()
    return  sgs.Self:getMark("zhanjuewin")<2 and not sgs.Self:isKongcheng()
end,
enabled_at_response=function(self,pattern)        
    return false  --不响应打出
end
}

zhanjuets = sgs.CreateTriggerSkill
{--战绝受伤效果
	name = "#zhanjuets",
	events = {sgs.Damaged,sgs.PhaseChange}, 
	priority=4,
	can_trigger = function(self, player)
		return true
	end,
	
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		local owner = room:findPlayerBySkillName(self:objectName())
		if not owner or owner:isDead() then return false end
		
		if event == sgs.PhaseChange and owner:getPhase() == sgs.Player_Finish then
		room:setPlayerMark(owner, "zhanjuewin", 0) -- 阶段转换时清除标记
		else
		
		local damage = data:toDamage()
		if damage.card:getSkillName()~="zhanjuevs" then return false end
		--room:playSkillEffect("zhanjuevs")
			owner:drawCards(1)
			damage.to:drawCards(1)
			if damage.from:objectName()==owner:objectName() then room:setPlayerMark(owner,"zhanjuewin",owner:getMark("zhanjuewin")+1) end
			--if damage.from:objectName()==owner:objectName() then owner:gainMark("zhanjuewin") end 这个写法会有获得标记的提示，哪怕是隐性标记
			end
	end,
}
-------------------------------------------------

qinwang=sgs.CreateTriggerSkill{
	name="qinwang",
	can_trigger = function (self, player)
		return player:hasSkill("qinwang")
	end,--读取当前具备此技能的玩家（定向作用）
	
	events={sgs.HpChanged},
	priority = 3,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if player:isAlive() and player:getMark("qinwangused")== 0 and player:getHp()<=2 then
        room:acquireSkill(player, "jijiang")
	    room:detachSkillFromPlayer(player,self:objectName())
		player:addMark("qinwangused")
		end
	end,
}

liuchen:addSkill(zhanjuevs)
liuchen:addSkill(zhanjuets)
liuchen:addSkill(qinwang)

	
sgs.LoadTranslationTable{

    ["myz"]="命与灾",

	["liuchen"] = "刘谌",
	["#liuchen"]="北地王",
	["zhanjuevs"]="战绝",
	[":zhanjuevs"]="出牌阶段，你可将所有手牌当【决斗】使用，结算后你和受伤角色各摸一张牌。\n◆<font color=\"red\"><b>赢两次后不可再发动</b></font>",
	["$zhanjuevs1"] = "成败在此一举！杀！",
	["$zhanjuevs2"] = "此刻唯有死战，安能言降！",
	["qinwang"]="勤王",
	[":qinwang"]="体力值≤2时，你获得“激将”。",
	["$qinwang"] = "国有危难，哪位将军请战？！",
	["~liuchen"] = "无颜对百姓，有愧见先祖……",
	
	["diqing"] = "狄青",
	["#diqing"]="西北战神",
	["xiaoyong"]="骁勇",
	[":xiaoyong"]="<font color=\"blue\"><b>锁定技</b></font>，你使用<font color=\"black\"><b>梅花</b></font>牌造成的伤害+1，受到的此类伤害-1。",
	["#xiaoyong"]="因为【骁勇】的效果，%from 对 %to 的伤害从 %arg 点上升至 %arg2 点",
	["$xiaoyong1"] = "八百之众，哼，须臾可灭！",
	["$xiaoyong2"] = "哼！",
	["zhengjun"]="整军",
	[":zhengjun"]="你计算与其他角色的距离时，无视其+1马；其他角色计算与你的距离时，无视其-1马",
	["dinglue"]="定略",
	[":dinglue"]="摸牌阶段结束时，你可将摸牌阶段得到的牌任意数量弃置，并摸等量的牌，每回合仅限一次。",
	["$dinglue"] = "此战首功，当由我取之！",
	["~diqing"] = "虽极荣宠，亦有尽时……",
	
	["zhangxingcai"] = "张星彩",
	["#zhangxingcai"]="敬哀皇后",
    ["shenxian"]="甚贤",
	[":shenxian"]="<font color=\"blue\"><b>每名角色的回合限一次</b></font>，你的回合外，每当有其他角色因弃置而失去牌时，若其中有基本牌，你可以摸１张牌。",
	["$shenxian1"] = "愿尽己力，为君分忧。",
	["$shenxian2"] = "抚慰军心，以安国事。",
	["qiangwu"]="枪舞",
	[":qiangwu"]="<font color=\"blue\"><b>锁定技</b></font>，你使用点数＜７的杀无视距离，点数＞７的杀可以额外选择一个目标，点数＝７的杀伤害＋１；装备丈八蛇矛时杀强制命中。",
	["#qiangwutip1"]="<font color=\"yellow\"><b>“张星彩的【枪舞】技能效果被触发，此杀不可被闪避”</b></font>",
	["#qiangwutip2"]="<font color=\"yellow\"><b>“张星彩的【枪舞】技能效果被触发，此杀伤害＋１”</b></font>",
	["$qiangwu1"] = "咆哮沙场，万夫不敌！",
	["$qiangwu2"] = "父亲未竟之业，由我继续！",
	["~zhangxingcai"] = "复兴汉室之路，臣妾再也不能陪伴左右···",
	
	["jiping"]="吉平",
	["#jiping"]="圣手毒医",
	["luaduanzhi"]="斷指",
	[":luaduanzhi"]="<font color=\"blue\"><b>锁定技</b></font>，你无法使用和打出【杀】。",
	["luagudu"]="蠱毒",
	["luagudu_card"]="蠱毒",
	["@gu"] = "蛊",
	["@du"] = "毒",
	["$peachtip"]="<font color=\"yellow\"><b>“吉平的【蠱毒】技能效果被触发，须再使用一张【桃/酒】！”</b></font>",
	["askforgudu"] = "请选择Ｘ名其他角色（≤你的“蛊”标记数）",
	[":luagudu"]="弃牌阶段开始时，你须弃置所有的【杀】并获得等量的“蛊”标记；弃牌阶段结束时，你可以指定Ｘ名其他角色并弃掉等量的“蛊”，这些角色各获得一枚“毒”标记；你处于濒死状态时，可弃置一枚“蛊”，视为使用了一张【桃】。\n◆<font color=\"green\"><b>拥有“毒”标记的角色在其回合开始时流失等同于“毒”标记数的体力，然后弃置所有“毒”标记</b></font>\n◆<font color=\"purple\"><b>若该角色因此效果而处于濒死状态，则需要额外的一张【桃/酒】来救活</b></font>",
    -------------------------------------
	["zhangyi"] = "张仪",
	["#zhangyi"]="纵横捭阖",
    ["lianheng"]="连横",
	[":lianheng"]="<font color=\"purple\"><b>回合开始时</b></font>，你可以指定一名其他角色，该角色获得你区域内所有牌，然后返还其区域内等量的牌。",
	["taolue"]="韬略",
	[":taolue"]="<font color=\"blue\"><b>常时AI</b></font>，你成为其他角色使用的【锦囊或杀】目标时，可进行一次判定，若为黑桃，此牌失效。",
	["$taoluetip"]="<font color=\"yellow\"><b>“张仪的【韬略】判定为黑桃，该牌失效！”</b></font>",
	["$taolue"] = "天意，不可逆···",
	----------------------------------
	["newhyy"] = "新黄月英",
	["#newhyy"]="才智无双",
    ["newjizhi"]="灵心",
	[":newjizhi"]="摸牌阶段你可以放弃摸牌，视为使用了一张【无中生有】。",
	["newqicai"]="巧鉴",
	--[":newqicai"]="你使用即时锦囊时可额外指定一名角色；你成为即时锦囊目标时可摸１张牌。",
	[":newqicai"]="你成为即时锦囊目标时可指定一名角色摸１张牌。",
	["qiaojianmubiao"]="增加１个目标",
	["qiaojianmopai"]="选人摸牌",
	["qiaojianxuanren"]="请选择一名角色",
	["newqicaitip"]="使该角色成为此即时锦囊的目标",
	["$newjizhi"] = "哼···",
	["$newqicai"] = "哼哼···",
	["~newhyy"] = "亮···",
-------------------------------------------
	["newsmy"] = "新司马懿",
	["#newsmy"]="狼顾之鬼",
    ["newfankui"]="反馈",
	[":newfankui"]="你每扣减一点体力后，可以获得任意角色的一张牌。",
	["newguicai"]="鬼才",
	["newguicai_card"]="鬼才",
	[":newguicai"]="一名角色的判定牌生效前，你可以打出一张牌代替之。若你打出的牌与判定牌类别相同，你摸１张牌。",
	["newguicaitip"]="请选择一张牌（包括装备）",
	["$newfankui1"] = "哼，自作孽不可活！",
	["$newfankui2"] = "哼，正中下怀！",
	["$newguicai1"] = "天命难违？哈哈哈哈哈哈哈哈！",
	["$newguicai2"] = "才通天地，逆天改命！",
	["~newsmy"] = "我的气数就到这里了吗？！",
	------------------------------------------------------
	["zhangxiu"] = "张绣",
["#zhangxiu"] = "北地枭雄",
["~zhangxiu"] = "若失文和，吾将何归？", 
	["xiongluan"] = "雄乱",
	["$xiongluan"] = "北地枭雄，乱世不败！",
	["$xiongluan2"] = "雄踞宛城，虽乱世可安。",
	[":xiongluan"] = "<b>限定技</b>，出牌阶段开始时，你可自减１点体力上限然后指定一名其他角色，直到回合结束，你封锁其<font color=\"red\"><b>手牌</b></font>，无视与其距离并可无限追杀。",
	["qiangwang"] = "枪王", 
["$qiangwang1"]="北地枭雄，乱世不败！",
["$qiangwang2"]="雄踞宛城，虽乱世可安。",
[":qiangwang"]="当你使用【杀】对一名角色造成伤害后，你可以摸１张牌然后无限追杀。",
["@#qiangwang"]="你可以对其继续使用一张【杀】",
	["xuanzedaomeidan"]="雄乱：选择一名幸运玩家",
	["@xiongluan"]="雄乱",
	["congjian"]="从谏",
	["$congjian1"] = "从谏良计，可得自保",
	["$congjian2"] = "听君谏言，去危亡，保宗祀",
	[":congjian"]="其他角色使用<font color=\"red\"><b>黑桃</b></font>即时锦囊时，你可令其与你各摸１张牌，然后交换１张牌。\n◆<font color=\"green\"><b>暗牌交换手牌/装备，从该角色开始</b></font>",
	-------------------------------------------------------
	
	["niufu"] = "牛辅",
	["#niufu"]="魔郎",
	["wujian"] = "五箭",
	[":wujian"] = "【岩石之箭】你使用杀指定目标后，可弃置1张杀强制命中。\
	【烈焰之箭】你造成雷属性伤害后，可流失1点体力追加1点火属性伤害。\
	【洪水之箭】你使用黑色锦囊造成伤害后，可弃置1张黑色锦囊清空对方装备区。\
	【苍月之箭】你使用红色锦囊造成伤害后，可弃置1张红色锦囊令双方依次失去1点体力（从你开始）。\
	【伤心之箭】你受到AOE伤害后，可弃置1张装备牌，视为使用了一张万箭齐发。",
	["@wujianone-discard"]="你可以弃置一张杀强制命中",
	["$wujian1"] = "驱刀飞血，直取寇首！",
	["@wujiantwo"]="你可以流失1点体力追加1点火属性伤害",
	["$wujian2"] = "一夫突击，三军莫当！",
	["@wujianthree-discard"]="你可以弃置一张黑色锦囊清空其装备区",
	["$wujian3"] = "龙威虎胆，斩敌破阵！",
	["@wujianfour-discard"]="你可以弃置一张红色锦囊，双方依次流失1点体力（从你开始）",
	["$wujian4"] = "百战之身，奋勇驱前！",
	["@wujianfive-discard"]="你可以弃置一张装备牌，视为你使用了一张万箭齐发",
	["$wujian5"] = "袭敌千里，溃敌百步！",
    ["liujian"] = "生命之箭",
	["@liujian"]="生命",
    [":liujian"] = "<b>限定技</b>，你进入死亡结算时，立刻恢复体力至1点，然后摸5张牌并进行一个额外的回合,该回合结束后立即死亡。",
	["~niufu"] = "我原以为一生只有五支箭，现在我终于知道，我还有第六支箭，就是生命之箭···",
	---------------------------------
	["quyi"] = "麹义",
	["#quyi"]="界桥先登",
	["fuqi"] = "伏骑",
	[":fuqi"] = "锁定技，你的回合内，与你距离为1或你距离为1的角色不能响应你使用的牌\n◆<font color=\"red\"><b>注意：包括【神速】杀和【奇策、乱击】等虚拟卡牌，【八阵】技能及八卦阵也失效</b></font>\n◆<font color=\"green\"><b>人类玩家不受影响</b></font>",
	["$fuqi1"] = "白马？哼！定叫他有来无回！",
	["$fuqi2"] = "既来之，休走之！",
	["jiaozi"] = "骄恣",
	[":jiaozi"] = "锁定技，你造成或受到伤害时，若手牌数为全场最多，此伤害+1",
	["$jiaozi1"] = "今吾于此，尔等皆为飞灰！",
	["$jiaozi2"] = "今日之获，皆是吾之功劳。",
	["~quyi"] = "为主公戎马一生，主公为何如此对我？",
	
	
	

	}
	
	



	
	
	