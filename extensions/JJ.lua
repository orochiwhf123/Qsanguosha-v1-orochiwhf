module("extensions.JJ", package.seeall)
extension = sgs.Package("JJ")
--神黄盖
shenhuanggai = sgs.General(extension, "shenhuanggai", "god", 5)--增加武将 

--鞭笞
bianchi=sgs.CreateTriggerSkill{
name="bianchi",
events={sgs.Predamaged,sgs.PhaseChange},
frequency = sgs.Skill_Compulsory,--锁定发动
--frequency=sgs.Skill_Frequent,--默认频繁发动
--frequency = sgs.Skill_NotFrequent,--询问发动
on_trigger=function(self,event,player,data)
    local room=player:getRoom()
	if event == sgs.Predamaged then
	local log=sgs.LogMessage()
        log.from = player
		log.arg = self:objectName()
        log.type ="#bianchitip"
        room:sendLog(log)
    room:setPlayerMark(player,"@kurou",(math.min(player:getMark("@kurou")+1,5)))
	room:playSkillEffect("bianchi")
    return true
	end
	if (event ==sgs.PhaseChange and player:getPhase() == sgs.Player_RoundStart) then
	if player:getMark("@kurou") <=0 then return end
	local x = math.min(player:getMark("@kurou"),player:getHp())
	local y = math.min(player:getMark("@kurou"),5)
	player:loseMark("@kurou",x)
	player:drawCards(2*y)
	room:loseHp(player, y)
	end
end,
}

ziqiang=sgs.CreateTriggerSkill{--自强
 name = "ziqiang",
 frequency = sgs.Skill_Compulsory,
 --events = {sgs.AskForPeaches,sgs.CardEffected},
 events = {sgs.CardEffected},
 can_trigger = function()
 return true
 end,
 on_trigger=function(self,event,player,data)
  local room = player:getRoom()
  local selfplayer=room:findPlayerBySkillName(self:objectName())
  --[[if event==sgs.AskForPeaches then
  for _,p in sgs.qlist(room:getOtherPlayers(player)) do
  if not dying.savers.contains(p) then--not (player:hasSkill(self:objectName()))then
		return false
		end
		end
		end]]
  if event==sgs.CardEffected then 	
  local effect=data:toCardEffect()
  if((effect.card:inherits("Peach")) and effect.from:objectName()==selfplayer:objectName()) then-- or effect.card:inherits("Analeptic")-- and selfplayer:hasFlag("dying")
          
	    local log=sgs.LogMessage()
        log.from = selfplayer
		log.arg = self:objectName()
        log.type ="#ziqiangExtraRecover"
        room:sendLog(log)
             
		local recover=sgs.RecoverStruct()
		recover.recover=1
		recover.who=effect.from
		room:recover(selfplayer,recover)
		end
		end
 end,
}

--[[juedi=sgs.CreateTriggerSkill--绝地
{
	name="juedi",
	frequency = sgs.Skill_Limited,
	events={sgs.AskForPeaches},
	
	on_trigger=function(self,event,player,data)
		  local room = player:getRoom()
		  local dying=data:toDying()
		  if dying.who:objectName()~=player:objectName() then return end
		  if player:getMark("juedimark")>0 then return false end
		  if player:getMark("@kurou") <=0 then return end
		  if not player:askForSkillInvoke(self:objectName()) then return end
		  player:loseAllMarks("@kurou")
		  room:setPlayerProperty(player,"hp",sgs.QVariant(player:getMaxHp())) 
		  player:addMark("juedimark")
	end,
}]]

Fire = function(player,target,damagePoint)
	local damage = sgs.DamageStruct()
	damage.from = player
	damage.to = target
	damage.damage = damagePoint
	damage.nature = sgs.DamageStruct_Fire
	player:getRoom():damage(damage)
end
LuajuediCard = sgs.CreateSkillCard{
	name = "LuajuediCard",
	will_throw = true,
	
	filter = function(self, targets, to_select, player)
		return #targets<5
end,
	on_effect = function(self,effect)
		Fire(effect.from, effect.to, 1)
end,
	on_use = function(self, room, source, targets)
	
            source:loseMark("@juedi",1)
            for var=1,#targets,1 do
			if not targets[var]:isNude() then  
			room:obtainCard(source,room:askForCardChosen(source,targets[var],"he","juedi"))
			end
			end
			
			
			
            for _,target in ipairs(targets) do
            room:cardEffect(self, source, target)
			target:throwAllEquips()
	        end
			
			room:loseHp(source,3)
	end

}

juedivs = sgs.CreateViewAsSkill{
	name = "juedivs",
	n = 4,

	view_filter = function(self, selected, to_select)
		if #selected >= 6 then return false end
end,
	view_as = function(self, cards)
		
		local juediCard = LuajuediCard:clone()
		return juediCard
end,

		enabled_at_play=function(self, player)
		return player:getMark("@juedi")>0
end
}

juedi=sgs.CreateTriggerSkill{
	name="juedi",
	frequency=sgs.Skill_Limited,
	events={sgs.GameStart},
	view_as_skill=juedivs,
	on_trigger=function(self,event,player,data)
	player:gainMark("@juedi",1)
	end,
}


shenhuanggai:addSkill(bianchi)
shenhuanggai:addSkill(ziqiang)
shenhuanggai:addSkill(juedi)

