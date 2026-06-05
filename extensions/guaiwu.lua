module("extensions.guaiwu", package.seeall)
extension = sgs.Package("guaiwu")


zhanhou = sgs.CreateTriggerSkill
{
	name = "zhanhou",
	frequency = sgs.Skill_Compulsory,
	events = {sgs.DrawNCards,sgs.PhaseChange},
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		if event==sgs.DrawNCards then
			--local count = data:toInt() + 2
			data:setValue(4)
			end
			
		if event==sgs.PhaseChange and player:getPhase() == sgs.Player_Finish then
		player:drawCards(4)
	    end
	end,
}
--------------------------------------------------------

------------------------------------

longyi = sgs.CreateTriggerSkill
{
	name = "#longyi",
	frequency = sgs.Skill_Compulsory,
	events = {sgs.GameStart},
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		for _,others in sgs.qlist(player:getSiblings()) do
			room:setFixedDistance(player,others,1)
		end
	end,
}
-------------

-----------------------------------
longyibuff=sgs.CreateFilterSkill{
name="longyibuff",
view_filter=function(self,to_select)
return to_select:inherits("EquipCard") 
end,
view_as=function(self,card)

local filtered=sgs.Sanguosha:cloneCard("slash", card:getSuit(), card:getNumber())

filtered:addSubcard(card) 

filtered:setSkillName(self:objectName())
return filtered
end
}


----------------------

-----------------------------------
longzhua=sgs.CreateTriggerSkill{
name="longzhua",
events={sgs.DamageDone,sgs.Damage},
frequency = sgs.Skill_Compulsory,
can_trigger = function()
    return true
end,
on_trigger=function(self,event,player,data)
	local room=player:getRoom()
    local selfplayer=room:findPlayerBySkillName("longzhua")	
	
	if event==sgs.DamageDone then
	local damage=data:toDamage()--获取伤害结构体
	if damage.from and damage.from:hasSkill("longzhua") and damage.from:isAlive() then
	if damage.card==nil then return end
	if not damage.card:inherits("Slash") then return end
	local tos = sgs.SPlayerList()
    for _,p in sgs.qlist(room:getOtherPlayers(damage.to)) do
    --if p:objectName()~=damage.from:objectName() and (math.abs(p:getSeat()-damage.to:getSeat()) == 1 or math.abs(p:getSeat()-damage.to:getSeat()) == 7) then
	if p:objectName()~=damage.from:objectName() and damage.to:distanceTo(p)<= 1 then
	tos:append(p)
	room:setPlayerMark(p, "DamageTarget", 1)
	end
	end
	end
	end
	

	
	if event==sgs.Damage then
	local tos = sgs.SPlayerList()
	for _,p in sgs.qlist(room:getAlivePlayers()) do
            if p:getMark("DamageTarget")>0 then
			    tos:append(p)
			end
		end
	if tos == nil then return end
	for _,q in sgs.qlist(tos) do
	room:setPlayerMark(q, "DamageTarget", 0)--这句的位置很重要，须在执行伤害之前清除mark，否则会引发嵌套循环。
		local damage=sgs.DamageStruct()
			damage.damage = 1
			damage.from = selfplayer
			damage.to = q
		    room:damage(damage)
			
	end
end

		
end,
}
-------------------------------------

-------------------------------------
longoneshixue=sgs.CreateTriggerSkill{
name="longoneshixue",
events={sgs.Dying,sgs.Predamage},
frequency = sgs.Skill_Compulsory,
can_trigger = function(self, target)
	return target
end,
on_trigger=function(self,event,player,data)
	local room=player:getRoom()
    local selfplayer=room:findPlayerBySkillName(self:objectName())	
	
	if event==sgs.Dying then
	local dying=data:toDying()
	if dying.who:objectName()~=selfplayer:objectName() then
	local recover = sgs.RecoverStruct()
	      recover.who = selfplayer
		  recover.recover = 1
		  room:recover(selfplayer,recover)
	dying.who:gainMark("@longoneshixue")
	end
	end
	
	if event==sgs.Predamage then
	local damage=data:toDamage()
	if damage.from:objectName()==selfplayer:objectName() and damage.to:getMark("@longoneshixue")>0 then
	local log = sgs.LogMessage()
	log.from = selfplayer
	log.to:append(damage.to)
	log.arg = tonumber(damage.damage)
	log.arg2 = log.arg+damage.to:getMark("@longoneshixue")
	room:sendLog(log)	
	damage.damage = damage.damage+damage.to:getMark("@longoneshixue")
	data:setValue(damage)
	end
	end
	
end,
}
---------------------------


