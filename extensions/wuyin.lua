module("extensions.wuyin", package.seeall)
extension = sgs.Package("wuyin")

--Y_guanyu = sgs.General(extension, "Y_guanyu", "shu",4)
--Y_ganqian = sgs.General(extension, "Y_ganqian", "shu",3,false)

--Y_mayunlu = sgs.General(extension, "Y_mayunlu", "shu",3,false)
--Y_bulianshi = sgs.General(extension, "Y_bulianshi", "wu", 3, false)

Y_handang = sgs.General(extension, "Y_handang", "wu",4)
Y_lvmeng = sgs.General(extension, "Y_lvmeng", "wu",4)

--Y_liubiao = sgs.General(extension, "Y_liubiao", "qun", 3)
shenlingtong = sgs.General(extension, "shenlingtong", "wu", 4)
shenluxun = sgs.General(extension, "shenluxun", "wu", 3)
Y_zhugejin = sgs.General(extension, "Y_zhugejin", "wu", 3)

dofile "lua/sgs_ex.lua"

--姜维
tiaoxinm_card = sgs.CreateSkillCard
{--挑衅 
    name = "tiaoxinm_card",
    once = true,
    will_throw = true,
    
	filter=function(self,targets,to_select,player)
        return to_select:getAttackRange() >= to_select:distanceTo(player) and not to_select:isNude()
    end,
    
	on_use=function(self, room, source, targets)
		room:playSkillEffect("Y_tiaoxin")
        if not room:askForUseSlashTo(targets[1], source, "@txslash") then
		    local cardid=room:askForCardChosen(source,targets[1],"he",self:objectName())
            room:throwCard(cardid,targets[1])
        end
    end,
}

Y_tiaoxin = sgs.CreateViewAsSkill{
    name = "Y_tiaoxin",
    n=0,
    
	view_filter=function()
        return false
    end,
    
	view_as=function(self, cards)        
        return tiaoxinm_card:clone()
    end,
    
	enabled_at_play=function(self,player) 
        return (not player:hasUsed("#tiaoxinm_card"))
    end,
}

Y_zhiji = sgs.CreateTriggerSkill
{--志继（卖血观星）
	name = "Y_zhiji",
	events = {sgs.Damaged},
	
	on_trigger = function(self, event, player, data)
	    local room = player:getRoom()
	    if not player:askForSkillInvoke(self:objectName(),data) then return false end
	    room:playSkillEffect(self:objectName())
		room:askForGuanxing(player,room:getNCards(4),false)
		player:drawCards(1)
	end,
}


--关羽 
Y_wusheng_card = sgs.CreateSkillCard
{ --武圣
	name = "Y_wusheng_card",
	target_fixed = false,	
	will_throw = false,		
	once = false,
	
	filter = function(self, targets, to_select, player)
	    local x = self:subcardsLength()
		return #targets == 0 and to_select:objectName()~= sgs.Self:objectName() and player:distanceTo(to_select)<=(player:getAttackRange()+(x-1))
	end,
	
	on_use = function(self, room, source, targets)
	    local room=source:getRoom()
		local x = self:subcardsLength()
		if x==1 then
		    local cards=self:getSubcards()
		    cards=sgs.QList2Table(cards)
		    local card = sgs.Sanguosha:getCard(cards[1])
		    local slash = sgs.Sanguosha:cloneCard("slash", card:getSuit(), card:getNumber())
			slash:setSkillName("Y_wusheng")
		    slash:addSubcard(cards[1])
		    local use = sgs.CardUseStruct()
            use.card = slash
            use.to:append(targets[1])
            use.from = source
            room:useCard(use)
		else
		    local cards=self:getSubcards()
		    cards=sgs.QList2Table(cards)
		    local slash = sgs.Sanguosha:cloneCard("slash", sgs.Card_NoSuit, 0)
		    slash:setSkillName("Y_wusheng")
		    for _,p in ipairs(cards) do
		    slash:addSubcard(p)
		    end
		    local use = sgs.CardUseStruct()
            use.card = slash
            use.to:append(targets[1])
            use.from = source
            room:useCard(use)
		end
	end,	
}

Y_wusheng = sgs.CreateViewAsSkill
{
	name = "Y_wusheng",
	n = 999,
	
	view_filter = function(self, selected, to_select)
	    if #selected<1 then return to_select:isRed() end
		if #selected>=1 then return to_select:isBlack() end
	end,
	
	view_as = function(self, cards)
		if #cards == 0 then return nil end
		local acard = Y_wusheng_card:clone()
		for i = 1, #cards, 1 do     
			acard:addSubcard(cards[i])                
		end
		acard:setSkillName(self:objectName())
		return acard
	end,
	
	enabled_at_play = function()
		return (sgs.Self:canSlashWithoutCrossbow()) or (sgs.Self:getWeapon() and sgs.Self:getWeapon():className() == "Crossbow")
	end,
	enabled_at_response = function(self, player, pattern)
		return pattern == "slash"
	end,
}

--甘倩
Y_shushen = sgs.CreateTriggerSkill
{--淑慎
	name="Y_shushen",
	frequency=sgs.Skill_NotFrequent,
	events={sgs.PhaseChange},	
	
	on_trigger=function(self,event,player,data)
	    if player:getPhase()~=sgs.Player_Finish then return nil end
		local room = player:getRoom()
		local i=0
		for _, p in sgs.qlist(room:getAllPlayers()) do
		    if p:getHandcardNum()<p:getHp() then 
			    i=i+1
			end
		end
		if i<1 then return nil end
		if not player:askForSkillInvoke(self:objectName()) then return nil end
		local target=room:askForPlayerChosen(player,room:getAllPlayers(),self:objectName())
		if target:getHandcardNum()>=target:getHp() then return nil end
		room:playSkillEffect(self:objectName())
		target:drawCards(1)
	end,
}