--------------------------------------------------------------------------------
--神张角
--[[shenzhangjiao = sgs.General(extension, "shenzhangjiao", "god", 4)--增加武将

leiting=sgs.CreateFilterSkill{--雷霆之杀
name="leiting",
view_filter=function(self,to_select)
	return to_select:inherits("Slash")
end,
view_as=function(self,card)
	local filtered=sgs.Sanguosha:cloneCard("thunder_slash", card:getSuit(), card:getNumber())
	filtered:addSubcard(card)
	filtered:setSkillName(self:objectName())
	return filtered
end
}

leitingbuff=sgs.CreateTriggerSkill--雷霆BUFF
{
	name="#leitingbuff",
	events={sgs.GameStart,sgs.Damage},
	on_trigger=function(self,event,player,data)
		  local room = player:getRoom()
		  --local selfplayer=room:findPlayerBySkillName(self:objectName())
		  if event==sgs.GameStart then 
		  player:gainMark("@lei",2)
		  player:obtainCard(sgs.Sanguosha:getCard("lightning"))--获得默认的黑桃闪电，无法获得两张
		  end
		  if event==sgs.Damage then
		  local damage = data:toDamage()
		  if damage.nature~=sgs.DamageStruct_Thunder then return end
		  local num = damage.damage
		  local count =  player:getMark("@lei")+num
		  room:setPlayerMark(player, "@lei", math.min(count,4))
		  end
		  end;
}
Thunder = function(player,target,damagePoint)
	local damage = sgs.DamageStruct()
	damage.from = player
	damage.to = target
	damage.damage = damagePoint
	damage.nature = sgs.DamageStruct_Thunder
	player:getRoom():damage(damage)
end

LuawanjunCard = sgs.CreateSkillCard{
	name = "LuawanjunCard",
	will_throw = true,
	
	filter = function(self, targets, to_select, player)
		if self:subcardsLength() == 0 then return #targets < (player:getMark("@lei")) end
		if self:subcardsLength() == 0 and #targets == 1 then return to_select:objectName() ~= (targets[1]:objectName())
		end
end,
	on_effect = function(self,effect)
		Thunder(effect.from, effect.to, 1)
end,
	on_use = function(self, room, source, targets)
	
		source:loseMark("@lei",#targets)
		for p=1,#targets,1 do
		local judge=sgs.JudgeStruct()
			judge.pattern=sgs.QRegExp("(.*):(spade|club):(.*)")
			judge.good=false
			judge.reason=self:objectName()
			judge.who=targets[p]
		room:judge(judge)
		if judge:isGood() then
		room:setEmotion(targets[p],"good")
		else
		room:setEmotion(targets[p],"bad")
			Thunder(source, targets[p], 1)
		end
			end
			
	end;
}

wanjunViewAsSkill = sgs.CreateViewAsSkill{
	name = "wanjun",
	n = 4,

	view_filter = function(self, selected, to_select)
		if #selected > sgs.Self:getMark("@lei") then return false end
end,
	view_as = function(self, cards)
		local wanjunCard = LuawanjunCard:clone()
		return wanjunCard
end,

		enabled_at_play=function(self, player)
		return not player:hasUsed("#LuawanjunCard")
end
}

wanjun = sgs.CreateTriggerSkill{
	name = "wanjun",
	events = {sgs.PhaseChange},
	view_as_skill = wanjunViewAsSkill,

	on_trigger = function(self,event,player,data)
	
end
}

function getshandian(card)
-- 本函数用于获取落英的梅花，因为有些梅花是在技能卡的子卡列表里，不能直接获得
        local shandian = {}
        if not card:isVirtualCard() then
                if card:objectName() == "lightning" then
                        table.insert(shandian, card)
                end
                return shandian
        end
        for _, card_id in sgs.qlist(card:getSubcards()) do
                local c = sgs.Sanguosha:getCard(card_id)
                if c:objectName() == "lightning" then
                        table.insert(shandian, c)
                end
        end
        return shandian
end

tianqian=sgs.CreateTriggerSkill{
-- 天谴主代码
        name="tianqian",
        frequency = sgs.Skill_Frequent,
        default_choice = "no",
        priority = -1,
        events={sgs.CardDiscarded,sgs.CardUsed,sgs.FinishJudge},

        can_trigger = function(self, player)
                return not player:hasSkill(self:objectName())
        end,

        on_trigger = function(self,event,player,data)
                local room = player:getRoom()
                local shandian = {}
                if event == sgs.CardUsed then
                        local use = data:toCardUse()
                        if use.card and use.card:subcardsLength() > 0 and
                                use.card:willThrow() and not use.card:isOwnerDiscarded() then
                                shandian = getshandian(use.card)
                        end
                elseif event == sgs.CardDiscarded then
                        local card = data:toCard()
                        shandian = getshandian(card)
                elseif event == sgs.FinishJudge then
                        local judge = data:toJudge()
                        if room:getCardPlace(judge.card:getEffectiveId()) == sgs.Player_DiscardedPile
                           and judge.card:objectName() == "lightning" then
                           table.insert(shandian, judge.card)
                        end
                end

                local shenzhangjiao = room:findPlayerBySkillName(self:objectName())
                if #shandian == 0 then return false end
                if shenzhangjiao and shenzhangjiao:askForSkillInvoke(self:objectName(), data) then

                        for _, a in ipairs(shandian) do
                                shenzhangjiao:obtainCard(a)
                        end
                end
        end
}

tianqianbuff=sgs.CreateTriggerSkill
{
	name="#tianqianbuff",
	events={sgs.CardEffected},
	frequency=sgs.Skill_Compulsory,
	on_trigger=function(self,event,player,data)
	    local room = player:getRoom()
		local effect=data:toCardEffect()
		if event == sgs.CardEffected and effect.card:inherits("Lightning") then
		return true
	end   		

	end,
}

shenzhangjiao:addSkill(leiting)
shenzhangjiao:addSkill(leitingbuff)
shenzhangjiao:addSkill(wanjun)
shenzhangjiao:addSkill(tianqian)
shenzhangjiao:addSkill(tianqianbuff)]]

--帕拉丁
palading = sgs.General(extension, "palading", "god", 4)--增加武将 
yongheng= sgs.CreateTriggerSkill   
{
	name = "yongheng" ,
	events = {sgs.MaxHpChanged,sgs.GameStart} ,
	priority = 9,
	frequency = sgs.Skill_Compulsory,
	on_trigger = function( self , event , player , data )
		local room = player:getRoom()
		local curMaxHp = player:getMaxHp()
		if (event == sgs.MaxHpChanged or event == sgs.GameStart) then
		if( curMaxHp < 5 ) then
			room:setPlayerProperty(player, "maxhp", sgs.QVariant(curMaxHp+1))
		end
		if( curMaxHp > 5 ) then
			room:setPlayerProperty(player, "maxhp", sgs.QVariant(curMaxHp-1))
		end
		end	
	end,
}

--荣誉
rongyu = sgs.CreateTriggerSkill{
	frequency = sgs.Skill_Compulsory,
	name = "rongyu",
	events = {sgs.Predamage},
	on_trigger = function(self, event, player, data)
		local damage = data:toDamage()
		local room = player:getRoom()
		if ((damage.card == nil) or (not damage.card:isRed())) then return end
		--[[local log = sgs.LogMessage()
			log.from = player
			log.to:append(damage.to)
			log.arg = tonumber(damage.damage)
			log.arg2 = log.arg+1
			room:sendLog(log)]]
			damage.damage = damage.damage+1
			data:setValue(damage)
	end,
}

shengqi=sgs.CreateDistanceSkill{
 name = "shengqi",
correct_func = function(self, from, to)
		if to:hasSkill("shengqi") then
			return 1
		end
		if from:hasSkill("shengqi") then
			return -1
		end
	end,
}

--圣愈
shengyuzhifeng = sgs.CreateViewAsSkill
{
name = "shengyuzhifeng",
n = 1,

enabled_at_play=function(self, player)
		return not sgs.Self:hasFlag("shengyuzhifeng_used") and not player:isKongcheng()
	end,
	
view_filter = function(self, selected, to_select)
return not to_select:isEquipped()
end,

view_as = function(self, cards)
if #cards == 1 then
local card = cards[1]
local new_card =sgs.Sanguosha:cloneCard("god_salvation", card:getSuit(), card:getNumber())
new_card:addSubcard(card:getId())
new_card:setSkillName(self:objectName())
sgs.Self:setFlags("shengyuzhifeng_used")
return new_card
end
end
}

shenpa_card = sgs.CreateSkillCard
{   name = "shenpa_card",	
	filter = function(self,targets,to_select,player)
		return #targets<sgs.Self:getHandcardNum() and not sgs.Self:isKongcheng() 			
	end,
	on_use=function(self,room,player,targets)
	--或者用for _,target in ipairs(targets) do room:killPlayer(target)
	for var=1,#targets,1 do room:killPlayer(targets[var])
	end
end,
}

shenpaVS=sgs.CreateViewAsSkill{
	name="shenpaVS",
	view_as = function(self, cards)
        return shenpa_card:clone()
	end,
	enabled_at_play=function(self,player,pattern)
		return false 
	end,
	enabled_at_response=function(self,player,pattern)
		return pattern=="@@shenpa"
	end,
}
shenpa=sgs.CreateTriggerSkill--审判
{
	name="shenpa",
	frequency = sgs.Skill_Limited,
	events={sgs.PhaseChange},
	view_as_skill=shenpaVS,
	on_trigger=function(self,event,player,data)
		  local room = player:getRoom()
		  if event == sgs.PhaseChange and player:getPhase() == sgs.Player_Finish then
		  if player:getMark("@shenpanmark")>0 then return end
		  if not player:askForSkillInvoke(self:objectName()) then return end
		  player:turnOver()
		  room:setPlayerMark(player, "@shenpanmark", 1)
		  end
		  if event == sgs.PhaseChange and player:getPhase() == sgs.Player_RoundStart then
		  if player:getMark("@shenpanmark")==0 then return end
		  if player:getMark("sharenmark")>0 then return end
		  room:playSkillEffect("shenpa")
		  room:askForUseCard(player, "@@shenpa", "askforsharen")
		  player:throwAllHandCards()
		  player:addMark("sharenmark")
		  end
	end,
}

--palading:addSkill(yongheng)
palading:addSkill(rongyu)
--palading:addSkill(shengqi)
--palading:addSkill(shengyuzhifeng)
--palading:addSkill(shenpa)

--新郭嘉
newguojia = sgs.General(extension, "newguojia", "wei", 3)--增加武将
qizuo = sgs.CreateTriggerSkill
{--奇佐
	name="qizuo",
	events=sgs.CardEffected,
	priority = 4,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local effect=data:toCardEffect()
		local from=effect.from
		if effect.card:inherits("Slash") then
			for _,theplayer in sgs.qlist(room:getAllPlayers()) do--循环，逐一检视所有角色
				if theplayer:hasSkill("qizuo") then--theplayer:getSeat()~=from:getSeat()不是自己
					if room:askForSkillInvoke(theplayer,"qizuo",data) then
						
			local judge=sgs.JudgeStruct()
			judge.pattern=sgs.QRegExp("(.*):(spade|club):(.*)")
			judge.good=false
			judge.reason="qizuo"
			judge.who=theplayer
		    room:judge(judge)
		    if judge:isGood() then
		    room:setEmotion(theplayer,"good")
		
		    theplayer:drawCards(1)
		    effect.to=theplayer
		    data:setValue(effect)
						
		local hnum = theplayer:getHandcardNum() --手牌数
		local cdlist = sgs.IntList()   --Int类型的list
		    cdlist:append(theplayer:handCards():at(hnum-1))   --插入刚摸的
		    --cdlist:append(theplayer:handCards():at(hnum-2))   --还是插入刚摸的
		    room:askForYiji(theplayer, cdlist)   --这个。。内核自带的一个函数，想必实现遗计神哥花了不少功夫，观星同样
		if(theplayer:getHandcardNum() == hnum-1) then
		    celist = sgs.IntList()
		    --celist:append(theplayer:handCards():at(hnum-2))
	        --room:askForYiji(theplayer, celist)
			end
		else
			room:setEmotion(theplayer,"bad")
			effect.to=theplayer
			data:setValue(effect)
			return
		end	
						return false
					end
				end
			end
		end
	end,
	can_trigger=function(self,player)
		return player and player:isAlive()
	end,
}

--[[
	技能名：英才
	相关武将：丁丁包·新郭嘉
	描述：在你的判定牌生效前，你可以选择：
      1.获得该牌，然后亮出牌堆顶的一张牌代替之（该步骤可执行Ｘ次★Ｘ为你已损体力值）。
      2.在判定牌生效后，获得该判定牌。
	状态：验证通过
]]--
--[[yingcai = sgs.CreateTriggerSkill{
	name = "yingcai", 
	frequency = sgs.Skill_NotFrequent, 
	priority = 2,
	events = {sgs.AskForRetrial,sgs.FinishJudge}, 
	on_trigger = function(self, event, player, data) 
		local room = player:getRoom()
		local x = player:getLostHp()
		local judge = data:toJudge()
		
	if event == sgs.AskForRetrial and judge.who:objectName() == player:objectName() then
	if x==0 and player:askForSkillInvoke(self:objectName(), data) then
	player:addMark("yingcaimark")
	end
	
	if x~=0 and player:askForSkillInvoke(self:objectName(), data) then
		local choise = room:askForChoice(player,self:objectName(), "yi+er")
		if choise == "yi" then
		for i = 1, x, 1 do
			if player:askForSkillInvoke(self:objectName(), data) then
			    local judge = data:toJudge()
			    player:obtainCard(judge.card)
				local card_id = room:drawCard()
				room:getThread():delay()
				judge.card = sgs.Sanguosha:getCard(card_id)
				room:sendJudgeResult(judge)
				
				local log=sgs.LogMessage()
				log.type = "$ChangedJudge"
				log.from = player
				log.to:append(judge.who)
				--log.arg = judge.card:objectName()
				log.card_str = judge.card:getEffectIdString()
				room:sendLog(log)
				
			end
			end
		    end
		if choise == "er" then
		player:addMark("yingcaimark")
		end
		end
	end
	
	if event == sgs.FinishJudge then
	if player:getMark("yingcaimark")==0 then return end
		local card = judge.card
		data_card = sgs.QVariant(0)
		data_card:setValue(card)
	    player:obtainCard(card)
	    room:setPlayerMark(player, "yingcaimark", 0)
		return true
	end
			
		return false
	end
}]]

yingcai = sgs.CreateTriggerSkill{
	name = "yingcai", 
	frequency = sgs.Skill_Compulsory, 
	events = {sgs.FinishJudge}, 
	on_trigger = function(self, event, player, data) 
		local room = player:getRoom()
		local judge = data:toJudge()
		
		if event == sgs.FinishJudge then
		
		data_card = sgs.QVariant(0)
		data_card:setValue(judge.card)
	    --player:obtainCard(judge.card)
		
		local cardtwo = sgs.Sanguosha:getCard(room:drawCard())
		room:moveCardTo(cardtwo,nil,sgs.Player_Special,true)
        room:getThread():delay()
		if cardtwo:sameColorWith(judge.card) then 
		player:obtainCard(cardtwo)
		end
		
	    return true
		end
		
		return false
	end,
}


newguojia:addSkill(qizuo)
newguojia:addSkill(yingcai)

--司马昭
smz = sgs.General(extension, "smz", "wei", 3)--增加武将
--谋略：任意角色的判定牌生效后，你可以获得之，然后将自己的一张手牌弃置或放置到牌堆顶。
mouluecard=sgs.CreateSkillCard{
	name="mouluecard",
	target_fixed=true,
	will_throw=false,
	on_use = function(self, room, source, targets)
		room:moveCardTo(self,nil,sgs.Player_DrawPile,true)
	end,
}

mouluevs=sgs.CreateViewAsSkill{
	name="mouluevs",
	n=1,
	view_filter = function(self, selected, to_select)
		return not to_select:isEquipped()
	end,
	view_as = function(self, cards)
		if #cards~=1 then return end
		local ZYcard=mouluecard:clone()
		ZYcard:addSubcard(cards[1])
		ZYcard:setSkillName("moulue")
		return ZYcard
	end,
	enabled_at_play=function(self, player)
		return false
	end,
	enabled_at_response=function(self,player,pattern) 
		return pattern=="@@moulue"
	end,
}

moulue=sgs.CreateTriggerSkill{
	name="moulue",
	frequency=sgs.Skill_NotFrequent,
	priority = 1,
	events={sgs.FinishJudge},
	view_as_skill=mouluevs,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local judge = data:toJudge()
		local splayer=room:findPlayerBySkillName(self:objectName())
		if not splayer then return end
		if not splayer:askForSkillInvoke(self:objectName()) then return end
		
		local card = judge.card
		data_card = sgs.QVariant(0)
		data_card:setValue(card)
	    splayer:obtainCard(card)
		
		if splayer:isKongcheng() then return end
		
		local choise = room:askForChoice(splayer,self:objectName(), "rengdiao+fangpaidui")
		if choise == "rengdiao" then 
		room:askForDiscard(splayer,self:objectName(),1,false,false)
		end
		if choise == "fangpaidui" then
		room:askForUseCard(splayer,"@@moulue","mouluetip")
		end
		return true
	end,
	can_trigger=function(self,target)
		return true
	end,
}

skyming=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "skyming",
	    events={sgs.CardLostDone, sgs.CardGotDone, sgs.CardDrawnDone, sgs.Predamaged ,sgs.HpRecover}, 
	    on_trigger=function(self,event,player,data)
		    local room=player:getRoom()
			local x=player:getHp()
			local num = player:getHandcardNum() - x
			
			if num > 0 then
			if not player:hasSkill("guicai")then
			
			if player:hasSkill("fankui")then
		    room:detachSkillFromPlayer(player,"fankui")
			end
			
		    room:acquireSkill(player,"guicai")
			end
			end
			
			if num < 0 then
			if player:hasSkill("guicai")then
		    room:detachSkillFromPlayer(player,"guicai")
			end
			
			if not player:hasSkill("fankui")then
		    room:acquireSkill(player,"fankui")
			end
		    end
			
			if num == 0 then
			if player:hasSkill("guicai")then
		    room:detachSkillFromPlayer(player,"guicai")
			end
			if player:hasSkill("fankui")then
		    room:detachSkillFromPlayer(player,"fankui")
			end
            end
			
			
			return false end,
}

