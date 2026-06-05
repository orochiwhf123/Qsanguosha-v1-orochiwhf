module("extensions.wuqun", package.seeall)
extension = sgs.Package("wuqun")
--华雄
wuqunhuaxiong = sgs.General(extension, "wuqunhuaxiong", "qun", 4)--增加武将 
--引用智包霸刀

wuqunhuaxiong:addSkill("badao")

--温酒
hxwenjiu=sgs.CreateTriggerSkill{
name="hxwenjiu",
--events={sgs.Predamage},
events={sgs.Damage},
frequency=sgs.Skill_Frequent,--默认频繁发动
--frequency = sgs.Skill_NotFrequent,--询问发动
on_trigger=function(self,event,player,data)
local room=player:getRoom()
local selfplayer=room:findPlayerBySkillName(self:objectName())
if event==sgs.Damage then
    local damage=data:toDamage()
	local xueliang = player:getLostHp()
    --if not damage.card then return false end
    
    --local shisha
    if not player:hasSkill(self:objectName()) then return false end
    --shisha=damage.card:isKindOf("Slash")
    --if not shisha then return false end
    if not room:askForSkillInvoke(selfplayer,self:objectName(),data) then return false end
    --selfplayer:drawCards(xueliang)
	local judge=sgs.JudgeStruct()
			judge.pattern=sgs.QRegExp("(.*):(heart|diamond):(.*)")
			judge.good=true
			judge.reason=self:objectName()
			judge.who=selfplayer
		room:judge(judge)
		if judge.card:isBlack() then return end
	selfplayer:drawCards(1)
	--room:playSkillEffect("shiyong",math.random(1))
	room:playSkillEffect("hxwenjiu")
    data:setValue(damage)
    return false
end
end,
can_trigger=function(self,player)
local room=player:getRoom()
local selfplayer=room:findPlayerBySkillName(self:objectName())
if selfplayer==nil then return false end
return selfplayer:isAlive()
end,
}

hxmojiang=sgs.CreateTriggerSkill{
        name="hxmojiang",
        events=sgs.CardUsed,
		priority=1,
        frequency=sgs.Skill_Frequent,--默认频繁发动
      --frequency = sgs.Skill_NotFrequent,--询问发动
        on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		local use=data:toCardUse()
        local cd = use.card
        if event==sgs.CardUsed and cd:inherits("Slash") and room:askForSkillInvoke(player, self:objectName()) then
		        room:playSkillEffect("hxmojiang")
		        local card_id = room:drawCard()
				local card=sgs.Sanguosha:getCard(card_id)
                room:moveCardTo(card,nil,sgs.Player_Special,true)
                room:getThread():delay()
				if(card:inherits("Slash") or card:inherits("Jink"))then
				room:obtainCard(player,card_id)
                else
                    room:throwCard(card_id)
					end
					end
					end
}

wuqunhuaxiong:addSkill(hxwenjiu)
wuqunhuaxiong:addSkill(hxmojiang)

sgs.LoadTranslationTable{
["wuqun"] = "五霸群雄",

["wuqunhuaxiong"] = "五霸华雄", 
["#wuqunhuaxiong"] = "魔将", 
["hxwenjiu"] = "魔武", 
["$hxwenjiu"] = "敌：“这厮好大的力气···”",
[":hxwenjiu"] = "你造成伤害后可以进行一次判定，为红色摸１张牌，为黑色不摸牌",  
["hxmojiang"] = "将才",
["$hxmojiang"] = "进可攻，退可守！",
[":hxmojiang"]="你使用【杀】时，可以展示牌堆顶的一张牌，若为<font color=\"red\">【杀】</font>、<font color=\"blue\">【闪】</font>，你获得之，否则将之置入弃牌堆",
["~wuqunhuaxiong"] = "太自负了吗···", 
}

--颜良文丑
ylwc = sgs.General(extension, "ylwc", "qun", 4)--增加武将 

