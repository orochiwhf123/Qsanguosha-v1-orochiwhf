module("extensions.dmxy", package.seeall)
extension = sgs.Package("dmxy")

chiqingzhoushangxian=sgs.CreateMaxCardsSkill{
name="#chiqingzhoushangxian", 
extra_func=function(self,target) 
		return target:getMark("@chiqing")
end
}


pokong=sgs.CreateTriggerSkill{
	name="pokong",
	can_trigger = function (self, player)
		return player:hasSkill("pokong")
	end,--读取当前具备此技能的玩家（定向作用）
	frequency = sgs.Skill_Compulsory,
	events={sgs.PreDeath,sgs.Dying},
	priority = 999999999,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
	
		
		if event==sgs.PreDeath then
			if player:hasSkill("pokong") then
				--room:revivePlayer(player)
			    player:throwAllCards()---清手牌装备判定区
		        room:setEmotion(player,"chunge")--播放复活·春哥特效
		        --room:broadcastSkillInvoke("pokong")--播放音效
				room:setPlayerProperty(player,"maxhp",sgs.QVariant(5))
				room:setPlayerProperty(player,"hp",sgs.QVariant(5))
				return true
			end
				elseif event==sgs.Dying then
			room:setPlayerProperty(player,"hp",sgs.QVariant(player:getMaxHp()))
			--player:throwAllCards()---清手牌装备判定区
			player:drawCards(5)--摸牌
			room:setPlayerProperty(player,"chained",sgs.QVariant(false))--不连环
			if not player:faceUp() then player:turnOver() end--不翻面
		return false	
	
		
		
		
		
		
	end--索命技已经不能把他杀死了，要想破掉可以封印其技能，比如蔡文姬（或者自写破坏技能）。
	end
}





xukong = sgs.CreateTriggerSkill   
{
	name = "#xukong" ,
	events = {sgs.MaxHpLost,sgs.PhaseChange} ,
	priority = 999999999,
	frequency = sgs.Skill_Compulsory,
	on_trigger = function( self , event , player , data )
		local room     = player:getRoom()
		local curMaxHp = player:getMaxHp()
		if( curMaxHp < 5 ) then
			room:setPlayerProperty(player, "maxhp", sgs.QVariant(curMaxHp+1))
		end
		return true		
	end,
}


xuanwoo = sgs.CreateTriggerSkill
{
	name = "xuanwoo",
	--frequency = sgs.Skill_NotFrequent,
	frequency = sgs.Skill_Compulsory,
	events = {sgs.Damaged},
	can_trigger = function (self, player)
		return player:hasSkill("xuanwoo")
	end,
	on_trigger = function (self, event, player, data)
		local room = player:getRoom()
		local damage = data:toDamage()
		local p = damage.to
		local source = damage.from
		local sp = room:getAllPlayers()
		if damage.card ~= nil and damage.card:inherits("SavageAssault") then
			for _,p in sgs.qlist(sp) do
				if p:hasSkill("huoshou") then source = p end
			end
		end
	
		if damage.damage >= 1  then
			if not player:isAlive() then return false end
			--if not room:askForSkillInvoke(p, "xuanwoo", data) then return false end
			
			
			local otherplayers = room:getOtherPlayers(p)
			
			local target = room:askForPlayerChosen(p, otherplayers, "@xuanwoo")

			--room:askForPlayerChosen(p, otherplayers, "@xuanwoo")
			local log = sgs.LogMessage()
			
			log.from = player
			log.arg = target:getGeneralName()
			room:sendLog(log)
			room:killPlayer(target)

		end
	end,
}

xuanwo = sgs.CreateTriggerSkill{
	name="xuanwo",
	events={sgs.Predamage},
	priority = 999999999,
	on_trigger=function(self,event,player,data)
		local room =player:getRoom()
		local log  =sgs.LogMessage()
		if(room:findPlayerBySkillName("huoshou") and event==sgs.Predamage) then
			local damage = data:toDamage()
			if	(damage.card and damage.card:inherits("SavageAssault")) then
				return false
			end
		end
		
		if(not player:askForSkillInvoke("xuanwo") ) then return end
		local damage = data:toDamage()
		room:loseHp(damage.to , damage.damage )
		--room:broadcastSkillInvoke("xuanwo")
		return true
		
	
	end,
}



tashe = sgs.CreateTriggerSkill
{--踏射
	name = "tashe",
	frequency = sgs.Skill_NotFrequent,
	events = {sgs.CardEffected},
	priority = 999999999,

	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		local selfplayer=room:findPlayerBySkillName("tashe")

		local effect = data:toCardEffect()
		local card = effect.card
		
		if card:inherits("Card")  then--or card:inherits("Card")牌，加上去就极其变态了。

			if(not room:askForSkillInvoke(player,"tashe"))then return false end

			local pfc=room:getAlivePlayers()
			pfc:removeOne(selfplayer)
			local pc=room:askForPlayerChosen(selfplayer,pfc,"#tashe_target")
			if(not pc)then return false end
			effect.to = pc
			room:cardEffect(effect)
			--room:broadcastSkillInvoke("tashe")
			return true
		end
	end,
}


	
	baiban=sgs.CreateTriggerSkill{
	name="baiban",
	events={sgs.HpChanged,sgs.GameStart},
	priority = 999999998,

	on_trigger=function(self,event,player,data)
		local room = player:getRoom()
		local selfplayer=room:findPlayerBySkillName(self:objectName())--这句非常重要!
		if player:askForSkillInvoke("baiban") then
		
		for _, tmp in sgs.qlist(room:getOtherPlayers(selfplayer)) do
			local choice = room:askForChoice(tmp, self:objectName(), "su+jiangg")
			
			if(choice == "su") then
				room:transfigure(tmp,"shenguanyu",true,false)
                
				room:setPlayerProperty(tmp,"general2",sgs.QVariant("shenguanyu"))--无技能
				room:setPlayerProperty(tmp,"hp",sgs.QVariant(0))
                room:setPlayerProperty(tmp,"maxhp",sgs.QVariant(0))

			else
				room:transfigure(tmp,"shenguanyu",true,false)
       
				room:setPlayerProperty(tmp,"general2",sgs.QVariant("shenguanyu"))--无技能
				room:setPlayerProperty(tmp,"hp",sgs.QVariant(0))
                room:setPlayerProperty(tmp,"maxhp",sgs.QVariant(0))

			end
		end
		return false
	end
	end
}



eatdeath=sgs.CreateTriggerSkill{
	name="eatdeath",
	frequency = sgs.Skill_NotFrequent,
	events={sgs.Death},
	priority = 999999999,

	can_trigger = function(self, player)
		return true
	end,

	on_trigger = function(self,event,player,data)
		local room = player:getRoom()
		local tenkei = room:findPlayerBySkillName(self:objectName())
		if not tenkei then return false end

		local skillslist = tenkei:getTag("EatDeath"):toString()
		local eatdeath_skills = skillslist:split("+")
		if eatdeath_skills[1] == "" then table.remove(eatdeath_skills, 1) end

		if room:askForSkillInvoke(tenkei, self:objectName(), data) then
			--if #eatdeath_skills > 0 and sgs.Sanguosha:getSkill(eatdeath_skills[1]) then
				--local choice = room:askForChoice(tenkei, self:objectName(), table.concat(eatdeath_skills, "+"))
				--room:detachSkillFromPlayer(tenkei, choice)
				--for i = #eatdeath_skills, 1, -1 do
					--if eatdeath_skills[i] == choice then
						--table.remove(eatdeath_skills, i)
					--end
				--end
			--end
			--room:loseMaxHp(tenkei)
			local skills = player:getVisibleSkillList()
			for _, skill in sgs.qlist(skills) do
				if skill:getLocation() == sgs.Skill_Right then
					--if skill:getFrequency() ~= sgs.Skill_Limited and
						--skill:getFrequency() ~= sgs.Skill_Wake then
						local sk = skill:objectName()
						room:acquireSkill(tenkei, sk)
						table.insert(eatdeath_skills, sk)
					--end
				end
			end
			tenkei:setTag("EatDeath", sgs.QVariant(table.concat(eatdeath_skills, "+")))
		end
		return false
	end
}








she=sgs.CreateTriggerSkill{
	name="#she",
	can_trigger = function (self, player)
		return player:hasSkill("#she")
	end,--读取当前具备此技能的玩家（定向作用）
	
	events={sgs.HpChanged,sgs.GameStart},
	priority = 999999999,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		--if (room:askForSkillInvoke(player,self:objectName())) then 
		room:gameOver(player:objectName())
	--end
	end,
}




--skills = sgs.General(extension, "skills", "god", 0, true, true, true)

--skills:addSkill(pokong)
--skills:addSkill(pokon)
--skills:addSkill(xuanwo)
--skills:addSkill(xukong)
--skills:addSkill(tashe)
--skills:addSkill(eatdeath)
--skills:addSkill(baiban)
--skills:addSkill(shenren)




lingdonglai=sgs.General(extension, "$lingdonglai", "wei", "5", true , true)

lingdonglai:addSkill(pokong)
--lingdonglai:addSkill(xuanwoo)


lingdonglai:addSkill(xuanwo)
--lingdonglai:addSkill(xukong)
lingdonglai:addSkill(tashe)
lingdonglai:addSkill(eatdeath)
lingdonglai:addSkill(baiban)
lingdonglai:addSkill(she)
--lingdonglai:addSkill(shenli)



lujiaer = sgs.General(extension, "lujiaer", "god",4,true,true)



liefengquan=sgs.CreateTriggerSkill{
	name = "liefengquan",
	frequency = sgs.Skill_NotFrequent,
	events = {sgs.SlashProceed},
	on_trigger=function(self,event,player,data)
	local room = player:getRoom()
		if event==sgs.SlashProceed then
			local effect=data:toSlashEffect()
			if effect.to:isKongcheng() then return false end
			if (not room:askForSkillInvoke(player,self:objectName())) then return false end
			player:drawCards(1)
			local success = player:pindian(effect.to,"liefengquan", nil)
			room:playSkillEffect("liefengquan")
			if success then
				room:slashResult(effect, nil)      
			return true
			else 
				 
					effect.to:turnOver()
				
			return true
			end
		end
	end,
}

encijietuo=sgs.CreateTriggerSkill{

	name = "encijietuo",
	
 	frequency = sgs.Skill_Compulsory,
	
 	events = {sgs.SlashProceed,sgs.Predamage},
	
 	on_trigger=function(self,event,player,data)
	  	local room = player:getRoom()
		if event==sgs.SlashProceed then
			if math.random()<=0.20 then	
				room:setPlayerFlag(player,"ecjt")
     			local effect=data:toSlashEffect()
     			room:slashResult(effect, nil) 

     			return true
			end
		end
		
		if event==sgs.Predamage and player:hasFlag("ecjt") then
			local damage=data:toDamage()
			damage.damage=damage.damage*3
			data:setValue(damage)
			room:playSkillEffect("encijietuo")
				
			local log=sgs.LogMessage()
			log.type="#encijietuo"
			log.from=player
			log.to:append(damage.to)
			log.arg=damage.damage
			room:sendLog(log)
		end
	end
}

LuaKuaiYiCard=sgs.CreateSkillCard{--技能卡
	name="LuaKuaiYiCard",
	filter=function(self,targets,to_select,player)
		return not to_select:isKongcheng() and to_select:getSeat()~=player:getSeat() and not to_select:hasFlag("LuaKuaiYiTarget")
	end,
	on_use=function(self,room,source,targets)
		room:throwCard(self)
		local target=targets[1]--从目标角色数组中把目标提取出来
		local cardid=room:askForCardChosen(source,target,"h","LuaKuaiYi")
		local card=sgs.Sanguosha:getCard(cardid)--记录选择的牌
		room:playSkillEffect("LuaKuaiYi")
		room:showCard(target,cardid)
		if card:inherits("BasicCard") then
			room:throwCard(card)
		else
			local duel=sgs.Sanguosha:cloneCard("duel",sgs.Card_NoSuit,0)
			duel:setSkillName(self:objectName())
			local use=sgs.CardUseStruct()
			use.card=duel
			use.from=source
			use.to:append(target)
			room:useCard(use)
		end
		room:setPlayerFlag(target,"LuaKuaiYiTarget")
	end,
}
LuaKuaiYi=sgs.CreateViewAsSkill{
	name="LuaKuaiYi",
	n=1,--一次一张牌
	view_filter=function(self,selected,to_select)
		return to_select:isRed()--要求是“红”
	end,
	view_as=function(self,cards)
		if #cards==1 then
			acard=LuaKuaiYiCard:clone()--复制一张卡的效果
			acard:addSubcard(cards[1])--？？
			return acard--返回一张新卡
		end
	end,
}
Luakuaiyi=sgs.CreateTriggerSkill{
	name="#Luakuaiyi",
	events=sgs.PhaseChange,--阶段改变时发动，开始时加标记
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()--获取房间
		if player:getPhase()==sgs.Player_Play then--结束阶段发动
			for _,p in sgs.qlist(room:getOtherPlayers(player)) do--循环，逐一检视其它角色
				room:setPlayerFlag(p,"-LuaKuaiYiTarget")
			end
		end
	end,
}

kaisabo=sgs.CreateTriggerSkill{
	name="kaisabo",
	frequency=sgs.Skill_NotFrequent,
	events={sgs.CardLostDone},
	on_trigger=function(self,event,player,data)
		
		local room=player:getRoom()
		local cannot=false
		local maxnum=0
	
		if cannot then return end
		if player:getPhase()~=sgs.Player_NotActive then return false end
		if not player:askForSkillInvoke(self:objectName()) then return end
		local targets=sgs.SPlayerList()
		for _,p in sgs.qlist(room:getAllPlayers()) do
			if  p:getCards("hej"):length()~=0 then
				targets:append(p)
			end
		end
		if targets:isEmpty() then return end
		local target=room:askForPlayerChosen(player,targets,"kaisabo")
		local log= sgs.LogMessage()
			log.type = "#kaisabo"
			log.from = player
			log.to:append(target)
		room:sendLog(log)
		local card_id=room:askForCardChosen(player,target,"hej","kaisabo")
		room:throwCard(sgs.Sanguosha:getCard(card_id))
		room:playSkillEffect("kaisabo")
	end,
}

baqi=sgs.CreateTriggerSkill
{
        name="baqi",
        events={sgs.Dying},
			priority=998,
        frequency=sgs.Skill_Wake,		
        on_trigger=function(self,event,player,data)
		player:gainMark("@kunyi")
        local room=player:getRoom()	
		if player:getMark("baqi")==1 then return end
		room:playSkillEffect("baqi",2)
--room:setPlayerMark(player, "baqi1Invoked", 1) --这个标记用于防止重复觉醒		
		
		local CanInvoke = false
		
			
			if (room:askForSkillInvoke(player,self:objectName())) then 
			room:playSkillEffect("baqi",1)
			for _,pl in sgs.qlist(room:getAllPlayers()) do
						pl:invoke("animate", "lightbox:$baqi:3000")
						end
						room:getThread():delay(3000)
			room:transfigure(player,"shenshezhang",true,false)
			player:setMark("baqi",1)
			if not player:faceUp() then player:turnOver() end--不翻面
				room:setPlayerProperty(player,"hp",sgs.QVariant(4))
                room:setPlayerProperty(player,"maxhp",sgs.QVariant(4))
			player:gainAnExtraTurn()
			--room:setPlayerProperty(player,"general2",sgs.QVariant("shenshezhang"))--

			
			--player:gainMark("@waked", 1) --获得1枚“觉醒”标记
			end
			return		
        end,
		
		--can_trigger = function(self, target)
		--if target then
			--if target:isAlive() and target:hasSkill(self:objectName()) then
				--return target:getMark("baqi1Invoked") == 0
			--end
		--end
	--end, 
	
}


shenshezhang = sgs.General(extension, "shenshezhang", "god",4,true,true,true)
sha = sgs.CreateSlashSkill
{
	name = "sha",
-- 额外目标
	s_extra_func = function(self, from, to, slash) -- from：使用者；to：目标；slash：所用的杀。这三个参数除了from，其余都是可有可无的
		if from:hasSkill("sha") and slash --and slash:getSuit() == sgs.Card_Club  --注意必须先判断from是否有这个技能，否则谁都会发动的
			then return 998 -- 这张杀可以指定一个额外目标，注意加上原本的，一共两个目标
		end
	end,
-- 攻击范围
	s_range_func = function(self, from, to, slash)
		if from:hasSkill("sha") and slash --and slash:getSuit() == sgs.Card_Heart 
			then return -998 -- 注意这里因为是锁定攻击范围，所以前面要加个负号，如果不加，则累加攻击范围
		end
	end,
}

luayinshi1 = sgs.CreateTriggerSkill{
	name = "luayinshi1",
	events = {sgs.CardEffect,sgs.CardEffected},
	frequency = sgs.Skill_Compulsory,
	on_trigger = function(self,event,player,data)
		local room = player:getRoom()
		local smh = room:findPlayerBySkillName(self:objectName())
		if smh == nil then return false end
		
		if event == sgs.CardEffected then
			local effect = data:toCardEffect()
			local card = effect.card
			if not effect.from then return false end
			if player:getPhase()~=sgs.Player_NotActive then return false end
			if  card:inherits("BasicCard") then 
				local log=sgs.LogMessage()
				log.type = "#yinshi"
				log.from = smh
				log.arg = card:objectName()
				room:sendLog(log)
				room:playSkillEffect("luayinshi1")
				smh:drawCards(1)
				return true 
			end
			
				if  card:inherits("TrickCard") then 
				local log=sgs.LogMessage()
				log.type = "#yinshi"
				log.from = smh
				log.arg = card:objectName()
				room:sendLog(log)
				room:playSkillEffect("luayinshi1")
				smh:drawCards(1)
				return true 
			end
			
		end 
	end
}


--[坤仪] 限定技，出牌阶段，你可以将你的武将牌翻面，并对其他所有角色造成2点伤害。
thkunyicard=sgs.CreateSkillCard{
	name="thkunyicard",
	target_fixed = true,
	will_throw = true,
	on_use=function(self, room, source, targets)
		source:loseMark("@kunyi")
		--source:gainMark("@kunyiused")
		--source:turnOver()
		local players = room:getOtherPlayers(source)
		room:playSkillEffect("thkunyi")

		for _,player in sgs.qlist(players) do
			player:throwAllEquips()
		end
		for _,player in sgs.qlist(players) do
				player:throwAllCards()
				end
				for _,player in sgs.qlist(players) do
		local damage=sgs.DamageStruct()
			damage.damage=2
			damage.nature=sgs.DamageStruct_Thunder 
			--damage.chain=false 
			damage.from=source
			damage.to = player
		room:damage(damage)
		end
	end,
}

thkunyivs=sgs.CreateViewAsSkill{
	name="thkunyivs",
	n=0,
	view_as=function(self, cards)
		local KYcard=thkunyicard:clone()
		KYcard:setSkillName("thkunyi")
		return KYcard
	end,
	enabled_at_play=function(self, player)
		return player:getMark("@kunyi")>0
	end,
}

thkunyi=sgs.CreateTriggerSkill{
	name="thkunyi",
	frequency=sgs.Skill_Limited,
	events={sgs.GameStart},
	view_as_skill=thkunyivs,
	on_trigger=function(self,event,player,data)
		player:gainMark("@kunyi")
	end,
}



bashen = sgs.General(extension, "bashen", "god", "4",true,true)


--[[touhou_UndefinedAF=sgs.CreateProhibitSkill{ --鬼步
	name = "touhou_UndefinedAF",
	is_prohibited=function(self,from,to,card)
		if to and to:hasSkill(self:objectName()) and to:hasFlag("touhou_UndefinedAF_on") then
			if card and (card:isKindOf("AmazingGrace") or card:isKindOf("GodSalvation") or card:isKindOf("Peach") or card:isKindOf("Analeptic")) then return end
			if from and from:objectName() == to:objectName() then return end
			return true
		end
	end
}
touhou_UndefinedAF_flag = sgs.CreateTriggerSkill{
	name="#touhou_UndefinedAF_flag",
	frequency = sgs.Skill_Compulsory,
	events = {sgs.CardFinished},
	can_trigger=function(self,target)
		return true
	end,
	on_trigger=function(self,event,player,data)
		local room = player:getRoom()
		for _,ap in sgs.qlist(room:getOtherPlayers(player)) do
			if ap:hasSkill("touhou_UndefinedAF") then
				 x = math.random(1,2)
				if x == 1 then
					room:setPlayerFlag(ap,"touhou_UndefinedAF_on")
				else
					if ap:hasFlag("touhou_UndefinedAF_on") then
						room:setPlayerFlag(ap,"-touhou_UndefinedAF_on")
					end
				end
			end
		end
	end
}
]]
--[] 每当你受到伤害时，可以进行一次判定，若结果为草花或黑桃，回复相应体力。
thxiangang=sgs.CreateTriggerSkill{
	name="thxiangang",
	frequency=sgs.Skill_NotFrequent,
	events={sgs.Predamaged},
	priority=998,
	on_trigger=function(self,event,player,data)
		if not player:askForSkillInvoke(self:objectName()) then return end
		local room=player:getRoom()
		local damage = data:toDamage()
		local count = damage.damage
		local recover=sgs.RecoverStruct()
		recover.recover=1
		recover.who=player
		
		local judge=sgs.JudgeStruct()
			judge.pattern=sgs.QRegExp("(.*):(spade|club):(.*)")
			judge.good=true
			judge.reason=self:objectName()
			judge.who=player
		room:judge(judge)
		if judge:isGood() then
		room:setEmotion(player,"good")
		room:playSkillEffect("thxiangang")
		--room:recover(player,recover)
		else
			room:setEmotion(player,"bad")
			return
		end
		local log= sgs.LogMessage()
			log.type = "#thxiangang"
			log.from = player
		room:sendLog(log)
		return true
	end,
}

baozou=sgs.CreateTriggerSkill
{
        name="baozou",
        events={sgs.Damaged,sgs.Dying},
			priority=997,
        frequency=sgs.Skill_Wake,		
        on_trigger=function(self,event,player,data)
        local room=player:getRoom()	
		if event == sgs.Damaged then --受到伤害后
			local damage = data:toDamage()
			local count = damage.damage
			player:gainMark("@kuny", count)
		room:playSkillEffect("baozou",2)
--room:setPlayerMark(player, "baqi1Invoked", 1) --这个标记用于防止重复觉醒	
        local CanInvoke = false	
		end
		if event == sgs.Dying then
		if player:getMark("baozou")==1 then return end
			player:gainMark("@huixuan")
			if (room:askForSkillInvoke(player,self:objectName())) then 
			room:playSkillEffect("baozou",1)
			for _,pl in sgs.qlist(room:getAllPlayers()) do
						pl:invoke("animate", "lightbox:$baozou:3000")
						end
						room:getThread():delay(3000)
			room:transfigure(player,"baozoubashen",true,false)
			player:setMark("baozou",1)
			if not player:faceUp() then player:turnOver() end--不翻面
			    room:setPlayerProperty(player,"hp",sgs.QVariant(2))
                room:setPlayerProperty(player,"maxhp",sgs.QVariant(2))
			player:gainAnExtraTurn()
			--room:setPlayerProperty(player,"general2",sgs.QVariant("shenshezhang"))--
				
				
			
			--player:gainMark("@waked", 1) --获得1枚“觉醒”标记
			end
			end
		return end
		
	
}

baozoubashen = sgs.General(extension, "baozoubashen", "god", "2",true,true,true)
touhou_demacia=sgs.CreateTriggerSkill
{
	name = "touhou_demacia",
	events={sgs.Damage},
    frequency = sgs.Skill_Frequent,
	on_trigger=function(self,event,player,data)
		local room = player:getRoom()
		local damage = data:toDamage()
		--if damage.card and 
		if damage.card:inherits("Slash") and damage.to:isAlive() and player:getMark("@kuny")>0 and player:getRoom():askForSkillInvoke(player, self:objectName()) 
			 then
			 player:loseMark("@kuny", 1)
			damage.to:turnOver()
			room:playSkillEffect("touhou_demacia")
		end
	end
}--造成伤害可令其翻面


luakej=sgs.CreateMaxCardsSkill{
name="#luakej", 
extra_func=function(self,target) 
	if target:hasSkill(self:objectName()) then
		return target:getMark("@kuny")
	end
end
}

ChsJuehunDummyCard = sgs.CreateSkillCard{
	name = "ChsJuehunDummyCard", 
}
ChsJuehunCard = sgs.CreateSkillCard{
	name = "ChsJuehunCard", 
	target_fixed = false, 
	will_throw = true, 
	filter = function(self, targets, to_select) 
		return #targets == 0
	end,
	feasible = function(self, targets)
		return #targets == 1
	end,
	on_use = function(self, room, source, targets) 
		local victim = targets[1]
		local ids = victim:handCards()
		source:loseMark("@huixuan", 1) --弃掉1枚“八稚女”标记
		
		
		if  ids:isEmpty() then
		victim:throwAllCards()
		room:playSkillEffect("ChsJuehun")
		local damage = sgs.DamageStruct()
				damage.from = source
				damage.to = victim
				damage.damage = 8
					damage.nature=sgs.DamageStruct_Fire 
				room:damage(damage)
				
			
			
			
		elseif not ids:isEmpty() then
			--room:showAllCards(victim)
			
		
				victim:throwAllCards()
				room:playSkillEffect("ChsJuehun")
				--制造伤害
				local damage = sgs.DamageStruct()
					damage.damage=8
			damage.nature=sgs.DamageStruct_Fire 
			--damage.chain=false 
			damage.from=source
			damage.to = victim
		room:damage(damage)
		
			end
		
	end
}
ChsJuehun = sgs.CreateViewAsSkill{
	name = "ChsJuehun", 
	n = 0, 
	view_as = function(self, cards) 
		return ChsJuehunCard:clone()
	end, 
	enabled_at_play = function(self, player)
		return player:getMark("@huixuan") > 0
	end
}

biaoji=sgs.CreateTriggerSkill{
	name="#biaoji",
	frequency=sgs.Skill_Limited,
	events={sgs.GameStart},
	on_trigger=function(self,event,player,data)
		--player:gainMark("@kuny",8)
		player:gainMark("@huixuan",1)
	end,
}

double = sgs.CreateTriggerSkill{
name = "#double",
--frequency = sgs.Skill_Limited,
frequency=sgs.Skill_Compulsory,
events = {sgs.CardUsed},
on_trigger = function(self, event, player, data)
local room = player:getRoom()
local card = data:toCardUse().card
if card:inherits("Slash") then 
room:playSkillEffect("sha")
end
end,
}

anfu = sgs.CreateTriggerSkill{
name = "anfu",
--frequency = sgs.Skill_Limited,
frequency=sgs.Skill_Compulsory,
events = {sgs.CardUsed,sgs.SlashEffect},
on_trigger = function(self, event, player, data)
local room = player:getRoom()

if event == sgs.CardUsed then
local card = data:toCardUse().card
if card:inherits("Slash") then 
room:playSkillEffect(self:objectName())
end
end

if event == sgs.SlashEffect then
local effect = data:toSlashEffect()
if effect.nature ~= sgs.DamageStruct_Fire then
effect.nature = sgs.DamageStruct_Fire
data:setValue(effect)
end
end

end,		
}



	--jhangchunhua=sgs.General(extension, "jhangchunhua", "wei","3",false)
	
	shangshih=sgs.CreateTriggerSkill{
	name="shangshih",
	events={sgs.HpChanged,sgs.CardLostDone,sgs.CardGotDone,sgs.CardDrawnDone,sgs.PhaseChange},
	frequency = sgs.Skill_Frequent,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local lostHp = player:getLostHp()
		local maxHp = player:getMaxHP()
		local HandcardNum = player:getHandcardNum()
		
		if (player:getPhase() == Player_Discard) then
            return false end

	    if lostHp < 1 then
		    return false end
		
			if (HandcardNum < lostHp) then
			if room:askForSkillInvoke(player,self:objectName(),data) then 
			local log=sgs.LogMessage()
			log.type ="#InvokeSkill"
			room:playSkillEffect("shangshih")
			player:drawCards(lostHp-HandcardNum)
		    end
		    end
	        return false end,
}

jyuecing=sgs.CreateTriggerSkill{
name="jyuecing",
events={sgs.Predamage},
priority=-1,
frequency=sgs.Skill_Compulsory,
on_trigger=function(self,event,player,data)
local room=player:getRoom()

local damage=data:toDamage()
if(damage.from and damage.damage > 0)then
local log=sgs.LogMessage()
log.type = "#TriggerSkill"
log.from = player
log.arg = "jyuecing"
room:sendLog(log)
room:loseHp(damage.to,damage.damage)
room:playSkillEffect("jyuecing")
return true
end 
return false end,
}

--jhangchunhua:addSkill(jyuecing)
--jhangchunhua:addSkill(shangshih)

lujiaer:addSkill(LuaKuaiYi)
lujiaer:addSkill(Luakuaiyi)
lujiaer:addSkill(kaisabo)
lujiaer:addSkill(baqi)
shenshezhang:addSkill(double)
shenshezhang:addSkill(sha)
shenshezhang:addSkill(thkunyi)
bashen:addSkill(anfu)
--bashen:addSkill(bssha)
bashen:addSkill(thxiangang)
bashen:addSkill(touhou_demacia)
bashen:addSkill(baozou)

baozoubashen:addSkill(luakej)
baozoubashen:addSkill(thxiangang)
baozoubashen:addSkill(ChsJuehun)
baozoubashen:addSkill(biaoji)