--[篡心] 出牌阶段限一次：你可以观看一名其他角色的手牌，选择：1.他获得你的1张手牌，你回复1点体力。2.你获得他的1张手牌，他回复1点体力。注：你和该角色的手牌数均须≥1
cuanxincard=sgs.CreateSkillCard{
	name="cuanxincard",
	target_fixed=false,
	will_throw=true,
	filter = function(self, targets, to_select, player)
		return #targets==0 and to_select:objectName()~=player:objectName() and to_select:getHandcardNum() > 0
	end,
	on_use = function(self, room, source, targets)
		local target=targets[1]
		local card_ids=target:handCards()
		local card_idss=source:handCards()
		local card_id 
		local newcard
		
		local choise = room:askForChoice(source,self:objectName(), "tana+wona")
		
		if choise == "tana" then 
		room:showAllCards(target,source)
		for i = 1, 1, 1 do
		if source:isKongcheng() then return end
		room:obtainCard(target,room:askForCardChosen(target,source,"h","~~~"))--前面加对象是获得
		end
		local recover=sgs.RecoverStruct()
			recover.recover=1
			recover.card=nil
			recover.who=source
		    room:recover(recover.who, recover)
		end
		--[[if source:isKongcheng() then return end 别人观看并拿我的
			room:fillAG(card_idss,target)
            card_id=room:askForAG(target, card_idss, true, self:objectName())
			target:invoke("clearAG")
            if card_id == -1 then
                break
            else
                newcard=sgs.Sanguosha:getCard(card_id)
					source:obtainCard(newcard)
					card_idss:removeOne(card_id)
            end
        end
		local recover=sgs.RecoverStruct()
			recover.recover=1
			recover.card=nil
			recover.who=source
		    room:recover(recover.who, recover)
			end]]
			
		if choise == "wona" then 
		for i = 1, 1, 1 do
		if target:isKongcheng() then return end
			room:fillAG(card_ids,source)
            card_id=room:askForAG(source, card_ids, true, self:objectName())
			source:invoke("clearAG")
            if card_id == -1 then
                break
            else
                newcard=sgs.Sanguosha:getCard(card_id)
					source:obtainCard(newcard)
					card_ids:removeOne(card_id)
            end
        end
		local recover=sgs.RecoverStruct()
			recover.recover=1
			recover.card=nil
			recover.who=target
		    room:recover(recover.who, recover)
			end
	end,
}