--甘倩 
Y_shenzhi = sgs.CreateTriggerSkill
{--神智
	name="Y_shenzhi",
	events = {sgs.CardGot,sgs.CardGotDone,sgs.CardDrawnDone},
	frequency=sgs.Skill_NotFrequent,
	
	on_trigger=function(self,event,player,data)
        local room = player:getRoom()
		local can_use=false
		if event == sgs.CardGot then
	        local move=data:toCardMove()
			if move.to_place ~= sgs.Player_Hand then return false end
			room:setPlayerFlag(player,"Ysz")
		end
	    if event == sgs.CardGotDone and player:hasFlag("Ysz") then 
			can_use=true
			room:setPlayerFlag(player,"-Ysz")
		end
		if event == sgs.CardDrawnDone then
		    can_use=true
		end
		if can_use==false then return false end
		local x = player:getHandcardNum()
		local y = player:getHp()
		if x<y then return false end
		if not player:askForSkillInvoke(self:objectName(),data) then return false end
		local target = room:askForPlayerChosen(player,room:getAlivePlayers(),"Y_shenzhi")
		room:playSkillEffect("Y_shenzhi")
		for i=1, y, 1 do
		    cardid = room:askForCardChosen(target,player,"h","Y_shenzhi")
			room:throwCard(cardid,player)
		end 
		local recover = sgs.RecoverStruct()
		recover.who = player
		room:recover(target, recover)
    end
}

--马云禄 
rzm_pattern = {}
Y_rongzhuang = sgs.CreateViewAsSkill
{--戎装
	name = "Y_rongzhuang",
	n = 1,
    
	view_filter = function(self, selected, to_select)
	    if #rzm_pattern == 0 then return false 
	    elseif #rzm_pattern == 1 then 
		    if rzm_pattern[1] == "slash" then 
			    for _,acard in sgs.qlist(sgs.Self:getEquips()) do
			        if acard:getSuit() == to_select:getSuit() then
			            return not to_select:isEquipped() 
					end
                end
			elseif rzm_pattern[1] == "jink" then
			    for _,acard in sgs.qlist(sgs.Self:getEquips()) do
			        if acard:getSuit() == to_select:getSuit() then return nil end
				end
			    return not to_select:isEquipped()
		    end
		end
	end,
	
    view_as = function(self, cards)
	    if #cards ~= 1 then return nil end
		local card = sgs.Sanguosha:cloneCard(rzm_pattern[1], cards[1]:getSuit(), cards[1]:getNumber())
		card:addSubcard(cards[1])
		card:setSkillName(self:objectName())
		return card
	end,
	
    enabled_at_play = function(self, player)
		rzm_pattern[1]= "slash"
	    return (sgs.Self:canSlashWithoutCrossbow()) or (sgs.Self:getWeapon() and sgs.Self:getWeapon():className()=="Crossbow")
    end,
	
    enabled_at_response = function(self, player, pattern)
		if pattern == "slash" or pattern == "jink" then
		    rzm_pattern[1]=pattern
		    return true
		end
	end,
}

rongzhuangm=sgs.CreateTriggerSkill{--记录需求的技能，为了AI。
	name="#rongzhuangm", --隐藏技能
	events={sgs.CardAsked},
	priority = 5,
	frequency=sgs.Skill_Compulsory,
	
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local str=data:toString()
		if str=="slash" then 
			player:setMark("RzMark",1)
		end
		if str=="jink" then 
			player:setMark("RzMark",2)
        end		
	end,
}

Y_chongqi = sgs.CreateTriggerSkill
{ --冲骑 
	name = "Y_chongqi",	
	events = {sgs.SlashEffect}, 
    frequency = sgs.Skill_NotFrequent,
	
	on_trigger = function(self, event, player, data)
	    if event==sgs.SlashEffect then 
     	    local room = player:getRoom()
		    local effect = data:toSlashEffect()
            if player:isNude() then return false end			
			local cards =sgs.IntList()
		    local ecard=effect.to:getCards("e")
		    ecard=sgs.QList2Table(ecard)
		    for _,e in ipairs(ecard)  do
			    if e:getSuit()==effect.slash:getSuit() then 
			        cards:append(e:getId()) 
			    elseif e:getSuit()==sgs.Card_Heart and effect.slash:getSuit() == sgs.Card_Spade and effect.to:hasSkill("hongyan") then 
			        cards:append(e:getId())
		        end
		    end
		    if cards:isEmpty() then return false end
			if not player:askForSkillInvoke(self:objectName(),data) then return false end 
			local judge = sgs.JudgeStruct()
			judge.pattern = sgs.QRegExp("(.*):(heart|diamond):(.*)")
			judge.good = true
			judge.reason = self:objectName()
			judge.who = player
			room:judge(judge)
			if(judge:isGood()) then
			    room:playSkillEffect("Y_chongqi")
		        room:fillAG(cards,player)
		        local card =room:askForAG(player,cards,false,self:objectName())
			    player:invoke("clearAG")
		        room:throwCard(card,effect.to)
			end
		end
	end
}

--韩当
Y_jiefan = sgs.CreateViewAsSkill
{--解烦
	name = "Y_jiefan",
	n = 0,
	
	view_as = function(self, cards)        
		local acard = Y_jiefan_card:clone()              
		acard:setSkillName(self:objectName())
		return acard        
	end,
	
	enabled_at_play = function(self, player)
		return not player:hasUsed("#Y_jiefan_card")
	end,
}

