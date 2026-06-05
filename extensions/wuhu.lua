module("extensions.wuhu",package.seeall)
extension=sgs.Package("wuhu")

--[[诸葛恪
--lua_zhugeke = sgs.General(extension, "lua_zhugeke", "wu", 3, true, false)

--傲才
lua_aocai = sgs.CreateTriggerSkill{
    name = "lua_aocai",
    events = {sgs.CardAsked,sgs.AskForPeaches},
    frequency = sgs.Skill_NotFrequent,
    on_trigger = function(self,event,player,data)
        local room = player:getRoom()
	if player:getPhase() ~= sgs.Player_NotActive then return false end
	--杀、闪响应时机
	if event == sgs.CardAsked then
	--杀部分
	if data:toString() == "slash" then
	if not room:askForSkillInvoke(player,self:objectName()) then return false end
	    for i=1,2,1 do
			local cards = sgs.QList2Table(room:getNCards(1))
			player:addToPile("lua_aocai",cards[1])
		end
		local q = player:getPile("lua_aocai")
		if sgs.Sanguosha:getCard(q:at(0)):inherits("Slash") and sgs.Sanguosha:getCard(q:at(1)):inherits("Slash") then
		    room:fillAG(q,player)
			local id_t = room:askForAG(player,q,true,self:objectName())
				room:provide(sgs.Sanguosha:getCard(id_t))
				q:removeOne(id_t)
				for _,cd in sgs.qlist(q) do
			        room:moveCardTo(sgs.Sanguosha:getCard(cd), nil, sgs.Player_DrawPile, true)
			    end
				
				player:invoke("clearAG")
				return true
		elseif sgs.Sanguosha:getCard(q:at(0)):inherits("Slash") and not sgs.Sanguosha:getCard(q:at(1)):inherits("Slash") then
			room:provide(sgs.Sanguosha:getCard(q:at(0)))
			for _,cd in sgs.qlist(q) do
			    room:moveCardTo(sgs.Sanguosha:getCard(cd), nil, sgs.Player_DrawPile, true)
			end
			return true
		elseif sgs.Sanguosha:getCard(q:at(1)):inherits("Slash") and not sgs.Sanguosha:getCard(q:at(0)):inherits("Slash") then
		    room:provide(sgs.Sanguosha:getCard(q:at(1)))
			for _,cd in sgs.qlist(q) do
			    room:moveCardTo(sgs.Sanguosha:getCard(cd), nil, sgs.Player_DrawPile, true)
			end
			return true
		elseif not sgs.Sanguosha:getCard(q:at(1)):inherits("Slash") and not sgs.Sanguosha:getCard(q:at(0)):inherits("Slash") then
			room:moveCardTo(sgs.Sanguosha:getCard(q:at(1)), nil, sgs.Player_DrawPile, true)
			room:moveCardTo(sgs.Sanguosha:getCard(q:at(0)), nil, sgs.Player_DrawPile, true)
			return false
		end
	--闪部分
	elseif data:toString() == "jink" then
	if not room:askForSkillInvoke(player,self:objectName()) then return false end
	    for i=1,2,1 do
			local cards = sgs.QList2Table(room:getNCards(1))
			player:addToPile("lua_aocai",cards[1])
		end
		local q = player:getPile("lua_aocai")
		if sgs.Sanguosha:getCard(q:at(0)):inherits("Jink") and sgs.Sanguosha:getCard(q:at(1)):inherits("Jink") then
		    room:fillAG(q,player)
			local id_t = room:askForAG(player,q,true,self:objectName())
				room:provide(sgs.Sanguosha:getCard(id_t))
				q:removeOne(id_t)
				for _,cd in sgs.qlist(q) do
			        room:moveCardTo(sgs.Sanguosha:getCard(cd), nil, sgs.Player_DrawPile, true)
			    end
				
				player:invoke("clearAG")
				return true
		elseif sgs.Sanguosha:getCard(q:at(0)):inherits("Jink") and not sgs.Sanguosha:getCard(q:at(1)):inherits("Jink") then
			room:provide(sgs.Sanguosha:getCard(q:at(0)))
			for _,cd in sgs.qlist(q) do
			    room:moveCardTo(sgs.Sanguosha:getCard(cd), nil, sgs.Player_DrawPile, true)
			end
			return true
		elseif sgs.Sanguosha:getCard(q:at(1)):inherits("Jink") and not sgs.Sanguosha:getCard(q:at(0)):inherits("Jink") then
		    room:provide(sgs.Sanguosha:getCard(q:at(1)))
			for _,cd in sgs.qlist(q) do
			    room:moveCardTo(sgs.Sanguosha:getCard(cd), nil, sgs.Player_DrawPile, true)
			end
			return true
		elseif not sgs.Sanguosha:getCard(q:at(1)):inherits("Jink") and not sgs.Sanguosha:getCard(q:at(0)):inherits("Jink") then
			room:moveCardTo(sgs.Sanguosha:getCard(q:at(1)), nil, sgs.Player_DrawPile, true)
			room:moveCardTo(sgs.Sanguosha:getCard(q:at(0)), nil, sgs.Player_DrawPile, true)
			return false
		end
	end
	--濒死时机
	elseif event == sgs.AskForPeaches then
	    local dying = data:toDying()
		--救自己的桃、酒部分
		if dying.who:objectName() == player:objectName() then
		    if not room:askForSkillInvoke(player,self:objectName()) then return false end
	    for i=1,2,1 do
			local cards = sgs.QList2Table(room:getNCards(1))
			player:addToPile("lua_aocai",cards[1])
		end
		local q = player:getPile("lua_aocai")
		if (sgs.Sanguosha:getCard(q:at(0)):inherits("Peach") and sgs.Sanguosha:getCard(q:at(1)):inherits("Peach")) or
		(sgs.Sanguosha:getCard(q:at(0)):inherits("Analeptic") and sgs.Sanguosha:getCard(q:at(1)):inherits("Analeptic")) or
		(sgs.Sanguosha:getCard(q:at(0)):inherits("Peach") and sgs.Sanguosha:getCard(q:at(1)):inherits("Analeptic")) or
		(sgs.Sanguosha:getCard(q:at(0)):inherits("Analeptic") and sgs.Sanguosha:getCard(q:at(1)):inherits("Peach"))
		then
		    room:fillAG(q,player)
			local id_t = room:askForAG(player,q,true,self:objectName())
				local use = sgs.CardUseStruct()
                use.from = player

                use.to:append(dying.who)
                                                         
                use.card = sgs.Sanguosha:getCard(id_t)
                room:useCard(use,true)
				q:removeOne(id_t)
				for _,cd in sgs.qlist(q) do
			        room:moveCardTo(sgs.Sanguosha:getCard(cd), nil, sgs.Player_DrawPile, true)
			    end
				
				player:invoke("clearAG")
		elseif (sgs.Sanguosha:getCard(q:at(0)):inherits("Peach") and not sgs.Sanguosha:getCard(q:at(1)):inherits("Peach") and not sgs.Sanguosha:getCard(q:at(1)):inherits("Analeptic")) or
		(sgs.Sanguosha:getCard(q:at(0)):inherits("Analeptic") and not sgs.Sanguosha:getCard(q:at(1)):inherits("Analeptic") and not sgs.Sanguosha:getCard(q:at(1)):inherits("Peach"))
		then
		    local use = sgs.CardUseStruct()
            use.from = player

            use.to:append(dying.who)
                                                         
            use.card = sgs.Sanguosha:getCard(q:at(0))
            room:useCard(use,true)
			for _,cd in sgs.qlist(q) do
			    room:moveCardTo(sgs.Sanguosha:getCard(cd), nil, sgs.Player_DrawPile, true)
			end
		elseif (sgs.Sanguosha:getCard(q:at(1)):inherits("Peach") and not sgs.Sanguosha:getCard(q:at(0)):inherits("Peach") and not sgs.Sanguosha:getCard(q:at(0)):inherits("Analeptic")) or
		(sgs.Sanguosha:getCard(q:at(1)):inherits("Analeptic") and not sgs.Sanguosha:getCard(q:at(0)):inherits("Analeptic") and not sgs.Sanguosha:getCard(q:at(0)):inherits("Peach"))
		then
		    local use = sgs.CardUseStruct()
            use.from = player

            use.to:append(dying.who)
                                                         
            use.card = sgs.Sanguosha:getCard(q:at(1))
            room:useCard(use,true)
			for _,cd in sgs.qlist(q) do
			    room:moveCardTo(sgs.Sanguosha:getCard(cd), nil, sgs.Player_DrawPile, true)
			end
		elseif not sgs.Sanguosha:getCard(q:at(1)):inherits("Peach") and not sgs.Sanguosha:getCard(q:at(0)):inherits("Peach") and
		not sgs.Sanguosha:getCard(q:at(1)):inherits("Analeptic") and not sgs.Sanguosha:getCard(q:at(0)):inherits("Analeptic")
		then
			room:moveCardTo(sgs.Sanguosha:getCard(q:at(1)), nil, sgs.Player_DrawPile, true)
			room:moveCardTo(sgs.Sanguosha:getCard(q:at(0)), nil, sgs.Player_DrawPile, true)
		end
		--救别人的桃部分
		elseif dying.who:objectName() ~= player:objectName() then
		    if not room:askForSkillInvoke(player,self:objectName()) then return false end
	    for i=1,2,1 do
			local cards = sgs.QList2Table(room:getNCards(1))
			player:addToPile("lua_aocai",cards[1])
		end
		local q = player:getPile("lua_aocai")
		if sgs.Sanguosha:getCard(q:at(0)):inherits("Peach") and sgs.Sanguosha:getCard(q:at(1)):inherits("Peach") then
		    room:fillAG(q,player)
			local id_t = room:askForAG(player,q,true,self:objectName())
				local use = sgs.CardUseStruct()
                use.from = player

                use.to:append(dying.who)
                                                         
                use.card = sgs.Sanguosha:getCard(id_t)
                room:useCard(use,true)
				q:removeOne(id_t)
				for _,cd in sgs.qlist(q) do
			        room:moveCardTo(sgs.Sanguosha:getCard(cd), nil, sgs.Player_DrawPile, true)
			    end
				
				player:invoke("clearAG")
		elseif sgs.Sanguosha:getCard(q:at(0)):inherits("Peach") and not sgs.Sanguosha:getCard(q:at(1)):inherits("Peach") then
		    local use = sgs.CardUseStruct()
            use.from = player

            use.to:append(dying.who)
                                                         
            use.card = sgs.Sanguosha:getCard(q:at(0))
            room:useCard(use,true)
			for _,cd in sgs.qlist(q) do
			    room:moveCardTo(sgs.Sanguosha:getCard(cd), nil, sgs.Player_DrawPile, true)
			end
		elseif sgs.Sanguosha:getCard(q:at(1)):inherits("Peach") and not sgs.Sanguosha:getCard(q:at(0)):inherits("Peach") then
		    local use = sgs.CardUseStruct()
            use.from = player

            use.to:append(dying.who)
                                                         
            use.card = sgs.Sanguosha:getCard(q:at(1))
            room:useCard(use,true)
			for _,cd in sgs.qlist(q) do
			    room:moveCardTo(sgs.Sanguosha:getCard(cd), nil, sgs.Player_DrawPile, true)
			end
		elseif not sgs.Sanguosha:getCard(q:at(1)):inherits("Peach") and not sgs.Sanguosha:getCard(q:at(0)):inherits("Peach") then
			room:moveCardTo(sgs.Sanguosha:getCard(q:at(1)), nil, sgs.Player_DrawPile, true)
			room:moveCardTo(sgs.Sanguosha:getCard(q:at(0)), nil, sgs.Player_DrawPile, true)
		end
		
		end
	
	end
    end,        
}

--黜武
qiangya_card = sgs.CreateSkillCard{
	name = "qiangya",
	target_fixed = true,
	will_throw = true,	
	on_use = function(self, room, source, targets)
		if(source:isAlive()) then			
			room:setPlayerFlag(source, "qiangyabuff")
			room:throwCard(self)
		end
	end,
}

qiangya = sgs.CreateViewAsSkill{
	name = "qiangya",
	n = 1,	
	enabled_at_play = function()
	return not sgs.Self:hasFlag("qiangyabuff")
	end,	
	view_filter = function(self, selected, to_select)
		return to_select:inherits("EquipCard") 
	end,	
	view_as = function(self, cards)
		if(#cards ~= 1) then return nil end
		local qcard = qiangya_card:clone()
		qcard:addSubcard(cards[1])
		qcard:setSkillName(self:objectName())
		return qcard
	end
}

qiangya_buff1 = sgs.CreateDistanceSkill{
    name = "#qiangya1",
	correct_func=function(self,from,to)
	if (from:hasFlag("qiangyabuff")) then 
	 return -9 end
	end
}
qiangya_buff2 = sgs.CreateTriggerSkill{
	name = "#qiangya2",
    events = {sgs.SlashEffect,sgs.SlashProceed},
    on_trigger = function(self,event,player,data)
    local room = player:getRoom()  
    local effect = data:toSlashEffect()
     if (player:hasFlag("qiangyabuff")) then 
	   local log = sgs.LogMessage()
               log.type = "#qiangya-buff"
               log.from = player
               log.arg = "qiangya"
               room:sendLog(log)
      room:slashResult(effect, nil) 
       return true
     end
    end
}

--lua_zhugeke:addSkill(lua_aocai)
--lua_zhugeke:addSkill(qiangya)
--lua_zhugeke:addSkill(qiangya_buff1)
--lua_zhugeke:addSkill(qiangya_buff2)]]

whzhaoyun= sgs.General(extension, "whzhaoyun", "shu",4)
--虎·赵云
changsheng=sgs.CreateTriggerSkill{
	name = "changsheng",
	events = {sgs.Predamaged},
	frequency = sgs.Skill_Compulsory,
	can_trigger=function(self, player)
		return player:hasSkill("changsheng")
	end,
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		local zy = room:findPlayerBySkillName(self:objectName())
		local damage=data:toDamage()
		local a=damage.to
		local b=damage.from
		if event==sgs.Predamaged then
			if damage.card:inherits("Duel") then
			room:playSkillEffect(self:objectName())
			local damage=sgs.DamageStruct()
				damage.damage=damage.damage
				damage.from=a
				damage.to=b
				room:damage(damage)
			else return false end
		return true
		end
	end,
}
whdanji = sgs.CreateTriggerSkill{
	name = "whdanji",
	frequency = sgs.Skill_NotFrequent,
	events = {sgs.PhaseChange,sgs.Predamage},
	can_trigger=function(self,target)
		return target:hasSkill(self:objectName())
	end,
	on_trigger=function(self,event,player,data)
	local room=player:getRoom()
	local damage=data:toDamage()
	if event == sgs.PhaseChange and player:getPhase()==sgs.Player_Draw then
		if (room:askForSkillInvoke(player,self:objectName())) then 
		room:playSkillEffect(self:objectName())
		
	
		for i=1,3 do
		local card_Id = room:drawCard()
		local card = sgs.Sanguosha:getCard(card_Id)
			room:moveCardTo(card,nil,sgs.Player_Special,true)
			room:getThread():delay()
			if card:inherits("Slash") then
				player:addMark("slashnum")
			else 
				room:obtainCard(player, card)
			end
		end
		    local x=player:getMark("slashnum")
			local log=sgs.LogMessage()
			log.from =player
			log.type ="#whdanjitishi"
			log.arg = x
			room:sendLog(log)
			
		return true end
		end
	if event==sgs.Predamage then
		local y=player:getMark("slashnum")
		--if damage.card:inherits("Slash") then
			damage.damage=damage.damage+y
			data:setValue(damage)
			player:setMark("slashnum",0)
		--end
	end
	if (event==sgs.PhaseChange) and (player:getPhase()== sgs.Player_Finish) then
		player:setMark("slashnum",0)
	end

	end,
}
baima=sgs.CreateDistanceSkill{
	name = "baima",
	correct_func=function(self,from,to)
	if to:hasSkill("baima") then
		return 1
	end
	end,
}

whzhaoyun:addSkill(changsheng)
whzhaoyun:addSkill(whdanji)
whzhaoyun:addSkill(baima)

whmachao= sgs.General(extension, "whmachao", "shu",4)

--虎·马超
tianjiang = sgs.CreateTriggerSkill{
	name = "tianjiang",
	frequency = sgs.Skill_NotFrequency,
	priority=99,
	events = {sgs.SlashProceed},
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		if event == sgs.SlashProceed then
			if (not room:askForSkillInvoke(player, self:objectName(),data)) then return false end 
			room:playSkillEffect("tianjiang")
			local judge = sgs.JudgeStruct()
			judge.pattern = sgs.QRegExp("(.*):(.*):(.*)")
			judge.good = true
			judge.reason = self:objectName()
			judge.who = player
			room:judge(judge)
			if(judge:isGood()) then
				local suit=judge.card:getSuit()
				if suit==sgs.Card_Heart then
					local effect = data:toSlashEffect()
					room:slashResult(effect, nil)
					--effect.from:obtainCard(judge.card)
					return true
				end
					if suit==sgs.Card_Spade then
						local effect = data:toSlashEffect()
						effect.to:turnOver()
						--effect.from:obtainCard(judge.card)
					end
				if suit==sgs.Card_Diamond then
					local effect = data:toSlashEffect()
					if effect.to and (not effect.to:isNude()) then
						local card_id = room:askForCardChosen(player, effect.to, "he", "tianjiang")
						if(room:getCardPlace(card_id) == sgs.Player_Hand) then
							room:moveCardTo(sgs.Sanguosha:getCard(card_id), player, sgs.Player_Hand, false)
							--effect.from:obtainCard(judge.card)
						else
							room:obtainCard(player, card_id)
							--effect.from:obtainCard(judge.card)
							
						end
					end
				end
				if suit==sgs.Card_Club then
					local effect = data:toSlashEffect()
					player:drawCards(1)
					--effect.from:obtainCard(judge.card)
				end
			end		
		end
	end,
}
whtieqi=sgs.CreateTriggerSkill{
	name = "whtieqi",
	frequency = sgs.Skill_Compulsory,
	events = {sgs.Predamage},
	can_trigger=function(self, player)
		return player:hasSkill("whtieqi")
	end,
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		local damage=data:toDamage()
		if event==sgs.Predamage then
			if (player:getDefensiveHorse()~=nil) or (player:getOffensiveHorse()~=nil) then
				if damage.card:inherits("Slash") then
					damage.damage=damage.damage+1
					data:setValue(damage)
				end
			end
		end
	end,
}
whmachao:addSkill(tianjiang)
whmachao:addSkill("mashu")
--whmachao:addSkill(whtieqi)






whzhangfei = sgs.General(extension, "whzhangfei", "shu", 4)

doubleda = sgs.CreateSlashSkill
{
	name = "doubleda",
-- 额外目标
	s_extra_func = function(self, from, to, slash) -- from：使用者；to：目标；slash：所用的杀。这三个参数除了from，其余都是可有可无的
		if from:hasSkill("doubleda") and slash and slash:isRed() then --注意必须先判断from是否有这个技能，否则谁都会发动的
			return 1 -- 这张杀可以指定一个额外目标，注意加上原本的，一共两个目标
		end
	end,
-- 攻击范围
	s_range_func = function(self, from, to, slash)
		if from:hasSkill("doubleda") and slash and slash:isBlack() then
			return -998 -- 注意这里因为是锁定攻击范围，所以前面要加个负号，如果不加，则累加攻击范围
		end
	end,
}
  
  --SPzhangfei:addSkill("jiang") 
  whzhangfei:addSkill("paoxiao") 
  whzhangfei:addSkill(doubleda) 
  
  --------------------------------------------
  --虎·黄忠
  whhuangzhong = sgs.General(extension, "whhuangzhong", "shu", 4)
jiaobing=sgs.CreateTriggerSkill{
	name = "jiaobing",
	events = {sgs.Damaged},
	frequency = sgs.Skill_NotFrequency,
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		local damage=data:toDamage()
		local x=damage.from:getMaxHP()
		local y=damage.from:getHandcardNum()
		if event==sgs.Damaged and damage.from~=nil then
		if not room:askForSkillInvoke(player,self:objectName(),data) then return false end
			room:playSkillEffect(self:objectName())
			if x>y then
				damage.from:drawCards(2)
				damage.from:turnOver() 
			else
				damage.from:turnOver()
			end
		end
		
	end,
}
duoshan=sgs.CreateTriggerSkill{
	name = "duoshan",
	events = {sgs.CardLost,sgs.PhaseChange},
	frequency = sgs.Skill_NotFrequency,
	can_trigger = function(self, player)
		return player:hasSkill("duoshan")
	end,
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		local hz= room:findPlayerBySkillName(self:objectName())
		if hz:getPhase()==sgs.Player_NotActive then
			if event==sgs.CardLost then
				local move = data:toCardMove()
				if (move.from_place == sgs.Player_Hand or move.from_place==sgs.Player_Equip) then
					local card = sgs.Sanguosha:getCard(move.card_id)
					if card:getSuit()==sgs.Card_Heart then
						if (room:askForSkillInvoke(hz,self:objectName())) then
							room:playSkillEffect(self:objectName())
							local targets2 = sgs.SPlayerList()
					all = room:getAllPlayers()
					for _,p in sgs.qlist(all) do
						--if  player:canSlash(p) then
						if player:inMyAttackRange(p) then
							targets2:append(p)
						end
					end
							local target=room:askForPlayerChosen(hz,targets2,"duoshan")
							
								local damage=sgs.DamageStruct()
								damage.damage=1
								damage.from=hz
								damage.to=target
								room:damage(damage)
						end
					end
				end
			end
			
		end
	end,
}
jianshu=sgs.CreateTriggerSkill{
	name = "jianshu",
	frequency = sgs.Skill_Compulsory,
	events = {sgs.SlashProceed},
	on_trigger=function(self,event,player,data)
	local room=player:getRoom()
	local effect=data:toSlashEffect()
	local hz= room:findPlayerBySkillName(self:objectName())
		if hz:getWeapon() and hz:getWeapon():inherits("KylinBow") then
			room:slashResult(effect, nil) 
			room:playSkillEffect(self:objectName())
		return true
		end
	end,
}



whhuangzhong:addSkill(jiaobing)
whhuangzhong:addSkill(duoshan)
--whhuangzhong:addSkill(jianshu)
whhuangzhong:addSkill("liegong")

luaguanyu = sgs.General(extension, "luaguanyu", "shu", 4 ,true) 
luaqinglong = sgs.CreateTriggerSkill
{
	name = "luaqinglong",
	events = {sgs.PhaseChange,sgs.Predamage},
	frequency = sgs.Skill_Compulsory,
	view_as_skill = luaqinglong,
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		local damage = data:toDamage()
		local card = damage.card
		if player:getPhase() == sgs.Player_Start then
			local blade = nil
			for _, p in sgs.qlist(room:getOtherPlayers(player)) do
				for _, cd in sgs.qlist(p:getCards("hej")) do
					if cd:inherits("Blade") then 
						blade = cd
						break
					end 
				end
			end
			if blade ~= nil then
				room:moveCardTo(blade, player, sgs.Player_Hand, true)
				
			end
					elseif(event == sgs.Predamage and  player:hasWeapon("blade")  and card:inherits("Slash")) then
				--local x=player:getLostHp()
				--player:drawCards(x)
				room:loseHp(damage.to)
				return false
		end

	end,
}
luawuwu=sgs.CreateProhibitSkill{ --无误
name = "luawuwu",
is_prohibited=function(self,from,to,card)
    if (to:hasSkill(self:objectName())) then
        return (card:inherits("Snatch") or card:inherits("Dismantlement")) 
    end
end,
}

chitu = sgs.CreateDistanceSkill
{
	name = "chitu",
	correct_func = function(self, from, to)
		if from:hasSkill("chitu") then		return -1		end
	end,
}


luaxiaoyong = sgs.CreateTriggerSkill
{
	name = "luaxiaoyong",
	events = {sgs.PhaseChange,sgs.GameStart},
	frequency = sgs.Skill_Compulsory,
	view_as_skill = luaxiaoyong,
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		if (event == sgs.GameStart) then
		room:acquireSkill(player,"luawuwu")
		end
		if(event == sgs.PhaseChange and player:getPhase() == sgs.Player_Finish) then
		room:acquireSkill(player,"luawuwu")
		room:detachSkillFromPlayer(player,"wusheng")
		room:detachSkillFromPlayer(player,"chitu")	
		elseif (event == sgs.PhaseChange and player:getPhase() == sgs.Player_Start) then
		room:detachSkillFromPlayer(player,"luawuwu")
		room:acquireSkill(player,"wusheng")
		room:acquireSkill(player,"chitu")
		return false 
		end
		end
	
}

local skill=sgs.Sanguosha:getSkill("luawuwu")
if not skill then
	local skillList=sgs.SkillList()
	skillList:append(luawuwu)
	sgs.Sanguosha:addSkills(skillList)
end
local skill=sgs.Sanguosha:getSkill("chitu")
if not skill then
	local skillList=sgs.SkillList()
	skillList:append(chitu)
	sgs.Sanguosha:addSkills(skillList)
end

luaguanyu:addSkill(luaxiaoyong)
luaguanyu:addSkill(luaqinglong)



sgs.LoadTranslationTable{
    ["wuhu"] = "五虎上将",
	["luaguanyu"] = "五虎关羽",
    [":luaqinglong"] = "<b>锁定技</b>，回合开始阶段，若场上有 <b>【青龙偃月刀】</b>，你立刻获得；当你装备有青龙偃月刀且使用<b>【杀】</b>对其他角色造成伤害时，目标首先流失１点体力。\
    ★无论<b>【青龙偃月刀】</b>处于其他角色的手牌区/判定区/装备区，你均可在回合开始阶段加入手牌中",
    [":luaxiaoyong"] = "<b>锁定技</b>，回合內你拥有技能【武圣】和坐骑牌【赤兔】；回合外你拥有技能【忠义】，直到你的下一个回合开始阶段。\
    ★<b>【忠义】</b>：你不能成为顺手牵羊和过河拆桥的目标",
    [":luawuwu"] = "<b>锁定技</b>，你不能成为【顺手牵羊】和【过河拆桥】的目标。",
    ["luaqinglong"] = "青龙",
    ["$luaqinglong"] = "取汝狗头，犹如探囊取物！",
    ["luawuwu"] = "忠义",
    ["luaxiaoyong"] = "斩将",
    ["$luaxiaoyong"] = "还不速速领死！",
    ["designer:luaguanyu"] = "程春阳",
    ["~luaguanyu"] = "什么!此地名叫麦城?", 
    ["#luaguanyu"] = "过关斩将",

	--[[["lua_zhugeke"] = "新诸葛恪",
	["#lua_zhugeke"] = "兴家赤族",
	["illustrator:lua_zhugeke"] = "LiuHeng",
	["lua_aocai"] = "傲才",
	[":lua_aocai"] = "当你于回合外需要使用或打出一张基本牌时，你可以观看牌堆顶的两张牌。若你观看的牌中有此牌，你可以使用打出之。",
    ["qiangya"]="黩武",
	[":qiangya"]="出牌阶段，你可以弃一张装备牌，若这么做，直到回合结束前你使用的“杀”与锦囊无视距离且“杀”不可闪避。",
	["#qiangya-buff"] = "%from 技能【%arg】效果被触发，因此该“杀”无视距离且不可闪避",]]
	["whzhaoyun"]="五虎赵云",
	["#whzhaoyun"]="长坂子龙", 
	["changsheng"]="常胜",
	[":changsheng"]="锁定技，当你使用【决斗】或成为【决斗】的目标，无论结果如何，均视为你赢。",
	["$changsheng"]="喝~",
	["whdanji"]="单骑",
	[":whdanji"]="摸牌阶段你可以放弃摸牌，并展示牌堆顶３张牌，你获得除【杀】外的展示牌，且回合内你首次造成的伤害＋Ｘ（Ｘ=展示牌中【杀】的张数）。",
	["#whdanjitishi"] = "%from本回合首次造成的伤害增加%arg点",
	["$whdanji"]="能进能退乃真正法器",
	["baima"]="白马",
	[":baima"]="锁定技，其他角色计算与你的距离时，始终＋１。",
	["~whzhaoyun"]="这就是失败的滋味么？",
	["whmachao"]="五虎马超",
	["#whmachao"]="西凉孟起", 
	["tianjiang"]="天将",
	[":tianjiang"]="你使用【杀】指定目标后，可进行一次判定：若为红桃，该【杀】不可闪避；若为方块，你获得对方的一张牌；若为黑桃，对方翻面；若为梅花，你摸１张牌。",
	["$tianjiang"]="全军突击！",
	["whtieqi"]="铁骑",
	[":whtieqi"]="锁定技，当你装备区有马匹时，你使用【杀】造成的伤害＋１。",
	["~whmachao"]="马蹄声",
	["whzhangfei"] = "五虎张飞",
    [":doubleda"] = " <b>锁定技</b>，你使用黑【杀】无视距离，使用红【杀】可额外指定一个目标",
    ["doubleda"] = "飞矛";
    ["#whzhangfei"] = "文成武德",
	["whhuangzhong"]="五虎黄忠", 
	["#whhuangzhong"]="老将汉昇",
	["jianshu"]="箭术",
	[":jianshu"]="锁定技，当你装备了麒麟弓时，你使用的【杀】不可闪避",
	["$jianshu"]="中！",
	["duoshan"]="夺山",
	[":duoshan"]="回合外失去一张红桃牌时，你可以对攻击范围内的一名角色（<font color=\"green\"><b>包括自己</b></font>）造成１点伤害",
	["$duoshan"]="杀汝等个措手不及！",
	["jiaobing"]="骄兵",
	[":jiaobing"]="你受到伤害时，可以使伤害来源将武将牌翻面，此时若其手牌数＜体力上限，该角色摸２张牌",
	["$jiaobing"]="如此，一击可擒也！",
	["~whhuangzhong"]="不得不服老啊！",
	
	
}