cuanxin=sgs.CreateViewAsSkill{
	name="cuanxin",
	n=0,
	view_as = function(self, cards)
		local cxcard=cuanxincard:clone()
		cxcard:setSkillName(self:objectName())
		return cxcard
	end,
	enabled_at_play=function(self, player)
		return not player:hasUsed("#cuanxincard") and (player:getHandcardNum() > 0)
	end,
}

smz:addSkill(moulue)
--smz:addSkill(skyming)
smz:addSkill(cuanxin)

--孔融
kr = sgs.General(extension, "kr", "qun", 3)--增加武将

--[礼让] 摸牌阶段，你可以放弃摸牌，选择观看一名其他角色的手牌并获得其中1张牌，然后该角色摸2张牌
Lualirang=sgs.CreateTriggerSkill{
	name="Lualirang",
	frequency=sgs.Skill_NotFrequent,
	events={sgs.PhaseChange},
	priority=3,
	on_trigger=function(self,event,player,data)
		if player:getPhase()~=sgs.Player_Draw then return end
		local room=player:getRoom()
		local targets=sgs.SPlayerList()
		for _,p in sgs.qlist(room:getOtherPlayers(player)) do
			if not p:isKongcheng() then
				targets:append(p)
			end
		end
		if targets:isEmpty() then return end
		if not player:askForSkillInvoke(self:objectName()) then return end
		local target=room:askForPlayerChosen(player,targets,self:objectName())
		local card_ids=target:handCards()
		local card_id 
		local newcard
		for i = 1, 1, 1 do
	    room:fillAG(card_ids,player)
        card_id=room:askForAG(player, card_ids, true, self:objectName())
        player:invoke("clearAG")
            if card_id == -1 then
                break
            else
                newcard=sgs.Sanguosha:getCard(card_id)
					player:obtainCard(newcard)
					card_ids:removeOne(card_id)
            end
			target:drawCards(2)
			end
		return true
	end,
}

Luamingshi_card = sgs.CreateSkillCard
{   name = "Luamingshi_card",	
	filter = function(self,targets,to_select,player)
		return #targets<(sgs.Self:getLostHp()+1) --and to_select:objectName()~=player:objectName()		
	end,
	on_use=function(self,room,player,targets)
	--或者用for _,target in ipairs(targets) do room:killPlayer(target)
	for var=1,#targets,1 do room:setPlayerMark(targets[var],"@mingshidebuff",1)
	end
end,
}

LuamingshiVS=sgs.CreateViewAsSkill{
	name="LuamingshiVS",
	view_as = function(self, cards)
        return Luamingshi_card:clone()
	end,
	enabled_at_play=function(self,player,pattern)
		return false 
	end,
	enabled_at_response=function(self,player,pattern)
		return pattern=="@@Luamingshi"
	end,
}
Luamingshi=sgs.CreateTriggerSkill--名士：回合结束阶段，你可以指定至多X+1名角色，直到你的下回合开始，这些角色首次受到伤害后，伤害来源将武将牌翻面。（X为你已损体力值）
{
	name="Luamingshi",
	--frequency = sgs.Skill_Limited,
	events={sgs.PhaseChange},
	view_as_skill=LuamingshiVS,
	on_trigger=function(self,event,player,data)
		  local room = player:getRoom()
		  
		  if event == sgs.PhaseChange and player:getPhase() == sgs.Player_Finish then
		  if not player:askForSkillInvoke(self:objectName()) then return end
		  room:askForUseCard(player, "@@Luamingshi", "mingshitip")
		  end
		  
		  if event == sgs.PhaseChange and player:getPhase() == sgs.Player_RoundStart then
		  for _,p in sgs.qlist(room:getAllPlayers()) do
		  if p:getMark("@mingshidebuff")~=0 then 
		  room:setPlayerMark(p,"@mingshidebuff",0)
		  end
		  end
		  end
	end,
}

mingshixiaoguo=sgs.CreateTriggerSkill{
	name="#mingshixiaoguo",
	frequency=sgs.Skill_Compulsory,
	events={sgs.Damaged},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local damage=data:toDamage()
		if damage.to:getMark("@mingshidebuff")>0 then
		damage.from:turnOver()
		room:setPlayerMark(damage.to,"@mingshidebuff",0)
		end
	end,
	can_trigger=function(self,target)
		return true
	end,
}

kr:addSkill(Lualirang)
kr:addSkill(Luamingshi)
kr:addSkill(mingshixiaoguo)

--曹氏
caoshi = sgs.General(extension, "caoshi", "wei", 3,false)--增加武将

zifu=sgs.CreateTriggerSkill{
        name = "zifu",
        priority=3,
		events={sgs.PhaseChange},
		frequency=sgs.Skill_Frequent,--默认频繁发动
        on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		if (not player:isKongcheng()) and (not player:hasSkill("luoshen") or not player:hasSkill("qingguo")) and event == sgs.PhaseChange and player:getPhase() == sgs.Player_RoundStart then
	    if player:askForSkillInvoke(self:objectName()) then
		
                --room:showAllCards(player)
				local list = room:getAlivePlayers()
				local cardsid = sgs.IntList()
				local cards = player:getHandcards()
					if cards then
						for _,acard in sgs.qlist(cards) do
							cardsid:append(acard:getEffectiveId())
						end
					end
					if cardsid then
						room:fillAG(cardsid)
						room:getThread():delay(2000)
						for _,p in sgs.qlist(list) do
							p:invoke("clearAG")
						end
					end
					----------------------------------------
						local color = cards:first():isBlack()
						local same_color = true
						for _,card in sgs.qlist(cards) do
							if card:isBlack() ~= color then
								same_color = false
								break
							end
						end
						if same_color and cards:first():isBlack() then
				room:acquireSkill(player, "luoshen")
                room:acquireSkill(player, "qingguo")
				room:detachSkillFromPlayer(player,self:objectName())
			    end
		end		
        end
		end,
}



jiaorong=sgs.CreateTriggerSkill{
        name="jiaorong",
		frequency=sgs.Skill_Compulsory,
        events={sgs.SlashEffect,sgs.SlashEffected},
		
        on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		local use=data:toCardUse()
		local effect = data:toSlashEffect()
        if ((event==sgs.SlashEffect and effect.to:isMale()) or(event==sgs.SlashEffected and effect.from:isMale())) then
		      player:drawCards(1)
					end
					end
}

caoshi:addSkill(zifu)
caoshi:addSkill(jiaorong)

--王元姬
wyj = sgs.General(extension, "wyj", "wei", 3,false)--增加武将

--[洞悉] 回合外，当你攻击范围内的一名角色成为【杀】的目标时，你可弃置一张与此牌相同花色的牌使其无效并获得之。 
dongxi=sgs.CreateTriggerSkill{
	name="dongxi",
	frequency=sgs.Skill_NotFrequent,
	events={sgs.CardEffected},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local splayer=room:findPlayerBySkillName(self:objectName())
		
		local effect=data:toCardEffect()
		local card = effect.card
		local suit = card:getSuitString()
		local room = player:getRoom()
		local pattern = string.format(".|%s|.|.", suit)
		
		if splayer:getPhase()~=sgs.Player_NotActive then return end
		if splayer:isNude() then return end
		if not splayer:inMyAttackRange(player) then return end
		--if not effect.card:inherits("Slash") and not effect.card:isNDTrick() then return end
		--if not effect.card:isNDTrick() then return end
		--if not effect.card:inherits("Slash") or not effect.card:isRed() then return end
		if not effect.card:inherits("Slash") then return end
		if effect.card:getEffectiveId()==-1 then return end
		
		if room:askForSkillInvoke(splayer, self:objectName(), data) then --询问技能发动
				if room:askForCard(splayer, pattern, "@dongxi") then --询问卡牌
				--splayer:obtainCard(effect.card)
				return true
				end
				end
				
	end,
	can_trigger=function(self,target)
		return true
	end,
}