Y_jiefan_card = sgs.CreateSkillCard
{--
	name = "Y_jiefan_card",
	target_fixed = false,
	will_throw = false,	
	once = true,
	
	filter = function(self, targets, to_select, player)
	    return #targets == 0 
	end,
	
	on_use = function(self, room, source, targets)
	    room:playSkillEffect("Y_jiefan")
	    local choice="Hej"
		local tarPile=nil
	    if targets[1]:hasSkill("Y_yuanjiu") and targets[1]:getPile("Y_yuanjiuPile"):length()>0 then
		    tarPile="Y_yuanjiuPile"
		end
		if targets[1]:hasSkill("tuntian") and targets[1]:getPile("field"):length()>0 then
			local tarPile="field"
		end
		if targets[1]:hasSkill("buqu") and targets[1]:getPile("buqu"):length()>0 then
			local tarPile="buqu"
		end
		if targets[1]:hasSkill("quanji") and targets[1]:getPile("power"):length()>0 then
			local tarPile="power"
		end
		if tarPile~=nil then
		    choice = room:askForChoice(source,"Y_jiefan","Pile+Hej")
		elseif targets[1]:isAllNude() then return nil 
		end
		if choice=="Pile" then
			local cards=targets[1]:getPile(tarPile)
            room:fillAG(cards,source)
		    local cardid =room:askForAG(source,cards,false,"Y_jiefan")
		    room:throwCard(cardid,targets[1])
		    source:invoke("clearAG")
			targets[1]:drawCards(1)
		elseif choice=="Hej" then
		    if targets[1]:isAllNude() then return nil end
		    local cardid=room:askForCardChosen(source,targets[1],"hej",self:objectName())
		    room:throwCard(cardid,targets[1])
		    targets[1]:drawCards(1)
		end
    end,
}

--周泰 
Y_yuanjiu = sgs.CreateViewAsSkill
{--援救
    name="Y_yuanjiu",
    n=0,
    
	enabled_at_play=function(self,player)
        local x = player:getPile("Y_yuanjiuPile"):length()
		local cards=player:getPile("Y_yuanjiuPile")
		if x>1 then 
		    for _, acard in sgs.qlist(cards) do
                for _, bcard in sgs.qlist(cards) do
		            if acard~=bcard and sgs.Sanguosha:getCard(acard):getNumber()==sgs.Sanguosha:getCard(bcard):getNumber() then
					    return true
				    end
			    end
			end
		end
		return false
	end,
    
	view_as = function(self, cards) 
        local acard =Y_yuanjiu_card:clone()
		acard:setSkillName(self:objectName())
		return acard        
	end,
}

Y_yuanjiu_card = sgs.CreateSkillCard
{
	name = "Y_yuanjiu_card",
	target_fixed = true,
	will_throw = false,
	
    on_use = function(self, room, source, targets) 
	    room:playSkillEffect("Y_yuanjiu")
		room:loseHp(source,1)
	    local cards=source:getPile("Y_yuanjiuPile")
		room:fillAG(cards,source)
		local card =room:askForAG(source,cards,false,"Y_yuanjiu")
		room:obtainCard(source,card)
		source:invoke("clearAG")
	end	
}


Y_yuanjiuts = sgs.CreateTriggerSkill
{	--援救    
    name = "#Y_yuanjiuts",
	events = {sgs.AskForPeaches},
	
	on_trigger = function(self, event, player, data)
	    local room = player:getRoom()
		local x = player:getPile("Y_yuanjiuPile"):length()
		local cards=player:getPile("Y_yuanjiuPile")
		if x>0 then 
		    for _, acard in sgs.qlist(cards) do
                for _, bcard in sgs.qlist(cards) do
		            if acard~=bcard and sgs.Sanguosha:getCard(acard):getNumber()==sgs.Sanguosha:getCard(bcard):getNumber() then
					    return false
				    end
			    end
			end
		end
		if not player:askForSkillInvoke(self:objectName(),data) then return end
		--[[local n = player:getHandcardNum()
		local draw,dis=0,0
		local choice
		if n==0 then
		    dis=0
		    draw=3
		elseif n==1 then
		    choice = room:askForChoice(player,"Y_yuanjiuts","disone+Nodis")
		elseif n>=2 then 
		    choice = room:askForChoice(player,"Y_yuanjiuts","distwo+disone+Nodis")
		end
        if choice=="disone" then
			dis=1
			draw=2
	    elseif choice=="distwo" then
			dis=2
			draw=1
		elseif choice=="Nodis" then
			dis=0
			draw=3
		end
		if dis>0 then
		    room:askForDiscard(player, "Y_yuanjiuts", dis, dis, false, false)
		end]]
		room:playSkillEffect("Y_yuanjiu")
		local draw = room:alivePlayerCount() 
		
		player:drawCards(draw)
		for i=1, draw, 1 do
		    local y = player:getPile("Y_yuanjiuPile"):length()
		    local pcards=player:getPile("Y_yuanjiuPile")
		    if y>0 then
		        room:fillAG(pcards,player)
		    end
			local cardid=room:askForCardChosen(player,player,"h","Y_yuanjiuts")
			player:addToPile("Y_yuanjiuPile", cardid)
			player:invoke("clearAG")
		end
		
        local peach=sgs.Sanguosha:cloneCard("peach", sgs.Card_NoSuit,0)
		local use=sgs.CardUseStruct()
		use.card=peach
		use.from=player
		local index=0
		for i=1, 998, 1 do
			for _, p in sgs.qlist(room:getAlivePlayers()) do
				if p:getMark("Y_yjmark")==i then
					index=i
					use.to:append(p) 
					break
				end
			end
			if index==i then break end
		end
		room:useCard(use)
	end,
}