longlin=sgs.CreateTriggerSkill{
	name="longlin",
	frequency = sgs.Skill_Compulsory,
	priority = 5,
	events={sgs.SlashEffected,sgs.Predamaged,sgs.Predamage,sgs.HpLost,sgs.PhaseChange,sgs.Damaged},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		
		if (event == sgs.PhaseChange and player:getPhase() == sgs.Player_RoundStart) then
		if player:getHp() == 1 then
		        local recover = sgs.RecoverStruct()
				recover.who = player
				recover.recover = 1
				room:recover(player,recover)
		end
		end
		
		if event == sgs.Predamaged then
		if player:getHp() <= 3 then
		local damage = data:toDamage()
		local log=sgs.LogMessage()
			log.from =player
			log.type ="#longlinthree"
			log.arg = tonumber(damage.damage)
			log.arg2 = log.arg-1
			room:sendLog(log)
			damage.damage = damage.damage - 1
			data:setValue(damage)
		    end
		end
		
		if event == sgs.Predamage then
		if player:getHp() <= 2 then
		local damage = data:toDamage()
		local log = sgs.LogMessage()
			log.from = player
			log.type ="#longlintwo"
			log.to:append(damage.to)
			log.arg = tonumber(damage.damage)
			log.arg2 = log.arg+1
			room:sendLog(log)	
			damage.damage = damage.damage+1
			data:setValue(damage)
		    end
		end
		
		if event == sgs.HpLost then 
		if player:getHp() <= 4 then
		return true end
		end
		
		if event == sgs.Predamaged then
		if player:getHp() <= 5 then
		
		local damage=data:toDamage()--获取伤害结构体
		local from=damage.from--获取来源
		local x=damage.damage----获取伤害数值
		if from==nil then return end
		if from:objectName()==player:objectName() then return end
		
		local damagex=sgs.DamageStruct()--创建新的伤害结构体
			damagex.damage=x
			damagex.from=player--来源是自己
			damagex.to=from--伤害对象
			room:damage(damagex)--执行伤害
		end
		end
		
		if event == sgs.Damaged then
		if player:getHp() <= 6 then
		local damage=data:toDamage()
		if damage.from==nil then return end
		if damage.from:getWeapon()==nil then return end
		if damage.from:objectName()==player:objectName() then return end
		room:throwCard(damage.from:getWeapon(),damage.from,player)
		end
		end
		
		if event == sgs.SlashEffected then
		if player:getHp() <= 7 then
		local effect = data:toSlashEffect()
		if effect.from:objectName()==player:objectName() then return end
		local log=sgs.LogMessage()
		log.type ="#longlin"
		log.arg=player:getGeneralName()
		log.from =effect.from
		room:sendLog(log)	
	    if(room:askForCard(effect.from, "Slash", "@longlinseven-discard")) then 
				return false
		end	
			log.type ="#longlinsevennodiscard"
			room:sendLog(log)
			return true
		end
		end
		
end,

}
--------------------------

----------------------------------
haodoubuff = sgs.CreateProhibitSkill
{
name = "#haodoubuff",
is_prohibited = function(self, from, to, card)
if(to:hasSkill(self:objectName())) then
return (card:inherits("Indulgence") or card:inherits("SupplyShortage")) 
end
end
}
-----------------------