--【谦谨】回合外失去手牌时，若你的手牌数不大于1，你可以亮出牌堆顶的2张牌并获得其中一种颜色的牌，然后将剩下的牌交给一名其他角色。”
qianjin=sgs.CreateTriggerSkill{
	name="qianjin",
	frequency = sgs.Skill_NotFrequent,
	events={sgs.CardLost},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local move = data:toCardMove()
		if player:getPhase()~=sgs.Player_NotActive then return end
		if (move.from_place ~= sgs.Player_Hand) then return end
		local x=player:getHandcardNum()
	    local flag=true
		if x>1 then 
		flag=false
		--break
		end
	    --for _,p in sgs.qlist(room:getOtherPlayers(player)) do
		--if p:getHandcardNum()<x then
			--flag=false
			--break
		--end
	--end
	if flag==false then return end
	
		if not player:askForSkillInvoke(self:objectName()) then return end
		local x= 2
		local card_ids=room:getNCards(x)
		room:fillAG(card_ids,nil)
		local card_id=room:askForAG(player, card_ids, false, self:objectName())
		for _,p in sgs.qlist(room:getPlayers()) do
			p:invoke("clearAG")
		end
		local acard_ids=sgs.IntList()
		local acard_idss=sgs.IntList()
		local same=sgs.Sanguosha:getCard(card_id):getColor()
		for _,id in sgs.qlist(card_ids) do
			if (sgs.Sanguosha:getCard(id)):getColor()==same then
				acard_ids:append(id)--给自己
				for _,id in sgs.qlist(acard_ids) do
			player:obtainCard(sgs.Sanguosha:getCard(id))
		end
			else	
				acard_idss:append(id)--给别人
			end
		end
		if acard_idss:length()==0 then return end--全部同色则结束流程
		local target=room:askForPlayerChosen(player,room:getOtherPlayers(player),self:objectName())
		local log= sgs.LogMessage()
			log.type = "#qianjin"
			log.from = player
			log.to:append(target)
			log.arg = tonumber(acard_idss:length())
			--log.arg2 = same
		room:sendLog(log)
		for _,id in sgs.qlist(acard_idss) do
			target:obtainCard(sgs.Sanguosha:getCard(id))
		end
	end,
}

wyj:addSkill(dongxi)
wyj:addSkill(qianjin)

--吕玲绮
llq = sgs.General(extension, "llq", "qun", 3,false)--增加武将
--惜弓：锁定技，当麒麟弓被其他角色装备时，你获得并使用之；当麒麟弓进入弃牌堆时，你回复一点体力，摸三张牌。

xigong=sgs.CreateTriggerSkill{
        name="xigong",
		frequency=sgs.Skill_Compulsory,
        events={sgs.CardUsed,sgs.CardLost,sgs.FinishJudge},
		priority = -1,
        on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		local splayer=room:findPlayerBySkillName(self:objectName())
		if not splayer then return end
		
		if event == sgs.CardUsed then
		local use=data:toCardUse()
		if not use.card:inherits("KylinBow") then return end 
		if use.from:objectName() == splayer:objectName() then return end
		splayer:obtainCard(use.card)
		local newuse=sgs.CardUseStruct()
        			newuse.card=use.card
        			newuse.from=splayer
				    room:useCard(newuse,false)
					end
           
                if event == sgs.CardLost then
				        local move = data:toCardMove()
						if sgs.Sanguosha:getCard(move.card_id):inherits("KylinBow") and move.to_place == sgs.Player_DiscardedPile then
						local recover = sgs.RecoverStruct()
				        recover.who = splayer
				        recover.recover = 1
				        room:recover(splayer,recover)
                        splayer:drawCards(2)
						end
						end
                if event == sgs.FinishJudge then
                        local judge = data:toJudge()
                        if room:getCardPlace(judge.card:getEffectiveId()) == sgs.Player_DiscardedPile and judge.card:inherits("KylinBow") then
                        local recover = sgs.RecoverStruct()
				        recover.who = splayer
				        recover.recover = 1
				        room:recover(splayer,recover)
                        splayer:drawCards(2)
                        end
                end

				end,
		can_trigger=function(self,target)
		return true
	    end,
}
--枪王：当你使用【杀】对一名角色造成伤害后，你可以摸1张牌无限追杀。
nuji=sgs.CreateTriggerSkill{
	name="nuji",
	frequency=sgs.Skill_NotFrequent,
	events={sgs.Damage},	
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local damage=data:toDamage()
		if event==sgs.Damage and not damage.card:inherits("Slash") then return end
		player:drawCards(1)
		local slash=room:askForCard(player,"slash","@nuji")
		if slash then
			slash:setSkillName(self:objectName())
			local use=sgs.CardUseStruct()
			 	use.card = slash
			 	use.from = player
			 	use.to:append(damage.to)
			    room:useCard(use,false)
		end
	end,
}
--疾驰：锁定技，你使用的【杀】被闪避或你闪避【杀】时，你摸１张牌。

jichi=sgs.CreateTriggerSkill{
	name="jichi",
	frequency=sgs.Skill_Compulsory,
	events={sgs.SlashMissed},
	on_trigger=function(self,event,player,data)
	local room=player:getRoom()
	local effect=data:toSlashEffect()
	local splayer=room:findPlayerBySkillName(self:objectName())
	if not splayer then return end
	
    if effect.from:objectName() == splayer:objectName() then
                effect.from:drawCards(1)
			end
	if effect.to:objectName() == splayer:objectName() then
	            effect.to:drawCards(1)
			end
	end,
	can_trigger=function(self,target)
		return true
	    end,
}

llq:addSkill(xigong)
--llq:addSkill(nuji)
llq:addSkill(jichi)
--------------------------------------
--天启者
tianqizhe = sgs.General(extension, "tianqizhe", "god", 6)--增加武将

shengqijineng=sgs.CreateDistanceSkill{
 name = "shengqijineng",
correct_func = function(self, from, to)
		if to:hasSkill("shengqijineng") then
			return 1
		end
		if from:hasSkill("shengqijineng") then
			return -1
		end
	end,
}

shengdun=sgs.CreateTriggerSkill{
name="shengdun",
events={sgs.TurnStart,sgs.Predamaged},
frequency=sgs.Skill_Compulsory,

on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)

	if event==sgs.TurnStart then
    room:setPlayerMark(selfplayer, "shengdunmark", 1)
	end	
	
	if event==sgs.Predamaged and selfplayer:getMark("shengdunmark") > 0 then
	local damage = data:toDamage()
	if damage.to:getMark("shengdunmark") < 1 then return end
	local log=sgs.LogMessage()
        log.from = selfplayer
		log.arg = self:objectName()
        log.type ="#shengduntip"
        room:sendLog(log)
	room:playSkillEffect("shengdun")
	room:setPlayerMark(selfplayer, "shengdunmark", 0)
	return true
	end	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}
---------------
shengmaocard=sgs.CreateSkillCard
{  
name="shengmaocard",
target_fixed=false,
will_throw=true,
filter=function(self,targets,to_select,player)      
    return player:inMyAttackRange(to_select) and to_select:objectName() ~= player:objectName()--否则要在攻击范围内
    end,
on_effect=function(self,effect)   
local from=effect.from
local to=effect.to             
local room=from:getRoom() 
local damage=sgs.DamageStruct() --伤害结构体 这里赘述了一些

damage.damage=1
damage.nature=sgs.DamageStruct_Normal 
damage.chain=false 
damage.from=from
damage.to=to
room:damage(damage)
to:turnOver()

room:setPlayerFlag(effect.from,"shengmaoflag") --这个方法可以限制每回合一次
end                
}
 
shengmao=sgs.CreateViewAsSkill
{ 
name="shengmao",
n=0,
view_as=function(self, cards)
if #cards==0 then
local acard=shengmaocard:clone() 
acard:setSkillName(self:objectName())
return acard end
end,
enabled_at_play=function(self,player) 
if  player:getPhase()==sgs.Player_Finish then player:setFlags("-shengmaoflag") end --回合结束取消标记 限制每回合一次
return not player:hasFlag("shengmaoflag") 
end,
enabled_at_response=function(self,player,pattern) 
return false 
end
}
------------
  chanhuicard = sgs.CreateSkillCard
{
	name = "chanhuicard",	
	target_fixed = false,	
	will_throw = false,
	
		filter = function(self, targets, to_select, player)
		return #targets == 0 and (to_select:objectName()~=player:objectName()) and to_select:getPile("chanhuiqu"):length() == 0
	end,
	
on_use = function(self, room, source, targets)
        local room = source:getRoom()
	for _,card in sgs.qlist(self:getSubcards()) do
		targets[1]:addToPile("chanhuiqu", card, true)
    end		
end,
}