--[[local skill=sgs.Sanguosha:getSkill("luayinshi1")
if not skill then
	local skillList=sgs.SkillList()
	skillList:append(luayinshi1)
	sgs.Sanguosha:addSkills(skillList)
end]]







--ol_hanba = sgs.General(extension, "ol_hanba", "qun", 4, false, false)

ol_fentian = sgs.CreateTriggerSkill{
	name = "ol_fentian",
	events = {sgs.PhaseChange},
	frequency = sgs.Skill_Compulsory,
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
	if player:getPhase() == sgs.Player_Finish and player:getHandcardNum() <= player:getHp() then
		    local tos = sgs.SPlayerList()
		for _,p in sgs.qlist(room:getAlivePlayers()) do
            if player:inMyAttackRange(p) and not p:isNude() then
			    tos:append(p)
			end
		end
			local target = room:askForPlayerChosen(player, tos, self:objectName())
		if target then
		    player:addToPile("burn", sgs.Sanguosha:getCard(room:askForCardChosen(player, target, "he", self:objectName())))
		end
	end
	end,
}

ol_fentianslash = sgs.CreateSlashSkill
{
	name = "#ol_fentianslash",
	s_range_func = function(self, from, to, slash)
		if from:hasSkill("ol_fentian") then
			return -(from:getPile("burn"):length()+1)
		end
	end,
}

ol_zhiri = sgs.CreateTriggerSkill
{
	name = "ol_zhiri",
	events = sgs.TurnStart,
	frequency = sgs.Skill_Wake,
	on_trigger = function(self, event, player, data)
	    local room = player:getRoom()
	if player:getPile("burn"):length() > 2 and player:getMark("@ol_zhiri") == 0 then
	    player:gainMark("@ol_zhiri")
		room:loseMaxHp(player)
		room:acquireSkill(player,"ol_xindan")
    end
    end
}

--ol_hanba:addSkill(ol_fentian)
--ol_hanba:addSkill(ol_fentianslash)
--ol_hanba:addSkill(ol_zhiri)

--ol_xindanholder = sgs.General(extension, "ol_xindanholder", "qun", 4, false, true, true)

ol_xindancard = sgs.CreateSkillCard
{
        name="ol_xindan",
        target_fixed = false,
        will_throw = false,
        filter = function(self, targets, to_select, player)
            return #targets < 1
        end,
		on_effect=function(self,effect)                
            local room = effect.from:getRoom()
			local burn = effect.from:getPile("burn")
            room:fillAG(burn,effect.from)
            local id_t = room:askForAG(effect.from,burn,true,self:objectName())
            room:throwCard(id_t)
			local id_tt = room:askForAG(effect.from,burn,true,self:objectName())
            room:throwCard(id_tt)
			effect.from:invoke("clearAG")
			room:loseHp(effect.to)
		end,
}

ol_xindan = sgs.CreateViewAsSkill
{
	name = "ol_xindan",
	n = 0,
	view_as = function(self, cards)
	if #cards == 0 then
		local acard = ol_xindancard:clone()		
		acard:setSkillName(self:objectName())
		return acard
		end
	end,
	enabled_at_play = function(self,player)
		return player:getPile("burn"):length() > 1 and not player:hasUsed("#ol_xindan")
	end,
}

--ol_xindanholder:addSkill(ol_xindan)

--ol_zhangbao = sgs.General(extension, "ol_zhangbao", "qun", 4, true, false)

ol_zhoufucard = sgs.CreateSkillCard
{
        name="ol_zhoufu",
        target_fixed = false,
        will_throw = false,
        filter = function(self, targets, to_select, player)
            return #targets < 1 and player:objectName() ~= to_select:objectName() and to_select:getPile("ol_zhoufu"):length() == 0
        end,
		on_effect=function(self,effect)                
            local room = effect.from:getRoom()
			effect.to:addToPile("ol_zhoufu", self, false)
		end,
}

ol_zhoufuvs = sgs.CreateViewAsSkill
{
	name = "ol_zhoufu",
	n = 1,
	view_filter = function(self, selected, to_select)
        return not to_select:isEquipped()
    end,
	view_as = function(self, cards)
	if #cards == 1 then
		local acard = ol_zhoufucard:clone()
		acard:addSubcard(cards[1])
		acard:setSkillName(self:objectName())
		return acard
		end
	end,
	enabled_at_play = function(self,player)
		return not player:hasUsed("#ol_zhoufu")
	end,
}

ol_zhoufu = sgs.CreateTriggerSkill
{
	name = "ol_zhoufu",
	events = {sgs.StartJudge,sgs.PhaseChange},
	priority = 1,
	view_as_skill = ol_zhoufuvs,
	can_trigger = function(self, player)
        return player:getPile("ol_zhoufu"):length() > 0
    end,
	on_trigger = function(self, event, player, data)
	    local room = player:getRoom()
	    local judge = data:toJudge()
		local selfplayer = room:findPlayerBySkillName(self:objectName())
	if event == sgs.StartJudge and player:getPile("ol_zhoufu"):length() > 0 then
	    judge.card = sgs.Sanguosha:getCard(player:getPile("ol_zhoufu"):at(0))
		for _,cd in sgs.qlist(player:getPile("ol_zhoufu")) do
		    room:throwCard(cd)
		end
		return true
	end
	if event == sgs.PhaseChange and player:getPhase() == sgs.Player_Finish and player:getPile("ol_zhoufu"):length() > 0 then
	    for _,cd in sgs.qlist(player:getPile("ol_zhoufu")) do
		    selfplayer:obtainCard(sgs.Sanguosha:getCard(cd))
		end
	end
	end
}

ol_yingbing = sgs.CreateTriggerSkill
{
	name = "ol_yingbing",
	events = {sgs.StartJudge,sgs.PhaseChange},
	frequency = sgs.Skill_NotFrequent,
	priority = 2,
	can_trigger = function(self, player)
        return player:getPile("ol_zhoufu"):length() > 0
    end,
	on_trigger = function(self, event, player, data)
	    local room = player:getRoom()
	    local judge = data:toJudge()
		local selfplayer = room:findPlayerBySkillName(self:objectName())
	if event == sgs.StartJudge and player:getPile("ol_zhoufu"):length() > 0 and room:askForSkillInvoke(selfplayer,self:objectName(),data) then
	    selfplayer:drawCards(2)
	end
	end
}

--ol_zhangbao:addSkill(ol_zhoufu)
--ol_zhangbao:addSkill(ol_yingbing)





wanjian = sgs.CreateViewAsSkill
{
name = "wanjian",
n = 1,

view_filter = function(self, selected, to_select)
return to_select:isRed()
end,

view_as = function(self, cards)
if #cards == 1 then
local card = cards[1]
local new_card =sgs.Sanguosha:cloneCard("archery_attack", card:getSuit(), card:getNumber())
new_card:addSubcard(card:getId())
new_card:setSkillName(self:objectName())
return new_card
end
end
}
--南蛮
nanman = sgs.CreateViewAsSkill
{
name = "nanman",
n = 1,

view_filter = function(self, selected, to_select)
return to_select:isBlack()
end,

view_as = function(self, cards)
if #cards == 1 then
local card = cards[1]
local new_card =sgs.Sanguosha:cloneCard("savage_assault", card:getSuit(), card:getNumber())
new_card:addSubcard(card:getId())
new_card:setSkillName(self:objectName())
return new_card
end
end
}




dighole=sgs.CreateTriggerSkill{
name="dighole",
frequency = sgs.Skill_NotFrequent,
events={sgs.Death},
can_trigger = function(self, player)
	return true
end,
on_trigger = function(self,event,player,data)	
	local room = player:getRoom()
	player:speak("I am Dead")
	local owner = room:findPlayerBySkillName(self:objectName())
	if not owner then return end
	--if owner:getMark("digged")>0 then return end
	if not room:askForSkillInvoke(owner, self:objectName(), data) then return end
	            local str=""
				local sklist={}
				local sk = skill:objectName()	
				for _,sk in sgs.qlist(player:getVisibleSkillList()) do
		--if skill:getLocation() == sgs.Skill_Right then
			--if skill:getFrequency() == sgs.Skill_Limited or skill:getFrequency() ~= sgs.Skill_Wake then
				
				--addLimitMarks(room,owner,sk,"dighole")
				--table.insert(sklist,sk:objectName())
				--table.insert(sk:objectName())
				room:acquireSkill(owner,sk) --添加技能				
			--end
		--end
	end

	return false
end
}


--暴力
baoliquan = sgs.CreateTriggerSkill{
	frequency = sgs.Skill_Compulsory,
	name = "baoliquan",
	events = {sgs.Predamage},
	
	on_trigger = function(self, event, player, data)
		local damage = data:toDamage()
		local room = player:getRoom()
		local log = sgs.LogMessage()
			log.from = player
			log.to:append(damage.to)
			log.arg = tonumber(damage.damage)
			log.arg2 = log.arg+1
			room:sendLog(log)	
			damage.damage = damage.damage+1
			data:setValue(damage)
	end,
}

doubledao = sgs.CreateSlashSkill
{
	name = "doubledao",
-- 额外目标
	s_extra_func = function(self, from, to, slash) -- from：使用者；to：目标；slash：所用的杀。这三个参数除了from，其余都是可有可无的
		if from:hasSkill("doubledao") --and slash:getSuit() == sgs.Card_Club 
		then --注意必须先判断from是否有这个技能，否则谁都会发动的
			return 998 -- 这张杀可以指定一个额外目标，注意加上原本的，一共两个目标
		end
	end,
-- 攻击范围
	s_range_func = function(self, from, to, slash)
		if from:hasSkill("doubledao") --and slash:getSuit() == sgs.Card_Heart
		then
			return -998 -- 注意这里因为是锁定攻击范围，所以前面要加个负号，如果不加，则在所有技能和武器指定的攻击范围里，取最大值
		end
	end,
}

dragonfist = sgs.CreateSlashSkill
{
	name = "dragonfist",
-- 额外出杀（返回还能再使用的杀的数量）
	s_residue_func = function(self, from)
		if from:hasSkill("dragonfist") then
            local init =  998 - from:getSlashCount() -- 还能再使用的杀的数量，若已经使用了1张杀，则init=1-1=0，不能使用杀了
            return init + from:getMark("Fist") -- 如果获得了1个Fist标记，则在可用杀的基础上+1，本例中为0+1=1，有多少Fist标记可再使用多少张杀
			-- 返回值为998，表示使用杀无次数限制（如连弩、咆哮）
			-- 返回值为-998，表示不能再使用杀（如天义拼点失败）
        else
            return 0
		end
	end,
}

dragonfistt=sgs.CreateTriggerSkill{
	name="#dragonfist",
	events={sgs.Damage, sgs.PhaseChange},
	priority = -1,

	on_trigger=function(self,event,player,data)
		local room = player:getRoom()
		if event == sgs.PhaseChange then
			room:setPlayerMark(player, "Fist", 0) -- 阶段转换时清除标记
		else
			local damage = data:toDamage()
			if damage.card:isKindOf("Slash") then
				room:setPlayerMark(player, "Fist", player:getMark("Fist")+1)
			end
		end
		return false
	end
}


------------------------------------------------------------------

---------------------------------------------------------------
--lrh=sgs.General(extension, "lrh", "god", 5,true)--增加武将
--lrh:addSkill(wanjian)
--lrh:addSkill(nanman)

--lrh:addSkill(doubledao)
--lrh:addSkill(dragonfist)
--lrh:addSkill(dragonfistt)



--lrh:addSkill(dighole)


	
	
	
	----------------------------------------------------------------------------------------



LuaGuimou = sgs.CreateViewAsSkill{
	name = "LuaGuimou", 
	n = 1, 
	view_filter = function(self, selected, to_select)
		return true
	end, 
	
	view_as = function(self, cards)
		if #cards == 1 then
			local card = cards[1]
			local suit = card:getSuit()
			local point = card:getNumber()
			local id = card:getId()
			if suit == sgs.Card_Heart then
				viewAsCard = sgs.Sanguosha:cloneCard("fire_attack", suit, point)
			elseif suit == sgs.Card_Diamond then
				viewAsCard = sgs.Sanguosha:cloneCard("archery_attack", suit, point)
			elseif suit == sgs.Card_Spade then
				viewAsCard = sgs.Sanguosha:cloneCard("duel", suit, point)
			elseif suit == sgs.Card_Club then
				viewAsCard = sgs.Sanguosha:cloneCard("savage_assault", suit, point)
			end
			viewAsCard:setSkillName(self:objectName())
			viewAsCard:addSubcard(id)
			return viewAsCard
		end
	end,
}
--克己
luakeji=sgs.CreateTriggerSkill{		
	name      = "luakeji",
	events=sgs.PhaseChange, 
	frequency=sgs.Skill_Compulsory,
	on_trigger=function(self,event,player,data)	
		local room=player:getRoom()	
			if (event==sgs.PhaseChange) and (player:getPhase()==sgs.Player_Discard) then							
				local x = player:getHp()
				local y = player:getHandcardNum()				
				if y-x>999 then room:askForDiscard(player,"luakeji",y-x-999,false,false) 				
				return true
				else return true
				end			
			end		
	end
}




------------------------------------------------------------------
tDgongmou = sgs.CreateTriggerSkill{
name="tDgongmou",--tDgongmou$
events = {sgs.EventPhaseStart},
can_trigger = function(self, player)
if player and not player:hasSkill(self:objectName()) then--主公技是Lord
return (player:getPhase()==sgs.Player_Play) end--and player:getKingdom()=="qun"
end,
on_trigger=function(self,event,player,data)
local room=player:getRoom()
local splayer=room:findPlayerBySkillName(self:objectName())
if splayer==nil or not splayer:hasSkill(self:objectName()) then return end
if not player:askForSkillInvoke(self:objectName()) then return end
room:showAllCards(player, splayer)
end 
}
---------------------------------------------------------------

 shayi_card = sgs.CreateSkillCard
{   name = "shayi_card",	
	filter = function(self,targets,to_select,player)
		if  #targets>1 then return false			
		--else return to_select:getSeat()~=player:getSeat() and not to_select:isAllNude() end
		else return not to_select:isAllNude() end
	
	end,
	on_use=function(self,room,player,targets)
	if #targets==1 then 
	--room:obtainCard(player,room:askForCardChosen(player,targets[1],"h","shayi"))--前面加对象是获得
		room:throwCard(room:askForCardChosen(player,targets[1],"hej","shayi"),targets[1])--后面加,targets[?]是弃置
	if targets[1]:isAllNude() then return end 
	--room:obtainCard(player,room:askForCardChosen(player,targets[1],"h","shayi"))
	    room:throwCard(room:askForCardChosen(player,targets[1],"hej","shayi"),targets[1])
	elseif #targets==2 then 
	for var=1,2,1 do
	--room:obtainCard(player,room:askForCardChosen(player,targets[var],"h","shayi"))
		room:throwCard(room:askForCardChosen(player,targets[var],"hej","shayi"),targets[var])
	end
	end
end,
}

shayiVS=sgs.CreateViewAsSkill{
	name="shayiVS",
	view_as = function(self, cards)
        return shayi_card:clone()
	end,
	enabled_at_play=function(self,player,pattern)
		return false 
	end,
	enabled_at_response=function(self,player,pattern)
		return pattern=="@@shayi"
	end,
}

shayi = sgs.CreateTriggerSkill
{
	name = "shayi",
	events={sgs.PhaseChange},
	view_as_skill=shayiVS,
	frequency=sgs.Skill_NotFrequent,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if player:getPhase()~=sgs.Player_Draw then return end
		if not room:askForSkillInvoke(player,"shayi") then return end
		if room:askForUseCard(player,"@@shayi","askforshayi") then return true end
	end,
}

chuozhe = sgs.CreateTriggerSkill
{
	name = "#chuozhe",
	events={sgs.Damaged},--sgs.PhaseChange,
	--frequency=sgs.Skill_NotFrequent,
	frequency = sgs.Skill_Compulsory,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		--[[if event==sgs.PhaseChange and player:getPhase()==sgs.Player_Start then 
		if player:getPile("zhi2"):isEmpty() then return end
		for var=1,player:getPile("zhi2"):length(),1 do		
		room:obtainCard(player,player:getPile("zhi2"):first())
		end
		end]]
		if player:getPile("zhi2"):length()==5 then return end
		if event==sgs.Damaged then 
			--if not room:askForSkillInvoke(player,"chuozhe") then return end
			player:addToPile("zhi2",room:drawCard()) end
	end,
}

zhitr=sgs.CreateDistanceSkill{
 name = "#zhitr",
 correct_func=function(self,from,to)
  if to:hasSkill("#chuozhe") and not to:getPile("zhi2"):isEmpty() then
   return to:getPile("zhi2"):length()
  end
 end,
}

cuozhecard=sgs.CreateSkillCard{
	name="cuozhecard",
	target_fixed=true,
	will_throw=false,
	on_use=function(self, room, source, targets)
		local card_ids=source:getPile("zhi2")
		room:fillAG(card_ids,source)
		local card_id=room:askForAG(source,card_ids,true,self:objectName())
		source:invoke("clearAG")
		if card_id==-1 then return end
		source:obtainCard(sgs.Sanguosha:getCard(card_id))
		source:addToPile("zhi2",self:getEffectiveId(),true)
		card_ids=source:getPile("zhi2")
		
		return 
	end,
}

cuozhe=sgs.CreateViewAsSkill{
	name="cuozhe",
	n=1,
	view_filter=function(self, selected, to_select)
		--return not to_select:isEquipped()
		return true
	end,
	view_as=function(self, cards)
		if #cards~=1 then return end
		local card=cuozhecard:clone()
		card:setSkillName(self:objectName())
		card:addSubcard(cards[1])
		return card
	end,
	enabled_at_play=function(self, player)
		return not player:getPile("zhi2"):isEmpty()
	end,
}

bodongCard=sgs.CreateSkillCard{
	name="bodongCard",
	target_fixed=true,
	will_throw=false,
	on_use=function(self, room, source, targets)
		local card_ids=source:getPile("keyin")
		room:fillAG(card_ids,source)
		local card_id=room:askForAG(source,card_ids,true,self:objectName())
		source:invoke("clearAG")
		if card_id==-1 then return end
		source:obtainCard(sgs.Sanguosha:getCard(card_id))
		source:addToPile("keyin",self:getEffectiveId(),true)
		card_ids=source:getPile("keyin")
		
		return 
	end,
}

bodong=sgs.CreateViewAsSkill{
	name="bodong",
	n=1,
	view_filter=function(self, selected, to_select)
		--return not to_select:isEquipped()
		return true
	end,
	view_as=function(self, cards)
		if #cards~=1 then return end
		local card=bodongCard:clone()
		card:setSkillName(self:objectName())
		card:addSubcard(cards[1])
		return card
	end,
	enabled_at_play=function(self, player)
		return not player:getPile("keyin"):isEmpty()
	end,
}
bdky = sgs.CreateTriggerSkill
{
	name = "#bdky",
	events = {sgs.CardResponsed,sgs.CardUsed},
	frequency = sgs.Skill_Compulsory,
	on_trigger = function(self, event,player, data)
		local room = player:getRoom()
		if player:getPile("keyin"):length()==5 then return end
		local card
		if event==sgs.CardUsed then 
		local use=data:toCardUse()
		if use.card:inherits("BasicCard") then card=use.card end
		elseif data:toCard():inherits("BasicCard") then card=data:toCard() end
		if card then 
		player:addToPile("keyin",room:drawCard())
		
		end
		end
}

keyintr=sgs.CreateDistanceSkill{
 name = "#keyintr",
 correct_func=function(self,from,to)
  if from:hasSkill("#bdky") and not from:getPile("keyin"):isEmpty() then
   return - from:getPile("keyin"):length()
  end
 end,
}

bodongyan = sgs.CreateTriggerSkill
{
	name = "bodongyan",
	events = {sgs.PhaseChange},
	frequency = sgs.Skill_Wake,
	priority=996,
	on_trigger = function(self, event,player, data)
		local room = player:getRoom()
		if player:getMark("bodongyan")==1 then return end
		if player:getPhase()~=sgs.Player_Start then return end
		if player:getPile("keyin"):length()>=5 then
for _,pl in sgs.qlist(room:getAllPlayers()) do
						pl:invoke("animate", "lightbox:$xiazijuexing:3000")
						end		
						room:getThread():delay(3000)
		room:loseMaxHp(player,1)
		player:setMark("bodongyan",1)
		room:acquireSkill(player, "budong")
		end
		end
}

budong_card = sgs.CreateSkillCard
{   name = "budong_card",	
	will_throw=true,
	filter = function(self,targets,to_select,player)
		return #targets<1  and not to_select:isAllNude()
	end,
	on_use=function(self,room, player, targets) 
	if #targets==0 then return end
		local card_id
		local dao = player:getPile("keyin")
			if dao:length() == 1 then
			card_id = dao:first()
		else
			room:fillAG(dao,player)
			card_id = room:askForAG(player,dao,false,"budong")
			player:invoke("clearAG")
			end
		if card_id ==-1 then return end
		room:throwCard(card_id)
		room:obtainCard(player,room:askForCardChosen(player,targets[1],"hej","budong"))
	end,
}

budong=sgs.CreateViewAsSkill{
	name="budong",
	view_as = function(self, cards)
		return budong_card:clone()
	end,
	enabled_at_play=function(self,player,pattern)
		return not player:getPile("keyin"):isEmpty()
	end,
}



local skills = sgs.SkillList()
if not sgs.Sanguosha:getSkill("budong") then skills:append(budong) end
sgs.Sanguosha:addSkills(skills)

axiuluo=sgs.General(extension, "axiuluo", "god", "4",true,true)
axiuluo:addSkill(shayi)
axiuluo:addSkill(cuozhe)
axiuluo:addSkill(bodong)



axiuluo:addSkill(bdky)
axiuluo:addSkill(chuozhe)
axiuluo:addSkill(zhitr)
axiuluo:addSkill(keyintr)
axiuluo:addSkill(bodongyan)



fanweisi = sgs.CreateSlashSkill
{
	name = "#fanweisi",
-- 额外目标
	s_extra_func = function(self, from, to, slash) -- from：使用者；to：目标；slash：所用的杀。这三个参数除了from，其余都是可有可无的
		if from:hasSkill("#fanweisi") and slash and from:getWeapon() and from:getWeapon():getRange()==4 then --注意必须先判断from是否有这个技能，否则谁都会发动的
			return 2 -- 这张杀可以指定2个额外目标，注意加上原本的，一共3个目标
		end
	end,

}

--[[dnfjingtongcard=sgs.CreateSkillCard{
	name="dnfjingtongcard",
	target_fixed=false,
	filter = function(self, targets, to_select, player)
		return #targets<2
	end,
	
	on_use = function(self, room, source, targets)
		card=sgs.Sanguosha:getCard(self:getSubcards():first())
		local newcard=sgs.Sanguosha:cloneCard("iron_chain",card:getSuit(),card:getNumber())
		newcard:addSubcard(card)
		newcard:setSkillName("dnfjingtong")
		local use=sgs.CardUseStruct()
        	use.card = newcard
        	use.from = source
			for x=1,#targets,1 do
        		use.to:append(targets[x])
			end
		room:useCard(use, true)
	end,
}]]

dnfjingtongvs=sgs.CreateViewAsSkill{
	name="dnfjingtongvs",
	n=1,
	
	view_filter = function(self, selected, to_select)
		if sgs.Self:getWeapon() and sgs.Self:getWeapon():getRange()==1 then
			return to_select:isRed() and (sgs.Self:canSlashWithoutCrossbow() or not to_select:inherits("Crossbow"))
	end
	end,

	view_as = function(self, cards)
		if #cards~=1 then return end 
		local JTcard
		if sgs.Self:getWeapon() and sgs.Self:getWeapon():getRange()==1 then
			JTcard=sgs.Sanguosha:cloneCard("slash",cards[1]:getSuit(),cards[1]:getNumber())
		else
			JTcard=dnfjingtongcard:clone()
		end
		JTcard:addSubcard(cards[1])
		JTcard:setSkillName("dnfjingtong")
		return JTcard
	end,

	enabled_at_play=function(self, player)
		return (player:getWeapon() and player:getWeapon():getRange()==1 and (player:canSlashWithoutCrossbow() or (player:getWeapon() and player:getWeapon():className() == "Crossbow"))) --or player:getAttackRange()==4
	end,
	
	enabled_at_response=function(self,player,pattern) 
		return pattern=="slash" and player:getWeapon() and player:getWeapon():getRange()==1 
	end,
}

dnfjingtong=sgs.CreateTriggerSkill{
	name="dnfjingtong",
	frequency = sgs.Skill_NotFrequent,
	priority = 100,
	events={sgs.Damage,sgs.SlashProceed,sgs.SlashEffect},
	view_as_skill=dnfjingtongvs,
	
	on_trigger=function(self,event,player,data)
		local room = player:getRoom()		
		local effect		
		if(event == sgs.SlashProceed) then
			effect = data:toSlashEffect()
			if not effect.from:hasSkill(self:objectName()) then return false end 
			if effect.from:getWeapon():getRange()==5 then
						if not room:askForSkillInvoke(effect.from,"dnfjingtong",data) then return end
				--local log= sgs.LogMessage()
					--log.type = "#dnfjingtong"
					--log.from = effect.from
					--log.to:append(effect.to)
				--room:sendLog(log)
				--local firstjink, secondjink = nil, nil
				--firstjink = room:askForCard(effect.to, "jink", "@dnfjingtong1", data)
				--if firstjink ~= nil then
					--secondjink = room:askForCard(effect.to, "jink", "@dnfjingtong1"..slasher, data)
				--end
				--local jink = nil
				--if (firstjink ~= nil and secondjink ~= nil) then
					--local jink = sgs.Sanguosha:cloneCard("DummyCard", 0, 0)
					--jink:addSubcard(firstjink)
					--jink:addSubcard(secondjink)
					room:slashResult(effect, nil)
					return true
				--end 
			end
			return
		elseif event == sgs.SlashEffect then
			effect = data:toSlashEffect()
			if not effect.from:hasSkill(self:objectName()) then return false end 
			if effect.from:getWeapon():getRange()~=2 then return end
			if effect.to:isAllNude() then return end
			if not room:askForSkillInvoke(effect.from,"dnfjingtong",data) then return end
			room:obtainCard(player,room:askForCardChosen(effect.from,effect.to,"hej",self:objectName()))
			--local card_id = room:askForCardChosen(effect.from, effect.to, "hej", self:objectName())
			--room:throwCard(card_id)
			return
		elseif event == sgs.Damage then
			local damage = data:toDamage()
			if not damage.from:hasSkill(self:objectName()) then return false end 
			--if damage.from:getAttackRange()~=3 then return end
			 if damage.from:getWeapon():getRange()~=3 then return end
			if not damage.to:isAlive() then return end
			if (not damage.card)or(not damage.card:inherits("Slash")) then return end 
			--if damage.to:isNude() then return end
			if not room:askForSkillInvoke(damage.from,"dnfjingtong",data) then return end
			--local card_idd = room:askForCardChosen(damage.from, damage.to, "hej", self:objectName())
			--damage.from:obtainCard(sgs.Sanguosha:getCard(card_idd))
			damage.to:turnOver()
		end

	end,
	
	can_trigger=function(self,target)
		return true
	end,
}

--[[jianji_card = sgs.CreateSkillCard
{   name = "jianji_card",
	target_fixed = true,
    on_use = function(self, room,player, targets)
		local card=sgs.Sanguosha:getCard(player:getPile("jianpile2"):first())
		if player:getWeapon() then player:addToPile("jianpile2",player:getWeapon()) end
		room:moveCardTo(card,player, sgs.Player_Equip,true)
	end 
}]]
jianji_card=sgs.CreateSkillCard{
	name="jianji_card",
	target_fixed=true,
	will_throw=false,
	on_use=function(self, room, source, targets)
		local card_ids=source:getPile("jianpile2")
		room:fillAG(card_ids,source)
		local card_id=room:askForAG(source,card_ids,true,self:objectName())
		source:invoke("clearAG")
		if card_id==-1 then return end
		source:obtainCard(sgs.Sanguosha:getCard(card_id))
		----
		--local move = data:toCardMove()		
		--local card = sgs.Sanguosha:getCard(move.card_id)
		--if  move.from_place ~= sgs.Player_Equip then
		----
		--source:addToPile("jianpile2",self:getEffectiveId(),true)
		card_ids=source:getPile("jianpile2")
		--end
		
		return 
	end,
}

--[[jianjivs = sgs.CreateViewAsSkill
{
	name = "jianjivs",
	view_as = function(self ,cards)
		return jianji_card:clone()
	end,	
	enabled_at_play = function(self,player)
		return  not player:getPile("jianpile2"):isEmpty() --and not player:getWeapon()
	end,	
}]]
jianjivs=sgs.CreateViewAsSkill{
	name="jianjivs",
	n=1,
	view_filter=function(self, selected, to_select)
		return  to_select:inherits("Weapon")
		--return true
	end,
	view_as=function(self, cards)
		--if #cards~=1 then return end
		local card=jianji_card:clone()
		card:setSkillName(self:objectName())
		card:addSubcard(cards[1])
		return card
	end,
	enabled_at_play=function(self, player)
		return not player:getPile("jianpile2"):isEmpty()
	end,
}