--双雄
wqshuangxiong=sgs.CreateTriggerSkill{
name="wqshuangxiong",
--view_as_skill=!!_vs,
events={sgs.SlashHit},
frequency=sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	local qipai
	--local shuliang = player:getLostHp()
	--local effect=data:toCardEffect()
	if event==sgs.SlashHit then
	    for qipai=1,2,1 do
		local effect=data:toSlashEffect()
		if not effect.from:hasSkill(self:objectName()) then return false end
		if effect.to:hasSkill(self:objectName()) then return false end
		if effect.to:isAllNude() then return end
		if (room:askForSkillInvoke(selfplayer,self:objectName(),data)~=true) then return false end
		room:playSkillEffect("wqshuangxiong")
		room:throwCard(room:askForCardChosen(selfplayer,effect.to,"hej",self:objectName()))
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

zhanli=sgs.CreateTriggerSkill{
	name="zhanli",
    frequency=sgs.Skill_Frequent,
	--events={sgs.Damage,sgs.PhaseEnd},
	events={sgs.Damage,sgs.PhaseChange},
	can_trigger=function(self,target)
		return true
	end,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if event == sgs.Damage then
		    local damage = data:toDamage()
		    local dest = damage.to
			local selfplayer=room:findPlayerBySkillName(self:objectName())
			if not damage.card then return false end
    
            local shasha
            shasha=damage.card:inherits("Duel")
            if not shasha then return false end
			if not damage.to:isAlive()then return false end
		    if (damage.from:hasSkill(self:objectName())) and (damage.to:objectName() ~= damage.from:objectName()) and(room:askForSkillInvoke(selfplayer,self:objectName(),data)) then
			    if not dest:isDead() then
			        local room = dest:getRoom()
					  room:playSkillEffect("zhanli")--音效
			          dest:gainMark("@weiju", 1)
					  selfplayer:turnOver()
					  selfplayer:drawCards(1)
			    end
			end
		

			
			elseif event == sgs.PhaseChange and player:getPhase() == sgs.Player_RoundStart then
			if player:isNude() then return end
			local y=player:getMark("@weiju")
			if y<1 then return end
			--[[local log= sgs.LogMessage()
			log.type = "#zhanli"
			log.from = player
			log.arg  = "@weiju"
			log.arg2 = player:getHp()-player:getMark("@weiju")
			room:sendLog(log)
			local x=player:getHandcardNum()-player:getHp()
			if x+y<1 then return end
			local z
			if x+y>player:getHandcardNum() then
				z=player:getHandcardNum()
			else
				z=x+y
			end
			room:askForDiscard(player,self:objectName(),z,false,false)]]
			
			local log= sgs.LogMessage()
			log.type = "#zhanli"
			log.from = player
			log.arg  = "@weiju"
			log.arg2 = y
			room:sendLog(log)
			room:askForDiscard(player,self:objectName(),y,false,true)
				
	
	end
	end
	
}







juezhan=sgs.CreateViewAsSkill{

name="juezhan",

n=1,

view_filter=function(self,selected,to_select)
return to_select:inherits("EquipCard")
end,

view_as=function(self, cards)

if #cards==1 then

local card = cards[1]

local d_card = sgs.Sanguosha:cloneCard("duel",card:getSuit(),card:getNumber())

d_card:addSubcard(card:getId())

d_card:setSkillName(self:objectName())

return d_card

end

end,

enabled_at_play=function()

return true

end,

enabled_at_response=function()

return false

end,

}
--------------------------------------------------------------------------------------
juedoucard = sgs.CreateSkillCard
{--技能卡
        name="juedoucard",
        target_fixed=true,
        will_throw=false,
		on_use = function(self, room, source, targets)
        return true
		end,
		}
juedou=sgs.CreateFilterSkill{
name="#juedou",
view_filter=function(self,to_select)
return to_select:inherits("Nullification")
end,
view_as=function(self,card)
local filtered=luajcxcard:clone()
filtered:addSubcard(card)
filtered:setSkillName(self:objectName())
return filtered
end
}




luajuedou = sgs.CreateTriggerSkill{
 name="#luajuedou",
 events={sgs.PhaseChange},
 frequency = sgs.Skill_Compulsory,
 on_trigger=function(self,event,player,data)
  local room = player:getRoom()
   if (event == sgs.PhaseChange and player:getPhase() == sgs.Player_Start) then
    room:detachSkillFromPlayer(player,"#juedou")
end
 if (event == sgs.PhaseChange and player:getPhase() == sgs.Player_Play) then
    room:detachSkillFromPlayer(player,"#juedou")
	for _,p in sgs.qlist(room:getOtherPlayers(player)) do
		    room:attachSkillToPlayer(p,"#juedou")
	 end
end
if (event == sgs.PhaseChange and player:getPhase() == sgs.Player_Finish) then
	for _,p in sgs.qlist(room:getOtherPlayers(player)) do
		    room:detachSkillFromPlayer(p,"#juedou")
	 end
end
end, 
} 

-----------------------------------------------------------------------------------

--[[Luashensua = sgs.CreateTriggerSkill
{
	name = "#Luashensua",
	events = {sgs.CardEffected},
	can_trigger = function(self, target) return target end,
	frequency = sgs.Skill_Compulsory,
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		if event == sgs.CardEffected then
			local effect = data:toCardEffect()		
			if effect.card and effect.card:isKindOf("TrickCard") then
				if effect.from and effect.from:hasSkill(self:objectName()) and effect.card:toTrick() then
					effect.card:toTrick():setCancelable(false)
					

	end
	end
	
	end
	end,
		
}]]

--决战BUFF(回合外失去装备牌时，你立刻使用之：未实现)
juezhanbuff=sgs.CreateTriggerSkill{
name="#juezhanbuff",
events={sgs.CardLost},
frequency = sgs.Skill_Compulsory,
priority=5,
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	if event==sgs.CardLost then
		local move=data:toCardMove()
		if not move.card:inherits("EquipCard") then return false end
		if selfplayer:getPhase()~=sgs.Player_NotActive then return false end
		if not move.from:hasSkill(self:objectName()) then return false end
		--room:playSkillEffect(self:objectName())
		room:moveCardTo(sgs.Sanguosha:getCard(move.card_id),selfplayer,sgs.Player_Equip)		
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

ylwc:addSkill(juezhan)
--ylwc:addSkill(zhanli)
ylwc:addSkill(wqshuangxiong)
--ylwc:addSkill(luajuedou)
--ylwc:addSkill(juedou)




sgs.LoadTranslationTable{
["ylwc"] = "五霸双雄", 
["#ylwc"] = "河北上将", 
["wqshuangxiong"] = "雙雄", 
["$wqshuangxiong"] = "吾乃河北上将颜良/文丑是也！",
[":wqshuangxiong"] = "你使用<font color=\"blue\">【杀】</font>对一名其他角色造成伤害时，可以弃置其区域内的两张牌", 
["juezhan"] = "决戰", 
["$juezhan"] = "兄弟同心，其利断金！",
[":juezhan"] = "你可以将装备牌当<font color=\"red\">【决斗】</font>使用。", 
["zhanli"] = "决死", 
["$zhanli"] = "快来与我等决一死战！",
[":zhanli"] = "你使用<font color=\"red\">【决斗】</font>对其他角色造成伤害后，可令其获得一枚“恐惧”标记，然后你将武将牌翻面并摸１张牌\n◆<font color=\"green\"><b>回合开始时，该角色须弃置Ｘ张牌（Ｘ=“恐惧”标记数）</b></font>",
["@weiju"] = "恐惧",
["#zhanli"] = "<b>回合开始，由于“%arg”标记效果，%from 须弃置<font color=\"red\">【%arg2】</font>张牌</b>",
["~ylwc"] = "生不逢时啊！···", 
}

--吕布
wuqunlvbu = sgs.General(extension, "wuqunlvbu", "qun", 4)--增加武将 
--马术，无双
--wuqunlvbu:addSkill("mashu")
--wuqunlvbu:addSkill("wushuang")
--神威
lbshenwei=sgs.CreateTriggerSkill{
	name="lbshenwei",
	frequency=sgs.Skill_Compulsory,
	events={sgs.PhaseChange},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if (event==sgs.PhaseChange) and (player:getPhase()==sgs.Player_Discard) then	
                --local c = player:getLostHp()
                --if c==0 then return  end				
                room:playSkillEffect("lbshenwei",1)						
			end		
		--local d = player:getLostHp()
		--if d==0 then return  end
		if (event==sgs.PhaseChange) and (player:getPhase()==sgs.Player_RoundStart) then --不受兵粮影响
			player:drawCards(1)
			room:playSkillEffect("lbshenwei",2)
		return false
		end
	end,
}

lbshenweimax=sgs.CreateMaxCardsSkill{
name="#lbshenweimax", 
extra_func=function(self,target) 
	if target:hasSkill(self:objectName()) then
		--return target:getLostHp()
		return 1
	end
end
}

fangtian = sgs.CreateTriggerSkill
{
	name = "fangtian",
	events = {sgs.PhaseChange},
	frequency = sgs.Skill_Compulsory,
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		if player:getPhase() == sgs.Player_Start then
			local halberd = nil
			
			for _, p in sgs.qlist(room:getOtherPlayers(player)) do
				for _, cd in sgs.qlist(p:getCards("hej")) do
					if cd:inherits("Halberd")  then 
						halberd = cd
						
						break
					end 
				end
			end
			if  halberd ~= nil then
				room:moveCardTo(halberd, player, sgs.Player_Hand, true)
				room:playSkillEffect("fangtian")
			
			end
			
            end
	end,
}



chituma = sgs.CreateDistanceSkill
{
	name = "chituma",
	correct_func = function(self, from, to)
		if from:hasSkill("chituma") then		return -1		end
	end,
}


zhanshen = sgs.CreateTriggerSkill{
	name = "zhanshen",  
	frequency = sgs.Skill_Compulsory, 
	events = {sgs.SlashEffected},  
	on_trigger = function(self, event, player, data)
		local effect = data:toSlashEffect()
		local room = player:getRoom()
		if (event == sgs.SlashEffected) and (effect.from:distanceTo(effect.to) >= 3) then
			room:playSkillEffect("zhanshen")--音效	
            local log = sgs.LogMessage()
	            log.type = "#zhanshen"
			    log.from = effect.to
			    log.to:append(effect.from)
			    room:sendLog(log)
		return true
		end	
	end
}

fangtianbuff = sgs.CreateTriggerSkill{
  name = "#fangtianbuff",
  events = {sgs.Predamage},
  frequency = sgs.Skill_Compulsory,
  
  on_trigger = function(self, event, player, data)
    local room = player:getRoom()
    local damage = data:toDamage()

    if (player:getWeapon():isKindOf("Halberd") and
        damage.card:inherits("Slash")) then 
      room:playSkillEffect("zhanshen")

      damage.damage = damage.damage + 1 
      data:setValue(damage)
    end
  end
}

wuqunlvbu:addSkill(lbshenwei)
wuqunlvbu:addSkill(lbshenweimax)
wuqunlvbu:addSkill(fangtianbuff)
wuqunlvbu:addSkill(fangtian)
--wuqunlvbu:addSkill(chituma)



sgs.LoadTranslationTable{
["wuqunlvbu"] = "五霸吕布", 
["#wuqunlvbu"] = "飞将", 
["lbshenwei"] = "神威", 
["$lbshenwei2"] = "飞将之威，上天亦知！（摸牌）",
["$lbshenwei1"] = "嚎叫声（弃牌）",
[":lbshenwei"] = "<font color=\"blue\"><b>锁定技</b></font>,回合开始时你额外摸１张牌，你的手牌上限始终＋１",  
["fangtian"] = "方天",
["$fangtian"] = "神戟在手，何人能及！",
[":fangtian"] = "<font color=\"blue\"><b>锁定技</b></font>,回合开始阶段，若场上有<font color=\"red\"><b>【方天画戟】</b></font>，你立刻获得之；你使用【方天画戟】杀伤敌人时伤害＋１",  
["chituma"] = "赤兔",
[":chituma"] = "<font color=\"blue\"><b>锁定技</b></font>,你自带－１马",  
["#zhanshen"] = "<font color=\"green\">%from</font><font color=\"yellow\"><b>战神的霸气</b></font>使%to吓尿，此杀失效！",
["zhanshen"] = "战神",
["$zhanshen"] = "战神一出，天下无双！",
[":zhanshen"] = "<font color=\"blue\"><b>锁定技</b></font>,当你被指定为【杀】的目标时，若来源与你的距离≥３，此【杀】无效",
 
["~wuqunlvbu"] = "什么？！我败了？？！！", 
}




--董卓
shendongzhuo = sgs.General(extension, "shendongzhuo", "qun", 5, true)


baojunn=sgs.CreateMaxCardsSkill{
name="baojunn", 
extra_func=function(self,target) 
	if target:hasSkill(self:objectName()) then
	if not target:isWounded() then return end
		return 3
	end
end
}

baojunnaudio=sgs.CreateTriggerSkill{
	name="#baojunnaudio",
	events={sgs.PhaseChange},
	on_trigger=function(self,event,player,data)
		    local room=player:getRoom()
	if player:getPhase()~=sgs.Player_Discard then return end
	if not player:isWounded() then return end
	        room:playSkillEffect("baojunn")	
	end,			
}

baojun = sgs.CreateTriggerSkill
{--暴君
	name = "baojun",  
	frequency = sgs.Skill_Frequent , 
	events = {sgs.CardEffected},
	
	on_trigger = function(self, event, player, data)
	    local room = player:getRoom()
		local ef = data:toCardEffect()
		--if ef.card:isNDTrick() or ef.card:inherits("Slash") then
		if ef.card:isNDTrick() and ef.card:isBlack() then
		    if player:getHandcardNum() ~= player:getHp() then
		        if not player:askForSkillInvoke(self:objectName(),data) then return false end				
		        player:drawCards(1)
room:playSkillEffect("baojun",1)
		    --[[elseif player:getHandcardNum() > player:getHp() then
		        local players=room:getAlivePlayers()
		        local targets=room:getAlivePlayers()
		        for _, p in sgs.qlist(players) do
		            if p:isAllNude() then
				        targets:removeOne(p)
			        end
		        end
		        if targets:isEmpty() then return false end
	            if not player:askForSkillInvoke(self:objectName(),data) then return false end
	            local target=room:askForPlayerChosen(player, targets, self:objectName())
		        local card=room:askForCardChosen(player,target,"hej",self:objectName())
			    room:throwCard(card,target,player)
				room:playSkillEffect("baojun",2)]]
			end
		end
	end, 
}
-------------------------------------------------------------------------------------------
--[[qiangjie_trs=sgs.CreateTriggerSkill{--有问题，已解决（自己造成伤害则崩溃，原因是未检测袁术不在场的情况）
name="qiangjie_trs$",
events={sgs.Damage},
frequency = sgs.Skill_NotFrequent,
priority = 3,
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local shuba=room:findPlayerBySkillName("weidi")
	if event==sgs.Damage then--造成伤害
		if not selfplayer:hasLordSkill(self:objectName()) then return false end
		local damage=data:toDamage()
		if damage.to:isAllNude() then return false end--伤害目标全裸
		
		if damage.from and damage.from:getKingdom()=="qun" and  damage.from:objectName()==selfplayer:objectName() then--有源，为群雄,自己
		if ((selfplayer:getGeneralName()=="yuanshu" or selfplayer:getGeneralName()=="tai_yuanshu") and selfplayer:getGeneral2Name()=="shendongzhuo")then return false end--如果副将为董卓而主将为袁术则结束（防止重复暴虐）
		if shuba~=nil and selfplayer:getGeneral2Name()~="yuanshu" and selfplayer:getGeneral2Name()~="tai_yuanshu" then--很重要，如果不检测袁术是否在场，执行后续代码就会因为nil而崩溃；如果正副将组合是董卓袁术则结束（防止重复暴虐）【因为默认此情况自己主将为董卓（否则哪来的暴虐呢？）所以只要判定副将是否袁术即可】
		if (room:askForSkillInvoke(shuba,self:objectName(),data)==true) then --如果袁术发动了				
			     room:playSkillEffect("qiangjie_trs")	
                 room:obtainCard(shuba,room:askForCardChosen(shuba,damage.to,"hej",self:objectName()))--袁术拿牌
				 end
				 return false end
			end--此情况结算完毕
				 
		if damage.from and damage.from:getKingdom()=="qun" and  damage.from:objectName()~=selfplayer:objectName() then--有源，为群雄,非自己
			    if (room:askForSkillInvoke(selfplayer,self:objectName(),data)==true) then --如果董卓发动了
			    room:playSkillEffect("qiangjie_trs")	
				room:obtainCard(selfplayer,room:askForCardChosen(selfplayer,damage.to,"hej",self:objectName()))
				--董卓拿完牌
				if ((selfplayer:getGeneralName()=="yuanshu" or selfplayer:getGeneralName()=="tai_yuanshu") and selfplayer:getGeneral2Name()=="shendongzhuo")then return false end--如果副将为董卓而主将为袁术则结束（防止重复暴虐）
				if ((selfplayer:getGeneral2Name()=="yuanshu") or (selfplayer:getGeneral2Name()=="tai_yuanshu")) then return false end--如果正副将组合是董卓袁术则结束（防止重复暴虐）【因为默认此情况自己主将为董卓（否则哪来的暴虐呢？）所以只要判定副将是否袁术即可】
				if damage.to:isAllNude() then return false end--拿光了就结束不再询问袁术
				if damage.from and damage.from:getKingdom()=="qun" and  damage.from:objectName()==shuba:objectName() then return false end
				--如果伤害来源是袁术则在询问完董卓后就结束
				if shuba~=nil then
				if (room:askForSkillInvoke(shuba,self:objectName(),data)==true) then --如果袁术发动了				
			    room:playSkillEffect("qiangjie_trs")	
			    room:obtainCard(shuba,room:askForCardChosen(shuba,damage.to,"hej",self:objectName()))--袁术再拿牌
				return false end
				end
		        --董卓发动的处理结束
			
				
				 else--如果董卓不发动（没拿牌所以不需要继续判断伤害目标是否全裸）
				 if ((selfplayer:getGeneralName()=="yuanshu" or selfplayer:getGeneralName()=="tai_yuanshu") and selfplayer:getGeneral2Name()=="shendongzhuo")then return false end--如果副将为董卓而主将为袁术则结束（防止重复暴虐）
				 if ((selfplayer:getGeneral2Name()=="yuanshu") or (selfplayer:getGeneral2Name()=="tai_yuanshu")) then return false end--如果正副将组合是董卓袁术则结束（防止重复暴虐）【因为默认此情况自己主将为董卓（否则哪来的暴虐呢？）所以只要判定副将是否袁术即可】
				 if damage.from and damage.from:getKingdom()=="qun" and  damage.from:objectName()==shuba:objectName() then return false end
				     --如果伤害来源是袁术则在询问完董卓后就结束
				 if shuba~=nil then
				 if (room:askForSkillInvoke(shuba,self:objectName(),data)==true) then --如果袁术发动了				
			     room:playSkillEffect("qiangjie_trs")	
                 room:obtainCard(shuba,room:askForCardChosen(shuba,damage.to,"hej",self:objectName()))--袁术拿牌
			    end
				return false end
		    end--董卓不发动的处理结束	
	      end
	   end
    end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive() and player and player:getKingdom() == "qun"
end
}]]


qiangjie_trs = sgs.CreateTriggerSkill{
	name = "qiangjie_trs$" ,
	events = {sgs.Damage} ,
	can_trigger = function(self, target)
		return target and target:isAlive() and target:getKingdom() == "qun"
	end ,
	on_trigger = function(self, event, player, data)
		local lords = sgs.SPlayerList()
		local room = player:getRoom()
		for _, p in sgs.qlist(room:getOtherPlayers(player)) do
			if p:hasLordSkill(self:objectName()) then lords:append(p) end
		end
		if lords:isEmpty() then return false end
		local damage = data:toDamage()
		for _, lord in sgs.qlist(lords) do
			if (damage.to:isAllNude()) then return false end
			if (lord:askForSkillInvoke(self:objectName())) then
			    room:playSkillEffect("qiangjie_trs")
				local id = room:askForCardChosen(lord, damage.to, "hej", self:objectName())
				room:obtainCard(lord, sgs.Sanguosha:getCard(id))
			end
		end
	end ,
}


--shendongzhuo:addSkill(lieang)
--shendongzhuo:addSkill(shemi)

--shendongzhuo:addSkill(zuimo)
--shendongzhuo:addSkill(mozui)
shendongzhuo:addSkill(baojunn)
shendongzhuo:addSkill(baojunnaudio)
shendongzhuo:addSkill(baojun)
shendongzhuo:addSkill(qiangjie_trs)



sgs.LoadTranslationTable{
	["#shendongzhuo"] = "混世魔王",
	["shendongzhuo"]="五霸董卓",
	["~shendongzhuo"]="吾儿···奉先···何在···呃啊···",
	["lieang"]="烈昂",
	[":lieang"]="<font color=\"blue\"><b>锁定技</b></font>,若你在出牌阶段未造成伤害，则回合结束阶段你自动【苦肉】一次",
	["$lieang"]="哼！",		
	["shemi"]="奢靡",
	[":shemi"]="回合结束阶段，你可以从牌堆顶翻开一张牌，直至出现相同点数为止，你获得所有翻开的牌，并将武将牌翻面",
	["#luashm"]=" %from 从牌堆顶亮出一张牌，点数为 %arg ",
	["$shemi1"]="岂能无牌？！",
	["$shemi2"]="呃...！",		
	["mozui"]="醉酒",
	["luamz_effect"]="醉酒",
	[":mozui"]="你每回合可以使用任意张【酒】，且对下一张杀效果叠加",
	["#luamz"]="由于【<font color='yellow'><b>醉酒</b></font>】的效果， %from 对 %to 的伤害由 %arg 点上升为 %arg2 点",
	["$zuimo"]="酒呢？！",
	["$mozui"]="啊！好酒！",
	["zuimo"]="嗜酒",
	[":zuimo"]="<font color=\"blue\"><b>锁定技</b></font>,你的【即时锦囊】均视为【酒】",
	["qiangjie_trs"]="超级暴虐",
	["$qiangjie_trs"]="嘿嘿嘿嘿嘿...",
	[":qiangjie_trs"]="<font color=\"red\"><b>主公技</b></font>,其他群雄角色造成伤害后，你可从伤害目标区域获得一张牌",
	["baojunn"]="醉乡",
	["$baojunn"]="呃...！",	
	[":baojunn"]="<font color=\"blue\"><b>锁定技</b></font>,若你已受伤，则你的手牌上限＋３",
	["baojun"] = "暴君",
	["$baojun1"]="哼！",
	["$baojun2"]="嘿嘿嘿嘿...",	
	[":baojun"] = "当你成为<font color=\"blue\"><b>【黑色即时锦囊】</b></font>的目标时，若手牌数≠体力值，你可摸１张牌",
	["cv:shendongzhuo"] = "codeby:一个好人",
	["designer:shendongzhuo"] = "小爺綠豆殺",
	}
	
	--袁绍
dazui = sgs.General(extension, "dazui", "qun", 4)--增加武将 

Luaxueyi = sgs.CreateMaxCardsSkill{
	name = "Luaxueyi$",
	extra_func = function(self, target)
		local extra = 0
		local players = target:getSiblings()
		for _,player in sgs.qlist(players) do
			--if player:isAlive() then
				if player:getKingdom() == "qun" then
					extra = extra + 2
				end
			end
		if target:hasLordSkill(self:objectName()) then
			return extra
		end
	end
}



budao = sgs.CreateTriggerSkill
{
	name = "budao",
	frequency=sgs.Skill_NotFrequent,
	priority = 5,
	events = {sgs.SlashProceed},
	on_trigger = function(self, event, player, data)
		local room=player:getRoom()
		local effect = data:toSlashEffect()
		local to = effect.to
		local list = room:getOtherPlayers(player)
        local ju = list:length() == 1 and list:first():objectName() == target:objectName()--判断目标是否为除我之外唯一角色,感谢萝神(*^__^*) 
		if ju then return false end
		if not room:askForSkillInvoke(player, "budao") then return false end 		
		local targets=sgs.SPlayerList()
			for _,p in sgs.qlist(room:getOtherPlayers(player)) do
				if  p:getSeat()~=to:getSeat() then
					targets:append(p)
				end
			end
		local target=room:askForPlayerChosen(player,targets,"budao")
				if target==nil then return false end
				local slash=room:askForCard(target,"slash","askforbudao")
				if slash then 
				room:playSkillEffect("budao")
				--slash:setSkillName("budao")
				local use=sgs.CardUseStruct()
						use.card=slash
						use.from=target
						use.to:append(to)
				room:useCard(use)
				--room:getThread():delay()
				end		
	end
}


zhuisha = sgs.CreateTriggerSkill
{
	name = "zhuisha",
	frequency = sgs.Skill_Compulsory,
	events = sgs.SlashMissed,
	on_trigger = function(self, event, player, data)
		local room=player:getRoom()
		local effect = data:toSlashEffect()
		local  slash = effect.slash
		--player:obtainCard(slash)
		player:drawCards(1)
		room:playSkillEffect("zhuisha")
	end
}

mingmen=sgs.CreateTriggerSkill{
	name="mingmen",
	events=sgs.CardEffected,
	frequency=sgs.Skill_Compulsory,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local card=data:toCardEffect().card--记录使用的卡
		if  card:inherits("Duel") or card:objectName()=="archery_attack" then  
		local log = sgs.LogMessage()
				log.type = "$mingme"
				room:sendLog(log)
					room:playSkillEffect("mingmen")
		return true--卡片无效
	
		end
	end
}

dazui:addSkill(Luaxueyi)
dazui:addSkill(budao)
dazui:addSkill(zhuisha)
dazui:addSkill(mingmen)



sgs.LoadTranslationTable{
["dazui"] = "五霸袁绍", 
["#dazui"] = "高贵的名门", 
["Luaxueyi"] = "超级血裔", 
[":Luaxueyi"] = "<font color=\"red\"><b>主公技</b></font>,<font color=\"blue\"><b>锁定技</b></font>,场上每存在一名其他群雄角色,你的手牌上限便＋２(此效果不随角色阵亡而降低)", 
["budao"]="将令",	
["$budao"] = "容我来补一刀！",
[":budao"]="你使用杀结算前，可请求一名其他角色对目标使用一张杀",
["askforbudao"]="请帮袁绍补一刀",	
["zhuisha"]="威仪",	
["$zhuisha"] = "闪过了？",
[":zhuisha"]="<font color=\"blue\"><b>锁定技</b></font>,你使用的杀被闪避时，你摸１张牌",
["mingmen"]="名门",	
["$mingmen"] = "有此绝技，休想伤我！",
[":mingmen"]="<font color=\"blue\"><b>锁定技</b></font>,<font color=\"red\"><b>【万箭齐发】</b></font>和<font color=\"red\"><b>【决斗】</b></font>对你无效",
["$mingme"]="<font color=\"yellow\"><b>“累世公卿立大名，少年意气自纵横！”</b></font>",
["~dazui"] = "天不助袁哪！···", 
}