chanhuivs=sgs.CreateViewAsSkill{
name="chanhuivs",
n=999,
view_filter=function(self, selected, to_select)
	return not to_select:isEquipped()
end,
view_as = function(self, cards)
   local x = #cards
		if #cards>0 then
		acard=chanhuicard:clone()
		local y=0
		for var=1,x,1 do
		y=y+1
		acard:addSubcard(cards[y])
		end
		acard:setSkillName(self:objectName())
		return acard
	end
end,
enabled_at_play = function()
	return false
end,
enabled_at_response = function()
	return false
end,
}
  chanhui = sgs.CreateTriggerSkill
{
name = "chanhui",
view_as_skill = chanhuivs,
frequency = sgs.Skill_Frequency,
events = {sgs.PhaseEnd,sgs.Damaged},
can_trigger= function()
	return true 
end,
on_trigger = function(self, event, player, data)
	local room = player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	  if  event==sgs.PhaseEnd and player:getPhase()== sgs.Player_Finish then
	     if not player:hasSkill("chanhui") then return end
		 local fields = sgs.IntList()
		fields = player:getPile("chanhuiqu")
		--if fields:length() > 0 then return false end
		if player:isKongcheng() then return end
		 local tos = sgs.SPlayerList()
		for _,p in sgs.qlist(room:getOtherPlayers(player)) do
            if  p:getPile("chanhuiqu"):length() == 0 then
			    tos:append(p)
			end
		end
		
		if tos:isEmpty() then return end
        --if not room:askForSkillInvoke(player,"chanhui") then return false end	  
		room:askForUseCard(player, "@@chanhui", "chanhuitip")
	  end
	  
	  if event==sgs.Damaged then
	  local damage = data:toDamage()
	  local a=damage.from
	  local b=damage.from:getPile("chanhuiqu"):length()
	  if damage.from:objectName()== room:getCurrent():objectName() and damage.from:getPile("chanhuiqu"):length() > 0 and damage.to:objectName()== selfplayer:objectName() then
	  for var=1,damage.from:getPile("chanhuiqu"):length(),1 do
			local chanhuinapai = damage.from:getPile("chanhuiqu")
			local chanhuinapai_id = chanhuinapai:first()			
		room:obtainCard(damage.from,chanhuinapai_id)
	   end
		local damagetwo=sgs.DamageStruct() --伤害结构体 这里赘述了一些
        damagetwo.damage=b
        damagetwo.nature=sgs.DamageStruct_Normal 
        damagetwo.chain=false 
        damagetwo.from=a
        damagetwo.to=a
        room:damage(damagetwo)
		

		end
		end
end
}
--------------------------
fusu=sgs.CreateTriggerSkill{
name="fusu",
events={sgs.Dying,sgs.Predamaged},
frequency = sgs.Skill_NotFrequent, 
priority = 9,
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	if event==sgs.Dying then
	local dying=data:toDying()
	local a=dying.who
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)

	if dying.who:objectName()==selfplayer:objectName() then return end
	if not selfplayer:askForSkillInvoke(self:objectName()) then return end
	room:loseHp(selfplayer, 1)
	local peach=sgs.Sanguosha:cloneCard("peach",sgs.Card_NoSuit,0)
		peach:setSkillName(self:objectName())
		local use=sgs.CardUseStruct()
		use.card=peach
		use.from=selfplayer
		use.to:append(a)
		room:useCard(use)
    room:setPlayerMark(a, "fusumark", 1)
	room:setPlayerFlag(room:getCurrent(),"fusuflag")
	end
	
	if event==sgs.Predamaged then
	local damage = data:toDamage()
    if not (damage.to:getMark("fusumark")>0 and room:getCurrent():hasFlag("fusuflag")) then return end
		local log=sgs.LogMessage()
        log.from = selfplayer
		log.arg = self:objectName()
        log.type ="#fusutip"
        room:sendLog(log)
	room:playSkillEffect("fusu")
	return true
end
	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}
----------------------
tianqishengguangCard = sgs.CreateSkillCard{
	name = "tianqishengguang", 
	target_fixed = false, 
	will_throw = false, 
	once = true,
	filter = function(self, targets, to_select) 
		return #targets == 0 and (to_select:objectName()~=sgs.Self:objectName())
	end,
	feasible = function(self, targets)
		return #targets == 1
	end,
	on_use = function(self, room, source, targets) 
		local friend = targets[1]
		source:loseMark("@tianqishengguang", 1) --弃掉1枚“天启圣光”标记
		if friend:getCards("j"):length()>0 then
		for _,c in sgs.qlist(friend:getCards("j")) do
		room:moveCardTo(c, source, sgs.Player_Hand, false)--你取走其判定区的牌
	    end
		end
        room:transfigure(friend,friend:getGeneralName(),true,true)
		room:setPlayerProperty(friend,"chained",sgs.QVariant(false))--不连环
		if not friend:faceUp() then friend:turnOver() end--不翻面
		local hd_x=friend:getHandcardNum()
		local Mhp_x=friend:getMaxHP()
		local thecards = math.max(Mhp_x-hd_x,0)
		friend:drawCards(thecards)--摸满牌
		friend:gainAnExtraTurn()--其进行一个额外的回合
		
		
	end
}
tianqishengguangVS = sgs.CreateViewAsSkill{
	name = "tianqishengguang", 
	n = 0, 
	view_as = function(self, cards) 
		return tianqishengguangCard:clone()
	end, 
	enabled_at_play = function(self, player)
		return player:getMark("@tianqishengguang") > 0
	end
}

tianqishengguang=sgs.CreateTriggerSkill{
	name="tianqishengguang",
	frequency=sgs.Skill_Limited,
	events={sgs.GameStart},
	view_as_skill=tianqishengguangVS,
	on_trigger=function(self,event,player,data)
		player:gainMark("@tianqishengguang")
	end,
}
----------------
tianqizhe:addSkill(shengqijineng)
tianqizhe:addSkill(shengdun)
tianqizhe:addSkill(shengmao)
tianqizhe:addSkill(chanhui)
tianqizhe:addSkill(fusu)
tianqizhe:addSkill(tianqishengguang)
--------------------------------
--复仇者
fuchouzhe = sgs.General(extension, "fuchouzhe", "god", 4)--增加武将

huamo=sgs.CreateTriggerSkill{
name="huamo",
events={sgs.Damage,sgs.PhaseEnd},
frequency=sgs.Skill_Compulsory,

on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
    
	if event==sgs.Damage then
	local damage=data:toDamage()
	if damage.from:objectName()~=selfplayer:objectName() and (not damage.from:hasSkill("huamo")) and damage.from:objectName()== room:getCurrent():objectName() then
	room:setPlayerFlag(damage.from,"huamoflag")
	end
	end
	
	if event==sgs.PhaseEnd and player:getPhase() == sgs.Player_Finish then
	if player:hasFlag("huamoflag") then
	selfplayer:drawCards(2)
	end
	end
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}

--------------------------------
kuangbaoo = sgs.CreateTriggerSkill{
	frequency = sgs.Skill_Compulsory,
	name = "kuangbaoo",
	events = {sgs.Predamage,sgs.Predamaged},
	on_trigger = function(self, event, player, data)
	if event==sgs.Predamage then
		local damage = data:toDamage()
		local room = player:getRoom()
		local log = sgs.LogMessage()
			log.from = damage.from
			log.to:append(damage.to)
			log.arg = tonumber(damage.damage)
			log.arg2 = log.arg+1
			log.type ="#kuangbaotip"
			room:sendLog(log)
			damage.damage = damage.damage+1
			data:setValue(damage)
			end
	if event==sgs.Predamaged then
	    local damage = data:toDamage()
		local room = player:getRoom()
		local log = sgs.LogMessage()
			log.from = damage.from
			log.to:append(damage.to)
			log.arg = tonumber(damage.damage)
			log.arg2 = log.arg+1
			log.type ="#kuangbaotip"
			room:sendLog(log)
			damage.damage = damage.damage+1
			data:setValue(damage)
			end
	end,
}

--------------
kuangbaodistance=sgs.CreateDistanceSkill{
 name = "#kuangbaodistance",
correct_func = function(self, from, to)

		if from:hasSkill("#kuangbaodistance") then
			return -2
		end
	end,
}

------------------
fuchouzhici = sgs.CreateTriggerSkill{
	frequency = sgs.Skill_Compulsory,
	name = "fuchouzhici",
	events = {sgs.Dying},
	on_trigger = function(self, event, player, data)
	local room = player:getRoom()
	local players = room:getOtherPlayers(player)
		for _,p in sgs.qlist(players) do
		local damage=sgs.DamageStruct()
			damage.damage=1
			--damage.chain=false 
			damage.from=player
			damage.to = p
		room:damage(damage)
		end
		------------
				local recover = sgs.RecoverStruct()
				recover.who = player
				recover.recover = 1
				room:recover(player,recover)

	end,
}

linhunshouge=sgs.CreateTriggerSkill{
name="linhunshouge",
events={sgs.Death},
frequency=sgs.Skill_Compulsory,

on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
    
	if event==sgs.Death and (not player:hasSkill("linhunshouge")) then
	room:setPlayerProperty(selfplayer,"maxhp",sgs.QVariant(selfplayer:getMaxHp()+1))
	local recover = sgs.RecoverStruct()
				recover.who = selfplayer
				recover.recover = 1
				room:recover(selfplayer,recover)
	end
	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}