Y_yuanjiuMark = sgs.CreateTriggerSkill
{	--援救标记,为多重濒死时确认最新濒死角色和便于AI识别敌我  
    name = "#Y_yuanjiuMark",
	events = {sgs.Dying,sgs.AskForPeachesDone,sgs.HpRecover},
	priority = 5,
	frequency = sgs.Skill_Compulsory,
	
	can_trigger = function(self,player)
	    return true
	end,

	on_trigger = function(self, event, player, data)
	    local room = player:getRoom()
		if event == sgs.Dying then
		    player:setMark("Y_yjmark",1)
		    for _,p in sgs.qlist(room:getOtherPlayers(player)) do
		        if p:getMark("Y_yjmark")>0 then
		            p:addMark("Y_yjmark")
				end
			end
		end
		if event == sgs.AskForPeachesDone then
		    player:setMark("Y_yjmark",0)
		end
		if event == sgs.Hprecover and player:getHp()>0 then
			player:setMark("Y_yjmark",0)
		end
	end,
}

--吕蒙 
Y_baiyi = sgs.CreateTriggerSkill
{
	name = "Y_baiyi",	
	events = {sgs.SlashEffected}, 
    frequency = sgs.Skill_NotFrequent,
	
	can_trigger=function(self,player)
		return true
	end,
	
	on_trigger = function(self, event, player, data)
     	local room = player:getRoom()
        local slash = data:toSlashEffect()
        local selfplayer = room:findPlayerBySkillName(self:objectName())
		if not selfplayer then return false end
		if not selfplayer:isAlive() then return false end
		if not selfplayer:inMyAttackRange(player) then return false end
		if slash.slash:isBlack() then
		    if player:objectName()~=selfplayer:objectName() then return false end
		    if player:isNude() then return false end
		    if not player:askForSkillInvoke("Y_baiyi",data) then return false end
			room:playSkillEffect("Y_baiyi",1)
			room:askForDiscard(player,self:objectName(),1,1,false,true)
			player:drawCards(1)
		elseif not slash.slash:isBlack() then
		    local targets=room:getAlivePlayers()
		    local players=room:getAlivePlayers()
		    for _,p in sgs.qlist(players) do
			    if p:isAllNude() then targets:removeOne(p) end
		    end
		    if targets:isEmpty() then return false end
		    if not selfplayer:askForSkillInvoke("Y_baiyier",data) then return false end
			room:playSkillEffect("Y_baiyi",2)
		    local target=room:askForPlayerChosen(selfplayer,targets,self:objectName())
		    local cardid=room:askForCardChosen(selfplayer,target,"hej",self:objectName())
		    room:throwCard(cardid,target)
		    return false
		end
	end
}