jianji=sgs.CreateTriggerSkill{
	name="jianji",
	events={sgs.CardLost},
	frequency = sgs.Skill_NotFrequent,
	view_as_skill=jianjivs,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local selfplayer=room:findPlayerBySkillName(self:objectName())
		local move = data:toCardMove()		
		local card = sgs.Sanguosha:getCard(move.card_id)
		
		if player:getPhase()~=sgs.Player_NotActive then--回合内
		if card:inherits("Weapon") and  move.from_place == sgs.Player_Equip and player:getPile("jianpile2"):length()<3 then--and player:getPile("jianpile2"):isEmpty() then 
		if (room:askForSkillInvoke(selfplayer,self:objectName())~=true) then return false end
		player:addToPile("jianpile2",card)
		--room:moveCardTo(card,player,sgs.Player_Hand,true)
		end
		end
		
		if player:getPhase()==sgs.Player_NotActive then--回合外
		if card:inherits("Weapon") and  move.from_place == sgs.Player_Equip and player:getPile("jianpile2"):length()<3 then--and player:getPile("jianpile2"):isEmpty() then 
		if (player:isKongcheng() and player:getEquips():length()==0) then return false end--手牌和装备为0
		if (room:askForSkillInvoke(selfplayer,self:objectName())~=true) then return false end
		local card2=room:askForCard(player,"..","rengpai~~")
	    if card2==nil then return false end
	    room:throwCard(card2)
		player:addToPile("jianpile2",card)
		--room:moveCardTo(card,player,sgs.Player_Hand,true)
		end
		end
	end,
}

jianhunjuexing=sgs.CreateTriggerSkill
{
        name="jianhunjuexing",
        events={sgs.Dying},
			priority=995,
        frequency=sgs.Skill_Wake,		
        on_trigger=function(self,event,player,data)
		--player:gainMark("@flamee")
        local room=player:getRoom()	
		--room:playSkillEffect("baqi",2)
--room:setPlayerMark(player, "baqi1Invoked", 1) --这个标记用于防止重复觉醒		
		
		local CanInvoke = false
		
			
			if (room:askForSkillInvoke(player,self:objectName())) then 
			--room:playSkillEffect("baqi",1)
			for _,pl in sgs.qlist(room:getAllPlayers()) do
						pl:invoke("animate", "lightbox:$jianhunjuexing:3000")
						end
						room:getThread():delay(3000)
			room:transfigure(player,"JHBS",true,false)
			--player:gainAnExtraTurn()
				room:setPlayerProperty(player,"hp",sgs.QVariant(4))
                room:setPlayerProperty(player,"maxhp",sgs.QVariant(4))
			
			
			end
			return		
        end,
	
	
}

wanjianguizong = sgs.CreateTriggerSkill
{
	name = "wanjianguizong",
	events = {sgs.PhaseChange},
	priority=994,
	frequency = sgs.Skill_Wake,
	on_trigger = function(self, event,player, data)
		local room = player:getRoom()
		if player:getMark("wanjianguizong")==1 then return end
		if player:getPhase()~=sgs.Player_Start then return end
		if player:getPile("jianpile2"):length()>=3 then
for _,pl in sgs.qlist(room:getAllPlayers()) do
						pl:invoke("animate", "lightbox:$jianhunjuexing:3000")
						end		
						room:getThread():delay(3000)
		room:loseMaxHp(player,1)
		player:setMark("wanjianguizong",1)
		room:acquireSkill(player, "baofengshi")
		end
		end
}

baofengshi = sgs.CreateTriggerSkill
{
	name = "baofengshi",
	events = sgs.Predamage,
	priority = 5,
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		local damage = data:toDamage()
		if not damage.from:inMyAttackRange(damage.to) then return false end
		if player:askForSkillInvoke(self:objectName()) then
		    player:drawCards(1)
			local tos = sgs.SPlayerList()
			for _,p in sgs.qlist(room:getOtherPlayers(player)) do
				if player:canSlash(p) then
					tos:append(p)
				end
			end
			if not tos:isEmpty() then
			local choise = room:askForChoice(player,self:objectName(), "mo+bumo")
			if choise == "mo" then
				local to = room:askForPlayerChosen(player, tos, self:objectName())
				 --room:playSkillEffect("baofengshi")
				to:drawCards(1)
			end
			if choise == "bumo" then
			end
			end
			return true  --防止伤害
		else
			return false
		end
	end,
}


local skills = sgs.SkillList()
if not sgs.Sanguosha:getSkill("baofengshi") then skills:append(baofengshi) end
sgs.Sanguosha:addSkills(skills)

dnfJH = sgs.General(extension, "dnfJH", "god",4,true,true)
dnfJH:addSkill(jianji) 
dnfJH:addSkill(dnfjingtong)
dnfJH:addSkill(fanweisi)
dnfJH:addSkill(wanjianguizong)



--dnfJH:addSkill(jianhunjuexing)

--JHBS = sgs.General(extension, "JHBS", "god",4,true,true,true)


--JHBS:addSkill()


baozoubuff = sgs.CreateTriggerSkill
{
	name = "baozoubuff",
	frequency = sgs.Skill_Compulsory,
	events = {sgs.Predamage,sgs.Predamaged},
	can_trigger = function (self, player)
		return player:hasSkill("baozoubuff")
	end,

	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		local hx = room:findPlayerBySkillName("baozoubuff")
		if hx == nil then return false end
		if hx:getMark("@baozoubiaoji") < 1 then return false end
		--if hx:getPhase()==sgs.Player_NotActive then return false end
		local damage = data:toDamage()
		local card = damage.card
		if card == nil then return false end
		if card:inherits("Slash") or card:inherits("Duel") then--and card:isRed() then
			--if damage.from:objectName() == hx:objectName() then
				--room:playSkillEffect("baozoubuff", 1)
			--elseif damage.to:objectName() == hx:objectName() then
				--room:playSkillEffect("baozoubuff", 2)
			--end
			hx:loseMark("@baozoubiaoji")
			--local log = sgs.LogMessage()
			--log.type = "#baozoubuff"
			--log.from = hx
			--room:sendLog(log)
				
			damage.damage = damage.damage + 1
			data:setValue(damage)
		end
	
		return false
	end,
}

huodebiaoji=sgs.CreateTriggerSkill{
	name="#huodebiaoji",
	events={sgs.TurnStart,sgs.GameStart},
	frequency = sgs.Skill_Compulsory,
	priority = 10,
	on_trigger=function(self,event,player,data)
	local room = player:getRoom()
		room:setPlayerMark(player, "@baozoubiaoji", 1)
		room:setPlayerMark(player, "@shixuebiaoji", 1)
	end,
}

shiqubaozoubiaoji=sgs.CreateTriggerSkill{
	name="#shiqubaozoubiaoji",
	events={sgs.PhaseChange},
	frequency = sgs.Skill_Compulsory,
	priority = 10,
	on_trigger=function(self,event,player,data)
	if  player:getPhase()==sgs.Player_Finish then
	if player:getMark("@baozoubiaoji") > 0 then 
		player:loseMark("@baozoubiaoji",1)
    end		
	end
	end,
}

shiqushixuebiaoji=sgs.CreateTriggerSkill{
	name="#shiqushixuebiaoji",
	events={sgs.PhaseChange},
	frequency = sgs.Skill_Compulsory,
	priority = 10,
	on_trigger=function(self,event,player,data)
	if  player:getPhase()==sgs.Player_Finish then
	if player:getMark("@shixuebiaoji") > 0 then 
		player:loseMark("@shixuebiaoji",1)
    end		
	end
	end,
}



baozouxiaoguo = sgs.CreateSlashSkill
{
	name = "#baozouxiaoguo",
-- 额外目标
	--s_extra_func = function(self, from, to, slash) -- from：使用者；to：目标；slash：所用的杀。这三个参数除了from，其余都是可有可无的
		--if from:hasSkill("doubleda") and slash and slash:isRed() then --注意必须先判断from是否有这个技能，否则谁都会发动的
			--return 1 -- 这张杀可以指定一个额外目标，注意加上原本的，一共两个目标
		--end
	--end,
-- 攻击范围
	s_range_func = function(self, from, to, slash)
	if from:getPhase()==sgs.Player_NotActive then return false end
		if from:hasSkill("#baozouxiaoguo") and slash then--and slash:isRed() then
			return -998 -- 注意这里因为是锁定攻击范围，所以前面要加个负号，如果不加，则累加攻击范围
		end
	end,
}


shixue = sgs.CreateTriggerSkill
{
	name = "shixue",
	frequency = sgs.Skill_NotFrequency,
	events = {sgs.Predamage},
	can_trigger = function (self, player)
		return player:hasSkill("shixue")
	end,
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		local hx = room:findPlayerBySkillName("shixue")
		if hx == nil then return false end
		if hx:getMark("@shixuebiaoji") < 1 then return false end
		--if hx:getPhase()==sgs.Player_NotActive then return false end
		local damage = data:toDamage()
		--local card = damage.card
		--if card == nil then return false end
		if not room:askForSkillInvoke(player,self:objectName()) then return false end--and card:isRed() then
			--if damage.from:objectName() == hx:objectName() then
				--room:playSkillEffect("baozoubuff", 1)
			--elseif damage.to:objectName() == hx:objectName() then
				--room:playSkillEffect("baozoubuff", 2)
			--end
			hx:loseMark("@shixuebiaoji")
			room:loseHp(hx,2)
			--local log = sgs.LogMessage()
			--log.type = "#shixue"
			--log.from = hx
			--room:sendLog(log)
				
			damage.damage = damage.damage + 1
			data:setValue(damage)
		
		
		return false
	end,
}

siwangkangju = sgs.CreateTriggerSkill
{
	name = "siwangkangju",
	frequency = sgs.Skill_Compulsory,
	events = {sgs.Damage,sgs.DamageDone},
	can_trigger = function (self, target)
		return target
	end,
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		local damage = data:toDamage()
		if damage.from and damage.from:hasSkill("siwangkangju") and damage.from:isAlive() then
		local x=damage.from:getHp()
		if x==2 then
		local recover = sgs.RecoverStruct()
				recover.who = damage.from
				recover.recover = 1
				room:recover(damage.from,recover)
				end
				
				if x==1 then
		local recover = sgs.RecoverStruct()
				recover.who = damage.from
				recover.recover = 2
				room:recover(damage.from,recover)
				end
		end
		return false
	end,
}

hongyanjuexing=sgs.CreateTriggerSkill
{
        name="hongyanjuexing",
        events={sgs.Dying},
			priority=995,
        frequency=sgs.Skill_Wake,		
        on_trigger=function(self,event,player,data)
		--player:gainMark("@flamee")
        local room=player:getRoom()	
		if player:getMark("hongyanjuexing")==1 then return end
		--room:playSkillEffect("baqi",2)
--room:setPlayerMark(player, "baqi1Invoked", 1) --这个标记用于防止重复觉醒		
		
		local CanInvoke = false
		
			
			if (room:askForSkillInvoke(player,self:objectName())) then 
			--room:playSkillEffect("baqi",1)
			for _,pl in sgs.qlist(room:getAllPlayers()) do
						pl:invoke("animate", "lightbox:$hongyanjuexing:3000")
						end
						room:getThread():delay(3000)
			room:transfigure(player,"HYBS",true,false)
			--player:gainAnExtraTurn()
				room:setPlayerProperty(player,"hp",sgs.QVariant(4))
                room:setPlayerProperty(player,"maxhp",sgs.QVariant(4))
			player:setMark("hongyanjuexing",1)
			
			end
			return		
        end,
	
	
}
dnfHY = sgs.General(extension, "dnfHY", "god",4,true,true) 

dnfHY:addSkill(baozoubuff)
--dnfHY:addSkill(baozouxiaoguo)
dnfHY:addSkill(shixue)
dnfHY:addSkill(huodebiaoji)
dnfHY:addSkill(siwangkangju)
dnfHY:addSkill(hongyanjuexing)

HYBS = sgs.General(extension, "HYBS", "god",4,true,true,true)

shiqujuexingbiaoji=sgs.CreateTriggerSkill{
	name="#shiqujuexingbiaoji",
	events={sgs.PhaseChange},
	frequency = sgs.Skill_Compulsory,
	on_trigger=function(self,event,player,data)
	if  player:getPhase()==sgs.Player_Finish then
	if player:getMark("@flamee") > 0 then 
		player:loseMark("@flamee",1)
    end		
	end
	end,
}


 xuemo = sgs.CreateTriggerSkill
{
	name = "xuemo",
	frequency = sgs.Skill_Compulsory,
	events = {sgs.Damaged, sgs.PreDamagedDone},
	can_trigger = function(self, player)
		return not player:hasSkill("xuemo")
	end,
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		local ziji = room:findPlayerBySkillName("xuemo")
		if ziji == nil then return false end
		if ziji:getPhase()~=sgs.Player_NotActive then return false end
		local damage = data:toDamage()
		local source = damage.from 
		local target = damage.to
		if target~=ziji then 
		local recover = sgs.RecoverStruct()
				recover.who = ziji
				recover.recover = 1
				room:recover(ziji,recover)
		end
	end,
}

Fire = function(player,target,damagePoint)
	local damage = sgs.DamageStruct()
	damage.from = player
	damage.to = target
	damage.damage = damagePoint
	damage.nature = sgs.DamageStruct_Fire
	player:getRoom():damage(damage)
end
LuaYeyanCard = sgs.CreateSkillCard{
	name = "LuaYeyanCard",
	will_throw = true,
	
	filter = function(self, targets, to_select, player)
		if self:subcardsLength() == 0 then return #targets < 2 end
		if self:subcardsLength() == 0 and #targets == 1 then return to_select:objectName() ~= (targets[1]:objectName() and player:objectName())
		else if #targets == 0 then return to_select:objectName() ~= player:objectName()
		end
	end
end,
	on_effect = function(self,effect)
		Fire(effect.from, effect.to, 1)
end,
	on_use = function(self, room, source, targets)
		--local subcards_length = self:subcardsLength()
		--if subcards_length == 0 then
			--source:loseMark("@flame")
        --for _,target in ipairs(targets) do
           -- room:cardEffect(self, source, target)
	--end
		if #targets == 2 then
			--source:loseMark("@flamee")
		
		
			Fire(source, targets[1], 1)
			Fire(source, targets[2], 1)
	room:loseHp(source,2)
			
			--room:setPlayerFlag(player,"yeyan_used")
			end
		if #targets == 1 then
			--source:loseMark("@flamee")
			
		local choice = room:askForChoice(source, self:objectName(), "aaa+bbb")
		if choice == "aaa" then
			Fire(source, targets[1], 1)
			room:loseHp(source,2)
		else
			Fire(source, targets[1], 2)
			room:loseHp(source,2)
	end
			
			--room:setPlayerFlag(player,"yeyan_used")
	end
	end

}

LuaYeyanViewAsSkill = sgs.CreateViewAsSkill{
	name = "Luayeyan",
	n = 4,

	view_filter = function(self, selected, to_select)
		if #selected >= 3 then return false end
		--if to_select:isEquipped() then return false end
		--for _,card in ipairs(selected) do
       -- if card:getSuit() == to_select:getSuit() then return false end
	--end
		--return true
end,
	view_as = function(self, cards)
		--if #cards == 0 then return LuaYeyanCard:clone() end
		--if #cards ~= 4 then return nil end
		local YeyanCard = LuaYeyanCard:clone()
		--for _,card in ipairs(cards) do
			--YeyanCard:addSubcard(card)
	--end
		return YeyanCard
end,

		--enabled_at_play=function(self, player)
		--return player:getMark("@flamee") >= 1
		enabled_at_play=function(self, player)
		return not player:hasUsed("#LuaYeyanCard")
end
}

LuaYeyan = sgs.CreateTriggerSkill{
	name = "Luayeyan",
	--frequency = sgs.Skill_NotFrequent,
	events = {sgs.PhaseChange},
	view_as_skill = LuaYeyanViewAsSkill,

	on_trigger = function(self,event,player,data)
	if player:getPhase()==sgs.Player_Start then
		--player:gainMark("@flamee")
end
end
}

 
HYBS:addSkill(xuemo)
--HYBS:addSkill(shiqujuexingbiaoji)
HYBS:addSkill(LuaYeyan)
--HYBS:addSkill(shiqubaozoubiaoji)
--HYBS:addSkill(shiqushixuebiaoji)






----------------------------------------------------------------------------------------------------------
guiqi=sgs.General(extension, "guiqi", "god",4,true,true)

sizhen = sgs.CreateTriggerSkill
{
	name = "sizhen",
	events = {sgs.Damage,sgs.PhaseChange},
	on_trigger = function(self, event, player, data)
	local room=player:getRoom()
		if event==sgs.Damage then 
		player:gainMark("@zhen")
		end
		if (event==sgs.PhaseChange) and (player:getPhase()==sgs.Player_Start or player:getPhase()==sgs.Player_Finish) and player:getMark("@zhen")>0 and room:askForSkillInvoke(player,"sizhen") then----------回合开始阶段
		local target = room:askForPlayerChosen(player, room:getOtherPlayers(player), "xuanzemubiao")
		local choise = room:askForChoice(player,self:objectName(), "hong+lv+bin+zi")
		
		if choise == "hong" then
		player:loseMark("@zhen")
		local choice = room:askForChoice(target,self:objectName(), "huixue+shangxian")
		if choice =="huixue" then
		local recover=sgs.RecoverStruct()
				recover.who = target
				recover.reason = self:objectName()
				recover.recover = 1
				room:recover(target,recover)
				end
		if choice =="shangxian" then
		target:gainMark("@chiqing")
		end
		end
		
		if choise =="lv" then
		player:loseMark("@zhen")
		local choice = room:askForChoice(target,self:objectName(), "rengpai+rangnina")
		if choice =="rengpai" then
		room:askForDiscard(target,self:objectName(),2,false,true)
		end
		if choice =="rangnina" then
		if target:isAllNude() then return end
		room:obtainCard(player,room:askForCardChosen(player,target,"hej","sizhen"))
		end
		end
		
		if choise =="bin" then
		player:loseMark("@zhen")
		local choice = room:askForChoice(target,self:objectName(), "fanmian+liushitili")
		if choice =="fanmian" then
		target:turnOver()
		end
		if choice =="liushitili" then
		room:loseHp(target,1)
		end
		end
		
		if choise =="zi" then
		player:loseMark("@zhen")
		local choice = room:askForChoice(target,self:objectName(), "beisha+beijuedou")
		if choice =="beisha" then
		local use=sgs.CardUseStruct()
	        use.card=sgs.Sanguosha:cloneCard("slash",sgs.Card_NoSuit,0)
	        use.from=player
	        use.to:append(target)
	        room:useCard(use,false)
		end
		if choice =="beijuedou" then
		local use=sgs.CardUseStruct()
	        use.card=sgs.Sanguosha:cloneCard("duel",sgs.Card_NoSuit,0)
	        use.from=player
	        use.to:append(target)
	        room:useCard(use,false)
		end
		end
		
		end
		end,
		}
		
kaijia = sgs.CreateTriggerSkill
{
	name = "kaijia",
	events={sgs.Predamaged},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if event==sgs.Predamaged and player:getMark("@zhen")>0 and room:askForSkillInvoke(player,"kaijia") then 
		player:loseMark("@zhen") 
		local damage = data:toDamage()
		local log=sgs.LogMessage()
			log.from =player
			log.type ="#lua_kaijia_one"
			log.arg = tonumber(damage.damage)
			log.arg2 = tonumber(damage.damage - 1)
			room:sendLog(log)
		
			damage.damage = damage.damage - 1
			data:setValue(damage)
		end
	end,
}

bulaxiu = sgs.CreateTriggerSkill
{
	name = "bulaxiu",
	events = {sgs.PhaseChange},
	priority=993,
	frequency = sgs.Skill_Wake,
	on_trigger = function(self, event,player, data)
		local room = player:getRoom()
		if player:getMark("bulaxiu")==1 then return end
		if player:getPhase()~=sgs.Player_Start then return end
		if player:getMark("@zhen")>=4 then
for _,pl in sgs.qlist(room:getAllPlayers()) do
						pl:invoke("animate", "lightbox:$guiqijuexing:3000")
						end		
						room:getThread():delay(3000)
		room:loseMaxHp(player,1)
		player:setMark("bulaxiu",1)
		room:acquireSkill(player, "kaluo")
		end
		end
}



--当你使用的【杀】被【闪】抵消时，你可以弃置一张装备牌令此【杀】强制命中。 
kaluo=sgs.CreateTriggerSkill{
	name="kaluo",
	frequency=sgs.Skill_NotFrequent,
	events={sgs.SlashMissed},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local effect=data:toSlashEffect()
		--if player:getWeapon() then return end
		if not player:askForSkillInvoke(self:objectName(),data) then return end
		--if not room:askForDiscard(player,self:objectName(),1,true,true) then return end
		local card=room:askForCard(player,"EquipCard","mz~~",data)
	    if card==nil then return end
	    room:throwCard(card)
		room:slashResult(effect, nil)
	end,
}

local skills = sgs.SkillList()
if not sgs.Sanguosha:getSkill("kaluo") then skills:append(kaluo) end
sgs.Sanguosha:addSkills(skills)

guiqi:addSkill(sizhen)
guiqi:addSkill(chiqingzhoushangxian)
guiqi:addSkill(kaijia)
guiqi:addSkill(bulaxiu)




------------------------------------------------------------------------------------------------------------------------------------------------------
fengqiang=sgs.General(extension, "fengqiang", "god",5,true,true)

baq = sgs.CreateTriggerSkill
{
	name = "baq",
	frequency=sgs.Skill_Compulsory,
	events = {sgs.HpRecover},
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		local losthp=player:getLostHp()
		
		if event==sgs.HpRecover then
		    local rec=data:toRecover()
			for var=1,rec.recover do
		    room:setPlayerProperty(player,"maxhp",sgs.QVariant(player:getMaxHP()+1))
			end
	end
	end
}

celoucard=sgs.CreateSkillCard
{  
name="celoucard",
target_fixed=false,
will_throw=true,
filter=function(self,targets,to_select,player)      
    return player:inMyAttackRange(to_select) --否则要在攻击范围内
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
room:loseMaxHp(from,1)

room:setPlayerFlag(effect.from,"clused") --这个方法可以限制每回合一次
end                
}
 
celou=sgs.CreateViewAsSkill
{ 
name="celou",
n=0,
view_as=function(self, cards)
if #cards==0 then
local acard=celoucard:clone() 
acard:setSkillName(self:objectName())
return acard end
end,
enabled_at_play=function(self,player) 
if  player:getPhase()==sgs.Player_Finish then player:setFlags("-clused") end --回合结束取消标记 限制每回合一次
return not player:hasFlag("clused") 
end,
enabled_at_response=function(self,player,pattern) 
return false 
end
}

shaluTR = sgs.CreateTriggerSkill
{
	name = "#shaluTR",
	frequency = sgs.Skill_Compulsory,
	events = {sgs.PhaseChange,sgs.CardFinished},
	on_trigger = function(self, event, player, data)
		local room=player:getRoom()
		if event == sgs.CardFinished then 
		local carduse = data:toCardUse()	
		local card = carduse.card
		if card:inherits("Slash")  then 
		local judge=sgs.JudgeStruct()
        		judge.pattern=sgs.QRegExp("(.*):(.*):(.*)")            
				judge.good=true 
				judge.reason="shalu"
				judge.who=player
				room:judge(judge)	
		if  judge.card:inherits("Slash")  then
		player:obtainCard(judge.card)
		if  player:getPhase()==sgs.Player_Play then
			room:acquireSkill(player, "paoxiao")
		end
			end
		end		
		end
		if event  ==  sgs.PhaseChange and player:getPhase()==sgs.Player_Finish and player:hasSkill("paoxiao")then 
		room:detachSkillFromPlayer(player,"paoxiao")	
		end
	end
}

--[[nykj=sgs.CreateTriggerSkill{
name="nykj",
frequency=sgs.Skill_NotFrequent,
events={sgs.Predamage,sgs.Damage},
priority=5,
on_trigger=function(self,event,player,data)	
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local log=sgs.LogMessage()
	log.from =player

    if event == sgs.Predamage and player:askForSkillInvoke(self:objectName()) then
    
	local damage=data:toDamage()	
	local judge=sgs.JudgeStruct() --先判定
	judge.pattern=sgs.QRegExp("(.*):(.*):(.*)")
	judge.good=true
	judge.reason="nykj"
	judge.who=player
	room:judge(judge)
	local i=judge.card:getNumber()
	
    --local base=math.floor(0.25*i) --0.5翻倍
	local base=math.ceil(0.25*i)--向上取整
	damage.damage=base	    
	data:setValue(damage)	--SET回去
	
	log.type ="#nykjpd"
	log.arg  =damage.to:getGeneralName()
	log.arg2=tostring(base)	
	room:sendLog(log)
	if base==0 then return true end
	return false --返回
	elseif event==sgs.Damage then
	player:setFlags("jidiandamage")

end	
end,
}]]
-------------------------------------------------
nykjClear = sgs.CreateTriggerSkill{
	name = "#nykjClear",  
	frequency = sgs.Skill_Frequent, 
	events = {sgs.EventPhaseStart}, 
	on_trigger = function(self, event, player, data)
		if player:getPhase() == sgs.Player_NotActive  then
			local room = player:getRoom()
			player:loseAllMarks("@nu")
		end
		return false
	end, 
	can_trigger = function(self, target)
		return target
	end
}
nykj = sgs.CreateTriggerSkill{
	name = "nykj",
	events = {sgs.DamageCaused,sgs.Damaged}, 
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		if player then
			if event == sgs.Damaged then
				if player:getPhase() == sgs.Player_NotActive then
					if room:getCurrent():isAlive() then
						if player:getMark("@nu") < 1 then
							
							player:gainMark("@nu")
						end
					end
				end
			else	
				local damage = data:toDamage()
				--local card = damage.card
				--if card then
					if player:getMark("@nu")> 0 then
					if not player:askForSkillInvoke(self:objectName()) then return end
						local hurt = damage.damage
						damage.damage = hurt + 1
						data:setValue(damage)
						room:loseMaxHp(player,1)
					--end
				end
			end
			return false
		end
	end
}
--fengqiang:addSkill(baq)
fengqiang:addSkill(celou)
fengqiang:addSkill(nykj)
fengqiang:addSkill(nykjClear)





chenhao = sgs.General(extension, "chenhao", "god",4,true,true) 

--[[xueba=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "xueba",
	    events={sgs.CardLostDone, sgs.CardGotDone, sgs.CardDrawnDone}, 
	    on_trigger=function(self,event,player,data)
		    local room=player:getRoom()
			--if event == sgs.PhaseChange then
			--if player:getPhase()==sgs.Player_Draw then
			--return true
			--end
			--return false end
			
			--if(player:getHandcardNum() == 4) then
            --return false end
			
			local num = player:getHandcardNum() - 4
			if num <0 then
			player:drawCards(math.abs(num))
			--else
			--room:askForDiscard(player,self:objectName(),num)
		    end
			
			return false end,
}

xueba=sgs.CreateTargetModSkill{
name="xueba",
pattern="Slash,TrickCard",
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
}]]