------------恶魔禁锢
emojinguCard = sgs.CreateSkillCard{
	name = "emojingu", 
	target_fixed = false, 
	will_throw = false, 
	once = true,
	filter = function(self, targets, to_select) 
		return #targets == 0 and (to_select:objectName()~=sgs.Self:objectName())
	end,
	feasible = function(self, targets)
		return #targets == 1
	end,
	on_use = function(self, room, source, targets) 
	local jinguzhe = targets[1]
		room:playSkillEffect("emojingu")
		source:loseMark("@emojingu", 1) --弃掉1枚“恶魔禁锢”标记
		for _,ren in sgs.qlist(room:getOtherPlayers(targets[1])) do
			for _,pai in sgs.qlist(ren:getCards("h")) do
		room:moveCardTo(pai, jinguzhe, sgs.Player_Hand, false)
	    end
		end
		
		jinguzhe:turnOver()
		
		local a=targets[1]:getHp()
		
		local damage=sgs.DamageStruct()
				damage.damage=a
				damage.from=source
				damage.to=jinguzhe
			    room:damage(damage)
			
        local recover = sgs.RecoverStruct()
				recover.who = source
				recover.recover = a
				room:recover(source,recover)			
				
	end
}
emojinguVS = sgs.CreateViewAsSkill{
	name = "emojingu", 
	n = 0, 
	view_as = function(self, cards) 
		return emojinguCard:clone()
	end, 
	enabled_at_play = function(self, player)
		return player:getMark("@emojingu") > 0
	end
}