--步练师 
Y_budu=sgs.CreateViewAsSkill
{--不妒
    name="Y_budu",
    n=1,
    
	enabled_at_play=function()
        return not sgs.Self:hasUsed("#budum_card")
	end,
    
	view_filter = function(self, selected, to_select)
		return not to_select:isEquipped()
    end,
    
	view_as = function(self, cards) 
	    if(#cards ~= 1) then return nil end
        local acard =budum_card:clone()
		acard:addSubcard(cards[1])
		acard:setSkillName(self:objectName())
		return acard        
	end,
}

budum_card = sgs.CreateSkillCard
{
	name = "budum_card",
	target_fixed = false,
	will_throw = true,
	
    filter = function(self, targets, to_select, player)
	    return #targets == 0	
	end,

    on_use = function(self, room, source, targets) 
	    room:playSkillEffect("Y_budu")
		local x = targets[1]:getLostHp()
        if x==0 then
            targets[1]:drawCards(1)
        else
	        targets[1]:drawCards((x+1))
            room:askForDiscard(targets[1], self:objectName(), x, x, false, true)
		end
	end	
}

Y_chongguan = sgs.CreateTriggerSkill
{--宠冠
	name = "Y_chongguan",
	events = {sgs.CardLost},
	priority = 5,
	frequency=sgs.Skill_Compulsory,
    
	can_trigger=function(self,player)
		return player:isAlive() 
	end,
    
	on_trigger = function(self, event, player,data)
	    local room = player:getRoom()
        local move = data:toCardMove()
        if move.from_place ~= sgs.Player_Equip then return false end
		local selfplayer = room:findPlayerBySkillName(self:objectName())
		if not selfplayer:isAlive() then return nil end
		    
		room:playSkillEffect(self:objectName())
		local log=sgs.LogMessage()
		log.type ="#Y_chongguan"
		log.from=selfplayer	
        room:sendLog(log)	
		    
	    selfplayer:drawCards(1)
    end,
}

--诸葛瑾
Y_hongyuancard = sgs.CreateSkillCard
{--弘援
	name = "Y_hongyuancard",
	target_fixed = false,
	will_throw = true,
	
	filter = function(self, targets, to_select, player)
	    return player:inMyAttackRange(to_select)
	end,

    on_use = function(self, room, source, targets)
	    room:playSkillEffect("Y_hongyuan")
        for i=1, #targets, 1 do
            targets[i]:drawCards(1)
        end
    end,		
}

Y_hongyuanvs = sgs.CreateViewAsSkill
{
	name = "Y_hongyuanvs",
	n = 0,
	
	view_as = function(self, cards)
		local acard = Y_hongyuancard:clone()             
		acard:setSkillName("Y_hongyuan")
		return acard 
	end,
	
	enabled_at_play = function()
		return false        
	end,
	
	enabled_at_response = function(self, player, pattern)
		return pattern == "@@Y_hongyuan"     
	end
}

Y_hongyuan = sgs.CreateTriggerSkill
{
	name = "Y_hongyuan",
	view_as_skill = Y_hongyuanvs,
	events = {sgs.CardLostDone,sgs.CardLost},

	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		if player:getPhase()~=sgs.Player_NotActive then return false end
		if event == sgs.CardLost then
		    local move = data:toCardMove()
		    if move.from_place == sgs.Player_Equip or move.from_place == sgs.Player_Hand then
			    player:setFlags("Yhy")
			end
		end
		if event==sgs.CardLostDone and player:hasFlag("Yhy") then
		    player:setFlags("-Yhy")
	        if not player:askForSkillInvoke(self:objectName(),data)  then return false end	
		    room:askForUseCard(player,"@@Y_hongyuan","@Y_hongyuan")
		end
		return false
	end,        
}

Y_huanshi=sgs.CreateViewAsSkill
{--缓释
    name="Y_huanshi",
    n=0,
    
	enabled_at_play=function()
        return not sgs.Self:hasUsed("#Y_huanshicard")
	end,
	
	enabled_at_response = function()
		return false    
	end,
    
	view_as = function(self, cards) 
        local acard =Y_huanshicard:clone()
		acard:setSkillName(self:objectName())
		return acard        
	end,
}

Y_huanshicard = sgs.CreateSkillCard
{
	name = "Y_huanshicard",
	target_fixed = false,
	will_throw = true,
	
    filter = function(self, targets, to_select, player)
	    if #targets <2 then return not to_select:isNude() and to_select:objectName()~=player:objectName() end
	end,

    on_use = function(self, room, source, targets)
        if #targets~=2 then 	
	    room:playSkillEffect("Y_huanshi")
		 local card1 = room:askForCardChosen(targets[1], targets[1], "he" ,"Y_huanshi")
		      
		room:obtainCard(source, card1)
		    local card2 = room:askForCardChosen(source, source, "he" ,"Y_huanshi")
		--room:moveCardTo(sgs.Sanguosha:getCard(card2), targets[1], sgs.Player_Hand, false)  
		room:obtainCard(targets[1], card2)
				
			elseif #targets==2 then	
			 room:playSkillEffect("Y_huanshi")
        local card1 = room:askForCardChosen(targets[1], targets[1], "he" ,"Y_huanshi")
		      local card2 = room:askForCardChosen(targets[2], targets[2], "he" ,"Y_huanshi")
		room:obtainCard(source, card1)
		        room:obtainCard(source, card2)
		local card3 = room:askForCardChosen(source, source, "he" ,"Y_huanshi")
		--room:moveCardTo(sgs.Sanguosha:getCard(card3), targets[1], sgs.Player_Hand, false)
		room:obtainCard(targets[1], card3)
		       local card4 = room:askForCardChosen(source, source, "he" ,"Y_huanshi")
		     --room:moveCardTo(sgs.Sanguosha:getCard(card4), targets[2], sgs.Player_Hand, false)
			 room:obtainCard(targets[1], card4)
	end	
end
}

--[[Y_huanshi=sgs.CreateViewAsSkill
{--缓释
    name="Y_huanshi",
    n=0,
    
	enabled_at_play=function()
        return not sgs.Self:hasUsed("#Y_huanshicard")
	end,
	
	enabled_at_response = function()
		return false    
	end,
    
	view_as = function(self, cards) 
        local acard =Y_huanshicard:clone()
		acard:setSkillName(self:objectName())
		return acard        
	end,
}

Y_huanshicard = sgs.CreateSkillCard
{
	name = "Y_huanshicard",
	target_fixed = false,
	will_throw = true,
	
    filter = function(self, targets, to_select, player)
	    if #targets <2 then return to_select:objectName()~=player:objectName() end
	end,

    on_use = function(self, room, source, targets)
        if #targets~=2 then return nil end	
	    room:playSkillEffect("Y_huanshi")
		local gave1 = false
		local gave2 = false
		if not targets[1]:isNude() then
		    local choice1 = room:askForChoice(targets[1],"Y_huanshi1","Y_Give+Y_NoGi")
			if choice1=="Y_Give" then
                local card1 = room:askForCardChosen(targets[1], targets[1], "he" ,"Y_huanshi")
			    if sgs.Sanguosha:getCard(card1):isEquipped() then
				    room:moveCardTo(sgs.Sanguosha:getCard(card1), source, sgs.Player_Hand, true)
				else
			        room:moveCardTo(sgs.Sanguosha:getCard(card1), source, sgs.Player_Hand, false)
				end
			    gave1=true
			end
		end
		if not targets[2]:isNude() then
		    local choice2 = room:askForChoice(targets[2],"Y_huanshi1","Y_Give+Y_NoGi")
			if choice2=="Y_Give" then
		        local card2 = room:askForCardChosen(targets[2], targets[2], "he" ,"Y_huanshi")
			    if sgs.Sanguosha:getCard(card2):isEquipped() then
				    room:moveCardTo(sgs.Sanguosha:getCard(card2), source, sgs.Player_Hand, true)
				else
			        room:moveCardTo(sgs.Sanguosha:getCard(card2), source, sgs.Player_Hand, false)
				end
			    gave2=true
			end
		end
		if gave1==true then
		    if not source:isNude() then 
		        local choice3 = room:askForChoice(source,"Y_huanshi2","Y_Give+Y_NoGi")
				if choice3=="Y_Give" then
		            local card3 = room:askForCardChosen(source, source, "he" ,"Y_huanshi")
					if sgs.Sanguosha:getCard(card3):isEquipped() then
				        room:moveCardTo(sgs.Sanguosha:getCard(card3), targets[1], sgs.Player_Hand, true)
				    else
			            room:moveCardTo(sgs.Sanguosha:getCard(card3), targets[1], sgs.Player_Hand, false)
					end
				end
			end
		end
		if gave2==true then
		    if not source:isNude() then 
		        local choice4 = room:askForChoice(source,"Y_huanshi2","Y_Give+Y_NoGi")
				if choice4=="Y_Give" then
		            local card4 = room:askForCardChosen(source, source, "he" ,"Y_huanshi")
		            if sgs.Sanguosha:getCard(card4):isEquipped() then
				        room:moveCardTo(sgs.Sanguosha:getCard(card4), targets[2], sgs.Player_Hand, true)
				    else
			            room:moveCardTo(sgs.Sanguosha:getCard(card4), targets[2], sgs.Player_Hand, false)
					end
				end
			end
		end
	end	
	
}]]



--------------------------------------------------------------------------------------------

shuanglongcard=sgs.CreateSkillCard{
        name = "shuanglong",
        will_throw = false,
        once = true,
        filter = function(self,targets,to_select,player)
        if (#targets>0) then return false end
		if to_select:isKongcheng() then return false end
        return to_select:objectName() ~= player:objectName()
        end,
        on_effect=function(self,effect)          
                local room = effect.from:getRoom()
                if (effect.from:pindian(effect.to,"shuanglong",self)) then
		
				    room:setPlayerFlag(effect.from, "shuanglong_success")
                    room:setPlayerFlag(effect.to, "wuqian")
					room:setPlayerFlag(effect.to, "shuanglongt")
					effect.from:skip(sgs.Player_Discard)
                else
			
				    room:setPlayerFlag(effect.from, "shuanglong_failed")
					--effect.from:skip(sgs.Player_Discard)
					if room:askForSkillInvoke(effect.from,"shuanglong") then
					local froms = sgs.SPlayerList()
					for _,r in sgs.qlist(room:getAlivePlayers()) do
					if r:getEquips():length() > 0 then
					    froms:append(r)
						end
					end
					local from = room:askForPlayerChosen(effect.from, froms, "shuanglong")
					if from:hasEquip() then
					local card_id = room:askForCardChosen(effect.from, from, "e", self:objectName())
					local card = sgs.Sanguosha:getCard(card_id)
					local place = room:getCardPlace(card_id)
					local tos = sgs.SPlayerList()
					local list = room:getAlivePlayers()
					for _,p in sgs.qlist(list) do
					if (card:inherits("Weapon") and p:getWeapon() == nil) or (card:inherits("Armor") and p:getArmor() == nil) or (card:inherits("DefensiveHorse") and p:getDefensiveHorse() == nil) or (card:inherits("OffensiveHorse") and p:getOffensiveHorse() == nil) then
						tos:append(p)
						end
					end
					local tag = sgs.QVariant()
					tag:setValue(from)
					room:setTag("shuanglongtarget", tag)
					local to = room:askForPlayerChosen(effect.from, tos, "shuanglong")
					if to then
						room:moveCardTo(card, to, place, true)
					end
					room:removeTag("shuanglongtarget")
					end
				end
			end
        end,
}

shuanglongvs=sgs.CreateViewAsSkill{
        name = "shuanglong",
        n = 1,
        view_filter = function(self, selected, to_select)
                return not to_select:isEquipped()
        end,
        view_as=function(self, cards)
		if #cards == 1 then
                        local acard = shuanglongcard:clone()
                        acard:addSubcard(cards[1])                
                        acard:setSkillName("shuanglong")
                        return acard
						end
        end,
        enabled_at_play = function(self,player)
                return not (player:hasFlag("shuanglong_success") or player:hasFlag("shuanglong_failed")) and not player:isKongcheng()
        end,
        enabled_at_response = function(self,player,pattern) 
                return false
        end
}

shuanglong=sgs.CreateTriggerSkill
{
	name="shuanglong",
	events={sgs.PhaseChange,sgs.Death},
	view_as_skill = shuanglongvs,
	on_trigger=function(self,event,player,data)
		local room = player:getRoom()
	if (event == sgs.PhaseChange and player:getPhase() == sgs.Player_Finish) or (event == sgs.Death) then
		for _,p in sgs.qlist(room:getOtherPlayers(player)) do
		if p:hasFlag("wuqian") then
		room:setPlayerFlag(p,"-wuqian")
		end
		if p:hasFlag("shuanglongt") then
		room:setPlayerFlag(p,"-shuanglongt")
		end
		end
		end
	end,
}

shuanglongdis = sgs.CreateDistanceSkill{
   name = "#shuanglongdis",
   correct_func = function(self, from, to)
       if from:hasSkill("shuanglong") and from:hasFlag("shuanglong_success") and to and to:hasFlag("shuanglongt") then
       return -998
    end
end,
}

shuanglongslash = sgs.CreateSlashSkill
{
	name = "#shuanglongslash",
	s_residue_func = function(self, from)
		if from:hasSkill("shuanglong") and from:hasFlag("shuanglong_success") then
            local init =  1 - from:getSlashCount()
            return init + 998
        else
            return 0
		end
	end,
}

shuanglongp = sgs.CreateProhibitSkill
{
	name = "#shuanglongp",
	is_prohibited = function(self, from, to, card)
		if from:hasSkill("shuanglong") and from:hasFlag("shuanglong_success") and from:getSlashCount() > 0 and to and not to:hasFlag("shuanglongt") then
		if from:getWeapon() and from:getWeapon():className() == "Crossbow" then return false end
			return card:inherits("Slash")
		end
	end,
}

shijiang = sgs.CreateTriggerSkill{
	name = "shijiang",
    events = {sgs.CardLost},
	frequency = sgs.Skill_NotFrequent,
	priority=998,
	
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		if event==sgs.CardLost then
			if player:getHandcardNum()>0 then return end
			local move = data:toCardMove()
		--if (move.from_place == sgs.Player_Hand or move.from_place == sgs.Player_Equip) then
		if (move.from_place == sgs.Player_Hand) then
			--if (not room:askForSkillInvoke(player,self:objectName())) then return false end
			if not player:askForSkillInvoke(self:objectName(),data) then return end
			
			local targets2 = sgs.SPlayerList()
					all = room:getAllPlayers()
					for _,p in sgs.qlist(all) do
						--if  player:canSlash(p) then
						if player:inMyAttackRange(p) then
							targets2:append(p)
						end
					end
	    local target = room:askForPlayerChosen(player, targets2, "shijiang")
		
		local judge=sgs.JudgeStruct()
			judge.pattern=sgs.QRegExp("(.*):(heart|diamond):(.*)")
			judge.good=true
			judge.reason=self:objectName()
			judge.who=player
		room:judge(judge)
		if judge.card:isBlack() then
		player:drawCards(1) 
		return end

		player:drawCards(1)
	    local damage=sgs.DamageStruct()
        damage.damage=1
        damage.nature=sgs.DamageStruct_Fire
        damage.from=player
        damage.to=target
        room:damage(damage)
		--damage.to:drawCards(1)
			room:playSkillEffect("shijiang")
			end
			
		end
	end,
} 

luxunpanding=sgs.CreateTriggerSkill{
name="luxunpanding",
--view_as_skill=!!_vs,
events={sgs.StartJudge,sgs.AskForRetrial,sgs.FinishJudge},
frequency = sgs.Skill_Compulsory,
priority=2,
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.StartJudge then
		local judge=data:toJudge()
		if not judge.who:hasSkill(self:objectName()) then return false end
		for _,p in sgs.qlist(room:getAlivePlayers()) do
			room:setPlayerFlag(p,"luajk_tmp")				
		end
	elseif event==sgs.FinishJudge then
		for _,p in sgs.qlist(room:getAlivePlayers()) do
			if p:hasFlag("luajk_tmp") then
				room:setPlayerFlag(p,"-luajk_tmp")
			end			
		end
	elseif event==sgs.AskForRetrial then
		if player:hasFlag("luajk_tmp") then return true end
	end	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}


shenlingtong:addSkill(shuanglong)
shenlingtong:addSkill(shuanglongdis)
shenlingtong:addSkill(shuanglongslash)
shenlingtong:addSkill(shuanglongp)

shenluxun:addSkill("qianxun")
shenluxun:addSkill(shijiang)
shenluxun:addSkill(luxunpanding)


--Y_guanyu:addSkill(Y_wusheng)
--Y_ganqian:addSkill(Y_shushen)
--Y_ganqian:addSkill(Y_shenzhi)
--Y_mayunlu:addSkill(Y_rongzhuang)
--Y_mayunlu:addSkill(rongzhuangm)
--Y_mayunlu:addSkill(Y_chongqi)

Y_handang:addSkill(Y_jiefan)
Y_lvmeng:addSkill(Y_baiyi)
--Y_zhugejin:addSkill(Y_huanshi)
Y_zhugejin:addSkill(Y_hongyuan)


sgs.LoadTranslationTable{
		["wuyin"] = "五影良才",

	["#shenlingtong"] = "豪情烈胆",
	["shenlingtong"] = "五影凌统",
	["shuanglong"] = "旋风",
	[":shuanglong"] = "出牌阶段限一次，你可以与一名其他角色拼点。若你赢：跳过该回合的弃牌阶段，你与该角色的距离始终视为 １并无视其防具，你使用【杀】时无次数限制，直到回合结束。若你没赢：可以将场上的一件装备置于一名角色的装备区里。",
	["$shuanglong1"]="伤敌于千里之外。",
	["$shuanglong2"]="索命于须臾之间。",
	["~shenlingtong"]="大丈夫不惧死亡···",
	["designer:shenlingtong"] = "gaoda",


	
	["shenluxun"] = "五影陆逊",
	["shijiang"] = "火营",
	["@shijiang"] = "火营",
	[":shijiang"] = "当你失去手牌时，若手牌数为０，你可以选择一名你攻击范围内的角色（<font color=\"green\"><b>包括自己</b></font>），然后你进行一次判定并摸１张牌，若判定牌为红色则其受到你造成的１点火属性伤害",
	["$shijiang1"]="牌不是万棱的，但是没牌是万万不棱的！",
	["$shijiang2"]="以火应敌，贼人何处逃窜！",
	["luxunpanding"]="儒生",
	[":luxunpanding"]="<b>锁定技</b>，你的判定牌展示后不可被更改，立即生效",

	["#shenluxun"] = "儒生雄才",
	["~shenluxun"]="我还是太连清了···",

	
	["Y_guanyu"] = "影·关羽",
	["Y_wusheng"] = "武圣",
	["Y_wusheng_card"] = "武圣",
	[":Y_wusheng"] = "你可将你的一张红色牌加任意数量的黑色牌当成一张【杀】使用或打出。此【杀】使用时攻击范围加。X为其中的黑牌数，最少可为0。",
	["$Y_wusheng"]="关羽在此，尔等受死",
	["~Y_guanyu"] = "什么？此地叫麦城",
	["designer:Y_guanyu"] = "ByArt",
	["#Y_guanyu"] = "美髯公",
    ["illustrator:Y_guanyu"] = "官方",
	
	["Y_ganqian"] = "影·甘倩",
	["#Y_ganqian"] = "昭烈皇后",
    ["Y_shushen"] = "淑慎",
	["Y_shenzhi"] = "神智",
	[":Y_shenzhi"] = "每当你获得一次手牌，若你手牌数不小于你当前体力值，你可指定一名角色弃置你的X张手牌，然后该角色回复1点体力。X为你当前的体力值。",
	[":Y_shushen"] = "回合结束时，你可让一名手牌数小于体力值的角色摸一张牌。",
	["$Y_shushen"]="想要牌吗",
	["$Y_shenzhi"]="以光之魂抚平你的创伤",
	["~Y_ganqian"]="死有何惧也",
	["designer:Y_ganqian"] = "ByArt",
    ["illustrator:Y_ganqian"]="官方",

	["Y_mayunlu"] = "影·马云禄",
	["#Y_mayunlu"] = "巾帼冰枪",
    ["Y_rongzhuang"] = "戎装",
	["Y_chongqi"] = "冲骑",
	[":Y_rongzhuang"] = "你的一张手牌,若你装备区内有与之花色相同的牌，则这张手牌可当【杀】使用或打出；若没有，则这张手牌可当【闪】使用或打出。",
	[":Y_chongqi"] = "当你使用【杀】指定目标后，若目标的装备区内有与此【杀】花色相同的牌，你可进行一次判定，若判定结果为红色，你弃置目标角色装备区内与此【杀】花色相同的一张牌。",
	["$Y_rongzhuang"]="看我的厉害",
	["$Y_chongqi"]="螳臂当车",
	["~Y_mayunlu"]="马蹄声",
	["designer:Y_mayunlu"] = "ByArt",
    ["illustrator:Y_mayunlu"]="宇峻画廊",

	
	["Y_handang"] = "五影韩当",
	["Y_jiefan"] = "解烦",
	["Y_jiefan_card"] = "解烦",
	[":Y_jiefan"] = "出牌阶段限一次，你可你弃置一名角色区域内或武将牌上的一张牌，然后该角色摸１张牌。",
	["$Y_jiefan"]="一物换一物",
	["Pile"]="弃武将牌上的牌",
	["Hej"]="弃区域内的牌",
	["~Y_handang"]="尽力啦",
	["designer:Y_handang"] = "ByArt",
	["#Y_handang"] = "石城侯",
    ["illustrator:Y_handang"] = "官方",
	
	["Y_lvmeng"] = "五影吕蒙",
	["Y_baiyi"] = "白衣",
	["Y_baiyier"] = "白衣二（弃置某角色区域内的一张牌）",
	[":Y_baiyi"] = "当你攻击范围内的角色（<font color=\"green\"><b>包括自己</b></font>）成为【杀】的目标时，若此【杀】不为黑色，你可弃置一名角色区域内的一张牌，若为黑色且目标为你，你可弃１张牌，然后摸１张牌。",
	["$Y_baiyi1"]="君子藏器于身待时而动",
	["$Y_baiyi2"]="进攻时机已到",
	["designer:Y_lvmeng"] = "ByArt",
	["~Y_lvmeng"] = "被看穿了吗",
	["#Y_lvmeng"] = "国士之风",
    ["illustrator:Y_lvmeng"] = "官方",
	
	["Y_zhugejin"]="五影诸葛瑾",
	["Y_hongyuan"] = "弘援",
	[":Y_hongyuan"] =  "回合外失去一次牌时，你可指定你攻击范围内任意数量的角色（<font color=\"green\"><b>包括自己</b></font>），这些角色每人摸１张牌。",
	["Y_huanshi"] = "缓释", 
	["Y_hongyuancard"] = "弘援", 
	["@Y_hongyuan"] = "你可指定你攻击范围内任意数量的角色（<font color=\"green\"><b>包括自己</b></font>）", 
	["~Y_hongyuan"] = "这些角色每人摸一张牌。", 
	[":Y_huanshi"] ="出牌阶段限一次，你可指定至多两名角色，目标角色给你一张牌，然后你返还一张牌。",
	["Y_huanshicard"] = "缓释", 
	["Y_huanshi"] = "缓释", 
	--[[["Y_Give"] = "给他牌", 
	["Y_NoGi"] = "不给牌",
	["Y_huanshi"] = "缓释", 
	["Y_huanshi1"] = "缓释",
	["Y_huanshi2"] = "缓释", 
	[":Y_huanshi"] ="出牌阶段，你可指定其他两名角色,这两名角色可各自给你一张牌，然后你可以返还一张牌。每阶段限一次",
	["Y_huanshicard"] = "缓释", 
	["Y_Give"] = "给他牌", 
	["Y_NoGi"] = "不给牌",]]
	["$Y_hongyuan"]="合诸公之力共讨奸贼",
	["$Y_huanshi"]="将军可愿听我一言",
	["~Y_zhugejin"] = "君臣不相负，来世复君臣",
    ["#Y_zhugejin"] = "联盟维系者", 
	["designer:Y_zhugejin"] = "ByArt",
    ["illustrator:zhugejin"]="官方",
	
	["Y_luxun"] = "影·陆逊",
    ["Y_dushi"] = "度势",
	["Y_dushi_card"] = "度势",
	[":Y_dushi"] = "每当有角色体力值回复至1或更多时，你可弃一张装备牌，若该角色与你势力相同，你摸两张牌；若不同，你对其造成1点火焰伤害。",
	["Y_shenjun"] = "神君",
	["Y_shenjuncard"] = "神君",
	["$Y_dushi1"]="没这么简单",
	["$Y_dushi2"]="血色火海葬敌万千",
	["$Y_shenjun"]="休养生息",
	[":Y_shenjun"] = "若你手牌数大于你当前的体力值（若体力值小于0暂视为0），你可将X张手牌当一张【桃】使用。X为你手牌数与体力值之差。",
	["designer:Y_luxun"] = "ByArt",
	["~Y_luxun"]="我还是太连清了",
	["#Y_luxun"] = "儒生雄才",
    ["illustrator:Y_luxun"] = "官方",
	
}