--[[xueba = sgs.CreateProhibitSkill
{
	name = "xueba",
	is_prohibited=function(self,from,to,card)
		if (to:hasSkill("xueba")) and (to:getHandcardNum()<=2) then
			return card:inherits("Slash") or card:isNDTrick() 
		else
			return false
		end
	end,
}]]

	xueba_card = sgs.CreateSkillCard
{--学霸技能卡 
	name = "xueba_card",
	target_fixed = false,
	will_throw = true,
	
	filter = function(self, targets, to_select, player)
		return #targets<2 and (to_select:objectName()~=player:objectName()) --and not to_select:isKongcheng()
	end,
	
	on_use = function(self, room, source, targets)
	local num=targets[1]:getHandcardNum()
	local cd_t=room:askForExchange(targets[1],"xueba_card",math.min(self:getSubcards():length(),num))
	room:moveCardTo(cd_t,targets[2],sgs.Player_Hand,false)
	local cd_s=room:askForExchange(targets[2],"xueba_card",math.min(self:getSubcards():length(),num))
	room:moveCardTo(cd_s,targets[1],sgs.Player_Hand,false)
	
	end,
	
	
}
	xueba= sgs.CreateViewAsSkill
{--技能"神赋"
	name = "xueba",
	n = 998,
	
	enabled_at_play=function(self, player)
		return not player:hasUsed("#xueba_card") and not player:isNude()
	end,
	
	view_filter = function(self, selected, to_select)
		return true
	end,
	
	view_as = function(self, cards)
		--if(#cards ~= 1) then return nil end
		local qcard = xueba_card:clone()
		for _, p in ipairs(cards) do
			qcard:addSubcard(p)
		end
		qcard:setSkillName(self:objectName())
		return qcard
	end
}
---------------------------------------------------------------------

shezhangg=sgs.CreateTriggerSkill{
        name = "shezhangg",
        frequency = sgs.Skill_Wake,
        priority=3,
        events = {sgs.TurnStart},
        can_trigger=function(self,player)
                return player:hasSkill(self:objectName()) and (player:getMark("shezhangg")==0)
        end,
        on_trigger=function(self,event,player,data)
            if (not player:faceUp()) then return false end
            
                local room = player:getRoom()
				local owner=room:findPlayerBySkillName(self:objectName())
				local recov = sgs.RecoverStruct()
		
			local maxmax,minmin=0,10
	for _,p in sgs.qlist(room:getAllPlayers()) do
	    maxmax=math.max(maxmax,p:getHp())
		minmin=math.min(minmin,p:getHp())
	end
	local maxlist=sgs.SPlayerList() 
	local minlist=sgs.SPlayerList() 
	for _,p in sgs.qlist(room:getAllPlayers()) do
	    if p:getHp()==maxmax then maxlist:append(p) end
		if p:getHp()==minmin then minlist:append(p) end
	end
	--if (owner:getHp()==maxmax ) or (owner:getHp()==minmin ) then
	  if (owner:getHp()<=2 ) then
			    recov.who = player
			    recov.recover = 1
		        room:recover(player, recov)
				room:loseMaxHp(player)
				
				room:acquireSkill(player, "hujia")
                room:acquireSkill(player, "jijiang")
				room:acquireSkill(player, "zhiheng")
				room:acquireSkill(player, "luanji")
                
                player:setMark("shezhangg",1)
			end
        
		end
}
chenhao:addSkill(xueba)
chenhao:addSkill(shezhangg)


yisen = sgs.General(extension, "yisen", "god",4,true,true) 

yisenone=sgs.CreateViewAsSkill{
name="yisenone",
n=2,
view_filter=function(self, selected, to_select)
	if #selected ==0 then return to_select:isRed()  end
	if #selected == 1 then 
			--local cc = selected[1]:getSuit()
			--return to_select:getSuit() == cc
			return to_select:isRed()
	else return false
	end	
end,
view_as=function(self, cards)
	if #cards==0 then return nil end	
	if #cards==2 then	
	    local num=0
		if cards[1]:getNumber()==cards[1]:getNumber() then num=cards[1]:getNumber() end
		local ys_card=sgs.Sanguosha:cloneCard("snatch",sgs.Card_NoSuit, num)	
		ys_card:addSubcard(cards[1])	
		ys_card:addSubcard(cards[2])
		ys_card:setSkillName(self:objectName())
		return ys_card end	
end,
enabled_at_play=function()
	return true	
end,
enabled_at_response=function(self,pattern)	
	return false 
end
}



yisentwo=sgs.CreateViewAsSkill{
name="yisentwo",
n=2,
view_filter=function(self, selected, to_select)
	if #selected ==0 then return to_select:isBlack()  end
	if #selected == 1 then 
			--local cc = selected[1]:getSuit()
			--return to_select:getSuit() == cc
			return to_select:isBlack()
	else return false
	end	
end,
view_as=function(self, cards)
	if #cards==0 then return nil end	
	if #cards==2 then	
	    local num=0
		if cards[1]:getNumber()==cards[1]:getNumber() then num=cards[1]:getNumber() end
		local ys_card=sgs.Sanguosha:cloneCard("dismantlement",sgs.Card_NoSuit, num)	
		ys_card:addSubcard(cards[1])	
		ys_card:addSubcard(cards[2])
		ys_card:setSkillName(self:objectName())
		return ys_card end	
end,
enabled_at_play=function()
	return true	
end,
enabled_at_response=function(self,pattern)	
	return false 
end
}

yisenthree=sgs.CreateTriggerSkill{
	name="yisenthree",
	events=sgs.CardEffected,
	frequency=sgs.Skill_Compulsory,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local card=data:toCardEffect().card--记录使用的卡
		if  card:objectName()=="savage_assault" or card:objectName()=="archery_attack" then  
		local log = sgs.LogMessage()
				log.type = "$yisenthree1"
				room:sendLog(log)

		return true--卡片无效
	
		end
	end
}



yisen:addSkill(yisenone)
yisen:addSkill(yisentwo)
yisen:addSkill(yisenthree)

luwei = sgs.General(extension, "luwei", "god",3,true,true)

--[智破] 你的回合外，每当使用或打出一张【基本牌】时，可观看一名其他角色的手牌，将其中一张基本牌交给另一名角色。
ZHYuu=sgs.CreateTriggerSkill{
	name="ZHYuu",
	--frequency=sgs.Skill_Frequent,
	frequency=sgs.Skill_NotFrequent,
	events={sgs.CardResponsed,sgs.CardUsed},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
if event==sgs.CardResponsed then
		if player:getPhase()~=sgs.Player_NotActive then return end
		local card=data:toCard()
		if not card:inherits("BasicCard") then return false end
		card:setSkillName(self:objectName())--这句话是向战报告知此牌通过哪个技能使用或打出，非常重要。
		if not player:askForSkillInvoke(self:objectName()) then return end
		local target=room:askForPlayerChosen(player,room:getAllPlayers(),self:objectName())
		local log= sgs.LogMessage()
			log.type = "#ZHYuu"
			log.from = player
			log.to:append(target)
		room:sendLog(log)
		room:showAllCards(target,player)
		--room:playSkillEffect("ZHYu")
		player:invoke("clearAG")
		local card_ids=target:handCards()
		room:fillAG(card_ids,player)
		local card_id 
		local sucess=false
		local newcard
		while not sucess do
            card_id=room:askForAG(player, card_ids, true, self:objectName())
            if card_id == -1 then
                sucess=true
            else
                newcard=sgs.Sanguosha:getCard(card_id)
                if newcard:getType() == "basic" then 
					sucess=true 
				end
            end
        end
		player:invoke("clearAG")
		if card_id == -1 then return end
		target=room:askForPlayerChosen(player,room:getOtherPlayers(target),self:objectName())
		target:obtainCard(newcard)
		
		
elseif event==sgs.CardUsed then
		if player:getPhase()~=sgs.Player_NotActive then return end
		local use=data:toCardUse()
		if not use.card:inherits("BasicCard") then return false end
		use.card:setSkillName(self:objectName())--这句话是向战报告知此牌通过哪个技能使用或打出，非常重要。
		if not player:askForSkillInvoke(self:objectName()) then return end
		local target=room:askForPlayerChosen(player,room:getAllPlayers(),self:objectName())
		local log= sgs.LogMessage()
			log.type = "#ZHYuu"
			log.from = player
			log.to:append(target)
		room:sendLog(log)
		room:showAllCards(target,player)
		--room:playSkillEffect("ZHYu")
		player:invoke("clearAG")
		local card_ids=target:handCards()
		room:fillAG(card_ids,player)
		local card_id 
		local sucess=false
		local newcard
		while not sucess do
            card_id=room:askForAG(player, card_ids, true, self:objectName())
            if card_id == -1 then
                sucess=true
            else
                newcard=sgs.Sanguosha:getCard(card_id)
                if newcard:getType() == "basic" then 
					sucess=true 
				end
            end
        end
		player:invoke("clearAG")
		if card_id == -1 then return end
		target=room:askForPlayerChosen(player,room:getOtherPlayers(target),self:objectName())
		target:obtainCard(newcard)
		end
		
	end,
}

ZHY=sgs.CreateTriggerSkill{
	name="#ZHY",
	--frequency=sgs.Skill_Frequent,
	frequency=sgs.Skill_NotFrequent,
	events={sgs.CardResponsed,sgs.CardUsed},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
if event==sgs.CardResponsed then
		if player:getPhase()~=sgs.Player_NotActive then return end
		local card=data:toCard()
		if not card:inherits("TrickCard") then return false end
		card:setSkillName(self:objectName())--这句话是向战报告知此牌通过哪个技能使用或打出，非常重要。
		if not player:askForSkillInvoke("#ZHY") then return end
		local target=room:askForPlayerChosen(player,room:getAllPlayers(),self:objectName())
		local log= sgs.LogMessage()
			log.type = "#ZHYuu"
			log.from = player
			log.to:append(target)
		room:sendLog(log)
		room:showAllCards(target,player)
		--room:playSkillEffect("ZHYu")
		player:invoke("clearAG")
		local card_ids=target:handCards()
		room:fillAG(card_ids,player)
		local card_id 
		local sucess=false
		local newcard
		while not sucess do
            card_id=room:askForAG(player, card_ids, true, self:objectName())
            if card_id == -1 then
                sucess=true
            else
                newcard=sgs.Sanguosha:getCard(card_id)
                if newcard:getType() == "trick" then 
					sucess=true 
				end
            end
        end
		player:invoke("clearAG")
		if card_id == -1 then return end
		target=room:askForPlayerChosen(player,room:getOtherPlayers(target),self:objectName())
		target:obtainCard(newcard)
		
		
elseif event==sgs.CardUsed then
		if player:getPhase()~=sgs.Player_NotActive then return end
		local use=data:toCardUse()
		if not use.card:inherits("TrickCard") then return false end
		use.card:setSkillName(self:objectName())--这句话是向战报告知此牌通过哪个技能使用或打出，非常重要。
		if not player:askForSkillInvoke(self:objectName()) then return end
		local target=room:askForPlayerChosen(player,room:getAllPlayers(),self:objectName())
		local log= sgs.LogMessage()
			log.type = "#ZHYuu"
			log.from = player
			log.to:append(target)
		room:sendLog(log)
		room:showAllCards(target,player)
		--room:playSkillEffect("ZHYu")
		player:invoke("clearAG")
		local card_ids=target:handCards()
		room:fillAG(card_ids,player)
		local card_id 
		local sucess=false
		local newcard
		while not sucess do
            card_id=room:askForAG(player, card_ids, true, self:objectName())
            if card_id == -1 then
                sucess=true
            else
                newcard=sgs.Sanguosha:getCard(card_id)
                if newcard:getType() == "trick" then 
					sucess=true 
				end
            end
        end
		player:invoke("clearAG")
		if card_id == -1 then return end
		target=room:askForPlayerChosen(player,room:getOtherPlayers(target),self:objectName())
		target:obtainCard(newcard)
		end
		
	end,
}

bihuojue=sgs.CreateTriggerSkill{
	name="bihuojue",
	events=sgs.CardEffected,
	frequency=sgs.Skill_NotFrequent,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local card=data:toCardEffect().card--记录使用的卡
		if  card:inherits("FireAttack") or card:objectName()=="fire_attack" then  
		   if not player:askForSkillInvoke(self:objectName()) then return false end
		local log = sgs.LogMessage()
				log.type = "$bihuojue"
				room:sendLog(log)
					--room:playSkillEffect("mingmen")
		return true--卡片无效
	
		end
	end
}

buzhihuo_card=sgs.CreateSkillCard{
name="buzhihuo_card",
target_fixed=false,
will_throw=false,
filter=function(self,targets,to_select)
	return (#targets==0) and to_select:objectName()~=sgs.Self:objectName() and sgs.Self:canSlash(to_select,false)
end,

on_use=function(self,room,source,targets)
	room:setPlayerFlag(source,"buzhihuo_used")
	
	room:moveCardTo(self,targets[1],sgs.Player_Hand,false)
	local use=sgs.CardUseStruct()
	use.card=sgs.Sanguosha:cloneCard("fire_slash",sgs.Card_NoSuit,0)
	use.from=source
	use.to:append(targets[1])
	use.card:setSkillName(self:objectName())--这句话是向战报告知此牌通过哪个技能使用或打出，非常重要。
	room:useCard(use,false)
	
end,

}

buzhihuo_vs=sgs.CreateViewAsSkill{
name="buzhihuo_vs",
n=1,
view_filter=function(self, selected, to_select)
	return true
end,
view_as=function(self, cards)
	if #cards~=1 then return nil end
	local a_buzhihuo_card=buzhihuo_card:clone()
	a_buzhihuo_card:addSubcard(cards[1])
	a_buzhihuo_card:setSkillName(self:objectName())
	return a_buzhihuo_card
end,
enabled_at_play=function(self,player)
	return not sgs.Self:hasFlag("buzhihuo_used") and not player:isNude()
end,
enabled_at_response=function(self, player, pattern)
	return false
end
}

luwei:addSkill(ZHYuu)
luwei:addSkill(ZHY)
luwei:addSkill(buzhihuo_vs)


zhangyanjun = sgs.General(extension, "zhangyanjun", "god",3,true,true)

	bangzhu_card=sgs.CreateSkillCard{
name="bangzhu_effect",
target_fixed=false,
will_throw=false,
filter=function(self,targets,to_select)
	return #targets==0 and not to_select:hasSkill("bangzhu_vs")
end,
--feasible=function(self,targets)
--end,
on_use=function(self,room,source,targets)
	local selfplayer=source
	room:setPlayerFlag(selfplayer,"bangzhu_used")
	room:moveCardTo(self,targets[1],sgs.Player_Hand,false)
	if self:getSubcards():length()>1 then
		if (room:askForChoice(targets[1],"bangzhu_vs", "GiveCard+NoGiveCard") ~= "GiveCard") then return false end
		-- 内置函数，只能返还手牌 local cd_t=room:askForExchange(targets[1],"bangzhu_vs",1)
		 local cd_t = room:askForCardChosen(targets[1],targets[1], "he" ,"bangzhu_vs")
		-- 交换卡牌专用简写 room:moveCardTo(cd_t,selfplayer,sgs.Player_Hand,false)
		room:moveCardTo(sgs.Sanguosha:getCard(cd_t),selfplayer,sgs.Player_Hand,false)
		
		--local recover = sgs.RecoverStruct()   --回复结构体
		--recover.recover = 1  --回复点数
		--recover.who = targets[1]   --回复来源
		--room:recover(targets[1],recover)
	end
end,
--on_effect=function(self,effect)
	--local room=effect.from:getRoom()	
--end
}

bangzhu_vs=sgs.CreateViewAsSkill{
name="bangzhu_vs",
n=998,
view_filter=function(self, selected, to_select)
	--return not to_select:isEquipped()
	return true
end,
view_as=function(self, cards)
	if #cards==0 then return nil end
	local a_bangzhu_card=bangzhu_card:clone()
	for var=1,#cards,1 do
		a_bangzhu_card:addSubcard(cards[var])
	end
	a_bangzhu_card:setSkillName(self:objectName())
	return a_bangzhu_card
end,
enabled_at_play=function(self,player)
	return not sgs.Self:hasFlag("bangzhu_used") and not player:isNude()
end,
enabled_at_response=function(self, player, pattern)
	return false
end
}

bupai_trs=sgs.CreateTriggerSkill{
name="bupai_trs",
--view_as_skill=!!_vs,
events={sgs.TurnStart},
frequency = sgs.Skill_Frequent,
priority = 99,
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.TurnStart then
		if player:hasSkill(self:objectName()) then return false end
			if not selfplayer:askForSkillInvoke(self:objectName()) then return false end
		local hd_x=selfplayer:getHandcardNum()
		local Mhp_x=selfplayer:getMaxHP()
		if hd_x>=Mhp_x then return false end
		selfplayer:drawCards(Mhp_x-hd_x)
	end	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}

zhangyanjun:addSkill(bangzhu_vs)
zhangyanjun:addSkill(bupai_trs)

--------------------------------------------
wanghaifeng = sgs.General(extension, "wanghaifeng", "god",6,true,true)

miaoyu=sgs.CreateTriggerSkill{
	name="miaoyu",
	frequency=sgs.Skill_NotFrequent,
	events={sgs.CardUsed},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local splayer=room:findPlayerBySkillName(self:objectName())
		if not splayer then return end
		--if splayer:getPhase()~=sgs.Player_NotActive then return end
		local use=data:toCardUse()
		if  use.from:getGeneralName()==splayer:getGeneralName() then return end--识别角色名字，而不是通常用的objectName()
		if (not use.card:inherits("FireSlash") and not use.card:inherits("ThunderSlash"))  then return end
		if not splayer:askForSkillInvoke(self:objectName()) then return end
		if (use.card:inherits("ThunderSlash")) then 
		room:playSkillEffect("miaoyu",1)
		use.from:drawCards(1)--摸牌
		splayer:drawCards(1)--摸牌
		
		local huanpai = room:askForCardChosen(use.from,use.from, "he" ,"miaoyu")
		room:moveCardTo(sgs.Sanguosha:getCard(huanpai),splayer,sgs.Player_Hand,false)
		local huanpaii = room:askForCardChosen(splayer,splayer, "he" ,"miaoyu")
		room:moveCardTo(sgs.Sanguosha:getCard(huanpaii),use.from,sgs.Player_Hand,false)
		end
		
		if (use.card:inherits("FireSlash")) then 
		room:playSkillEffect("miaoyu",2)
		use.from:drawCards(1)--摸牌
		splayer:drawCards(1)--摸牌
	    local huanpai = room:askForCardChosen(use.from,use.from, "he" ,"miaoyu")
		room:moveCardTo(sgs.Sanguosha:getCard(huanpai),splayer,sgs.Player_Hand,false)
		local huanpaii = room:askForCardChosen(splayer,splayer, "he" ,"miaoyu")
		room:moveCardTo(sgs.Sanguosha:getCard(huanpaii),use.from,sgs.Player_Hand,false)
		end

		end,
		
	can_trigger=function(self,target)
		return true
	end,
}

---------------
--回合开始时，你可以令你攻击范围内的角色各弃置一张手牌，然后你将其中一张牌交给一名其他角色，从剩余弃牌堆中获得至多三张牌。
lundao=sgs.CreateTriggerSkill{
	name="lundao",
	frequency=sgs.Skill_NotFrequent,
	events={sgs.PhaseChange},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if (event == sgs.PhaseChange and player:getPhase() == sgs.Player_RoundStart) then
		if not room:askForSkillInvoke(player,self:objectName(),data) then return end
		room:setPlayerFlag(player,"lundao")
		if lundaocardids:length()~= 0 then
			lundaocardids=sgs.IntList()
		end
		
		  local pl = sgs.SPlayerList()
		for _,f in sgs.qlist(room:getAlivePlayers()) do
            if player:inMyAttackRange(f) and not f:isNude() then
			    pl:append(f)
			end
			end
			
		for _,p in sgs.qlist(pl) do
				room:askForDiscard(p,self:objectName(),1,false,true)
				--room:throwCard(room:askForCardChosen(p,p,"he","lundao"),p)--后面加,targets[?]是弃置
		end
		room:setPlayerFlag(player,"-lundao")
		if lundaocardids:isEmpty() then return end
		local newlist=sgs.IntList()
		for _,id in sgs.qlist(lundaocardids) do
			if room:getCardPlace(id) == sgs.Player_DiscardedPile then
				newlist:append(id)
			end
		end
		if newlist:isEmpty() then return end
		local target
		for i=1,998,1 do
			room:fillAG(newlist,nil)
			card_id=room:askForAG(player,newlist, true, "lundao")
			for _,p in sgs.qlist(room:getPlayers()) do
				p:invoke("clearAG")
			end
			if card_id == -1 then break end
			newlist:removeOne(card_id)
			--if player:hasFlag("lundao") then
				--target=player
			--elseif player:getMark(self:objectName())>=3 then
				--target=room:askForPlayerChosen(player,room:getOtherPlayers(player),self:objectName())
			--else
				target=room:askForPlayerChosen(player,room:getAllPlayers(),self:objectName())
			--end
			--if target:objectName()==player:objectName() then
				--player:addMark(self:objectName())
			--else
				--room:setPlayerFlag(player,"lundao")
			--end
			target:obtainCard(sgs.Sanguosha:getCard(card_id))
			if newlist:isEmpty() then break end
		end
	end
		--room:setPlayerFlag(player,"-lundao")
		--room:setPlayerMark(player,self:objectName(),0)
end,
}

lundaocardids=sgs.IntList()
lundaorecord=sgs.CreateTriggerSkill{
	name="#lundaorecord",
	frequency=sgs.Skill_Compulsory,
	events={sgs.CardLost},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local splayer=room:findPlayerBySkillName(self:objectName())
		if not splayer then return end
		if not splayer:hasFlag("lundao") then return end
		local move=data:toCardMove()
		lundaocardids:append(move.card_id)
	end,
	can_trigger=function(self,target)
		return true
	end,
}--------

xinghe = sgs.CreateTriggerSkill
{
name = "xinghe",
events = {sgs.PhaseChange},
on_trigger = function(self, event, player, data)
    local room = player:getRoom()		
	if player:getPhase()==sgs.Player_Start and room:askForSkillInvoke(player,"xinghe") then
	    player:skip(sgs.Player_Judge)
	    player:skip(sgs.Player_Draw)
		local choise = room:askForChoice(player,self:objectName(), "wjqf+nmrq")
		if choise == "wjqf" then
		room:playSkillEffect("xinghe",1)
		local wanjianpai=sgs.Sanguosha:cloneCard("archery_attack", sgs.Card_NoSuit, 0)
		--wanjianpai:setSkillName("xinghe")
		local use = sgs.CardUseStruct()
		use.from = player
		for _,p in sgs.qlist(room:getAlivePlayers()) do
		    use.to:append(p)
		end
		use.card = wanjianpai
		room:useCard(use)
		player:setFlags("wanjianUsed")
		
		else
		room:playSkillEffect("xinghe",2)
		local nanmanpai=sgs.Sanguosha:cloneCard("savage_assault", sgs.Card_NoSuit, 0)
		--nanmanpai:setSkillName("xinghe")
		local use = sgs.CardUseStruct()
		use.from = player
		for _,p in sgs.qlist(room:getAlivePlayers()) do
		    use.to:append(p)
		end
		use.card = nanmanpai
		room:useCard(use)
		player:setFlags("nanmannUsed")
				end
				
				
				end
	
		if(player:getPhase() == sgs.Player_NotActive) then
		if (player:hasFlag("wanjianUsed") or player:hasFlag("nanmannUsed")) then
		room:playSkillEffect("xinghe",3)
				player:drawCards(2)
				end
				end
					    return false
end
}



chunqiu=sgs.CreateTriggerSkill{
	name="chunqiu",
	events=sgs.CardEffected,
	frequency=sgs.Skill_NotFrequent,
	priority=5,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local effect=data:toCardEffect()
		if player:getPhase()~=sgs.Player_NotActive then return false end
		if not effect.card:isNDTrick() then return end
		if effect.card:inherits("AmazingGrace") then return end
		if room:askForSkillInvoke(player,"chunqiu",data) then
				local current=room:getCurrent()
				local thread=room:getThread()
				room:askForDiscard(player,self:objectName(),1,false,true)
				current:play(current:getPhases())
					room:playSkillEffect("chunqiu")
				while true do
					current=current:getNextAlive()
					current:gainAnExtraTurn(current)
			end
		end
	end,
}

	lundaoo_card = sgs.CreateSkillCard
{--论道技能卡 
	name = "lundaoo_card",
	target_fixed = false,
	will_throw = false,
	
	filter = function(self, targets, to_select, player)
		return #targets == 0 and (to_select:objectName()~=player:objectName())
	end,
	
	on_use = function(self, room, source, targets)
	
		effect = sgs.CardEffectStruct()
		effect.card = sgs.Sanguosha:getCard(self:getEffectiveId())
		effect.from = source
		effect.to = targets[1]
		room:showCard(effect.from, self:getEffectiveId())
		room:moveCardTo(self, effect.to, sgs.Player_Hand, false)
		
		if  effect.card:getSuit() == sgs.Card_Club then
		    local duixiang = sgs.SPlayerList()
			for _,p in sgs.qlist(room:getAllPlayers()) do
				if targets[1]:canSlash(p,false) or p:objectName()==targets[1]:objectName() then
					duixiang:append(p)
				end
			end
			mubiao = room:askForPlayerChosen(effect.from, duixiang, "slashtarget")
			room:playSkillEffect("lundaoo",5)
			local use=sgs.CardUseStruct()
	        use.card=sgs.Sanguosha:cloneCard("thunder_slash",sgs.Card_NoSuit,0)
	        use.from=effect.to
	        use.to:append(mubiao)
	        --use.card:setSkillName(self:objectName())--这句话是向战报告知此牌通过哪个技能使用或打出，非常重要。
	        room:useCard(use,false)
		end
		
		if  effect.card:getSuit() == sgs.Card_Diamond then 
		    local duixiang = sgs.SPlayerList()
			for _,p in sgs.qlist(room:getAllPlayers()) do
				if not p:isAllNude() then
					duixiang:append(p)
				end
			end
			mubiao = room:askForPlayerChosen(effect.from, duixiang, "choosetarget")
			room:playSkillEffect("lundaoo",4)
			local pai = room:askForCardChosen(effect.to, mubiao, "hej", "gettarget")
			room:obtainCard(effect.to,pai)
		end
		
		if  effect.card:getSuit() ==  sgs.Card_Heart then 
		    room:playSkillEffect("lundaoo",1)
			room:askForDiscard(effect.to,self:objectName(),2,false,true)
			local recover=sgs.RecoverStruct()
			recover.recover=1
			recover.card=nil
			recover.who=effect.to
		    room:recover(recover.who, recover)
		end
		
		if effect.card:getSuit() == sgs.Card_Spade then 
		    if effect.to:faceUp() then
		    room:playSkillEffect("lundaoo",2)
			effect.to:drawCards(2)
			effect.to:turnOver()
		else
		    room:playSkillEffect("lundaoo",3)
		    effect.to:drawCards(2)
		    effect.to:turnOver()
		end
		
		end
	end,
	
}
	lundaoo= sgs.CreateViewAsSkill
{--技能"论道"
	name = "lundaoo",
	n = 1,
	
	enabled_at_play=function(self, player)
		return not player:hasUsed("#lundaoo_card") and not player:isNude()
	end,
	
	view_filter = function(self, selected, to_select)
		return true
	end,
	
	view_as = function(self, cards)
		if(#cards ~= 1) then return nil end
		local qcard = lundaoo_card:clone()
		qcard:addSubcard(cards[1])
		--qcard:setSkillName(self:objectName())
		return qcard
	end
}

wanghaifeng:addSkill(miaoyu)
wanghaifeng:addSkill(xinghe)
--wanghaifeng:addSkill(lundao)
--wanghaifeng:addSkill(lundaorecord)
wanghaifeng:addSkill(lundaoo)
-------------------------------------------------------------------------------------
wanghaining = sgs.General(extension, "wanghaining", "god",4,true,true)

--[征伐] 你使用【杀】时进行一次判定，若结果为黑色，你可指定攻击范围内的一名角色将武将牌翻面；若为红色，你可为该【杀】额外指定攻击范围内的一个目标。
zhengfa=sgs.CreateTriggerSkill{
	name="zhengfa",
	frequency=sgs.Skill_NotFrequent,
	events={sgs.CardUsed},	
	on_trigger=function(self,event,player,data)
		local use=data:toCardUse()
		if not use.card:inherits("Slash") then return end
		local room=player:getRoom()
		local judge=sgs.JudgeStruct()
			judge.pattern=sgs.QRegExp("(.*):(.*):(.*)")
			judge.good=true
			judge.reason=self:objectName()
			judge.who=player
		room:judge(judge)

		if judge.card:isBlack() then
		local targets=sgs.SPlayerList()
			for _,p in sgs.qlist(room:getAllPlayers()) do
				if player:inMyAttackRange(p) then
					targets:append(p)
				end
			end
			if targets:isEmpty() then return end
			if not player:askForSkillInvoke(self:objectName()) then return end
			local target=room:askForPlayerChosen(player,targets,"heisetishi")
		     target:turnOver()
			 room:playSkillEffect(self:objectName(),1)
		end
		
		if judge.card:isRed() then
			local targets=sgs.SPlayerList()
			for _,p in sgs.qlist(room:getAllPlayers()) do
				if player:canSlash(p,true) and not use.to:contains(p) then
					targets:append(p)
				end
			end
			if targets:isEmpty() then return end
			if not player:askForSkillInvoke(self:objectName()) then return end
			local target=room:askForPlayerChosen(player,targets,"hongsetishi")
			use.to:append(target)
			data:setValue(use)
			room:playSkillEffect(self:objectName(),2)
		end
		
		
	end,
}

chaojimashu=sgs.CreateDistanceSkill{
 name = "chaojimashu",
correct_func = function(self, from, to)
		if to:hasSkill("chaojimashu") then
			return 1
		end
		if from:hasSkill("chaojimashu") then
			return -1
		end
	end,
}
---------------------------------------------
mianyiaoe=sgs.CreateTriggerSkill{
	name="mianyiaoe",
	events=sgs.CardEffected,
	frequency=sgs.Skill_Compulsory,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local card=data:toCardEffect().card--记录使用的卡
		if  card:objectName()=="savage_assault" or card:objectName()=="archery_attack" then  
				room:playSkillEffect(self:objectName())
		local log = sgs.LogMessage()
				log.type = "$mianyiaoe1"
				room:sendLog(log)

		return true--卡片无效

	
		end
	end
}

local skill=sgs.Sanguosha:getSkill("mianyiaoe")
if not skill then
local skillList=sgs.SkillList()
skillList:append(mianyiaoe)
sgs.Sanguosha:addSkills(skillList)
end
---------------------------------------------
chaoshi=sgs.CreateTriggerSkill{
	name="chaoshi",
	frequency=sgs.Skill_NotFrequent,
	priority = 4,
	events={sgs.PhaseChange},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if player:getPhase()~=sgs.Player_Start then return end
		if not player:askForSkillInvoke(self:objectName()) then return end
        local judge=sgs.JudgeStruct()
			judge.pattern=sgs.QRegExp("(.*):(.*):(.*)")
			judge.good=true
			judge.reason=self:objectName()
			judge.who=player
		room:judge(judge)
		if judge.card:getSuit()==sgs.Card_Heart then
			local recover=sgs.RecoverStruct()
			recover.recover=1
			recover.card=nil
			recover.who=room:askForPlayerChosen(player,room:getAllPlayers(),"huixuetishi")
		    room:recover(recover.who, recover)
			room:playSkillEffect(self:objectName(),1)
		elseif judge.card:getSuit()==sgs.Card_Diamond then
		    local duixiang = sgs.SPlayerList()
			for _,p in sgs.qlist(room:getAllPlayers()) do
				if not p:isAllNude() then
					duixiang:append(p)
				end
			end
			mubiao = room:askForPlayerChosen(player, duixiang, "xuanmubiao")
			local pai = room:askForCardChosen(player, mubiao, "hej", "huoqupai")
			room:obtainCard(player,pai)
			room:playSkillEffect(self:objectName(),2)
		elseif judge.card:getSuit()==sgs.Card_Club then
			 local duixiang = sgs.SPlayerList()
			 for _,p in sgs.qlist(room:getAllPlayers()) do
				if player:canSlash(p,false) or p:objectName()==player:objectName() then
					duixiang:append(p)
				end
			end
			mubiao = room:askForPlayerChosen(player, duixiang, "shademubiao")
			local choice = room:askForChoice(player, self:objectName(), "leisha+huosha")
			if(choice == "leisha") then
			room:playSkillEffect(self:objectName(),3)
			local use=sgs.CardUseStruct()
	        use.card=sgs.Sanguosha:cloneCard("thunder_slash",sgs.Card_NoSuit,0)
	        use.from=player
	        use.to:append(mubiao)
	        --use.card:setSkillName(self:objectName())--这句话是向战报告知此牌通过哪个技能使用或打出，非常重要。
	        room:useCard(use,false)
			else
			room:playSkillEffect(self:objectName(),4)
			local use=sgs.CardUseStruct()
	        use.card=sgs.Sanguosha:cloneCard("fire_slash",sgs.Card_NoSuit,0)
	        use.from=player
	        use.to:append(mubiao)
	        --use.card:setSkillName(self:objectName())--这句话是向战报告知此牌通过哪个技能使用或打出，非常重要。
	        room:useCard(use,false)
			end
		elseif judge.card:getSuit()==sgs.Card_Spade then
		    mubiao = room:askForPlayerChosen(player, room:getAllPlayers(), "mopaitishi")
			mubiao:drawCards(1)
			room:playSkillEffect(self:objectName(),5)
		end
		return false
	end,
}

local skill=sgs.Sanguosha:getSkill("chaoshi")
if not skill then
local skillList=sgs.SkillList()
skillList:append(chaoshi)
sgs.Sanguosha:addSkills(skillList)
end
-------------------------------------------------------------------

yingjiee = sgs.CreateTriggerSkill
{
name = "yingjiee",
events = {sgs.PhaseChange},
on_trigger = function(self, event, player, data)
    local room = player:getRoom()		
	if player:getPhase()==sgs.Player_Finish and room:askForSkillInvoke(player,"yingjiee") then

		local choise = room:askForChoice(player,self:objectName(), "wjqf+nmrq")
		if choise == "wjqf" then
		room:playSkillEffect("yingjiee",1)
		local wanjianpai=sgs.Sanguosha:cloneCard("archery_attack", sgs.Card_NoSuit, 0)
		--wanjianpai:setSkillName("yingjiee")
		local use = sgs.CardUseStruct()
		use.from = player
		for _,p in sgs.qlist(room:getAlivePlayers()) do
		    use.to:append(p)
		end
		use.card = wanjianpai
		room:useCard(use)
		player:setFlags("wanjianUsed")
		
		else
		room:playSkillEffect("yingjiee",2)
		local nanmanpai=sgs.Sanguosha:cloneCard("savage_assault", sgs.Card_NoSuit, 0)
		--nanmanpai:setSkillName("yingjiee")
		local use = sgs.CardUseStruct()
		use.from = player
		for _,p in sgs.qlist(room:getAlivePlayers()) do
		    use.to:append(p)
		end
		use.card = nanmanpai
		room:useCard(use)
		player:setFlags("nanmannUsed")
				end
				
				
				end
	
					    return false
end
}

local skill=sgs.Sanguosha:getSkill("yingjiee")
if not skill then
local skillList=sgs.SkillList()
skillList:append(yingjiee)
sgs.Sanguosha:addSkills(skillList)
end
-----------------------------------------------------------------------------
juexingjineng=sgs.CreateTriggerSkill{
        name = "juexingjineng",
        frequency = sgs.Skill_Wake,
        priority=5,
		events={sgs.PhaseChange},
        can_trigger=function(self,player)
                return player:hasSkill(self:objectName()) and (player:getMark("juexingle")==0)
        end,
        on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		if (event == sgs.PhaseChange and player:getPhase() == sgs.Player_RoundStart) then
	    if  player:getHandcardNum()>=player:getHp() then
		room:playSkillEffect(self:objectName())
		for _,pl in sgs.qlist(room:getAllPlayers()) do
						pl:invoke("animate", "lightbox:$juexingjineng:5000")
						end
						room:getThread():delay(5000)
				room:acquireSkill(player, "mianyiaoe")
                room:acquireSkill(player, "chaoshi")
				room:acquireSkill(player, "yingjiee")                
                player:setMark("juexingle",1)
			end
        end
		end,
}
wanghaining:addSkill(zhengfa)
wanghaining:addSkill(chaojimashu)
wanghaining:addSkill(juexingjineng)
-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
zhangxiaofan = sgs.General(extension, "zhangxiaofan", "god",4)

hongsebusi=sgs.CreateTriggerSkill{
	name="hongsebusi",
	events=sgs.Dying,
	frequency=sgs.Skill_Compulsory,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()--获取房间
		local dying=data:toDying()
		local card=dying.damage.card
		if card and card:isRed() then--红色
			room:playSkillEffect("shixuezhu")
			return true--跳过濒死结算
		end
		return false
	end,
}


shehunbangDS=sgs.CreateDistanceSkill{
	name="#shehunbangDS",
	correct_func=function(self,from,to)
		if from:hasFlag("shehunbangUsed") then
			return -998
		end
	end,
}
shehunbangCard=sgs.CreateSkillCard{
	name="shehunbangCard",
	target_fixed=true,
	on_use=function(self,room,source,targets)
		room:throwCard(self)
		room:setPlayerFlag(source,"shehunbangUsed")
		room:playSkillEffect("shehunbang")
	end,
}
shehunbang=sgs.CreateViewAsSkill{
	name="shehunbang",
	n=1,
	view_filter=function(self,selected,to_select)
		--return not to_select:isEquipped()
		return true 
	end,
	view_as=function(self,cards)
		if #cards==0 then return nil end
		local acard=shehunbangCard:clone()
		acard:addSubcard(cards[1])
		return acard
	end,
	enabled_at_play=function(self,player)
		return not player:hasFlag("shehunbangUsed") and not player:isNude()
	end,
}

tianshu = sgs.CreateTriggerSkill
 {
         name = "tianshu",
         events = {sgs.CardDiscarded},
         frequency = sgs.Skill_Compulsory,
         can_trigger = function(self, player)
                 return not player:hasSkill(self:objectName())
         end,
         on_trigger = function(self, event, player, data)
                 local room = player:getRoom()
                 local owner = room:findPlayerBySkillName(self:objectName())
                 if not owner then return false end
                 if player:getPhase() == sgs.Player_Discard then
                         local card_star = data:toCard()
                         local card_ids = {}
                         for _, id in sgs.qlist(card_star:getSubcards()) do
                                 table.insert(card_ids, id)
                         end
                         if #card_ids == 0 or #card_ids <= 1 then return false end
                         local card_id = table.concat(card_ids, "+")
                         room:setTag("tianshuList", sgs.QVariant(card_id))
                 end
         end                
}
 
tianshu_invoke = sgs.CreateTriggerSkill
 {
         name = "#tianshu_invoke",
         events = {sgs.PhaseChange},
         priority = -2,
         can_trigger = function(self, player)
                 return not player:hasSkill("tianshu")
         end,
         on_trigger = function(self, event, player, data)
                 local room = player:getRoom()
                 local owner = room:findPlayerBySkillName("tianshu")
                 if not owner or player:isDead() then return false end
                 local tianshu_list = room:getTag("tianshuList"):toString()
                 room:removeTag("tianshuList")
                 if tianshu_list == "" then return false end
                 tianshu_list = tianshu_list:split("+")
                 local napai = sgs.IntList()
                 local guzheng = false
                 for _, id in ipairs (tianshu_list) do
                         if room:getCardPlace(id) == sgs.Player_DiscardedPile then
                                 napai:append(id)
                         else
                                 guzheng = true
                         end
                 end
                 if napai:length() == 0 and guzheng then return false end
                 if napai:length() == 0 then return false end
                 if room:askForChoice(owner, "tianshu", "nagepai+qigepai") == "nagepai" then
                         room:fillAG(napai, owner)
                         local card_id = room:askForAG(owner, napai, false, "tianshu")
                         room:moveCardTo(sgs.Sanguosha:getCard(card_id), owner, sgs.Player_Hand, true)
                         owner:invoke("clearAG")
                 else
                         --room:getCurrent():turnOver()
						 if room:getCurrent():isKongcheng() then return end
						 room:askForDiscard(room:getCurrent(),"tianshu",1,false,false)
                 end                
        end                
}

shixuezhu=sgs.CreateTriggerSkill{
	name="shixuezhu",
	frequency=sgs.Skill_Compulsory,
	events={sgs.CardEffected},	
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local effect = data:toCardEffect()
		if effect.card:isRed() then
		--if not player:askForSkillInvoke(self:objectName()) then return end
		player:drawCards(1)
		end
	end,
}

zhangxiaofan:addSkill(shixuezhu)
zhangxiaofan:addSkill(shehunbangDS)
zhangxiaofan:addSkill(shehunbang)
--zhangxiaofan:addSkill(tianshu_invoke)
--zhangxiaofan:addSkill(tianshu)

tianbuyi = sgs.General(extension, "tianbuyi", "god",4,true,true)

	shieng_card = sgs.CreateSkillCard
 
{
        name = "shieng",
        target_fixed = false,
        will_throw = false,       
        filter=function(self,targets,to_select)
                return #targets == 0
        end,     
        on_effect=function(self,effect)
                local room = effect.from:getRoom()
                local player = effect.from
                local target = effect.to
                local numb = self:getSubcards():length()
                room:moveCardTo(self,target,sgs.Player_Hand,false)   
if numb<4 then				
                local card_ids = room:getNCards(numb)
                room:fillAG(card_ids,nil)
                room:getThread():delay()
                for _,id in sgs.qlist(card_ids) do
                        card = sgs.Sanguosha:getCard(id)
                        if card:isRed() then
                                room:takeAG(player, id)
                        else
                                room:takeAG(nil, id)
                        end
                end
                room:getThread():delay()
                for _,p in sgs.qlist(room:getAllPlayers()) do
                        p:invoke("clearAG")
               end
                room:setPlayerFlag(player,"shiengused")


		
else

               local card_ids = room:getNCards(3)
                room:fillAG(card_ids,nil)
                room:getThread():delay()
                for _,id in sgs.qlist(card_ids) do
                        card = sgs.Sanguosha:getCard(id)
                        if card:isRed() then
                                room:takeAG(player, id)
                        else
                                room:takeAG(nil, id)
                        end
                end
                room:getThread():delay()
                for _,p in sgs.qlist(room:getAllPlayers()) do
                        p:invoke("clearAG")
               end
                room:setPlayerFlag(player,"shiengused")
        end
		end

}

shieng_vs = sgs.CreateViewAsSkill{
        name = "shieng",        
        n = 200,       
        view_filter=function(self, selected, to_select)
               -- if #selected > sgs.Self:getLostHp() then return false end
			   if #selected > 3 then return false end
        --if to_select:isEquipped() then return false end
        return true 
        end,    
        view_as = function(self, cards)
                if #cards==0 then return false end
                local card=shieng_card:clone()
                for var=1,#cards,1 do
            card:addSubcard(cards[var])                
        end
                card:setSkillName(self:objectName())
        return card
        end,   
        enabled_at_play = function(self,player)
                return not (player:hasFlag("shiengused") or player:isNude())
        end,
 

}


-------------------------
chiyan_card=sgs.CreateSkillCard{
name="chiyan_effect",
target_fixed=false,
will_throw=false,
filter=function(self,targets,to_select)
	return (#targets==0) and to_select:objectName()~=sgs.Self:objectName() and sgs.Self:canSlash(to_select,false)
end,

on_use=function(self,room,source,targets)
    room:setPlayerFlag(source,"chiyan_used")
    room:playSkillEffect("chiyan_vs")
	--local slash=sgs.Sanguosha:getCard(self:getSubcards():at(0))
	--self:getSubcards():removeOne(slash:getEffectiveId())
	room:throwCard(self)
	targets[1]:addMark("qinggang")
	local use_t = sgs.CardUseStruct()
	use_t.card=sgs.Sanguosha:cloneCard("fire_slash",sgs.Card_NoSuit,0)
	use_t.from=source
	use_t.to:append(targets[1])
	use_t.card:setSkillName(self:objectName())--这句话是向战报告知此牌通过哪个技能使用或打出，非常重要。
	room:useCard(use_t,false)--false指不计入杀的次数限制
	targets[1]:removeMark("qinggang")
end,

}

chiyan_vs=sgs.CreateViewAsSkill{
name="chiyan_vs",
n=1,
view_filter=function(self, selected, to_select)
	return (to_select:inherits("Slash")) --and (to_select:isRed())
end,
view_as=function(self, cards)
	if #cards~=1 then return nil end
	local a_chiyan_card=chiyan_card:clone()
	a_chiyan_card:addSubcard(cards[1])
	a_chiyan_card:setSkillName(self:objectName())
	return a_chiyan_card
end,
enabled_at_play=function(self, player)
	return not sgs.Self:hasFlag("chiyan_used") and not player:isNude()
end,
enabled_at_response=function(self, player, pattern)
	return false
end
}

tianbuyi:addSkill(shieng_vs)
tianbuyi:addSkill(chiyan_vs)


luxueqi = sgs.General(extension, "luxueqi", "god",3,false,true)


shenjianyulei=sgs.CreateTriggerSkill
{
    name="shenjianyulei",
    events={sgs.CardLost},
    priority = 7,
    on_trigger=function(self,event,player,data)
	    local room=player:getRoom()
		
		local move=data:toCardMove()
		local card=sgs.Sanguosha:getCard(move.card_id)
		if player:getPhase() == sgs.Player_NotActive then
		if move.from_place == sgs.Player_Hand then
		if room:askForSkillInvoke(player,"shenjianyulei") then
		    room:playSkillEffect("shenjianyulei")
             local duixiang = sgs.SPlayerList()
			 for _,p in sgs.qlist(room:getAllPlayers()) do
				if player:canSlash(p,false) or p:objectName()==player:objectName() then
					duixiang:append(p)
				end
			end
			local to=room:askForPlayerChosen(player,duixiang,"shenjianyulei")
			local use=sgs.CardUseStruct()
	        use.card=sgs.Sanguosha:cloneCard("thunder_slash",sgs.Card_NoSuit,0)
	        use.from=player
	        use.to:append(to)
	        room:useCard(use,false)
			to:drawCards(1)
          
			end
			end
			end
			
			end
			}
			
			mianyiji = sgs.CreateProhibitSkill
{
name = "#mianyiji",
is_prohibited = function(self, from, to, card)
if(to:hasSkill(self:objectName())) then
return (card:inherits("Indulgence") or card:inherits("Lightning") or card:inherits("SupplyShortage")) 
end
end
}

wangyue = sgs.CreateTriggerSkill
{
	name = "wangyue",
	events = {sgs.PhaseEnd},
	frequency=sgs.Skill_Compulsory,
	
	on_trigger = function(self, event, player, data)
		if(player:getPhase() == sgs.Player_Finish) then
			local room = player:getRoom()
			--if(room:askForSkillInvoke(player, "wangyue")) then
				room:playSkillEffect("wangyue")
				player:drawCards(2)
			--end
		end
	end
}
luxueqi:addSkill(wangyue)
luxueqi:addSkill(mianyiji)
luxueqi:addSkill(shenjianyulei)

biyao = sgs.General(extension, "biyao", "god",3,false,true)

--[[shangxinhua=sgs.CreateTriggerSkill
{ 
name="shangxinhua",
events={sgs.CardUsed,sgs.CardEffected,sgs.PhaseChange},
frequency=sgs.Skill_Compulsory,
can_trigger=function(self,player)
return true end,
on_trigger=function(self,event,player,data)	
local room=player:getRoom()
local owner=room:findPlayerBySkillName(self:objectName())
local current=room:getCurrent()
if owner==nil then return false end
if event==sgs.CardUsed then
    if player:objectName()~=current:objectName() then return end
    if player:hasSkill("shangxinhua") then return end
    if owner:hasFlag("shangxinhuatrick") or owner:hasFlag("shangxinhuabasic") then return end
    local use=data:toCardUse() 
	local shangxinhua=false
	for _,p in sgs.qlist(use.to) do
	    if p:objectName()==owner:objectName() then
		    shangxinhua=true
		end
	end
	if shangxinhua==true then
	    if use.card:inherits("BasicCard") then
		    room:setPlayerFlag(owner, "shangxinhuatrick")
		elseif use.card:inherits("TrickCard") then
		    room:setPlayerFlag(owner, "shangxinhuabasic")
		end
	end
elseif event==sgs.CardEffected then
    local effect=data:toCardEffect()
	if effect.from:objectName()~=current:objectName() then return false end
	if effect.to:hasFlag("shangxinhuatrick") and effect.card:inherits("TrickCard") then
        local log= sgs.LogMessage()
        log.type = "#shangxinhuaavoid"
        log.from = effect.to
		log.arg  = effect.card:objectName()
        room:sendLog(log)
        return true
	elseif effect.to:hasFlag("shangxinhuabasic") and effect.card:inherits("BasicCard") then
        local log= sgs.LogMessage()
        log.type = "#shangxinhuaavoid"
        log.from = effect.to
		log.arg  = effect.card:objectName()
        room:sendLog(log)
        return true
	end
	return false
elseif event==sgs.PhaseChange then
    if player:getPhase() == sgs.Player_NotActive then
	    room:setPlayerFlag(owner, "-shangxinhuatrick")
		room:setPlayerFlag(owner, "-shangxinhuabasic")
	end
end
end
}]]

shangxinhua=sgs.CreateTriggerSkill{
	name="shangxinhua",
	frequency=sgs.Skill_NotFrequent,
	events={sgs.PhaseChange},
	priority=3,
	on_trigger=function(self,event,player,data)
		if player:getPhase()~=sgs.Player_Draw then return end
		local room=player:getRoom()
		
		local targets=sgs.SPlayerList()
		for _,p in sgs.qlist(room:getOtherPlayers(player)) do
			if not p:isAllNude() then
				targets:append(p)
			end
		end
		if targets:isEmpty() then return end
		if not player:askForSkillInvoke(self:objectName()) then return end
		local target=room:askForPlayerChosen(player,targets,self:objectName())
		local card_id=room:askForCardChosen(player,target,"hej",self:objectName())
		if(room:getCardPlace(card_id)==sgs.Player_Hand) then
			room:moveCardTo(sgs.Sanguosha:getCard(card_id),player,sgs.Player_Hand,false)
		else
			room:obtainCard(player,card_id)
		end
		 
		
		local slash=room:askForCard(target,"Slash","@shangxinhua")
		if not slash then
		room:loseHp(target, 1)
		end
		return true
	end,
}

----------------------------------------------------------
chiqingzhoucard=sgs.CreateSkillCard{
	name="chiqingzhoucard",
	target_fixed=false,
	filter=function(self, targets, to_select, player)
		return player:inMyAttackRange(to_select) and to_select:objectName()~=player:objectName() and #targets==0
	end,
	on_use=function(self, room, source, targets)
		targets[1]:gainMark("@chiqing")
		--room:loseHp(source)
		source:turnOver()
		source:drawCards(1)
		local recover = sgs.RecoverStruct()
		recover.who = targets[1]
		room:recover(targets[1], recover)

	end,
}

chiqingzhouvs=sgs.CreateViewAsSkill{
	name="chiqingzhouvs",
	view_as=function(self, cards)
		local SNcard=chiqingzhoucard:clone()
		SNcard:setSkillName("chiqingzhou")
		return SNcard
	end,
	enabled_at_play=function(self, player)
		return not player:hasUsed("#chiqingzhoucard")
	end,
}

chiqingzhou=sgs.CreateTriggerSkill{
	name="chiqingzhou",
	frequency=sgs.Skill_NotFrequent,
	events={sgs.PhaseChange},
	view_as_skill=chiqingzhouvs,
	on_trigger=function(self,event,player,data)
		    local room=player:getRoom()
	if player:getPhase()~=sgs.Player_Discard then return end
	if player:getMark("@chiqing") ==0 then return end
		    local log= sgs.LogMessage()
			log.type = "#chiqingzhou"
			log.from = player
			log.arg  = "@chiqing"
			log.arg2  = player:getMark("@chiqing")
			room:sendLog(log)
	end,
			
	can_trigger=function(self,target)
		return true
	end,
}

biyao:addSkill(shangxinhua)
biyao:addSkill(chiqingzhou)
biyao:addSkill(chiqingzhoushangxian)

zengshushu = sgs.General(extension, "zengshushu", "god",4,true,true)

--[[jiaxue=sgs.CreateTriggerSkill{
	name="jiaxue",
	frequency=sgs.Skill_Compulsory,
	events={sgs.PhaseChange},
	priority=4,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if player:getPhase()~=sgs.Player_Discard then return end
		local x=player:getHandcardNum()-player:getHp()
		if x>0 then
			local log= sgs.LogMessage()
				log.type = "#TriggerSkill"
				log.from = player
				log.arg  = self:objectName()
			room:sendLog(log)
		end
		if x>3 then 
			room:askForDiscard(player,self:objectName(),x-3,false,false)
		end
		return true
	end,
}]]

jiaxue=sgs.CreateMaxCardsSkill{
name="jiaxue", 
extra_func=function(self,target) 
	if target:hasSkill(self:objectName()) then
		return 3
	end
end
}

--[] 摸牌阶段，你可以放弃摸牌，若如此做，此回合结束时，你摸3张牌。 
yuanbo=sgs.CreateTriggerSkill{
	name="yuanbo",
	frequency=sgs.Skill_NotFrequent,
	events={sgs.PhaseChange,sgs.PhaseEnd},
	
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if (event==sgs.PhaseChange) and (player:getPhase()==sgs.Player_Draw) then
			if not room:askForSkillInvoke(player,self:objectName(),data) then return end
			room:setPlayerFlag(player,"yuanbo")
			return true
		elseif (event==sgs.PhaseEnd) and (player:getPhase()==sgs.Player_Finish) then
			if player:hasFlag("yuanbo") then
				room:setPlayerFlag(player,"-yuanbo")
				player:drawCards(3)
			end
		elseif (event==sgs.PhaseEnd) and (player:getPhase()==sgs.Player_Finish) then
			room:setPlayerFlag(player,"-yuanbo")
		end
	end,
}

shushubinliang = sgs.CreateProhibitSkill
{
name = "#shushubinliang",
is_prohibited = function(self, from, to, card)
if(to:hasSkill(self:objectName())) then
return (card:inherits("SupplyShortage")) 
end
end
}

zengshushu:addSkill(jiaxue)
zengshushu:addSkill(shushubinliang)
zengshushu:addSkill(yuanbo)

Y_liubiao = sgs.General(extension, "Y_liubiao", "qun", 3)

--刘表 
Y_yangzhengcard = sgs.CreateSkillCard
{ --养政 
	name = "Y_yangzhengcard",
	target_fixed = false,	
	will_throw = false,		
	once = false,
	
	filter = function(self, targets, to_select, player)
	    return #targets == 0 and to_select:objectName()~= sgs.Self:objectName()
	end,
	
	on_use = function(self, room, source, targets)
	    source:gainMark("Y_yangzheng",self:subcardsLength())
		room:playSkillEffect("Y_yangzheng")
		room:moveCardTo(self, targets[1], sgs.Player_Hand, false)
		local x=source:getMark("Y_yangzheng")
		local y=source:getHp()
		if x>=y and source:getMark("Y_yzRec")~=1 then 
			local recover = sgs.RecoverStruct() 
			recover.recover = 1 
			recover.who = source 
			room:recover(source,recover)
			source:setMark("Y_yzRec",1)
		end 
		if source:getHandcardNum()~=0 then
		    room:askForUseCard(source,"@@Y_yangzheng","@Y_yangzheng")
		end
    end,
}

Y_yangzhengvs = sgs.CreateViewAsSkill
{
	name = "Y_yangzheng",
	n = 999,
	
	view_filter = function(self, selected, to_select)                    
		return not to_select:isEquipped()
	end,
	
	view_as = function(self, cards)        
		if #cards == 0 then return end
		local acard = Y_yangzhengcard:clone()
		for i = 1, #cards, 1 do   
			acard:addSubcard(cards[i])                
		end
		acard:setSkillName(self:objectName())
		return acard        
	end,
	
	enabled_at_play=function()
	    return false 
    end,
    
	enabled_at_response=function(self,player,pattern) 
	    return pattern == "@@Y_yangzheng"
    end
}

Y_yangzheng = sgs.CreateTriggerSkill
{
	name = "Y_yangzheng",
	view_as_skill = Y_yangzhengvs,
    events = {sgs.Damaged},
    
	on_trigger=function(self,event,player,data)
        local room = player:getRoom()
		if player:getHandcardNum()<1 then return false end
		player:setMark("Y_yangzheng",0)
		player:setMark("Y_yzRec",0)
	    if(not room:askForSkillInvoke(player, "Y_yangzheng")) then return false end   
        room:askForUseCard(player,"@@Y_yangzheng","@Y_yangzheng")
    end
}

Y_zishou = sgs.CreateTriggerSkill
{ --自守
	name = "Y_zishou",	
	events = {sgs.EventPhaseStart}, 
	frequency = sgs.Skill_NotFrequent,
	
	on_trigger = function(self, event, player, data)
	    local room=player:getRoom()	
	    --local log=sgs.LogMessage()
	    --log.from=player
	    if player:getPhase()==sgs.Player_Draw then	
		    if not player:askForSkillInvoke(self:objectName(),data) then return false end 
		    room:playSkillEffect("Y_zishou")
			player:drawCards(1)
		    player:setFlags("Y_zs")		
		    --log.type ="#Y_zs"	
		    --room:sendLog(log)		
		    return true	
		--[[elseif player:getPhase()==sgs.Player_Play and not player:hasFlag("Y_zs") then
            if not player:askForSkillInvoke(self:objectName(),data) then return false end 
		    room:playSkillEffect("Y_zishou")
		    player:setFlags("Y_zs")		
		    log.type ="#Y_zs"	
		    room:sendLog(log)		
		    return true	]]		
	    elseif player:getPhase()==sgs.Player_Finish and player:hasFlag("Y_zs") then	  
		    local x = player:getMaxHp()
	        local y = player:getHandcardNum()
		    if x<=y then return false end
		    room:playSkillEffect(self:objectName())
		    player:drawCards((x-y))
			--log.type ="#zs"			
			--room:sendLog(log)	
			player:setFlags("-Y_zs")
		end
	end, 
}

Y_liubiao:addSkill(Y_zishou)
Y_liubiao:addSkill(Y_yangzheng)

shenzhonghui = sgs.General(extension, "shenzhonghui", "god", 4,true,true)

quanshu=sgs.CreateTriggerSkill{
	name="quanshu",
	events={sgs.CardUsed,sgs.CardEffected,sgs.CardAsked},
	priority=9,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local use=data:toCardUse()
		local effect = data:toCardEffect()
		
		if event==sgs.CardUsed then
		if use.card:inherits("TrickCard") and use.card:isRed() then
			player:gainMark("@quanshu")
			room:playSkillEffect("quanshu",1)
			end
		end
		
		if event==sgs.CardEffected then
		if effect.card:inherits("TrickCard") and effect.card:isBlack() then
			player:gainMark("@quanshu")
			room:playSkillEffect("quanshu",1)
			end
		end
		
		if event==sgs.CardAsked then
		local pattern = data:toString()
        if pattern == "jink" then
		if player:getMark("@quanshu")<2 then return end
		if not player:askForSkillInvoke("quanshutip") then return end
		player:loseMark("@quanshu",2)
        local jink = sgs.Sanguosha:cloneCard("jink", sgs.Card_NoSuit, 0)
        jink:setSkillName(self:objectName())
        room:provide(jink)
		room:playSkillEffect("quanshu",2)
		return true 
        end
		end
	end,
}

quanshukeep = sgs.CreateMaxCardsSkill{
	name = "#quanshukeep",
	extra_func = function(self, target)
			return target:getMark("@quanshu")
		end
}

ziao=sgs.CreateTriggerSkill{
	name="ziao",
	events=sgs.CardEffected,
	priority=2,
	frequency=sgs.Skill_Compulsory,
	on_trigger=function(self,event,player,data)
	local effect=data:toCardEffect()
	local room=player:getRoom()	
	if event==sgs.CardEffected and effect.from:objectName()~=player:objectName() and effect.card:inherits("TrickCard") then 	
        room:playSkillEffect("ziao")	
		local log=sgs.LogMessage()
		log.type ="#ziao"
		log.arg=player:getGeneralName()
		log.from =effect.from
		room:sendLog(log)	
	
	if(room:askForCard(effect.from, "TrickCard", "@ziao-discard")) then 
				return false
		end	
			log.type ="#ziaonodiscard"
			room:sendLog(log)
			return true
		end
		return false
	end,
}

luazili = sgs.CreateTriggerSkill
{
	name = "luazili",
	events = {sgs.PhaseChange},
	priority=5,
	frequency = sgs.Skill_Wake,
	on_trigger = function(self, event,player, data)
		local room = player:getRoom()
		if player:getMark("@quanshu")<3 then return end
		if player:getMark("luazili")==1 then return end
		if player:getPhase()~=sgs.Player_RoundStart then return end
		room:playSkillEffect("luazili")
		for _,pl in sgs.qlist(room:getAllPlayers()) do
						pl:invoke("animate", "lightbox:$luazili:4200")
						end		
		--player:unicast(string.format("%s %s","animate","lightbox:$luazili:4000"))
		room:getThread():delay(4200)
		room:setEmotion(player,"luazili")
		local recover=sgs.RecoverStruct()
			recover.recover=1
			recover.card=nil
			recover.who=player
		room:recover(player, recover)
		player:drawCards(2)
		room:acquireSkill(player, "luayexin")
		player:setMark("luazili",1)
		end
}

luayexin=sgs.CreateTriggerSkill{
	name="luayexin",
	frequency=sgs.Skill_NotFrequent,
	events={sgs.CardResponsed,sgs.CardUsed},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
if event==sgs.CardResponsed then
		local card=data:toCard()
		if not card:inherits("BasicCard") then return end
		--card:setSkillName(self:objectName())--这句话是向战报告知此牌通过哪个技能使用或打出，非常重要。
		if player:getMark("@quanshu")==0 then return end
				local targets = sgs.SPlayerList()
					for _,p in sgs.qlist(room:getAllPlayers()) do
						if player:inMyAttackRange(p) and not p:isAllNude() then
							targets:append(p)
						end
					end
		if targets == nil then return end
		
		if not player:askForSkillInvoke(self:objectName()) then return end
		player:loseMark("@quanshu",1)

		local target=room:askForPlayerChosen(player,targets,self:objectName())
		if target:isAllNude() then 
		local damage=sgs.DamageStruct()
				damage.damage=1
				damage.from=player
				damage.to=target
			    room:damage(damage)
				room:playSkillEffect("luayexin",2)
		else		
		local choice=room:askForChoice(player,"luayexin","getcard+fuckit")
		if choice=="getcard" then
				room:playSkillEffect("luayexin",1)
		        card_id=room:askForCardChosen(player,target,"hej","getcardtip")
		        room:obtainCard(player,card_id)
		end
		
		if choice=="fuckit" then
		local damage=sgs.DamageStruct()
				damage.damage=1
				damage.from=player
				damage.to=target
			    room:damage(damage)
				room:playSkillEffect("luayexin",2)
				end
          end
    end		  
		
		
		
if event==sgs.CardUsed then
		local use=data:toCardUse()
		if not use.card:inherits("BasicCard") then return end
		--use.card:setSkillName(self:objectName())--这句话是向战报告知此牌通过哪个技能使用或打出，非常重要。
		if player:getMark("@quanshu")==0 then return end
				if player:getMark("@quanshu")==0 then return end
				local targets = sgs.SPlayerList()
					for _,p in sgs.qlist(room:getAllPlayers()) do
						if player:inMyAttackRange(p) then
							targets:append(p)
						end
					end
		if targets == nil then return end
		
		if not player:askForSkillInvoke(self:objectName()) then return end
		player:loseMark("@quanshu",1)

		local target=room:askForPlayerChosen(player,targets,self:objectName())
		if target:isAllNude() then 
		local damage=sgs.DamageStruct()
				damage.damage=1
				damage.from=player
				damage.to=target
			    room:damage(damage)
				room:playSkillEffect("luayexin",2)
		else		
		local choice=room:askForChoice(player,"luayexin","getcard+fuckit")
		if choice=="getcard" then
				room:playSkillEffect("luayexin",1)
		        card_id=room:askForCardChosen(player,target,"hej","getcardtip")
		        room:obtainCard(player,card_id)
		end
		
		if choice=="fuckit" then
		local damage=sgs.DamageStruct()
				damage.damage=1
				damage.from=player
				damage.to=target
			    room:damage(damage)
				room:playSkillEffect("luayexin",2)
				end
          end
	end	
end,
}

local skill=sgs.Sanguosha:getSkill("luayexin")
if not skill then
local skillList=sgs.SkillList()
skillList:append(luayexin)
sgs.Sanguosha:addSkills(skillList)
end

shenzhonghui:addSkill(quanshu)
shenzhonghui:addSkill(quanshukeep)
shenzhonghui:addSkill(ziao)
shenzhonghui:addSkill(luazili)

xiahouen = sgs.General(extension, "xiahouen", "wei",4,true,true)

jianqi = sgs.CreateTriggerSkill
{
	name = "jianqi",
	events = {sgs.PhaseChange,sgs.Predamage},
	frequency = sgs.Skill_Compulsory,
	priority = 5,
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		if event == sgs.PhaseChange and player:getPhase() == sgs.Player_RoundStart then
			local qinggang_sword = nil
			
			for _, p in sgs.qlist(room:getOtherPlayers(player)) do
				for _, cd in sgs.qlist(p:getCards("hej")) do
					if cd:inherits("QinggangSword")  then 
						qinggang_sword = cd
						
						break
					end 
				end
			end
			if  qinggang_sword ~= nil then
				room:moveCardTo(qinggang_sword, player, sgs.Player_Hand, true)
				room:playSkillEffect("jianqi")
			
			end
            end
			
		if event == sgs.Predamage then
		local damage = data:toDamage()
		if not damage.card:isKindOf("Slash") then return end
		if not player:getWeapon():isKindOf("QinggangSword") then return end
		local log = sgs.LogMessage()
			log.from = player
			log.to:append(damage.to)
			log.type ="#jianqitip"
			log.arg = tonumber(damage.damage)
			log.arg2 = log.arg+1
			room:sendLog(log)	
			damage.damage = damage.damage+1
			data:setValue(damage)
		end
		
	end,
}
----------------------------------------
jianyi = sgs.CreateTriggerSkill
{
	name = "jianyi",
	events = {sgs.PhaseChange},
	frequency = sgs.Skill_NotFrequent, 
	priority = 3,
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		if event == sgs.PhaseChange and player:getPhase() == sgs.Player_Start then
			local targets = sgs.SPlayerList()
		    for _,p in sgs.qlist(room:getAlivePlayers()) do
            if player:inMyAttackRange(p) then
			    targets:append(p)
			end
			end
		if targets==nil then return end
		if not player:askForSkillInvoke(self:objectName(),data) then return end
		local target=room:askForPlayerChosen(player,targets,"shadetishi")
		local jink=room:askForCard(target,"Jink","tishiyuyan",data)
			if jink~=nil then
		    player:obtainCard(jink) 
            end
		if not jink then
		local slasher = sgs.SPlayerList()
			for _,p in sgs.qlist(room:getAlivePlayers()) do
		    if p:canSlash(target,false) then
			    slasher:append(p)
			end
			end
			if slasher==nil then return end
			sharenzhe = room:askForPlayerChosen(player, slasher, "sharentishi")
			
		    local use=sgs.CardUseStruct()
	        use.card=sgs.Sanguosha:cloneCard("slash",sgs.Card_NoSuit,0)
	        use.from=sharenzhe
	        use.to:append(target)
	        room:useCard(use,false)
		end
		end
		
		if event == sgs.PhaseChange and player:getPhase() == sgs.Player_Finish then
			local targets = sgs.SPlayerList()
		    for _,p in sgs.qlist(room:getOtherPlayers(target)) do
            if p:inMyAttackRange(player) then
			    targets:append(p)
			end
			end
		if targets==nil then return end
		if not player:askForSkillInvoke(self:objectName(),data) then return end
		local target=room:askForPlayerChosen(player,targets,"juedoudetishi")
		local slash=room:askForCard(target,"Slash","tishiciyu",data)
			if slash~=nil then
		    player:obtainCard(slash) 
            end
		if not slash then
		local dueler = sgs.SPlayerList()
			for _,p in sgs.qlist(room:getOtherPlayers(target)) do
			    dueler:append(p)
			end
			if dueler==nil then return end
			juedouzhe = room:askForPlayerChosen(player, dueler, "juedoutishi")
			
		    local use=sgs.CardUseStruct()
	        use.card=sgs.Sanguosha:cloneCard("duel",sgs.Card_NoSuit,0)
	        use.from=juedouzhe
	        use.to:append(target)
	        room:useCard(use,false)
		end
		end
		
	end,
}
----------------------------------------
xiahouen:addSkill(jianqi)
xiahouen:addSkill(jianyi)
--------------------------------
jiexian_guanyu = sgs.General(extension, "jiexian_guanyu", "shu","4",true,true,true)


jiexian_yijueCard = sgs.CreateSkillCard{
	name = "jiexian_yijueCard",
	target_fixed=false,
	will_throw=false,
	filter = function(self, targets, to_select, player)
		return #targets == 0 and not to_select:isKongcheng() and to_select:objectName() ~= player:objectName()
	end,

	on_use=function(self, room, source, targets)
	
		local success = source:pindian(targets[1],"jiexian_yijue",sgs.Sanguosha:getCard(self:getEffectiveId()))
		if success then
		    room:playSkillEffect("jiexian_yijue",1)
		    source:addMark("yijueused")
			room:setPlayerMark(targets[1], "@yijue",1)
			room:setPlayerCardLock(targets[1], "Card")
			
			local hp = targets[1]:getHp()
            local maxhp = targets[1]:getMaxHp()
			
			targets[1]:setTag("hided",sgs.QVariant(targets[1]:getGeneralName()))
			if targets[1]:isMale() then
			room:transfigure(targets[1],"sujiang",false,false)
			room:setPlayerProperty(targets[1],"hp",sgs.QVariant(hp))
			else
			room:transfigure(targets[1],"sujiangf",false,false)
			room:setPlayerProperty(targets[1],"hp",sgs.QVariant(hp))
			end
			
			if targets[1]:getGeneral2() then
			targets[1]:setTag("hided2",sgs.QVariant(targets[1]:getGeneral2Name()))
			if targets[1]:getGeneral2():isMale() then
			room:setPlayerProperty(targets[1],"general2",sgs.QVariant("sujiang"))
			room:setPlayerProperty(targets[1],"maxhp",sgs.QVariant(maxhp))
			else
			room:setPlayerProperty(targets[1],"general2",sgs.QVariant("sujiangf"))
			room:setPlayerProperty(targets[1],"maxhp",sgs.QVariant(maxhp))
			end
			
			end
			
		else
			if targets[1]:isWounded() then
				if  source:askForSkillInvoke("jiexian_yijue", sgs.QVariant("recover")) then
				    room:playSkillEffect("jiexian_yijue",2)
					local recover = sgs.RecoverStruct()
					recover.who = source
					room:recover(targets[1], recover)
				end
			end
		end
	end
}

jiexian_yijue = sgs.CreateViewAsSkill{
	name = "jiexian_yijue",
	n=1,
	view_filter=function(self, selected, to_select)
		return not to_select:isEquipped() and not sgs.Self:isKongcheng()
	end,
	view_as = function(self, cards)
		if #cards~=1 then return end
		local jiexian_card=jiexian_yijueCard:clone()
		jiexian_card:addSubcard(cards[1])
		jiexian_card:setSkillName(self:objectName())
		return jiexian_card
	end,
	
	enabled_at_play = function(self, player)
		return not player:hasUsed("#jiexian_yijueCard") and not player:isKongcheng()
	end,
}

jiexian_yijueclear = sgs.CreateTriggerSkill{
	name = "#jiexian_yijueclear",
	events = {sgs.PhaseChange,sgs.Death},
	view_as_skill = jiexian_yijue,
	
    can_trigger = function(self, target)
    return target:hasSkill(self:objectName())
    end,
	
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
	if ((event == sgs.PhaseChange and player:getPhase() == sgs.Player_NotActive) or event == sgs.Death) and player:getMark("yijueused")>0 then
		
		for _,p in sgs.qlist(room:getOtherPlayers(player)) do
		        if p:getMark("@yijue")>0 then
				room:clearPlayerCardLock(p)
				room:setPlayerMark(p, "@yijue", 0)
				
			local hp = p:getHp()	
			local maxhp = p:getMaxHp()
            room:transfigure(p,p:getTag("hided"):toString(),false,false)
            room:setPlayerProperty(p,"hp",sgs.QVariant(hp))			
			p:setTag("hided",sgs.QVariant())
			
			if p:getGeneral2() then
 			room:setPlayerProperty(p, "general2", sgs.QVariant(p:getTag("hided2"):toString()))
			room:setPlayerProperty(p,"maxhp",sgs.QVariant(maxhp))
            p:setTag("hided2",sgs.QVariant())
			end
			end
		end
	end
	
		return false
	end,
}

jiexian_wusheng = sgs.CreateViewAsSkill{
	name = "jiexian_wusheng",
	n = 1,
	view_filter = function(self, selected, to_select)
		if not to_select:isRed() then
			return false
		end
		local weapon = sgs.Self:getWeapon()
		if weapon then
			if to_select == weapon then
				if to_select:objectName() == "Crossbow" then
					return sgs.Self:canSlashWithoutCrossbow()
				end
			end
		end
		return true
	end,
	view_as = function(self, cards)
		if #cards == 0 then
			return nil
		elseif #cards == 1 then
			local card = cards[1]
			local slash = sgs.Sanguosha:cloneCard("slash", card:getSuit(), card:getNumber()) 
			slash:addSubcard(card:getId())
			slash:setSkillName(self:objectName())
			return slash
		end
	end,
	enabled_at_play = function(self, player)
		return sgs.Slash_IsAvailable(player)
	end, 
	enabled_at_response = function(self, player, pattern)
		return pattern == "slash"
	end,
}
------------------------------------

----------------------------------------------------
jiexian_guanyu:addSkill(jiexian_yijue)
jiexian_guanyu:addSkill(jiexian_yijueclear)
jiexian_guanyu:addSkill("wusheng")
jiexian_guanyu:addSkill("mashu")
-------------------------------------------
KM = sgs.General(extension, "KM", "god",4,true,true)
---------------

zhijii=sgs.CreateTriggerSkill{
	name="zhijii",
	events={sgs.PhaseChange,sgs.Death,sgs.CardEffected,sgs.CardLostDone,sgs.Predamaged,sgs.PhaseEnd,sgs.TurnStart},
	priority=999,
	frequency=sgs.Skill_Compulsory,
	on_trigger=function(self,event,player,data)
	
if event == sgs.PhaseChange and player:getPhase() == sgs.Player_Start then
	local room=player:getRoom()
	 local log=sgs.LogMessage()
        log.from = player
		log.arg = self:objectName()
        log.type ="#kaishi"
        room:sendLog(log)
		local judge=sgs.JudgeStruct()
			judge.pattern=sgs.QRegExp("(.*):(.*):(A|[2-5])")
			judge.good=true
			judge.reason=player:objectName()
			judge.who=player
		    room:judge(judge)
		    if judge:isBad() then
			player:drawCards(1)
			player:turnOver()
			end	
			
			if judge:isGood() then
			local shuner = sgs.SPlayerList()
			for _,p in sgs.qlist(room:getOtherPlayers(player)) do
			if not p:isAllNude()then--除你之外区域内有牌的人放一堆
			    shuner:append(p)
				end
			end
			
			
			
			if shuner:isEmpty() then--如果除你之外没人区域内有牌了
			local juedouer = sgs.SPlayerList()
			for _,e in sgs.qlist(room:getOtherPlayers(player)) do
			    juedouer:append(e)--准备决斗之
			end
			juezhe = room:askForPlayerChosen(player, juedouer, "zhijiijue")
			
		    local use=sgs.CardUseStruct()
	        use.card=sgs.Sanguosha:cloneCard("duel",sgs.Card_NoSuit,0)
	        use.from=juezhe
	        use.to:append(player)
	        room:useCard(use,false)--执行决斗
			end
		-------
		if not shuner:isEmpty() then
		local juedouer = sgs.SPlayerList()
			for _,e in sgs.qlist(room:getOtherPlayers(player)) do
			    juedouer:append(e)
			end
		local choise = room:askForChoice(player,self:objectName(), "shun+jue")
		if choise=="jue" then
			juezhe = room:askForPlayerChosen(player, juedouer, "zhijiijue")
		    local use=sgs.CardUseStruct()
	        use.card=sgs.Sanguosha:cloneCard("duel",sgs.Card_NoSuit,0)
	        use.from=juezhe
	        use.to:append(player)
	        room:useCard(use,false)
			end
			
			if choise=="shun" then
			shunzhe = room:askForPlayerChosen(player, shuner, "zhijiishun")
			
		    local use=sgs.CardUseStruct()
	        use.card=sgs.Sanguosha:cloneCard("snatch",sgs.Card_NoSuit,0)
	        use.from=player
	        use.to:append(shunzhe)
	        room:useCard(use,false)
			end
			end
			end
--------------------		
			end
		   
			

		
		if event == sgs.PhaseEnd and player:getPhase() == sgs.Player_Finish then
		local room=player:getRoom()
		 local log=sgs.LogMessage()
        log.from = player
		log.arg = self:objectName()
        log.type ="#jieshu"
        room:sendLog(log)
		local judge=sgs.JudgeStruct()
			judge.pattern=sgs.QRegExp("(.*):(.*):(A|[2-5])")
			judge.good=true
			judge.reason=player:objectName()
			judge.who=player
		    room:judge(judge)
			if judge:isBad() then
			if player:isNude() then return end
			room:askForDiscard(player,self:objectName(),1,false,true)
			player:turnOver()
			end
if judge:isGood() then
			player:gainAnExtraTurn()
end
			
			end
			
		
	if event==sgs.Predamaged and player:getMark("@kong")>0 then 
	local room=player:getRoom()
		local damage = data:toDamage()
		--local damage=sgs.DamageStruct()
		if not (damage.damage>player:getMark("@kong")) then
		local x=damage.damage
		room:setPlayerMark(player, "@kong",player:getMark("@kong")-x)
		local log=sgs.LogMessage()
			log.from =player
			log.type ="#kongjianshang1"
			log.arg = tonumber(x)
			log.arg2 = 0
			room:sendLog(log)
		
			damage.damage = 0
			data:setValue(damage)
		end
		
		if damage.damage>player:getMark("@kong") then
		local y=player:getMark("@kong")
		local log=sgs.LogMessage()
			log.from =player
			log.type ="#kongjianshang2"
			log.arg = tonumber(damage.damage)
			log.arg2 = tonumber(damage.damage - y)
			room:sendLog(log)
		
			damage.damage = damage.damage - y
			data:setValue(damage)
			player:loseAllMarks("@kong")
		end
		end
		
	if event==sgs.CardLostDone then
	local room=player:getRoom()
	if player:isKongcheng()then
 local log=sgs.LogMessage()
        log.from = player
		log.arg = self:objectName()
        log.type ="#huodekong"
        room:sendLog(log)	
	player:gainMark("@kong")
	end
	end
	
	if (event==sgs.PhaseChange) and (player:getPhase()==sgs.Player_Draw) then
	local room=player:getRoom()
			return true
			end
	
		if (event == sgs.PhaseChange and player:getPhase() == sgs.Player_RoundStart) then
		local room=player:getRoom()
		for _,p in sgs.qlist(room:getAllPlayers()) do
		room:setPlayerFlag(p,"TanhuTarget")
	end
        
	end   		
	
	    if(event == sgs.Death or (event == sgs.PhaseChange and player:getPhase() == sgs.Player_NotActive)) then
		local room=player:getRoom()
		for _,p in sgs.qlist(room:getAllPlayers()) do
		if (p:hasFlag("TanhuTarget")) then
		room:setPlayerFlag(p,"-TanhuTarget")
	end
	end
	end
	
	if event==sgs.TurnStart then
	local room=player:getRoom()
	if player:getMark("@kong")>=10 then
	local loser = sgs.SPlayerList()
			for _,s in sgs.qlist(room:getAllPlayers()) do
			    loser:append(s)--准备减上限
			end
			loszhe = room:askForPlayerChosen(player, loser, "zhijiilos")
			player:loseMark("@kong", 10)
	        room:loseMaxHp(loszhe,1)
			end
			end
	
	
	if event==sgs.CardEffected then
	local effect=data:toCardEffect()
	local room=player:getRoom()	
	if event==sgs.CardEffected and effect.from:objectName()~=player:objectName() and effect.card:isNDTrick() and effect.from~=nil	then	
        room:playSkillEffect("zhijii")	
		local log=sgs.LogMessage()
		log.type ="#zhijii"
		log.arg=player:getGeneralName()
		log.from =effect.from
		room:sendLog(log)	
	    effect.to = effect.from
		room:cardEffect(effect)
			return true
		end
		end
		return false
	end,
}

---------------
KM:addSkill(zhijii)
KM:addSkill("kongcheng")
KM:addSkill("#kongcheng-effect")
--------------------------------------
wuming = sgs.General(extension, "wuming", "god",2,true,true)
tianjian=sgs.CreateTriggerSkill{
	name="tianjian",
	events={sgs.CardEffected},
	priority=999,
	frequency=sgs.Skill_Compulsory,
	on_trigger=function(self,event,player,data)
	local effect=data:toCardEffect()
	local room=player:getRoom()	
	if event==sgs.CardEffected and effect.from:objectName()~=player:objectName() and effect.from~=nil	then	
        --room:playSkillEffect("tianjian")	
		local log=sgs.LogMessage()
		log.type ="#tianjian"
		log.arg=player:getGeneralName()
		log.from =effect.from
		room:sendLog(log)	
	    effect.to = effect.from
		room:cardEffect(effect)
			return true
		end
		return false
	end,}
wuming:addSkill(tianjian)




-------------------------------------
sgs.LoadTranslationTable{
----------------------------
["wuming"] = "无名",
["#wuming"] = "武林神话",
["tianjian"]="天剑",
	[":tianjian"]="<font color=\"blue\"><b>锁定技</b></font>：其他角色使用的牌对你无效并反作用于其自身。",
	["#tianjian"] = "<b><font color='red'>无名的被动技能【天剑】生效，该牌无效并反作用于使用者！</font></b>",
 ["KM"] = "孔明",
    ["#KM"] = "智计无双",
	["zhijii"]="智计无双",
	[":zhijii"]="<font color=\"blue\"><b>锁定技</b></font>\n<font color=\"red\"><b>★</b></font>你使用即时锦囊不可被无懈，其他角色使用的即时锦囊对你无效并反作用于其自身。\n<font color=\"red\"><b>★</b></font>你不摸牌，你失去牌后若为空城状态，获得1枚“空”标记（每枚“空”自动抵消1点伤害）；回合开始时若“空”达到10，你失去10枚“空”，令一名角色失去一点体力上限。\n<font color=\"blue\"><b>★</b></font>回合开始阶段，你进行一次判定，若点数≤5，选择一名其他角色视为<font color=\"purple\"><b>你对其</b></font>使用了一张【顺手牵羊】或<font color=\"purple\"><b>其对你</b></font>使用了一张【决斗】（无色无点数，无视禁止免疫），反之你摸1张牌并翻面。\n<font color=\"blue\"><b>★</b></font>回合结束阶段，你进行一次判定，若点数≤5，你获得一个额外的回合，反之你弃1张牌并翻面（无牌则不执行效果）。",
    ["zhijiishun"]="【智计无双】：视为你对其使用了一张【顺手牵羊】",
	 ["zhijiijue"]="【智计无双】：视为其对你使用了一张【决斗】",
	  ["zhijiilos"]="【智计无双】：其失去１点体力上限",
	["@kong"]="空",
	["#kongjianshang1"] = "%from的技能<b><font color='red'>智计无双</font></b>被触发，失去 %arg 枚【空】标记，受到的 %arg 点伤害减少至 %arg2 点！",
		["#kongjianshang2"] = "%from的技能<b><font color='red'>智计无双</font></b>被触发，受到的 %arg 点伤害减少至 %arg2 点！",
	["#zhijii"] = "<b><font color='red'>孔明的【智计无双】生效，该锦囊无效并反作用于使用者！</font></b>",
	["#kaishi"] = "<b><font color='red'>孔明回合开始！</font></b>",
	["#jieshu"] = "<b><font color='red'>孔明回合结束！</font></b>",
	["#huodekong"] = "<b><font color='red'>孔明失去牌时为空城状态！</font></b>",
		["shun"] = "顺手牵羊",
			["jue"] = "决斗",
	
	
	
	--------------------------------------------
	["jiexian_guanyu"] = "界·关羽",
	--["&jiexian_guanyu"] = "关羽",
	["#jiexian_guanyu"]="义薄云天",
	["jiexian_yijue"] = "义绝",
	["jiexian_yijueCard"] = "义绝",
	["@yijue"] = "义绝",
	[":jiexian_yijue"] = "<font color=\"blue\"><b>出牌阶段限一次</b></font>，你可以与一名其他角色拼点，若你赢，则直到你的回合结束，<font color=\"red\"><b>该角色不能使用或打出牌且所有技能失效</b></font>，否则你可使该角色回复１点体力。",
	["jiexian_yijue:recover"] = "你可以使该角色回复1点体力",
	["$jiexian_yijue1"] = "恩已断，义当绝！",
	["$jiexian_yijue2"] = "关某向来恩怨分明。",
	["~jiexian_guanyu"]="桃园一拜，恩义常在...",

	["xiahouen"] = "夏侯恩",
	["#xiahouen"]="长坂剑神",
    ["jianqi"]="剑气",
	[":jianqi"]="<font color=\"blue\"><b>锁定技</b></font>，回合开始时，若场上有<font color=\"red\"><b>【青釭剑】</b></font>，你立刻获得之；你使用【青釭剑】杀伤敌人时伤害＋１。",
	["#jianqitip"] = "%from 发动了技能【<font color=\"orange\"><b>剑气</b></font>】，对 %to 造成的 %arg 点伤害提高至 %arg2 点",
	["jianyi"]="剑意",
	[":jianyi"]="<font color=\"purple\"><b>回合开始阶段</b></font>，你可指定攻击范围内的一名角色Ａ交给你一张【闪】，否则你须指定一名其他角色Ｂ，视为Ｂ对Ａ使用了一张【杀】；<font color=\"purple\"><b>回合结束阶段</b></font>，你可指定攻击范围内有你的一名角色Ａ交给你一张【杀】，否则你须指定一名其他角色Ｂ，视为Ｂ对Ａ使用了一张【决斗】。",
	["tishiyuyan"]="请交给夏侯恩一张【闪】",
	["tishiciyu"]="请交给夏侯恩一张【杀】",
	["shadetishi"]="该角色须交给你一张【闪】",
	["juedoudetishi"]="该角色须交给你一张【杀】",
	["sharentishi"]="视为其对目标角色使用了一张【杀】",
	["juedoutishi"]="视为其对目标角色使用了一张【决斗】",
------------------------------------------------------------------
    ["shenzhonghui"] = "神钟会",
    ["#shenzhonghui"] = "桀骜的野心家",
	["quanshu"]="权术",
	[":quanshu"]="你使用红色锦囊或成为黑色锦囊目标时获得１枚“权”标记，你的手牌上限＋Ｘ（Ｘ＝“权”数）；<font color=\"purple\"><b>２枚“权”可当【闪】</b></font>。",
    ["@quanshu"]="权",
	["quanshutip"]="权术",
	["ziao"]="自傲",
	[":ziao"]="<font color=\"blue\"><b>锁定技</b></font>：其他角色对你使用锦囊时，须弃置一张锦囊牌，否则该锦囊对你无效。",
	["#ziao"]="%arg 的技能“<b><font color='yellow'>自傲</font></b>”被触发,%from 须额外弃一张锦囊牌才能使该牌生效",
	["@ziao-discard"]="请弃置一张锦囊牌，否则该锦囊对神钟会无效",
	["#ziaonodiscard"]="%from 使用的锦囊对 %arg 无效",
	["luazili"]="自立",
	[":luazili"]="<font color=\"red\"><b>觉醒技</b></font>：回合开始时，若“权”数≥３，你回复１点体力并摸２张牌，获得技能“野心”（你使用或打出一张基本牌时，可弃１枚“权”标记，获得攻击范围内一名角色区域中的１张牌或对该角色造成１点伤害）。",
	["$luazili"]="欲取天下，当在此时！",
	["luayexin"]="野心",
	[":luayexin"]="你使用或打出一张基本牌时，可弃１枚“权”标记，获得攻击范围内一名角色区域中的１张牌或对该角色造成１点伤害。",
	["getcard"]="获得其区域中的１张牌",
	["fuckit"]="对其造成１点伤害",
	["getcardtip"]="【野心★拿牌】：获得目标角色区域内１张牌",
	["~shenzhonghui"]="伯约，让你失望了...",
	["$quanshu1"] = "先让你得意几天。",
	["$quanshu2"] = "这仇，我记下了。",
	["$ziao"] = "哼！",
	["$luazili"] = "欲取天下，当在此时！",
	["$luayexin1"] = "此地容不下你。",
	["$luayexin2"] = "妨碍我的人都得死！",
	
	
["Y_liubiao"]="流氓表",
	["Y_zishou"] = "退守",
	[":Y_zishou"] =  "摸牌阶段你可少摸一张牌，若如此做，回合结束阶段将手牌补至体力上限。",
	["Y_yangzheng"] = "养政",
	["Y_yangzhengcard"] = "养政", 
	["Y_yangzhengcard"] = "养政",
	["@Y_yangzheng"] = "选择你要给出的牌，然后指定一名角色", 
	["~Y_yangzheng"] = "若给出的牌张数累计不少于两张，你回复1点体力。", 
	[":Y_yangzheng"] ="你受到伤害后，可将任意数量的手牌交给其他角色，累计给出的牌数≥当前体力值时，你回复１点体力。",
   	["$Y_zishou"]="让我好好考虑一下",
	["$Y_yangzheng"]="惟贤惟德能服于人",
    ["#Y_liubiao"] = "跨蹈汉南", 
	["~Y_liubiao"]="何人继承大业啊",
	["designer:Y_liubiao"] = "ByArt",
	["cv:Y_liubiao"] ="",
    ["illustrator:liubiaom"]="官方",
	
["zengshushu"] = "曾书书",
["jiaxue"] = "家学",	
[":jiaxue"]="<font color=\"blue\"><b>锁定技</b></font>：你不能成为兵粮寸断的目标；你的手牌上限＋3。",	
["yuanbo"] = "渊博",	
[":yuanbo"]="摸牌阶段，你可以放弃摸牌，若如此做，回合结束阶段你摸3张牌。",	

["biyao"] = "碧瑶",
["shangxinhua"] = "伤心花",	
	--[":shangxinhua"] = "<font color=\"blue\"><b>锁定技</b></font>：<font color=\"red\"><b>其他角色在其回合内第一次指定你为一张牌的目标时</b></font>，若此牌为【基本牌/即时锦囊】，该回合内其对你使用的【即时锦囊/基本牌】将失效。",	
	[":shangxinhua"]="摸牌阶段，你可以放弃摸牌，改为获得一名其他角色区域内的一张牌，然后该角色须打出一张<font color=\"red\"><b>【杀】</b></font>，否则失去１点体力",
	["#shangxinhuaavoid"] = "%from 的锁定技 【<font color='yellow'><b>伤心花</b></font>】 被触发，这张 %arg 对其无效",	
	["@shangxinhua"]="请打出一张【杀】，否则失去１点体力",
	
	["chiqingzhou"]="痴情咒",
	[":chiqingzhou"]="<font color=\"green\"><b>出牌阶段限一次</b></font>：你可以将武将牌翻面并摸一张牌，令你攻击范围内的一名其他角色<font color='blue'><b>回复１点体力</b></font>并获得一枚“痴情”标记。\n◆<font color='purple'><b>该角色每拥有一枚“痴情”标记，手牌上限便＋１</b></font>",
	["chiqingzhouvs"]="痴情咒",
	["chiqingzhoucard"]="痴情咒",
	["@chiqing"]="痴情",
	["#chiqingzhou"]="<font color=\"yellow\"><b>%from拥有的%arg标记效果被触发</b></font>，手牌上限＋<font color=\"red\">【%arg2】</font> ",
	
	
	
["luxueqi"] = "陆雪琪",
["shenjianyulei"] = "神剑御雷",
	[":shenjianyulei"] = "你在回合外失去手牌时，可视为对一名角色使用了一张<font color=\"red\"><b>【无色雷杀】</b></font>。\n◆<font color=\"green\"><b>此【杀】结算完毕后该角色摸一张牌</b></font>",
["wangyue"] = "天琊望月",
[":wangyue"] = "<font color=\"blue\"><b>锁定技</b></font>：你不能成为延时锦囊的目标；回合结束阶段，你摸２张牌。",



["zhangxiaofan"] = "张小凡",
["nagepai"]="拿一张弃掉的牌",
["qigepai"]="令其弃一张手牌",
["shixuezhu"]="噬血",
	[":shixuezhu"]="<font color=\"blue\"><b>锁定技</b></font>：成为红色牌目标时你摸１张牌",
		["shehunbang"]="摄魂",
		["shehunbangCard"]="摄魂",
	[":shehunbang"]="<font color=\"blue\"><b>出牌阶段限一次</b></font>：你可以弃置一张牌，获得<font color=\"green\"><b>无视</b></font><font color=\"red\"><b>距离</b></font>效果直到回合结束",	
	["tianshu"]="天书",
	[":tianshu"]="<font color=\"blue\"><b>锁定技</b></font>：其他角色弃牌阶段结束时，若弃牌数大于１，则你须进行二选一：\n◆获得一张所弃的牌\n◆令其弃置一张手牌",
	["tianshu_invoke"]="天书",

["tianbuyi"] = "田不易",
	["shieng"]="师恩",
	["shieng_vs"]="师恩",
	["shieng_card"]="师恩",
	[":shieng"]="<font color=\"blue\"><b>出牌阶段限一次</b></font>：你可以将Ｘ张牌（<font color=\"green\"><b>包括装备</b></font>）交给一名其他角色，然后展示牌堆顶Ｘ张牌(至多为３)，获得其中所有红色牌，然后将其余的置入弃牌堆。",
	["chiyan_vs"]="赤焰",
	["chiyan_card"]="赤焰",
	["chiyan_effect"]="赤焰",
	[":chiyan_vs"]="<font color=\"green\"><b>出牌阶段限一次</b></font>：你可以将一张【杀】当<font color=\"blue\"><b>无视距离和防具</b></font>的<font color=\"red\"><b>【无色火杀】</b></font>使用。\n◆<font color=\"purple\"><b>此【杀】不计入每回合使用限制</b></font>",

["wanghaifeng"] = "王海峰",
["#wanghaifeng"] = "神喵",
["~wanghaifeng"] = "破碎虚空，化羽登仙···", 
	["chunqiu"] = "春秋",
	[":chunqiu"] = "回合外成为<font color=\"red\"><b>即时锦囊</b></font>目标时，你可弃置一张牌令当前阶段立即终止",
	["xinghe"] = "星河",
	["$xinghe1"] = "三千强弩，乱箭肃敌！（万箭齐发）",
	["$xinghe2"] = "万象奔腾，随吾心意！（南蛮入侵）",
	["$xinghe3"] = "星汉灿烂，若出其里。（发动后）",
	["wjqf"] = "万箭齐发",
	["nmrq"] = "南蛮入侵",
	[":xinghe"] = "回合开始阶段，你可跳过判定和摸牌，视为使用了一张<font color=\"blue\"><b>万箭齐发/南蛮入侵</b></font>\n◆<font color=\"green\"><b>发动后，回合结束你摸２张牌</b></font>",
	["miaoyu"]="喵语",
	["$miaoyu1"] = "滚滚惊雷，震天撼地。（雷杀）",
	["$miaoyu2"] = "星星之火，可以燎原。（火杀）",
	[":miaoyu"]="其他角色使用<font color=\"red\"><b>属性杀</b></font>时，该角色和你可以各摸一张牌，然后交换一张牌\n◆<font color=\"green\"><b>均从该角色开始</b></font>",
	["lundao"]="论道",
	[":lundao"]="回合开始时，你可依次执行以下两项行动：\n★令攻击范围内的角色各弃一张牌\n★将此阶段中被弃置的牌任意分配",
    ["lundaoo"]="论道",
    ["$lundaoo1"] = "代天宣化，普世救人。（红桃）",
	["$lundaoo2"] = "龙困浅滩，一击可擒！（翻过去）",
	["$lundaoo3"] = "援军已至，即刻突围！（翻回来）",
	["$lundaoo4"] = "戮力同心，大事可图。（方块）",
	["$lundaoo5"] = "分兵于汝，直捣黄龙！（梅花）",
    ["lundaoo_card"]="论道",
	[":lundaoo"]="<font color=\"purple\"><b>出牌阶段限一次</b></font>：你可以展示一张牌（<font color=\"green\"><b>包括装备</b></font>）并将其交给一名其他角色Ａ，按此牌花色执行效果\n★<font color=\"red\"><b>红桃</b></font>：Ａ弃２牌并回复一体力\n★<font color=\"blue\"><b>黑桃</b></font>：Ａ摸２牌并翻面武将牌\n★<font color=\"red\"><b>方块</b></font>：你指定一角色，Ａ选择并获得其区域内的一张牌\n★<font color=\"blue\"><b>梅花</b></font>：你指定一角色，视为Ａ对其使用了一张<b>【无色雷杀】</b>",	
	["slashtarget"] = "【论道·梅花】★技能效果：视为卡牌获得者对目标角色使用了一张【无色雷杀】",
    ["choosetarget"] = "【论道·方块】★技能效果：卡牌获得者抢劫目标角色区域内一张牌",
    ["gettarget"] = "【论道·方块】★获得其区域内一张牌",
	
	
	-------------------------------------------------------
	["wanghaining"] = "王海宁",
["#wanghaining"] = "喵神",
["~wanghaining"] = "你等着，老哥会替我报仇的！哈哈···", 
	["zhengfa"] = "征伐",
	["$zhengfa1"] = "蹲坑去吧！",
	["$zhengfa2"] = "你也逃不了！",
	[":zhengfa"] = "你使用【杀】时进行一次判定：若结果为黑色，你可指定攻击范围内的一名角色将武将牌翻面；若为红色，你可为该【杀】额外指定攻击范围内的一个目标",
	["heisetishi"] = "【征伐·黑色】★技能效果：指定攻击范围内的一名角色将武将牌翻面",
	["hongsetishi"] = "【征伐·红色】★技能效果：为该【杀】额外指定攻击范围内的一个目标",
	["yingjiee"] = "英杰",
	["$yingjiee1"] = "放箭放箭！",
	["$yingjiee2"] = "给我踏平它！",
	[":yingjiee"] = "回合结束阶段，你可发动此技能，视为你使用了一张<font color=\"blue\"><b>万箭齐发/南蛮入侵</b></font>\n◆<font color=\"green\"><b>无花色无点数</b></font>",
	["chaojimashu"]="神驹",
	[":chaojimashu"]="你自带＋１和－１马",
	["juexingjineng"] = "拜将",
	[":juexingjineng"] = "<font color=\"red\"><b>觉醒技</b></font>：回合开始时，若手牌数<font color=\"green\"><b>≥</b></font>体力值，你获得技能“隐居”“超世”“英杰”",
	["$juexingjineng"]="有老哥助我一臂之力，天下唾手可得！",
	["mianyiaoe"]="隐居",
	["$mianyiaoe"] = "哼，鼠辈！",
	["$mianyiaoe1"]="<font color=\"yellow\"><b>“大隐隐于市！”</b></font>",
	[":mianyiaoe"]="<font color=\"blue\"><b>锁定技</b></font>：<font color=\"red\"><b>【万箭齐发】</b></font>和<font color=\"red\"><b>【南蛮入侵】</b></font>对你无效。",
	["chaoshi"]="超世",
	["$chaoshi1"] = "给你补补吧！",
	["$chaoshi2"] = "这本来就是我的！",
	["$chaoshi3"] = "雷动九天！",
	["$chaoshi4"] = "天火燎原！",
	["$chaoshi5"] = "少一张不如多一张！",
	[":chaoshi"]="回合开始阶段，你可进行一次判定，按判定花色执行效果\n★红桃：你令一角色回复１体力\n★黑桃：你令一角色摸１张牌\n★方块：你获得一名角色区域内的１张牌\n★梅花：视为你对一角色使用了一张【无色雷杀】/【无色火杀】",	
	["huixuetishi"] = "【超世·红桃】★技能效果：选择一名角色，你令其回复１体力",
    ["xuanmubiao"] = "【超世·方块】★技能效果：选择一名角色，你获得其区域内的１张牌",
    ["huoqupai"] = "【超世·方块】★获得其区域内一张牌",
	["shademubiao"] = "【超世·梅花】★技能效果：选择一名角色，视为你对其使用了一张<b>【无色雷杀】/【无色火杀】</b>",
	["leisha"]="雷杀",
	["huosha"]="火杀",
	["mopaitishi"] = "【超世·黑桃】★技能效果：选择一名角色，你令其摸１张牌",
	

["zhangyanjun"] = "张彦君",
["bangzhu_vs"]="骚之祝福",
	[":bangzhu_vs"]="<font color=\"blue\"><b>出牌阶段限一次</b></font>：你可将任意数量的牌（<font color=\"red\"><b>包括装备</b></font>）交给一名其他角色。\n◆<font color=\"green\"><b>若不少于２张，对方可选择将一张牌交给你</b></font>",
	["bangzhu_effect"]="骚之祝福",
	["GiveCard"]="将一张牌交给对方",
	["NoGiveCard"]="取消",
		["bupai_trs"]="骚气之源",
	[":bupai_trs"]="<font color=\"red\"><b>非锁定技</b></font>：其他角色的回合即将开始时，若你的手牌数小于体力上限，可立即将手牌数补至体力上限。",
	
	
	
	
["luwei"] = "卢威",
["ZHYuu"]="喵眼",
["#ZHY"]="喵眼",
	[":ZHYuu"]="你的回合外，每当你使用或打出一张【基本牌/锦囊牌】时，可观看一名角色的手牌，将其中一张【基本牌/锦囊牌】交给另一名角色。",
	["ZHYuucard"]="喵眼",
	["$ZHYu"] = "此计尚有后招。",
	["#ZHYuu"]="%from 观看了 %to 的手牌",
	[":#ZHY"]="你可以观看一名角色的手牌，将其中一张【锦囊牌】交给另一名角色。",
	["bihuojue"]="不知火",
	["$bihuojue"]="<font color=\"yellow\"><b>“关我喵事！”</b></font>",
	[":bihuojue"]="<font color=\"blue\"><b>非锁定技</b></font>：当你成为<font color=\"red\"><b>【火攻】</b></font>的目标时，你可使其无效。",
	
		["buzhihuo_vs"]="不知火",
	[":buzhihuo_vs"]="<font color=\"blue\"><b>出牌阶段限一次</b></font>：你可以将一张牌（<b>包括装备</b>）交给一名其他角色，视为你对其使用了一张<font color=\"red\"><b>【无色火杀】</b></font>。\n◆<font color=\"green\"><b>此【杀】不计入每回合使用限制</b></font>\n◆ＦＡＱ：由于<font color=\"purple\"><b>技能发动前检测目标，技能发动时确认目标</b></font>，故无法选择空城诸葛",
    ["buzhihuo_card"]="不知火",
	
["yisen"] = "林宜森",
	["yisenthree"]="看片模式",
	["$yisenthree1"]="<font color=\"yellow\"><b>“关我屁事！”</b></font>",
	[":yisenthree"]="<font color=\"blue\"><b>锁定技</b></font>：<font color=\"red\"><b>【万箭齐发】</b></font>和<font color=\"red\"><b>【南蛮入侵】</b></font>对你无效。",
	["yisenone"] = "顺手牵羊",
	[":yisenone"] = "出牌阶段，你可以将两张红牌（<font color=\"green\"><b>包括装备</b></font>）当无色【顺手牵羊】使用。",
	["yisentwo"] = "过河拆桥",
	[":yisentwo"] = "出牌阶段，你可以将两张黑牌（<font color=\"green\"><b>包括装备</b></font>）当无色【过河拆桥】使用。",
	
 ["chenhao"] = "陈昊",
	["xueba"] = "学霸",
	[":xueba"] = "<font color=\"blue\"><b>出牌阶段限一次</b></font>：你可弃置至少Ｘ张牌（<b>包括装备</b>），依次选择ＡＢ两名其他角色，令其交换Ｘ张手牌（不足则全给）。\n◆<font color=\"purple\"><b>Ａ先给Ｂ，Ｂ再给Ａ</b></font>",
	["xueba_card"] = "学霸",
	["shezhangg"] = "舍长",
	[":shezhangg"] = "<font color=\"red\"><b>觉醒技</b></font>：回合开始阶段，若你的体力值<font color=\"green\"><b>≤２</b></font>，你须回复一点体力并减少１点体力上限，获得技能“护驾”“激将”“制衡”“乱击”。",
	
["fengqiang"] = "冯强",
    ["@nu"] = "怒",
	["nykj"]="超强力量",
	--[":nykj"]="<font color=\"blue\"><b>非锁定技</b></font>：你造成伤害时可进行一次判定，将伤害最终值重置为<font color=\"red\"><b>【０．２５＊判定点数】</b></font>（向上取整）。",
	[":nykj"]="<font color=\"blue\"><b>非锁定技</b></font>：你在回合外受到伤害后，获得【怒】标记并进入暴走状态，此状态中你造成伤害时可令其＋１，然后你流失１点体力上限。\n◆<font color=\"red\"><b>回合结束后，【怒】标记消失</b></font>",
	["celou"]="怒意狂击",
	["celoucard"]="怒意狂击",
	[":celou"]="<font color=\"green\"><b>出牌阶段限一次</b></font>：你可以对攻击范围内的一名角色造成１点伤害，然后你流失１点体力上限。",
["#nykjpd"] = "%from 的锁定技【<b><font color='yellow'>超强力量</font></b>】被触发，对 %arg 的伤害变为 %arg2 点",
	["lingdonglai"]="令东来",
	
		["#lingdonglai"] = "无上宗师",
	
	["pokong"] = "春哥",
	[":pokong"] ="<b>春哥技<b> 每次濒死/死亡时你立刻原地复活" ,
	
	["$pokong"] = "生亦何欢，死矣何苦。",

	["pokon"] = "曾哥",
	[":pokon"] ="<b>曾哥技<b> 每次濒死时你立刻原地复活" ,
	["$pokon"] = "生亦何欢，死矣何苦。",
	["xuanwoo"] = "即死",
	[":xuanwoo"] ="当你受到伤害时，你随机指定其他任意一名角色立即死亡" ,
	["xuanwo"] = "破碎",
	[":xuanwo"] ="你造成的伤害可视为体力流失",
    ["$xuanwo"] = "德玛西亚！",
	["dmxy"]="德玛西亚",
	["xukong"] = "虚空",
	[":xukong"] ="<b>锁定技<b> 你的体力上限保持至少为5" ,
	["tashe"] = "玄功",
	["$tashe"] = "我只是喜欢把你踩在脚下的快感而已。",
    [":tashe"] = "每当一张牌指定你，轮到你结算时，你可选择其他任意一名角色替你结算",
    ["#tashe_target"] = "请选择一个目标替你承受此次结算",
	["su"] = "选择变成神二爷···",
	["jiangg"] = "坑爹啊！还是二！",
	["baiban"] = "神关",
	[":baiban"] ="<b>封印技<b> 游戏开始/体力变动时，你可选择直接胜利或指定除你之外的每名玩家选择变成神关羽" ,
	["eatdeath"] = "收尸",
	[":eatdeath"] = "当有角色死亡时，你可获得该角色当前所有武将技;你失去技能时立刻恢复原技能",
    ["#she"] = "立即获胜",
	[":#she"] ="<b>终极技<b> →游戏开始/体力变动时，你可以选择直接胜利" ,
	["~lingdonglai"] = "人力终有穷尽时，破碎一羽化虚空。",

		["zhaohuanshi"]="召唤师",
	["qiyue_card"] = "契约",
	["qi"] = "契",
	["qiyue"] = "契约",
	[":qiyue"] = "出牌阶段，你可将一张手牌置于其它角色的武将牌上，该角色视为“契”。场上的“契”最多存在4张并花色不得相同。“契”每受到一次伤害，你可以摸1张牌。",
	["gengsui"] = "跟随",
	["gengsui_card"] = "跟随",
	["askforgsslash"] = "请选择杀使用的目标",	
	["askforgengsui"] = "是否替召唤师出牌",
	[":gengsui"] = "当你需使用或打出一张基础牌时，可由“契”从其手牌中展示并代你打出，但所展示的牌的花色必须和自身武将牌上“契”一致。若有角色响应并出牌，该名角色摸一张牌。",
	["shicong"] = "恃宠",
	["scxue"] = "回血",
	["scpai"] = "摸牌",
	[":shicong"] = "出牌阶段开始时，若你已受伤，你可弃置两张手牌并跳过你的出牌阶段。若如此做，在回合结束时你令一名“契”进行一个额外的回合。该角色在此回合中每造成一次伤害，你可回复一点体力或摸一张牌。",
	
	
	["modaoxuezhe"]="魔道学者",
	["mingyun"] = "命运",
	["mingyun_card"] = "命运",
	[":mingyun"] = "当你每受到一次伤害，你可弃进行一次判定，判定结果为：\
	红桃~你回复1点体力\
	方块~指定1到2名角色合共摸2张牌\
	梅花~场上一张牌移到合理的位置\
	黑桃~你对伤害来源造成1点伤害",
	["yugan"] = "预感",
	[":yugan"] = "在任意角色的判定牌生效前，你可以打出一张手牌代替之。",
	["askforyugan"] = "是否要发动预感",
	["askFormingyun"] = "请指定1到2名角色合共摸2张牌",
	["~mingyun"] = "判定为方块~指定1到2名角色合共摸2张牌",
	
	["zhandoufashi"]="战斗法师",
	["wen"] = "纹",
	["#xuanwen"] = "%from获得一张‘纹'牌。",
	["xuanwen"] = "炫纹",
	[":xuanwen"] = "你对其他角色每造成1点伤害后你可翻出一张牌置于武将上，称为“纹”；当你使用一张无属性【杀】时，可以舍弃1个“纹”，使你的【杀】附带一种属性。“纹”的上限为5。",
	["liuxing"] = "流星",
	[":liuxing"] = "当你使用的【杀】被【闪】抵消时，你可将该【闪】交给除目标角色外的任一角色。",
	["doushen"] = "斗神",
	[":doushen"] = "觉醒技，回合开始阶段，若“纹”的数量达到4或更多，你需扣一点体力上限并获得技能【煌龙】(煌龙：出牌阶段，你可将2个“纹”当作【铁索连环】打出。)",
	["huanglong"] = "煌龙",
	[":huanglong"] = "出牌阶段，你可将2个“纹”当作【铁索连环】打出。",
	
	
	["yuanshushi"]="元素师",
	["bingqiang"] = "冰墙",
	[":bingqiang"] = "锁定技，你每受到一次伤害；伤害来源须向你展示1张手牌并由你选择1名角色获得它，若不展示则伤害来源的武将牌翻面。",
	["zhanshi"] = "向元素师展示一张手牌",
	["buzhanshi"] = "不",
	["show"] = "SHOW",
	[":show"] = "出牌阶段，你可以打出一张花色为红色手牌，视为你本回合内前一张单体锦囊牌使用，每阶段限用一次。",
	["xingqun"] = "星陨",
	[":xingqun"] = "限定技，出牌阶段，除你以外的所有角色需丢弃1张锦囊牌，或失去一点体力。",
	["askforxingqun"] = "你受到星陨的影响请丢弃一张锦囊牌否则失去1点体力",
	["xingqun_card"] = "星陨",
	
	["cike"]="刺客",
	["jueming"] = "绝命",
	["askforjueming"] = "请打出一张杀以发动绝命",
	["askforjueming2"] = "请打出一张内否则你立即死亡",
	[":jueming"] = "除你以外的一名角色进入濒死状态时，你可以对其打出一张【杀】，若不打出【闪】，则该角色立即死亡。若如此做，视为你杀死该角色。",
	["jichi2"] = "疾驰",
	[":jichi2"] = "锁定技，当你装备区没有牌时，其他角色计算的与你的距离+1。 ",
	
	["shilingsushi"]="死灵术士",
	["jianglin_card"] = "降临",
	["jianglin"] = "降临",
	[":jianglin"] = "出牌阶段，你使用的【过河拆桥】【顺手牵羊】【决斗】【火攻】可额外指定一名目标。",
	["shouhu"] = "守护",
	[":shouhu"] = "锁定技，当你装备区没有牌时,黑色牌对你造成的伤害减1。",
	
	
	["fuchouzhe"]="复仇者",
	["znmo"] = "魔",
	["zuinie"] = "罪孽",
	[":zuinie"] = "你每使用或打出一张【杀】时可进行一次判定，将非红桃结果的判定牌置于你的武将牌上，称为“魔”。每有一张“魔”，你计算与其他角色的距离便-1 。",
	["mohua"] = "魔化",
	[":mohua"] = "觉醒技，回合开始阶段开始时，若“魔”的数量达到4或更多，你须减1点体力上限，并获得技能[审判]：出牌阶段，你可弃置一张“魔”，指定一名距离为1且有手牌的角色，你获得其一张手牌。",
	["shenpan_card"] = "审判",
	["shenpan"] = "审判",
	[":shenpan"] = "出牌阶段，你可弃置一张“魔”，指定一名距离为1且有手牌的角色，你获得其一张手牌。（不限次数）",
	["duoluo"] = "堕落",
	[":duoluo"] = "你可以将你的黑色手牌当【杀】使用或打出。",
	
	["qumoshifa"]="驱魔师【法】",
	["bai"] = "白",
	["baihu"] = "白虎",
	["baihu_card"] = "白虎",
	[":baihu"] = "出牌阶段，你可将一张手牌横置在一名角色的武将牌上（不限次数），称为“白”，每个角色只能放置一张“白”；当场上有两张或以上“白”存在，则目标角色回合判定阶段，需进行判定；若结果为黑牌，你对所有被标记的角色造成1点伤害，且弃置场上所有的“白”。若结果为红色，则弃置该角色的“白”。当你阵亡时，弃置场上所有的“白”。",
	["xuanwu"] = "玄武",
	[":xuanwu"] = "你受到每一次伤害可摸X张牌并进行一次判定，若为黑色，伤害来源翻面，若为红色，伤害来源弃一张牌。（X为你已损失体力值）",
	
	["shengqishi"]="圣骑士",
	["shengyu"] = "愈合",
	[":shengyu"] = "出牌阶段，你可以弃置一张红色手牌，令一名已受伤的角色回复1点体力。每阶段限一次。",
	["shengyu_card"] = "圣域",
	["zhufu_card"] = "祝福",
	["zhufu2"] = "祝福",
	[":zhufu2"] = "出牌阶段，你可以弃置一张手牌并指定一名角色按弃牌的类型执行以下效果。每阶段限1次。\
	装备牌（武器祝福）：其立即装备此装备牌。\
	基础牌（荣誉祝福）：该角色摸一张牌。\
	锦囊牌（天使祝福）：直到你下回合开始之前，该角色造成的属性伤害为2。 ",
	["xisheng_card"] = "牺牲",
	["xisheng"] = "牺牲",
	[":xisheng"] = "你死亡时，可以使至多2名玩家各回复1点体力并摸2张牌。",
	["askforxisheng"] = "你可以选择至多2名玩家各回复1点体力并摸2张牌。",
	
	
	["lanquantianshi"]="蓝拳圣使",
	["zhiquan"] = "直拳",
	[":zhiquan"] = "锁定技，你使用的红色【杀】造成的伤害+1。",
	["lianji"] = "连击",
	[":lianji"] = "若你于一回合内杀死至少一名角色，可于此回合结束后，进行一个额外的回合。 ",
	
	["qumoshili"]="驱魔师【力】",
	["xianlongsl_card"] = "潜龙",
	["xianlong_card"] = "潜龙",
	["@xianlong2"] = "潜龙",
	["xianlong2"] = "潜龙",
	[":xianlong2"] = "若你在出牌阶段未使用过【杀】和【决斗】，回合结束阶段开始时，你获得1个潜龙标记；出牌阶段，你可弃2个潜龙标记，使你于该回合内使用的【杀】不限距离，且无视防具，该回合内使用的【决斗】造成的伤害+1。潜龙标记的上限为4个。",
	["jipo"] = "击破",
	[":jipo"] = "摸牌阶段，你可以放弃摸牌，改为展示牌堆顶的两张牌并获得之。若展示的牌不为同一颜色，则你获得【无双】直到回合结束。",
	
	["guiqi"]="鬼泣",
	["sizhen"] = "四阵",
	[":sizhen"] = "你造成伤害后获得１枚<b>“阵”</b>标记；回合开始/结束阶段，你可以选择一名其他角色并弃置１<b>“阵”</b>，根据<b>“阵”</b>的种类执行效果\n★<font color=\"red\"><b>【红阵】</b></font>：目标选择回１血/手牌上限＋１\n★<font color=\"green\"><b>【绿阵】</b></font>：目标选择弃２牌/让你获得其区域内一张牌\n★<font color=\"blue\"><b>【冰阵】</b></font>：目标选择翻面/流失１体力\n★<font color=\"purple\"><b>【紫阵】</b></font>：目标选择被你使用一张【杀】/决斗",
	["@zhen"] = "阵",
	["kaijia"] = "凯贾",
	[":kaijia"] = "你受到伤害时，可弃１枚<b>“阵”</b>标记使此伤害减一。",
	["hong"]="红阵",
	["lv"]="绿阵",
	["bin"]="冰阵",
	["zi"]="紫阵",
	["huixue"]="回复１点体力",
	["shangxian"]="手牌上限＋１",
	["rengpai"]="弃置２张牌",
	["rangnina"]="对方选取我区域内１张牌",
	["fanmian"]="翻面",
	["liushitili"]="流失１点体力",
	["beisha"]="被杀",
	["beijuedou"]="被决斗",
	["#lua_kaijia_one"] = "%from 发动了技能【凯贾】，将 %arg 点伤害减少至 %arg2 点",
	["xuanzemubiao"]="【四阵】",
	["bulaxiu"] = "第七鬼神",
	[":bulaxiu"] = "<font color=\"red\"><b>觉醒技</b></font>,回合开始阶段，若<b>“阵”</b>标记数达到４，你须减１点体力上限，并获得技能<font color=\"green\"><b>【冥炎之卡洛】</b></font>：当你使用的【杀】被【闪】抵消时，你可以弃置一张装备牌令此【杀】强制命中。",
	["kaluo"] = "冥炎之卡洛",
	[":kaluo"] = "当你使用的【杀】被【闪】抵消时，你可以弃置一张装备牌令此【杀】强制命中。",
	["mz~~"] = "请选择一张装备牌并弃置",
	["$guiqijuexing"]="鬼神的力量···到底有多恐怖呢···",
	
	["dnfHY"]="狂战士",
	["LuaYeyanCard"]="崩山裂地斩",
	["aaa"]="对其造成１点火属性伤害",
	["bbb"]="对其造成２点火属性伤害",
	["HYBS"]="帝血弑天",
	["#HYBS"]="鲜血淋漓",
	["JHBS"]="剑神",
	["#JHBS"]="万剑归宗",
	["$hongyanjuexing"]="嗷嗷嗷！血！！更多的鲜血！！！",
	["$jianhunjuexing"]="万剑归宗，天下俯首！",
	["$xiazijuexing"]="若因恻隐慈悲而软弱无能，便用武力护法！",
	["baozoubuff"] = "暴走",
	["@flamee"] = "崩山裂地斩",
	["hongyanjuexing"] = "魔狱血刹",
	[":hongyanjuexing"] = "<font color=\"red\"><b>觉醒技</b></font>,你进入濒死状态时，可选择立刻变身为帝血弑天，恢复体力和体力上限至４，获得技能<font color=\"green\"><b>【鲜血之忆】</b></font>：<font color=\"blue\"><b>锁定技</b></font>,你的回合外，其他角色受到伤害后你回复一点体力；<font color=\"green\"><b>【崩山裂地斩】</b></font>：出牌阶段限一次，你可以对１～２名角色造成共计至多２点火属性伤害，然后你流失两点体力。",
	["wanjianguizong"] = "极·鬼剑术【暴风式】",
	[":wanjianguizong"] = "<font color=\"red\"><b>觉醒技</b></font>,回合开始阶段，若“剑冢”中武器数达到３，你须减１点体力上限，并获得技能<font color=\"green\"><b>【幻影剑舞】</b></font>：你对攻击范围内的一名角色（包括自己）造成伤害时，可防止此伤害并摸一张牌，之后可令你攻击范围内的一名其他角色摸一张牌。",
	
		["baofengshi"] = "幻影剑舞",
		["mo"] = "使你攻击范围内的一名其他角色摸一张牌",
		["bumo"] = "什么都不做",
	[":baofengshi"] = "你对攻击范围内的一名角色（包括自己）造成伤害时，可防止此伤害并摸一张牌，之后可令你攻击范围内的一名其他角色摸一张牌。",
	
	["xuemo"] = "鲜血之忆",
	["Luayeyan"] = "崩山裂地斩",
	[":Luayeyan"] = "出牌阶段限一次，你可以对１～２名角色造成共计至多２点火属性伤害，然后你流失两点体力。",
	[":xuemo"] = "<font color=\"blue\"><b>锁定技</b></font>,你的回合外，其他角色受到伤害后你回复一点体力。",
	["@baozoubiaoji"] = "暴走",
	["@shixuebiaoji"] = "嗜血",
	[":baozoubuff"] = "<font color=\"blue\"><b>锁定技</b></font>,你使用【杀和决斗】以及别人对你使用【杀和决斗】造成伤害时，此伤害＋１（每圈限一次）。",
	["shixue"] = "嗜血",
	[":shixue"] = "你造成伤害时，可流失２点体力，使此伤害＋１（每圈限一次）。",
	["siwangkangju"] = "死亡抗拒",
	[":siwangkangju"] = "<font color=\"blue\"><b>锁定技</b></font>,你造成伤害后，若体力值为２，回复一点体力；若体力值为１，则回复两点体力。",
	["axiuluo"]="阿修罗",
	["shayi"] = "杀意",
	["~shayi"] = "杀意：摸牌阶段，你可以放弃摸牌，改为依次弃置一至两名角色区域内共计两张牌",
	["shayi_card"] = "杀意",
	["zhi2"] = "意志+",
	[":shayi"] = "摸牌阶段，你可以放弃摸牌，改为依次弃置一至两名角色区域内共计两张牌。",
	["askforshayi"] = "请选择一到两名玩家",
	["chuozhe"] = "挫折",
	[":chuozhe"] = "锁定技,你每受到一次伤害，从牌堆顶亮出一张牌置于你的武将牌上，称为“意志”。每有一“意志”，其他角色计算与你的距离便＋１。",--你的回合开始时，获得武将牌上的所有牌。
		["keyin"] = "刻印-",
	["bdky"] = "波动",
	[":bdky"] = "<font color=\"blue\"><b>锁定技</b></font>,你每使用或打出一张【基本牌】时摸一张牌置于你的武将牌上，称为“刻印”。每有一“刻印”，你计算与其他角色的距离便－１。",
	["bodong"] = "波动",
	["bodongCard"] = "波动",
	[":bodong"] = "你每使用或打出一张【基本牌】，摸一张牌置于你的武将牌上称为“刻印”（最多为５）。每有一“刻印”，你计算与其他角色的距离便－１;出牌阶段，你可以用一张牌替换“刻印”牌堆上的一张牌。",
	["bodongyan"] = "暗天波动眼",
	[":bodongyan"] = "<font color=\"red\"><b>觉醒技</b></font>,回合开始阶段，若“刻印”的数量达到５，你须减１点体力上限，并获得技能<font color=\"green\"><b>【不动明王阵】</b></font>：出牌阶段，你可弃置一“刻印”，获得一名角色区域内的一张牌。",
	["budong_card"] = "不动明王阵",
	["budong"] = "不动明王阵",
	[":budong"] = "出牌阶段，你可弃置一“刻印”，获得一位角色区域内的一张牌。（不限次数）",
	["cuozhe"]="挫折",
	["cuozhecard"]="挫折",
	[":cuozhe"]="你每受到一次伤害，摸一张牌置于你的武将牌上称为“意志”（最多为５）。每有一“意志”，其他角色计算与你的距离便＋１;出牌阶段，你可以用一张牌替换“意志”牌堆上的一张牌。",
	
	
	["wusheng2"]="散打·女",
	["bati"] = "霸体",
	[":bati"] = "锁定技,你的黑色非延时锦囊牌均视为[决斗]。",
	["rouhua"] = "柔化",
	[":rouhua"] = "体力值小于4时,你可将手牌的【闪】当作【杀】、【杀】当作【闪】打出或使用。",
	
	["baofengyan"]="柔道家·女",
	["aoyi"] = "奥义",
	["askforaoyi"] = "请打出一张杀",
	[":aoyi"] = "其他角色对你使用的【杀】造成伤害时，你可弃掉手牌里的一张【杀】来抵消这次伤害。你每用此法抵消一次伤害，可摸一张牌。",
	["beisuai_card"] = "背摔",
	["beisuai"] = "背摔",
	[":beisuai"] = "出牌阶段，你可弃一张牌指定一名使用【杀】能攻击到你的角色，该角色需对你使用一张【杀】，或令你弃其一张牌。每阶段限一次。",

	["bahualiaoluan"]="气功师·女",
	["nian"] = "念",
	["nianqi_card"] = "念气",
	["nianqi2_card"] = "念气",
	["~nianqi"] = "念气：每当你于摸牌阶段摸牌后，可用任意数量的手牌等量交换“念”中的牌",
	["askfornianqi"] = "点击【念气】，选择需要替换的手牌，然后点击确定",
	["nianqi"] = "念气",
	[":nianqi"] = "游戏开始前，共发你6张牌，选4张作为手牌，其余的面朝上置于武将牌上，称之为“念”。每当你于摸牌阶段摸牌后，可用任意数量的手牌等量交换这些“念”。每当你回合开始时“念”的数量不足2，则马上补至2张“念”。",
	["askfornianzhao"] = "请打出相应的牌",
	
	["nianzhao"] = "念罩",
	[":nianzhao"] = "锁定技，当一名角色对你造成伤害时，若你有“念”，伤害来源须弃一张与“念”相同花色的牌，否则防止此伤害。防止伤害后你失去2张“念”。",
	["huoxiao"] = "虎啸",
	[":huoxiao"] = "锁定技，你造成的伤害均为雷属性。",
	
	["duwang"]="街霸·女",
	["zhuanxi_card"] = "砖袭",
	["zhuanxi"] = "砖袭",
	[":zhuanxi"] = "出牌阶段，选择1名角色与你拼点；若你赢则对方武将牌翻面，若没赢你的武将牌翻面。每回合限一次。",
	["mengdu"] = "猛毒",
	[":mengdu"] = "限定技，当场上有角色进入濒死状态被救活时，你可弃一张黑桃牌。该角色的体力上限减少至当前体力值。",
	["dunfu"] = "蹲伏",
	[":dunfu"] = "若你在翻面状态时受到伤害，你的角色立即翻回正面。",
	
	["wuji3"]="散打·男",
	["bati2"] = "霸体",
	[":bati2"] = "锁定技，你的黑色非延时锦囊牌均视为[决斗]",
	["ruodian"] = "弱点",
	[":ruodian"] = "当目标的生命值不少于你时，你可将红色的手牌当作【杀】对其打出。",
	
	["fenglinhuoshan"]="柔道家·男",
	["aoyi2"] = "奥义",
	[":aoyi2"] = "其他角色对你使用的【杀】造成伤害时，你可弃掉手牌里的一张【杀】来抵消这次伤害。你每用此法抵消一次伤害，可摸一张牌。",
	["paotou_card"] = "抛投",
	["paotou"] = "抛投",
	[":paotou"] = "出牌阶段，你可弃一张牌指定一名生命值不少于你的角色，该角色需对你使用一张【杀】，或令你弃其一张牌。每回合限一次。",
	
	["kuanghudi"]="气功师·男",
	["nianqi2"] = "念气",
	["~nianqi2"] = "念气：每当你于摸牌阶段摸牌后，可用任意数量的手牌等量交换“念”中的牌",
	[":nianqi2"] = "游戏开始前，共发你6张牌，选4张作为手牌，其余的面朝上置于武将牌上，称之为“念”。每当你于摸牌阶段摸牌后，可用任意数量的手牌等量交换这些“念”。每当你回合开始时“念”的数量不足2，则马上补至2张“念”。",
	["yu2"] = "御",
	[":yu2"] = "当你受到伤害时，你可弃2张“念”，对伤害来源造成1点雷属性伤害。",
	["xi_card"] = "袭",
	["xi"] = "袭",
	[":xi"] = "你使用的黑色【杀】视为雷属性的【杀】打出，并无限制攻击距离。",
	
	["xianshouluohan"]="街霸·男",
	["tiaoxingvs"] = "挑衅",
	["tiaoxing_card"] = "挑衅",
	["tiaoxing"] = "挑衅",
	[":tiaoxing"] = "出牌阶段，选择1名角色与你拼点；若你赢获得拼点的两张牌，若没赢你的武将牌翻面。每回合限一次。",
	["xianshou_card"] = "千手",
	["xianshou"] = "千手",
	[":xianshou"] = "限定技，出牌阶段，可分别从每名其他角色处（手牌、装备区和判定区）获得一张牌，然后将你的武将牌翻面。",
	["dunfu2"] = "蹲伏",
	[":dunfu2"] = "你在翻面状态时受到伤害后立即翻回正面。",

		["#dnfNMY"] = "枪神",
	["dnfNMY"] = "漫游枪手·男",
	["designer:dnfNMY"] = "hxh2|codeby:Slob",
	["illustrator:dnfNMY"] = "Fel",
	["dnfyingqiang"] = "鹰枪",
	[":dnfyingqiang"] = "出牌阶段，你可以弃置一张手牌进行一次判定，若结果为红色，视为你对一名其他角色使用了一张【杀】（此【杀】无距离限制且不计入使用次数）。每阶段限一次。",
	["dnfyingqiangcard"] = "鹰枪",
	["dnfbaotou"] = "爆头",
	[":dnfbaotou"] = "<b>锁定技，</b>你的【杀】均为红桃花色。",
	["#dnfbaotoujudge"] = "%from 的锁定技【爆头】被触发，判定结果变为红桃",
	
	["#dnfNVMY"] = "沾血蔷薇",
	["dnfNVMY"] = "漫游枪手·女",
	["designer:dnfNVMY"] = "hxh2|codeby:Slob",
	["illustrator:dnfNVMY"] = "Fel",
	["dnfjieji"] = "劫击",
	[":dnfjieji"] = "每当一名其他角色受到一次伤害后，你可弃置一张手牌进行一次判定，若判定结果为红色，视为你对该角色使用了一张【杀】（此【杀】无距离限制且不计入使用次数），因此杀受到的伤害无法再次触发“劫击”。",
	["dnfjiejicard"] = "劫击",
	["~dnfjieji"] = "劫击：每当一名其他角色受到一次伤害后，你可弃置一张手牌进行一次判定，若判定结果为红色，视为你对该角色使用了一张【杀】（此【杀】无距离限制且不计入使用次数），因此杀受到的伤害无法再次触发“劫击”。",
	["@dnfjieji"] = "请弃置一张手牌",
	["dnfbaotounv"] = "爆头",
	[":dnfbaotounv"] = "<b>锁定技，</b>你的【杀】均为红桃花色。",
	["#dnfbaotounvjudge"] = "%from 的锁定技【爆头】被触发，判定结果变为红桃",
	
	["#dnfNDY"] = "大将军",
	["dnfNDY"] = "弹药专家·男",
	["designer:dnfNDY"] = "hxh2|codeby:Slob",
	["illustrator:dnfNDY"] = "Fel",
	["dnfjvji"] = "狙击",
	[":dnfjvji"] = "摸牌阶段，你可以展示你的所有手牌，若没有【杀】，你可以额外摸两张牌，且出牌阶段可以使用任意数量的【杀】",
	["dnfkuochong"] = "扩充",
	[":dnfkuochong"] = "<b>锁定技，</b>你的手牌上限+1。",
	
	["#dnfNVDY"] = "瓦尔基里",
	["dnfNVDY"] = "弹药专家·女",
	["designer:dnfNVDY"] = "hxh2|codeby:Slob",
	["illustrator:dnfNVDY"] = "Fel",
	["dnfshoulei"] = "手雷",
	[":dnfshoulei"] = "每当你使用【杀】对目标角色造成一次伤害后，可进行一次判定，若判定结果为黑色，你对该角色距离为1的一名角色造成1点雷属性伤害。",
	["dnfdilei"] = "地雷",
	[":dnfdilei"] = "当你被【杀】造成伤害时，可进行一次判定，若判定结果为红色，你对此【杀】来源造成1点火属性伤害。",
	["dnfkuochongnv"] = "扩充",
	[":dnfkuochongnv"] = "<b>锁定技，</b>你的手牌上限+1。",
	
	["#dnfNDQ"] = "狂暴者",
	["dnfNDQ"] = "枪炮师·男",
	["designer:dnfNDQ"] = "hxh2|codeby:Slob",
	["illustrator:dnfNDQ"] = "Fel",
	["askfordnfbaji"] = "你需额外打出一张闪，才能回避该杀。",
	["dnfbaji_card"] = "激光",
	["dnfbaji"] = "激光",
	[":dnfbaji"] = "锁定技，你的黑桃【杀】无距离限制，且此【杀】需连续使用两张【闪】才能抵消。",
	["dnfzhongpao"] = "蓄能",
	[":dnfzhongpao"] = "回合结束阶段，若你在该回合内未使用或打出【杀】,你可摸一张牌。",
	["dnfzhongpaocard"] = "重炮",
	
	["#dnfNVDQ"] = "重炮掌控者",
	["dnfNVDQ"] = "枪炮师·女",
	["designer:dnfNVDQ"] = "hxh2|codeby:Slob",
	["illustrator:dnfNVDQ"] = "Fel",
	["dnfbarbecue"] = "榴弹",
	[":dnfbarbecue"] = "锁定技，你的红色【杀】无距离限制，并且可以额外指定一名目标",
	["dnfbarbecuecard"] = "榴弹",
	["dnfzhongpaonv"] = "蓄能",
	[":dnfzhongpaonv"] = "回合结束阶段，若你在该回合内未使用或打出【杀】,你可摸一张牌。",
	
	["#dnfNJX"] = "机械战神",
	["dnfNJX"] = "机械师·男",
	["designer:dnfNJX"] = "hxh2|codeby:Slob",
	["illustrator:dnfNJX"] = "Fel",
	["dnfdouzhi"] = "斗志",
	[":dnfdouzhi"] = "<b>锁定技，</b>当你的体力值变为1时，你立即摸2张牌。",
	["dnfzhiyuan"] = "支援",
	[":dnfzhiyuan"] = "出牌阶段，你可以将两张牌按下列规则使用：一张黑桃牌和一张任意牌当【南蛮入侵】，一张红桃牌和一张任意牌当【万箭齐发】，一张草花牌和一张任意牌当【五谷丰登】，一张方片牌和一张任意牌当【桃园结义】。每阶段限一次。",
	["dnfzhiyuanvs"] = "支援",
	["dnfweizhuang"] = "伪装",
	[":dnfweizhuang"] = "回合外，你可将【杀】当【闪】使用或打出。"	,
	
	["#dnfNVJX"] = "机械之心",
	["dnfNVJX"] = "机械师·女",
	["designer:dnfNVJX"] = "hxh2|codeby:Slob",
	["illustrator:dnfNVJX"] = "Fel",
	["dnfgxilie"] = "G系",
	[":dnfgxilie"] = "出牌阶段，你可以弃置一张方片花色的手牌，从弃牌区内获得一张武器牌并立即使用之。每阶段限一次。",
	["dnfgxiliecard"] = "G系",
	["dnfgaizao"] = "改造",
	[":dnfgaizao"] = "每当你失去装备区里的一张武器牌时，你可以摸一张牌。",
	["dnfweizhuangnv"] = "伪装",
	[":dnfweizhuangnv"] = "回合外，你可将【杀】当【闪】使用或打出。",
	
	["#dnfJH"] = "剑圣",
	["dnfJH"] = "剑魂",
	["designer:dnfJH"] = "hxh2|codeby:Slob",
	["illustrator:dnfJH"] = "Fel",
	["dnfjingtong"] = "武器精通",
	[":dnfjingtong"] = "若你的装备区内存在武器牌，技能效果根据武器牌的攻击范围按以下规则变更：\
范围1，可将红色牌当【杀】使用或打出。\
范围2，使用【杀】指定一角色为目标后，可立即获得其区域内的一张牌。\
范围3，使用【杀】造成伤害后，可将对方翻面。\
范围4，使用【杀】可指定至多三名角色。\
范围5，使用【杀】不可被闪避。",
	["dnfjingtongvs"] = "武器精通",
	["dnfjingtongcard"] = "武器精通",
	["@dnfjingtong1"] = "对方拥有【武器精通】，此【杀】需要两张【闪】才可抵消",
	["@dnfjingtong2"] = "对方拥有【武器精通】，你需要再使用一张【闪】来抵消此【杀】",
	["#dnfjingtong"] = "%from 的技能【武器精通】被触发，%to 须要使用两张【闪】",
	["jianpile2"] = "剑冢",
	["jianji_card"] = "疾影手",
	["jianji"] = "疾影手",
	["rengpai~~"] = "请选择一手牌或者装备并弃置",
	[":jianji"] = "你的回合外，当你失去装备区的武器牌时,可弃一张牌然后将此武器置于你的武将牌上（回合内无须弃牌），称为“剑冢”（冢内武器数上限为３）。出牌阶段，你可点击“疾影手”按钮取出“剑冢”内的武器。",
	
	
	
	["#dnfHY"] = "狱血魔神",
	["dnfHY"] = "狂战士",
	["designer:dnfHY"] = "peerless|codeby:Slob",
	["illustrator:dnfHY"] = "Fel",
	["dnfxueqi"] = "血气",
	[":dnfxueqi"] = "每当你受到1点伤害后，你可以获得1枚“血气”标记（至多4枚），当你进入濒死状态时，你可以弃2枚“血气”标记并回复1点体力。",
	["@xueqi"] = "血气",
	["dnfxuekuangcard"] = "血狂",
	["dnfxuekuangvs"] = "血狂",
	["dnfxuekuang"] = "血狂",
	[":dnfxuekuang"] = "出牌阶段，你可以与一名其他角色拼点。若你赢，你获得以下技能直到回合结束：你使用【杀】时无距离限制，可额外使用一张【杀】，使用【杀】时可额外选择一个目标；若你没赢，你失去一点体力。每阶段限一次。",	
	
	
	
	
	["#guiqi"] = "弑魂",
	["#axiuluo"] = "大暗黑天",
	["#wusheng2"] = "武神",
	["#baofengyan"] = "暴风眼",
	["#bahualiaoluan"] = "百花缭乱",
	["#duwang"] = "毒王",
	["#wuji3"] = "武极",
	["#fenglinhuoshan"] = "风林火山",
	["#kuanghudi"] = "狂虎帝",
	["#xianshouluohan"] = "千手罗汉",
	["#shengqishi"] = "天启者",
	["#lanquantianshi"] = "神之手",
	["#qumoshili"] = "龙斗士",
	["#qumoshifa"] = "龙斗士",
	["#fuchouzhe"] = "末日审判",
	["#cike"] = "银月",
	["#shilingsushi"] = "灵魂收割者",
	["#yuanshushi"] = "大魔导师",
	["#modaoxuezhe"] = "魔术师",
	["#zhandoufashi"] = "贝亚娜斗神",
	["#zhaohuanshi"] = "月之女皇",
	
	
   ["ol_hanba"] = "旱魃",
	["#ol_hanba"] = "神怪乱入",
	["ol_fentian"] = "焚天",
	[":ol_fentian"] = "<b>锁定技</b>，回合结束阶段，若你的手牌数不大于体力值，你须选择一名你攻击范围内的角色，将其一张牌置于你的武将牌上，称为“焚”。你的攻击范围+X(X为焚的数量)。",
	["burn"] = "焚",
	["ol_zhiri"] = "炙日",
	[":ol_zhiri"] = "<b>觉醒技</b>，回合开始阶段，若“焚”的数量达到3或者更多，你减1点体力上限，然后获得技能“心惔”(出牌阶段，你可以将两张“焚”置入弃牌堆并选择一名角色，该角色失去一点体力，每阶段限一次。)。",
	["@ol_zhiri"] = "炙日",
	["ol_xindan"] = "心惔",
	[":ol_xindan"] = "出牌阶段，你可以将两张“焚”置入弃牌堆并选择一名角色，该角色失去一点体力，每阶段限一次。",
	
	["ol_zhangbao"] = "张宝",
	["#ol_zhangbao"] = "地公将军",
	["ol_zhoufu"] = "咒缚",
	[":ol_zhoufu"] = "出牌阶段限一次，你可以指定一名其他角色并将一张手牌移出游戏(将此牌置于该角色的武将牌旁)。若如此做，该角色进行判定时，改为将此牌作为判定牌。该角色的回合结束时，若此牌仍在该角色旁，将此牌收入手牌。",
    ["ol_yingbing"] = "影兵",
	[":ol_yingbing"] = "受到“咒缚”技能影响的角色进行判定时，你可以摸两张牌。",
	
	

    ["jhangchunhua"]="张春华",
  	["#jhangchunhua"] = "冷血皇后",
	
	["jyuecing"] = "绝情",
    [":jyuecing"] ="<font color=\"blue\"><b>锁定技</b></font>,你造成的伤害均为体力流失。" ,
	
	--["NostalgiaYJCM"] = "张春华",

	["shangshih"] = "伤逝",
	[":shangshih"] ="除弃牌阶段外，每当你的手牌数小于你已损失的体力值时，可立即将手牌数补至等同于你已损失的体力值。" ,
	["$jyuecing2"] = "无来无去，不悔不怨。",
	["$jyuecing1"] = "你的死活与我何干？",
	["$shangshih2"] = "自损八百，可伤敌一千。",
	["$shangshih1"] = "无情者伤人，有情者自伤。",
	["~jhangchunhua"] = "怎能如此对我……",

	
	
   ["pb"] = "庞斑", 
   ["#pb"] = "魔师", 
   ["wanjian"] = "万剑", 
   [":wanjian"] = "你可以把红色牌当做【万箭齐发】使用",
   ["nanman"] = "南蛮", 
   [":nanman"] = "你可以把黑色牌当做【南蛮入侵】使用",
   ["LuaGuimou"] = "出山", 
   [":LuaGuimou"] = "你可以将一张牌按以下规则使用或打出：<font color=\"red\">♥</font>当【火攻】；<font color=\"red\">♦</font>当【万箭齐发】；♠当【决斗】；♣当【南蛮入侵】",
   ["luakeji"] = "归隐", 
   [":luakeji"] = "<b>锁定技</b> 你始终跳过弃牌阶段",
   ["dighole"] = "收尸",
   [":dighole"] = "其它角色死亡时，你可以获得该角色的所有技能",
   ["baoliquan"] = "", 
   [":baoliquan"] = "<b>锁定技</b>，你造成的伤害+1",
   ["~lrh"] = "哼……", 
   ["doubledao"] = "燎原",
	[":doubledao"] = "你的杀可指定无限多目标；你使用杀无视对方防御距离",
	["dragonfist"] = "杀神",
	[":dragonfist"] = "出牌阶段，当你的【杀】造成伤害时，可继续出【杀】",
	["tDgongmou"] = "开黑",
   [":tDgongmou"] = "你可将手牌展示给庞斑观看。", 
   ["~tDgongmou"]="你可以将手牌展示给庞斑看",
	
		
  ["lujiaer"] = "社长",
  ["shenshezhang"] = "Ω社长",
  ["$baqi"]="哼哼，留给你们一点时间，为自己的弱小而悔恨吧！",
  ["$baozou"]="很快就会解脱了! 哼哼哼···马上将你解决掉！",
  ["bashen"] = "八神庵",
  ["baozoubashen"] = "暴走八神",
  ["#lujiaer"] = "搬运社社长",
	["#shenshezhang"] = "独眼复仇鬼",
	["#bashen"] = "孤傲之月",
	["#baozoubashen"] = "暴走之月",
		["~lujiaer"] = "呃啊啊啊啊····",
	["~shenshezhang"] = "呃啊啊啊啊····",
		["~bashen"] = "还没有结束的····",
	["~baozoubashen"] = "呃啊啊啊啊····",
	["anfu"] = "暗拂",
	[":anfu"] = "<b>锁定技</b>, 你的杀始终带有火焰属性。",
	["$anfu"] = "怎么样！",
	["thxiangang"]="鬼步",
	[":thxiangang"]="你的手牌上限＋【八酒杯标记数】；你每次受到伤害时，可进行一次判定，若结果为黑色，防止此伤害。",
	["#thxiangang"]="%from 判定成功，防止此伤害",
	["$thxiangang"] = "哼哼，哈哈哈，哈哈哈哈！",
	["baozou"] = "血之暴走",
	[":baozou"] = "<font color=\"red\"><b>觉醒技</b></font>, 你每受到一点伤害，获得一枚【八酒杯】标记；你每次濒死时，获得一枚【八稚女】标记并可选择立刻进入暴走状态开始屠杀！",
	["$baozou2"] = "呃啊啊啊啊····",
	["$baozou1"] = "啊啊啊啊啊！",
	["$baozou3"] = "变身BGM",
	["@kuny"]="八酒杯",
	["touhou_demacia"] = "八酒杯",
	[":touhou_demacia"] = "你使用杀对一名角色造成伤害后，可弃一枚【八酒杯】标记使对方翻面。",	
	["$touhou_demacia"] = "安乐地去死吧！",
	["ChsJuehun"] = "八稚女",
	["ChsJuehunCard"] = "八稚女",
	[":ChsJuehun"] = "游戏开始时，你获得１枚八稚女标记；出牌阶段，你可以弃掉１枚“八稚女”标记并指定一名角色，该角色弃置所有牌，然后你对该角色造成８点火属性伤害。",
	["$ChsJuehun"] = "哭吧、叫吧、然后就去死吧！",
	["@huixuan"]="八稚女",
	["encijietuo"]="烈风拳",
	["#encijietuo"]="烈风拳",
	["$encijietuo"] = "烈风拳！",
	[":encijietuo"]="锁定技，你的杀有20%的概率不可闪避并造成3倍伤害。",
	["LuaKuaiYi"]="烈风拳",
	["LuaKuaiYiCard"]="烈风拳",
	["$LuaKuaiYi"] = "烈风拳！",
	[":LuaKuaiYi"]="出牌阶段你可以弃置一张红色牌,然后展示一名其他角色的一张牌,若不为基本牌,视为你对他使用一张【决斗】,否则,弃置这张牌;你可以对不同角色反复发动【烈风拳】。",
    ["kaisabo"]="凯撒波",
	["#kaisabo"]="凯撒波",
	["$kaisabo"] = "凯撒！WAVE！",
	[":kaisabo"]="你在回合外失去牌时，可弃置一名角色区域内的一张牌。",
	["sha"] = "血腥屠戮",
	["$sha"] = "哈哈哈哈！",
	[":sha"] = "你的杀可指定无限目标；你使用杀的攻击范围无限。",
	["baqi"] = "惊异的死亡终结",
	[":baqi"] = "<font color=\"red\"><b>觉醒技</b></font>, 你每次濒死时，获得一个【天国之门】标记并可选择立刻变身为Ω社长进行复仇！",
	["$baqi1"] = "哈哈哈哈哈哈····",
	["$baqi2"] = "嗯····",
	["$baqi3"] = "变身BGM",
	
	["thkunyi"]="天国之门",
	[":thkunyi"]="<b>限定技</b>，出牌阶段，你可使其他所有角色扔光牌并对其各造成2点雷属性伤害。",
	["thkunyivs"]="天国之门",
	["thkunyicard"]="天国之门",
	["@kunyi"]="天国之门",
	["@kunyiused"]="天国之门(已发动)",
	["$thkunyi"] = "死！",
	
	["luayinshi1"]="天国之门",
	["#luayinshi1"]="天国之门",
	["#yinshi"] = "天国之门",
	["$luayinshi1"] = "哼哼哼····",
	[":luayinshi1"]="<b>锁定技，</b>你的回合外，每当你成为即时锦囊和基本牌的目标时，该牌无效且你摸一张牌。"

	}
	
	



	
	