emojingu=sgs.CreateTriggerSkill{
	name="emojingu",
	frequency=sgs.Skill_Limited,
	events={sgs.GameStart},
	view_as_skill=emojinguVS,
	on_trigger=function(self,event,player,data)
		player:gainMark("@emojingu")
	end,
}
------------------------------------
fuchouzhe:addSkill(huamo)
fuchouzhe:addSkill(kuangbaoo)
fuchouzhe:addSkill(kuangbaodistance)
fuchouzhe:addSkill(fuchouzhici)
fuchouzhe:addSkill(linhunshouge)
fuchouzhe:addSkill(emojingu)
------------------
sgs.LoadTranslationTable{
["JJ"] = "丁丁包",

["fuchouzhe"] = "复仇者", 
["#fuchouzhe"] = "恶魔之使", 
["huamo"] = "化魔",
[":huamo"] = "<font color=\"blue\"><b>锁定技</b></font>，若一名其他角色在其回合内造成过伤害，则在其回合结束后你摸２张牌。", 
["kuangbaoo"] = "狂暴",
[":kuangbaoo"] = "<font color=\"blue\"><b>锁定技</b></font>，你造成和受到的伤害＋１；你计算与其他角色的距离－２。",  
["#kuangbaotip"] = "复仇者的技能【狂暴】被触发，<font color=\"yellow\"><b>%from对%to造成的伤害由%arg增加到%arg2！</b></font>",
["fuchouzhici"] = "复仇之刺",
[":fuchouzhici"] = "<font color=\"blue\"><b>锁定技</b></font>，你进入濒死状态时，对所有其他角色造成１点伤害，并回复１点体力。",  
["linhunshouge"] = "灵魂收割",
[":linhunshouge"] = "<font color=\"blue\"><b>锁定技</b></font>，其他角色阵亡时，你的体力上限加１并回复１点体力。",  
["emojingu"] = "恶魔禁锢",
["$emojingu"] = "神！宽恕我！",
[":emojingu"] = "<font color=\"red\"><b>限定技</b></font>，你指定一名其他角色，其获得场上所有角色的手牌并翻面，然后你对其造成等同于其体力值的伤害并回复等量体力。",  
["@emojingu"] = "禁锢",
["emojinguCard"] = "恶魔禁锢",
["~fuchouzhe"] = "感觉还不错···", 
--------------------------------------------------------------
["tianqizhe"] = "天启者", 
["#tianqizhe"] = "帕拉丁", 
["shengqijineng"] = "圣骑",
[":shengqijineng"] = "<font color=\"blue\"><b>锁定技</b></font>，你计算与其他角色的距离时，始终－１;其他角色计算与你的距离时，始终＋１。", 
--["@kurou"] = "苦肉",
["shengdun"] = "圣盾",
[":shengdun"] = "<font color=\"blue\"><b>锁定技</b></font>，你免疫每回合受到的第一次伤害。",  
["#shengduntip"] = "%from 的技能【%arg】被触发，<font color=\"yellow\"><b>免疫此伤害！</b></font>",
["shengmao"] = "圣矛",
["shengmaocard"] = "圣矛",
--["$ziqiang"] = "我还能再战！",
[":shengmao"] = "<font color=\"blue\"><b>出牌阶段限一次</b></font>：对攻击范围内的一名其他角色造成１点伤害并令其翻面。",  
["#ziqiangExtraRecover"] = "%from 的技能【%arg】被触发，<font color=\"yellow\"><b>额外回复了１点体力！</b></font>",
["chanhui"] = "忏悔",
["chanhuiqu"] = "悔",
["chanhuicard"] = "忏悔",
["chanhuitip"] = "请选择Ｘ张手牌置于一名其他角色武将牌上",
--["$juedi"] = "战栗吧！在这绝地之中！",
[":chanhui"] = "回合结束时，你可将Ｘ张手牌置于一名其他角色武将牌上，称为“悔”（不可叠加）。若在该角色的回合其对你造成了伤害，则其获得“悔”并对自身造成Ｘ点伤害。",  
--["@juedi"] = "绝地",
["fusu"] = "复苏",
[":fusu"] = "其他角色进入濒死状态时，你可以失去１点体力视为对其使用了一张桃，且在该回合内此角色无法再受到伤害。",  
["#fusutip"] = "【%arg】被触发，<font color=\"yellow\"><b>免疫此伤害！</b></font>",
["tianqishengguang"] = "天启圣光",
--["$juedi"] = "战栗吧！在这绝地之中！",
[":tianqishengguang"] = "<font color=\"red\"><b>限定技</b></font>，指定一名其他角色，你获得其判定区域内的所有牌，令其重置武将牌，回满体力，补满手牌，然后其进行一个额外的回合。",  
["@tianqishengguang"] = "光",
["tianqishengguangCard"] = "天启圣光",
--["~shenhuanggai"] = "公覆为公瑾，死而无憾！", 

["shenhuanggai"] = "神黄盖", 
["#shenhuanggai"] = "赴汤蹈火", 
["bianchi"] = "鞭笞", 
["$bianchi1"] = "皮肉之痛，无关紧要！",
["$bianchi2"] = "赴汤蹈火，在所不辞！",
["@kurou"] = "苦肉",
[":bianchi"] = "<font color=\"blue\"><b>锁定技</b></font>，你受到伤害时，防止此伤害并获得１枚“苦肉”标记;回合开始时，你失去等同于当前体力值的“苦肉”标记并摸２Ｘ张牌，然后失去Ｘ点体力（Ｘ为“苦肉”标记数且至多为５）。",  
["#bianchitip"] = "%from 的技能【%arg】被触发，<font color=\"yellow\"><b>防止了此伤害！</b></font>",
["ziqiang"] = "自强",
["$ziqiang"] = "我还能再战！",
[":ziqiang"] = "<font color=\"blue\"><b>锁定技</b></font>，你使用【桃】额外回复１点体力。",  
["#ziqiangExtraRecover"] = "%from 的技能【%arg】被触发，<font color=\"yellow\"><b>额外回复了１点体力！</b></font>",
["juedi"] = "绝地",
["$juedi"] = "战栗吧！在这绝地之中！",
[":juedi"] = "<font color=\"red\"><b>限定技</b></font>，出牌阶段，你可以指定至多５名角色，你获得其各１张牌，然后你对这些角色各造成１点火属性伤害并令其弃光装备区的牌，然后你流失３点体力。",  
["@juedi"] = "绝地",
["LuajuediCard"] = "绝地",
["~shenhuanggai"] = "公覆为公瑾，死而无憾！", 

["shenzhangjiao"] = "神张角",
["#shenzhangjiao"] = "大贤良师",
["leiting"] = "雷霆", 
["$leiting1"] = "哈哈哈···（雷鸣声）",
["$leiting2"] = "雷公助我！",
["@lei"] = "雷",
[":leiting"] = "<font color=\"blue\"><b>锁定技</b></font>，游戏开始时你获得２枚“雷”标记（此标记数至多为４）；雷属性伤害对你无效，你的【杀】均视为【雷杀】；你造成１点雷属性伤害后，获得１个“雷”标记。",
["wanjun"] = "万钧",
["$wanjun"] = "黄天在上，雷霆万钧！",
["LuawanjunCard"] = "万钧",
[":wanjun"] = "<font color=\"blue\"><b>出牌阶段限一次</b></font>：你可以指定Ｘ名角色并弃置同等数量的“雷”标记，令这些角色依次进行判定，若结果为黑色，则你对其造成１点雷属性伤害。",  
["tianqian"] = "天谴", 
["$tianqian1"] = "此兆可助我一臂之力！",
["$tianqian2"] = "无妨..无妨！",
[":tianqian"] = "★游戏开始时你获得<font color=\"red\"><b>闪电</b></font>，其他角色的【闪电】因弃置或判定而置入弃牌堆时，你可以获得之。\n★【闪电】生效时，你可弃置Ｘ枚“雷”标记，令该角色受到的伤害＋Ｘ或－Ｘ（最终伤害为负视为回复效果）。\n★其他角色死于【闪电】伤害时，你摸２张牌。", 
["~shenzhangjiao"] = "天···晴了吗···", 

["palading"] = "帕拉丁",
["#palading"] = "不灭金身",
["yongheng"] = "永恒", 
["$yongheng"] = "圣光永在，吾命永恒。",
[":yongheng"] = "<font color=\"blue\"><b>锁定技</b></font>，你的体力上限始终为５。",
["rongyu"] = "荣誉",
[":rongyu"] = "<font color=\"blue\"><b>锁定技</b></font>，你使用红色牌造成的伤害＋１。",  
["shengqi"] = "圣骑", 
[":shengqi"] = "<font color=\"blue\"><b>锁定技</b></font>，你计算与其他角色的距离时，始终－１;其他角色计算与你的距离时，始终＋１。", 
["shengyuzhifeng"] = "圣愈",
["$shengyuzhifeng"] = "感受圣愈的恩惠吧！",
[":shengyuzhifeng"] = "<font color=\"green\"><b>出牌阶段限一次</b></font>：你可以将一张手牌当作【桃园结义】使用。",  
["shenpa_card"] = "审判", 
["askforsharen"] = "请选择至多Ｘ名角色，令其直接死亡（Ｘ为你当前手牌数）", 
["@shenpanmark"] = "审",
["shenpa"] = "审判", 
[":shenpa"] = "<font color=\"red\"><b>限定技</b></font>，回合结束阶段，你可以将武将牌翻面，若如此做，下个回合开始时，你须指定至多Ｘ名角色，令其直接死亡，然后你弃置所有手牌（Ｘ为你当前手牌数）。",  
["$shenpa"]="罪恶将知道，什么是痛苦！",
["~palading"] = "正义...不会灭亡！", 

["newguojia"] = "新郭嘉", 
["#newguojia"] = "天妒鬼才", 
["qizuo"] = "奇佐", 
["$qizuo1"]="某有一计，胜于二十万师。",
["$qizuo2"]="以退为进，后发制人。",
[":qizuo"] = "一名角色成为【杀】的目标时，你可以代替其成为目标并进行一次判定，若结果为红色，你摸１张牌任意分配。", 
["yingcai"] = "英才", 
["$yingcai"]="虽然天数三分定，妙算神机亦可图。",
["yi"] = "获得该判定牌，然后亮出牌堆顶的１张牌代替之（该步骤可执行Ｘ次◆Ｘ为你已损体力值）",
["er"] = "在判定牌生效后，获得该判定牌",
--[":yingcai"]="在你的判定牌生效前，你可以选择一项：\n★获得该牌，然后亮出牌堆顶的１张牌代替之（该步骤可执行Ｘ次◆Ｘ为你已损体力值）\n★在判定牌生效后，获得该判定牌。",
[":yingcai"]="<font color=\"blue\"><b>锁定技</b></font>，你的判定牌生效后，亮出牌堆顶的一张牌，若其与判定牌颜色相同，你获得之。",
["~newguojia"] = "丞相大恩，奉孝来世...再报...（咳咳咳）", 

["smz"] = "司马昭",
["#smz"] = "狼子野心",
["moulue"] = "谋略", 
["mouluecard"] = "谋略", 
["$moulue"]="利者用之，弊者弃之。",
[":moulue"] = "任意角色的判定牌生效后，你可以获得之，然后将一张手牌弃置或置于牌堆顶。", 
["rengdiao"] = "弃置一张手牌", 
["fangpaidui"] = "将一张手牌置于牌堆顶", 
["mouluetip"] = "请选择一张手牌置于牌堆顶", 
["skyming"] = "天命", 
["$skyming"]="顺天之命，承高祖之霸业。",
[":skyming"] = "<font color=\"blue\"><b>锁定技</b></font>，每当你的手牌数变动后或体力值即将变动时，若手牌数＞体力值（手牌数＜体力值），视为你拥有技能【鬼才】（【反馈】）。", 
["cuanxin"] = "篡心", 
["$cuanxin1"]="明敌心而篡，岂有不胜之理？",
["$cuanxin2"]="以利驱之，一计缓兵。",
["$cuanxin3"]="羽翼既失，瓮中捉鳖。",
["cuanxincard"] = "篡心", 
["~~~"] = "请选择对方的一张手牌", 
["tana"] = "目标获得你1张手牌，你回复１点体力", 
["wona"] = "你获得目标1张手牌，其回复１点体力", 
[":cuanxin"] = "<font color=\"green\"><b>出牌阶段限一次</b></font>：你可以观看一名其他角色的手牌并选择一项：\n★其获得你1张手牌，你回复1点体力\n★你获得其1张手牌，其回复1点体力。\n<font color=\"red\"><b>你与该角色的手牌数均须≥1</b></font>", 
["~smz"] = "果真是，天命...", 

["kr"] = "孔融",
["#kr"] = "北海名士",
["Lualirang"] = "礼让", 
["$Lualirang"]="让者，礼之主也。",
[":Lualirang"] = "摸牌阶段，你可以放弃摸牌，选择观看一名其他角色的手牌并获得其中１张牌，然后该角色摸２张牌。", 
["Luamingshi"] = "名士", 
["Luamingshi_card"] = "名士",
["@mingshidebuff"]="名", 
["$Luamingshi1"]="谦谦君子之风，英伟冠世之资。",
["$Luamingshi2"]="哼，道貌岸然之辈罢了！",
[":Luamingshi"] = "回合结束阶段，你可以指定至多Ｘ＋１名角色各获得一枚“名”标记，直到你的下回合开始，这些角色首次受到伤害后，伤害来源将武将牌翻面（Ｘ为你已损体力值）。", 
["mingshitip"] = "请选择角色", 
["~kr"] = "人生自有命，但恨生日稀。", 

["caoshi"] = "曹氏", 
["#caoshi"] = "东乡公主", 
["zifu"] = "资赋", 
["$zifu"]="自古红颜多薄命···",
[":zifu"] = "回合开始时，你可展示所有手牌，若均为黑色，你获得技能【洛神】【倾国】。", 
["jiaorong"] = "娇容", 
["$jiaorong"]="你们这些男人，为何总要打打杀杀？",
[":jiaorong"] = "<font color=\"blue\"><b>锁定技</b></font>，你对男性角色使用杀或男性角色对你使用杀时，你摸１张牌。",
["~caoshi"] = "天长地久有尽时，此恨绵绵无绝期。", 

["wyj"] = "王元姬", 
["#wyj"] = "文明皇后", 
["dongxi"] = "洞悉", 
["$dongxi"]="来将自比诸葛武侯如何？",
[":dongxi"] = "回合外，当你攻击范围内的一名角色成为【杀】的目标时，你可弃置１张相同花色的牌使其对该角色无效。", 
["@dongxi"]="请弃置一张花色相同的牌（包括装备区）。",
["qianjin"] = "谦谨",
["$qianjin"]="妾心已乱，但凭夫君做主。", 
[":qianjin"]="回合外失去手牌时，若你的手牌数≤１，你可以亮出牌堆顶的２张牌并获得其中一种颜色的牌，然后将剩下的牌交给一名其他角色。",
["#qianjin"]="%from 选择了 %to , %to 得到了 %arg 张牌",
["~wyj"] = "人说乱世莫诉儿女情，其实乱世儿女情更深···", 

["llq"] = "吕玲绮", 
["#llq"] = "将门虎女", 
["xigong"] = "惜弓", 
["$xigong1"]="父亲的遗志，由我来继承！",
["$xigong2"]="背水一战，谁能挡我！",
[":xigong"] = "<font color=\"blue\"><b>锁定技</b></font>，当麒麟弓被其他角色装备时，你获得并使用之；当麒麟弓进入弃牌堆时，你回复１点体力，摸２张牌。", 
["nuji"] = "怒击", 
["$nuji1"]="哼，破绽百出！",
["$nuji2"]="可敢再受一击？",
[":nuji"]="当你使用【杀】对一名角色造成伤害后，你可以摸１张牌然后无限追杀。",
["@nuji"]="你可以对其继续使用一张【杀】",
["jichi"] = "疾驰", 
["$jichi1"]="躲躲藏藏，枉为将士！",
["$jichi2"]="尔等匹夫，就这点能耐？",
[":jichi"]="<font color=\"blue\"><b>锁定技</b></font>，你使用的【杀】被闪避或你闪避【杀】时，你摸１张牌。",
["~llq"] = "驰骋沙场，何惧一死！", 
}