--------------------------------------------------------
haodou=sgs.CreateTriggerSkill{
name="haodou",
events={sgs.TurnedOver,sgs.PhaseChange},
frequency = sgs.Skill_Compulsory,
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	
	if event==sgs.TurnedOver then
	if not player:faceUp() then
	player:turnOver()
	end
	end
	
	if (event == sgs.PhaseChange and player:getPhase() == sgs.Player_RoundStart) then
	local tos = sgs.SPlayerList()
    for _,p in sgs.qlist(room:getAlivePlayers()) do
    if not p:faceUp() then
	tos:append(p)
	end
	end
	
	if tos == nil then return end
	for _,q in sgs.qlist(tos) do
		local damage=sgs.DamageStruct()
			damage.damage=5
			damage.from=player
			damage.to = q
		    room:damage(damage)
		end
	end
		
	
	
	
end,
}
--------------------


---------------------------------------------------------------------


---------------------
longone=sgs.General(extension, "longone", "god", "8", true,true)

longone:addSkill(zhanhou)
longone:addSkill(longoneshixue)
longone:addSkill(haodou)
longone:addSkill(haodoubuff)
longone:addSkill(longyi)
longone:addSkill(longyibuff)
longone:addSkill(longzhua)
longone:addSkill(longlin)




----------------------------------------------






---------------------------------------------------------
sgs.LoadTranslationTable{

    ["guaiwu"]="怪物包",


	["longone"] = "大龙",
    ["zhanhou"]="战吼",
	[":zhanhou"]="<font color=\"blue\"><b>锁定技</b></font>，摸牌阶段你摸４张牌，回合结束阶段你摸４张牌。",
	["longyibuff"]="龙翼",
	[":longyibuff"]="<font color=\"blue\"><b>锁定技</b></font>，你与其他角色的距离均视为１；你的装备牌均视为【杀】。",
    ["longlin"] = "龙鳞",
	[":longlin"] = "<font color=\"blue\"><b>锁定技</b></font>，你根据当前体力值拥有以下效果：\
<font color=\"purple\"><b>≤1</b></font>：你在回合开始时回复１点体力。\
<font color=\"purple\"><b>≤2</b></font>：你造成的伤害＋１。\
<font color=\"purple\"><b>≤3</b></font>：你受到的伤害－１。\
<font color=\"purple\"><b>≤4</b></font>：体力流失对你无效。\
<font color=\"purple\"><b>≤5</b></font>：你受到其他角色造成的伤害时，对伤害来源造成等量伤害。\
<font color=\"purple\"><b>≤6</b></font>：你受到其他角色造成的伤害后，弃置伤害来源装备区的武器牌。\
<font color=\"purple\"><b>≤7</b></font>：你成为其他角色使用的【杀】的目标时，其须弃置一张【杀】，否则此【杀】对你无效。",
	["#longlin"]="%arg 的技能“<b><font color='yellow'>龙鳞</font></b>”被触发,%from 须额外弃一张【杀】才能使该牌生效",
	["@longlinseven-discard"]="请弃置一张【杀】，否则该牌对大龙无效",
	["#longlinsevennodiscard"]="%from 使用的【杀】对 %arg 无效",
	["#longlinthree"] = "%from 发动了技能“<b><font color='yellow'>龙鳞</font></b>”，将 %arg 点伤害减少至 %arg2 点",
	["#longlintwo"] = "%from 发动了技能“<b><font color='yellow'>龙鳞</font></b>”，将 %arg 点伤害增加至 %arg2 点",
	["longzhua"]="龙爪",
	[":longzhua"]="<font color=\"blue\"><b>锁定技</b></font>，你使用【杀】造成伤害后，对该角色距离１以内的其他角色各造成１点伤害。",
	["haodou"]="好斗",
	[":haodou"]="<font color=\"blue\"><b>锁定技</b></font>，你的武将牌保持正面朝上；你不能成为【兵粮寸断】和【乐不思蜀】的目标；你不会失去技能；回合开始时，你对场上翻面的角色各造成５点伤害。",
	["longoneshixue"]="嗜血",
	["@longoneshixue"]="血",
	[":longoneshixue"]="<font color=\"blue\"><b>锁定技</b></font>，其他角色进入濒死状态时，你回复１点体力，然后该角色获得一枚“血”标记；你对拥有此标记的角色造成的伤害＋<font color=\"red\"><b>血标记数</b></font>。",
-------------------------------------------
-------------------------------------------
	}
	
	



	
	
	