module("extensions.dps",package.seeall)
extension = sgs.Package("dps")

luanhlx = sgs.General(extension, "luanhlx", "god", 3, true)

luapjfsh = sgs.General(extension, "luapjfsh", "god", 5, true)
--simayans=sgs.General(extension, "simayans", "god", 4, true)

--luajiananfeng=sgs.General(extension,"luajiananfeng","god","4",false)
shensunquans=sgs.General(extension, "shensunquans", "god", 3, true,true)
shensunce = sgs.General(extension, "shensunce", "god", 4,true,true)

--nandoubds=sgs.General(extension, "nandoubds", "god", "1", true)

local function array_include_player(players, player)
  for _, p in ipairs(players) do
    if p:objectName() == player:objectName() then
      return true 
    end
  end
end
--神孙策列传
suncels=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "suncels$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}

--南华老仙列传
nanhualaoxianls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "nanhualaoxianls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--仙术
luaxsh_sk={}
luaxsh_trs=sgs.CreateTriggerSkill{
name="luaxsh_trs",
--view_as_skill=!!_vs,
frequency = sgs.Skill_NotFrequent,
priority=3,
events = {sgs.PhaseChange},------发动时机
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	
		if (event==sgs.PhaseChange) and (selfplayer:getPhase()==sgs.Player_Start) then----------回合开始阶段
			if (room:askForSkillInvoke(selfplayer,self:objectName())~=true) then return false end
			room:playSkillEffect(self:objectName())---播放音效
			local pfc=room:getAlivePlayers()
			local pfc_t=room:getAlivePlayers()
			--for _,p in sgs.qlist(pfc_t) do
				--if not p:getGeneral():isMale() then pfc:removeOne(p) end-----获取男性角色
			--end
			pfc:removeOne(selfplayer)-----去掉自己，不包括自己
			local pc=room:askForPlayerChosen(selfplayer,pfc,self:objectName())
			if pc~=nil then-------------如果选择了，则
				-- if(skill->isLordSkill() || skill->getFrequency() == Skill::Limited
               --|| skill->getFrequency() == Skill::Wake)
				local str=""
				local sklist={}
				for _,sk in sgs.qlist(pc:getVisibleSkillList()) do
				    local name=sk:objectName()
					if not(name=="axe" or name=="fan" or name=="spear" or name=="huangtianv" or name=="zhiba_pindian" or sk:isLordSkill() or sk:getFrequency() == sgs.Skill_Limited or sk:getFrequency() == sgs.Skill_Wake)  then
						table.insert(sklist,sk:objectName())----插入技能，
					end
					--player:speak(sk:objectName())					
				end
				
				for var=1,#sklist,1 do
					str=str..sklist[var]
					str=str.."+"
					--player:speak(str)
				end
				str=str.."luaxsh_cancel"
				local strc=room:askForChoice(selfplayer, self:objectName(), str)
				if strc == "luaxsh_cancel" then
					return false
				else
					table.insert(luaxsh_sk,strc)				
				end
				room:acquireSkill(selfplayer,strc)-----获得技能
			end
		end

	if (event==sgs.PhaseChange) and (selfplayer:getPhase()==sgs.Player_RoundStart) then --回合开始时
		if #luaxsh_sk==0 then return false end
		room:detachSkillFromPlayer(selfplayer,luaxsh_sk[1])
		table.remove(luaxsh_sk)
	end
end,
--[[can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end]]--
}
--天道
luagm_card=sgs.CreateSkillCard{
name="luagm_effect",
target_fixed=true,
will_throw=false,
}
--视为技 红牌
luagm_vs=sgs.CreateViewAsSkill{
name="luagm_vs",
n=1,
view_filter=function(self, selected, to_select)        
       return true
end,
view_as=function(self, cards)
        if #cards==1 then 
        local acard=luagm_card:clone()        
        acard:addSubcard(cards[1])        
        acard:setSkillName(self:objectName())
        return acard end
end,
enabled_at_play=function()
        return false        
end,
enabled_at_response=function(self,pattern)
        return pattern=="@luagm_trs" --仅响应 要求一张jicai_card        
end
}
--主技能
luagm_trs=sgs.CreateTriggerSkill{
        name="luagm_trs",
        events=sgs.AskForRetrial,--听说这个事件不需要cantrigger
        view_as_skill=luagm_vs,
        --frequency=sgs.Skill_Compulsory,
        on_trigger=function(self,event,player,data)
                local room=player:getRoom()
                local selfplayer=room:findPlayerBySkillName(self:objectName())
                local judge=data:toJudge()                --获取判定结构体        
                selfplayer:setTag("Judge",data)                --SET技能拥有者TAG
                if (room:askForSkillInvoke(selfplayer,self:objectName())~=true) then return false end        --询问发动 可以去掉

                local card=room:askForCard(selfplayer,"@luagm_trs","@luagm_trs")                --要求一张jicai_card   别忘了@jicai是询问字符串     
                if card~=nil then  -- 如果打出了        
               -- room:throwCard(judge.card) --原判定牌丢弃 
--如果是想要鬼道那样的替换回来就应该改为simashi:obtainCard(judge.card)
			room:playSkillEffect(self:objectName())
			selfplayer:obtainCard(judge.card)
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
--太平
luatp_trs=sgs.CreateTriggerSkill{
name="luatp_trs",
--view_as_skill=!!_vs,
events={sgs.DamageForseen},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.DamageForseen then
		local damage=data:toDamage()
		if not damage.to:hasSkill(self:objectName()) then return false end
		if damage.nature~=sgs.DamageStruct_Thunder then return false end
		room:playSkillEffect(self:objectName())
		local log=sgs.LogMessage()
		log.from=selfplayer
		log.type="#luatp"
		room:sendLog(log)		
		return true
	end	
end,
--[[can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end]]--
}
--紫虚上人列传
zixushangrenls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "zixushangrenls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--预言
luayy_trs=sgs.CreateTriggerSkill{
name="luayy_trs",
--view_as_skill=!!_vs,
events={sgs.DrawNCards,sgs.TurnStart},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.DrawNCards then
		if (room:askForSkillInvoke(selfplayer,self:objectName())~=true) then return false end
		room:playSkillEffect(self:objectName())
		local suit_t=room:askForSuit(selfplayer,self:objectName())
		local id_t=room:drawCard()
		local card_t=sgs.Sanguosha:getCard(id_t)
		room:moveCardTo(card_t,nil,sgs.Player_Special,true)
		room:getThread():delay()
		room:throwCard(card_t)
		local x = data:toInt()
		if card_t:getSuit()==suit_t then
			data:setValue(x+2)
		else			
			data:setValue(x-1)			
		end
		selfplayer:addMark("luayy"..sgs.Card_Suit2String(suit_t))
	elseif event==sgs.TurnStart then
		if selfplayer:getMark("luayyspade")>0 then selfplayer:setMark("luayyspade",0) end
		if selfplayer:getMark("luayyheart")>0 then selfplayer:setMark("luayyheart",0) end
		if selfplayer:getMark("luayyclub")>0 then selfplayer:setMark("luayyclub",0) end
		if selfplayer:getMark("luayydiamond")>0 then selfplayer:setMark("luayydiamond",0) end			
	end	
end,
--[[can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end]]--
}
--先知
luaxzh_card=sgs.CreateSkillCard{
name="luaxzh_effect",
target_fixed=false,
will_throw=true,
filter=function(self,targets,to_select)
	return (#targets==0) and (not to_select:isKongcheng()) and ( to_select:objectName() ~= sgs.Self:objectName() )
end,
--feasible=function(self,targets)
--end,
--on_use=function(self,room,source,target)
--end,
on_effect=function(self,effect)
	local room=effect.from:getRoom()
	room:setPlayerFlag(effect.from,"luaxzh_used")
	
	local selfplayer=effect.from
	local suit_t=nil
	if selfplayer:getMark("luayyspade")>0 then suit_t=sgs.Card_Spade end
	if selfplayer:getMark("luayyheart")>0 then suit_t=sgs.Card_Heart end
	if selfplayer:getMark("luayyclub")>0 then suit_t=sgs.Card_Club end
	if selfplayer:getMark("luayydiamond")>0 then suit_t=sgs.Card_Diamond end	
	room:playSkillEffect("luaxzh_vs")
	
	local hids=effect.to:handCards()
	--room:fillAG(hids,effect.from);
	--local luaxzh_tmplist={}
	--while true do
	if hids:isEmpty() then return false end
	--room:askForAG(effect.from,hids,true,"luaxzh")
	--local id_t=-1
	--id_t=room:askForAG(effect.from,hids,true,"luaxzh")
	--if id_t==-1 then break end				
	--end
	--effect.from:invoke("clearAG")
	room:showAllCards(effect.to,effect.from)
	if (room:askForSkillInvoke(effect.from,"luaxzh_vs")~=true) then return false end
	for _,id_i in sgs.qlist(hids) do
		if sgs.Sanguosha:getCard(id_i):getSuit()==suit_t then
			room:obtainCard(effect.from,id_i)
			room:showCard(effect.from,id_i)
		end		
	end	
end
}

luaxzh_vs=sgs.CreateViewAsSkill{
name="luaxzh_vs",
n=0,
--view_filter=function(self, selected, to_select)
	--return true
--end,
view_as=function(self, cards)
	if #cards~=0 then return nil end
	local a_luaxzh_card=luaxzh_card:clone()
	--a_luaxzh_card:addSubcard(cards[1])
	a_luaxzh_card:setSkillName(self:objectName())
	return a_luaxzh_card
end,
enabled_at_play=function()
	return not sgs.Self:hasFlag("luaxzh_used")
end,
enabled_at_response=function(self, player, pattern)
	return false
end
}

--扶乩
--tmpgenerals={--武将TABLE
--skills={},--技能子TABLE
--name="",
--kingdom=""}
function luafj_ex(room,p1,p2)
	local tmp1={skills={},name="",kingdom=""} --局部武将变量
	local tmp2={skills={},name="",kingdom=""} --局部武将变量	
	for _,sk in sgs.qlist(p1:getGeneral():getVisibleSkillList()) do
    	if (not sk:isLordSkill()) and (not (sk:getFrequency()==sgs.Skill_Limited)) and (not (sk:getFrequency()==sgs.Skill_Wake)) then
    		table.insert(tmp1.skills,sk:objectName())           	
    	end
	end
	tmp1.name=p1:getGeneralName()
	tmp1.kingdom=p1:getKingdom()
	for var=1,#(tmp1.skills),1 do			
       	room:detachSkillFromPlayer(p1,tmp1.skills[var])
    end			
	for _,sk in sgs.qlist(p2:getGeneral():getVisibleSkillList()) do
    	if (not sk:isLordSkill()) and (not (sk:getFrequency()==sgs.Skill_Limited)) and (not (sk:getFrequency()==sgs.Skill_Wake)) then
    		table.insert(tmp2.skills,sk:objectName())           	
    	end
	end
	tmp2.name=p2:getGeneralName()
	tmp2.kingdom=p2:getKingdom()
	for var=1,#(tmp2.skills),1 do			
       	room:detachSkillFromPlayer(p2,tmp2.skills[var])    	
	end
	room:setPlayerProperty(p1,"general",sgs.QVariant(tmp2.name))
    room:setPlayerProperty(p1,"kingdom",sgs.QVariant(tmp2.kingdom))
	for var=1,#(tmp2.skills),1 do
		--p1:speak(tmp2.skills[var])
		room:attachSkillToPlayer(p1,tmp2.skills[var])
	end	
	room:setPlayerProperty(p2,"general",sgs.QVariant(tmp1.name))
	room:setPlayerProperty(p2,"kingdom",sgs.QVariant(tmp1.kingdom))
	for var=1,#(tmp1.skills),1 do
		--p2:speak(tmp1.skills[var])
		room:attachSkillToPlayer(p2,tmp1.skills[var])
	end
end

luafj_card=sgs.CreateSkillCard{
name="luafj_effect",
target_fixed=false,
will_throw=true,
filter=function(self,targets,to_select)
	return ( to_select:objectName() ~= sgs.Self:objectName() ) and #targets< 2
end,
--feasible=function(self,targets)
--end,
on_use=function(self,room,source,targets)
	if #targets<2 then return false end
	room:setPlayerFlag(source,"luafj_used")
	local p1=targets[1]
	local p2=targets[2]
	p1:addMark("luafj_tmp1")
	p2:addMark("luafj_tmp2")	
	luafj_ex(room,p1,p2)
	room:playSkillEffect("luafj_trs")
end,
--on_effect=function(self,effect)
--end
}

luafj_vs=sgs.CreateViewAsSkill{
name="luafj_vs",
n=0,
view_as=function(self, cards)
	if #cards~=0 then return nil end
	local a_luafj_card=luafj_card:clone()
	--a_luafj_card:addSubcard(cards[1])
	a_luafj_card:setSkillName(self:objectName())
	return a_luafj_card
end,
enabled_at_play=function()
	return not sgs.Self:hasFlag("luafj_used")
end,
enabled_at_response=function(self, player, pattern)
	return false
end
}

luafj_trs=sgs.CreateTriggerSkill{
name="luafj_trs",
view_as_skill=luafj_vs,
events={sgs.TurnStart,sgs.Death},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.TurnStart then
		if not player:hasSkill(self:objectName()) then return false end
		
		local p1=nil
		local p2=nil
		for _,p in sgs.qlist(otherplayers) do
			if p:getMark("luafj_tmp1")==1 then p1=p end
			if p:getMark("luafj_tmp2")==1 then p2=p end			
		end
		if (p1==nil) and (p2==nil) then return false end		
		p1:setMark("luafj_tmp1",0)
		p2:setMark("luafj_tmp2",0)		
		luafj_ex(room,p1,p2)
	elseif event==sgs.Death then
		local p1=nil
		local p2=nil
		if player:hasSkill(self:objectName()) then
			for _,p in sgs.qlist(otherplayers) do
				if p:getMark("luafj_tmp1")==1 then p1=p end
				if p:getMark("luafj_tmp2")==1 then p2=p end			
			end
			if (p1==nil) and (p2==nil) then return false end
			p1:setMark("luafj_tmp1",0)
			p2:setMark("luafj_tmp2",0)
			luafj_ex(room,p1,p2)			
		elseif player:getMark("luafj_tmp1")==1 then
			p1=player
			for _,p in sgs.qlist(otherplayers) do
				--if p:getMark("luafj_tmp1")==1 then p1=p end
				if p:getMark("luafj_tmp2")==1 then p2=p end			
			end
			p1:setMark("luafj_tmp1",0)
			p2:setMark("luafj_tmp2",0)
			luafj_ex(room,p1,p2)			
		elseif player:getMark("luafj_tmp2")==1 then
			p2=player
			for _,p in sgs.qlist(otherplayers) do
				if p:getMark("luafj_tmp1")==1 then p1=p end
				--if p:getMark("luafj_tmp2")==1 then p2=p end			
			end
			p1:setMark("luafj_tmp1",0)
			p2:setMark("luafj_tmp2",0)
			luafj_ex(room,p1,p2)
		end		
	end	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	--if selfplayer==nil then return false end
	--return selfplayer:isAlive()
	return true
end
}
--普净法师列传
pujingfashils=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "pujingfashils$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--超度
luachd_trs=sgs.CreateTriggerSkill{
name="luachd_trs",
--view_as_skill=!!_vs,
events={sgs.Dying,sgs.GameStart},
frequency = sgs.Skill_Limited,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.Dying then
		if selfplayer:getMark("@luachd_chaodu")==0 then return false end
		selfplayer:setTag("luachd_tmp",data)
		local dying=data:toDying()
		if dying.who:hasSkill(self:objectName()) then return false end
		if (room:askForSkillInvoke(selfplayer,self:objectName(),data)~=true) then return false end
		room:playSkillEffect(self:objectName())
		room:loseMaxHp(selfplayer,3)--改为失去3点体力上限，之语，削弱
		selfplayer:loseMark("@luachd_chaodu")
		room:setPlayerProperty(dying.who,"hp",sgs.QVariant(math.min(3, dying.who:getMaxHp())))
		dying.who:throwAllCards()
		dying.who:drawCards(3)
		if dying.who:isChained() then
			if (dying.damage~=sgs.DamageStruct_Fire) and (dying.damage~=sgs.DamageStruct_Thunder) then
				room:setPlayerProperty(dying.who,"chained",sgs.QVariant(false))
			end
		end
		if not dying.who:faceUp() then dying.who:turnOver() end
	elseif event==sgs.GameStart then
		if player:hasSkill(self:objectName()) then
			selfplayer:gainMark("@luachd_chaodu")
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
--戒戮
luajl_trs=sgs.CreateTriggerSkill{
name="luajl_trs",
--view_as_skill=!!_vs,
events={sgs.DamageInflicted},
frequency = sgs.Skill_Compulsory,
priority=-1,--已修复藤甲结算问题，藤甲优先结算，此技能后结算。--by 之语
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.DamageInflicted then
		local damage=data:toDamage()
		if not damage.to:hasSkill(self:objectName()) then return false end
		room:playSkillEffect(self:objectName())
		if damage.damage>1 then damage.damage=1 end
		data:setValue(damage)
	end	
end,
--can_trigger=function(self, player)
	--local room=player:getRoom()
	--local selfplayer=room:findPlayerBySkillName(self:objectName())
	--if selfplayer==nil then return false end
	--return selfplayer:isAlive()
--end
}
--戒酒
luajj_fts=sgs.CreateFilterSkill{
name="luajj_fts",
view_filter=function(self,to_select)
	return to_select:inherits("Analeptic")
end,
view_as=function(self,card)
	local filtered=sgs.Sanguosha:cloneCard("peach", card:getSuit(), card:getNumber())
	filtered:addSubcard(card)
	filtered:setSkillName(self:objectName())
	return filtered
end
}

--[[luajd_prs=sgs.CreateProhibitSkill{ 
name = "luajd_prs",
is_prohibited=function(self,from,to,card)
    if to:hasSkill(self:objectName()) then
        return card:inherits("Snatch")
    end
end,
}]]--
--戒盗
luajd_trs=sgs.CreateTriggerSkill{
name="luajd_trs",
--view_as_skill=!!_vs,
events={sgs.CardLost},
frequency = sgs.Skill_Compulsory,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.CardLost then
		local move=data:toCardMove()
		if selfplayer:getPhase()~=sgs.Player_NotActive then return false end
		if not move.from:hasSkill(self:objectName()) then return false end
		room:playSkillEffect(self:objectName())
		if move.to_place==sgs.Player_DiscardedPile then
			return false
		else
			room:moveCardTo(sgs.Sanguosha:getCard(move.card_id),nil,sgs.Player_DiscardedPile)			
			return true
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

--[[luajk_prs=sgs.CreateProhibitSkill{ 
name = "luajk_prs",
is_prohibited=function(self,from,to,card)
    if to:hasSkill(self:objectName()) then
        return card:inherits("DelayedTrick")
    end
end,
}]]--
--戒诳
luajk_trs=sgs.CreateTriggerSkill{
name="luajk_trs",
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

--[[luajy_prs=sgs.CreateProhibitSkill{ 
name = "luajy_prs",
is_prohibited=function(self,from,to,card)
    if to:hasSkill(self:objectName()) then
        return card:inherits("luast_card") or card:inherits("JieyinCard")
    end
end,
}]]--
--戒淫
luajieyin_trs=sgs.CreateTriggerSkill{
name="luajieyin_trs",
--view_as_skill=!!_vs,
events={sgs.CardEffect},
frequency = sgs.Skill_Compulsory,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.CardEffect then
		if not room:getCurrent():getGeneral():isFemale() then return false end
		local effect=data:toCardEffect()
		if not effect.to:hasSkill(self:objectName()) then return false end
		if effect.card:getTypeId()~=sgs.Card_Trick then return false end
		room:playSkillEffect(self:objectName())
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
--司马炎列传
simayanls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "simayanls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--晋帝
jindits=sgs.CreateTriggerSkill{
	name="jindits",
	events={sgs.GameStart,sgs.TurnedOver},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()--获取房间
		if event==sgs.GameStart then
			room:acquireSkill(player,"guixin")
		end
		if event==sgs.TurnedOver then
		if not player:faceUp() then
			room:detachSkillFromPlayer(player,"guixin")
			for _,p in sgs.qlist(room:getOtherPlayers(player)) do
				room:acquireSkill(p,"wangluanfs")
			end
		else
			room:acquireSkill(player,"guixin")
			for _,p in sgs.qlist(room:getOtherPlayers(player)) do
				room:detachSkillFromPlayer(p,"wangluanfs")
			end
		end
		end
	end,
}
 --王乱
wangluan_card=sgs.CreateSkillCard{--王乱技能卡        
name="wangluanfs",        
target_fixed=false,        
will_throw=false,
    filter = function(self, targets, to_select, player)                
	if #targets > 0  then return false end                
	if to_select:objectName() == player:objectName() then return false end
	if not (player:canSlash(to_select,true) or to_select:hasSkill("jindits")) then return false end--只有对司马炎才是无距离限制的
	local card = sgs.Sanguosha:getCard(self:getSubcards():first())                
	if player:isProhibited(to_select, card) then return false end                                
	return true        
	end,                
	on_effect=function(self,effect)                
	local room = effect.from:getRoom()
	local card_id = self:getSubcards():first()                
	local card = sgs.Sanguosha:getCard(card_id)                
	local use = sgs.CardUseStruct()                
	use.card = card               
	use.from = effect.from             
	use.to:append(effect.to)            
    room:useCard(use) 
	end,}
 
wangluanfs=sgs.CreateFilterSkill{--王乱视为技      
  name="wangluanfs",                      
  view_filter = function(self, to_select)         
	return (to_select:inherits("Slash") or to_select:inherits("FireSlash") or to_select:inherits("ThunderSlash")) and to_select:isBlack()
  end,            
  view_as = function(self, card)        
  local suit,number              
  local view_as_card            
  view_as_card = wangluan_card:clone()    
  view_as_card:addSubcard(card:getId())    
  view_as_card:setSkillName(self:objectName())     
  return view_as_card     
  end,}
  
--开国
kaiguots=sgs.CreateTriggerSkill{
	frequency = sgs.Skill_NotFrequent,
	name="kaiguots$",
	events={sgs.PhaseChange},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()--获取房间
		if not player:isLord() then return false end--主公技
		if event==sgs.PhaseChange and player:getPhase()==sgs.TurnStart then
		
			if not room:askForSkillInvoke(player, "kaiguots") then return false end
		
			for _,p in sgs.qlist(room:getAlivePlayers()) do--删掉开国赋予的技能，等待重新赋予
				if p:hasSkill("weijnts") then
					room:detachSkillFromPlayer(p,"weijnts")
				elseif p:hasSkill("shujnts") then
					room:detachSkillFromPlayer(p,"shujnts")
				elseif p:hasSkill("wujnts") then
					room:detachSkillFromPlayer(p,"wujnts")
				elseif p:hasSkill("qunjnts") then
					room:detachSkillFromPlayer(p,"qunjnts")
				end
			end		
		
			local new_kingdom=room:askForKingdom(player)
			room:setPlayerProperty(player, "kingdom",  sgs.QVariant(new_kingdom))
			local log=sgs.LogMessage()
            log.type = "#ChooseKingdom"
            log.from = player
            log.arg = new_kingdom
            room:sendLog(log)
			--
			for _,p in sgs.qlist(room:getAlivePlayers()) do--全体存活角色，包括自己			
				if(p:getKingdom() == player:getKingdom()) then 
				if p:getKingdom()=="wei" then
					room:acquireSkill(p,"weijnts")
				elseif p:getKingdom()=="shu" then
					room:acquireSkill(p,"shujnts")
				elseif p:getKingdom()=="wu" then
					room:acquireSkill(p,"wujnts")
				elseif p:getKingdom()=="qun" then
					room:acquireSkill(p,"qunjnts")
				else
					return false
				end
				end
			end
			--
		end		
	end,
}


weijnts=sgs.CreateTriggerSkill{
name="weijnts",
events={sgs.DamageInflicted},
frequency = sgs.Skill_Compulsory,
priority=-1,--已修复藤甲结算问题，藤甲优先结算，此技能后结算。--by 之语
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	if event==sgs.DamageInflicted then
		local damage=data:toDamage()
		if not damage.to:hasSkill(self:objectName()) then return false end
		room:playSkillEffect(self:objectName())
		local log=sgs.LogMessage()
			log.from =player
			log.type ="#weijnts"
			room:sendLog(log)
		if damage.damage>1 then damage.damage=1 end
		data:setValue(damage)
	end	
end,
}

shujnts=sgs.CreateTriggerSkill{ 
name="shujnts", 
events=sgs.CardEffect, 
frequency=sgs.Skill_Compulsory, 
on_trigger=function(self,event,player,data) 
	local room=player:getRoom()
	local effect = data:toCardEffect()
	if effect.card:inherits("Slash") then
	local log=sgs.LogMessage()
			log.from =player
			log.type ="#shujnts"
			room:sendLog(log)
		player:drawCards(1)
	end 
 end,
 }
 
wujnts = sgs.CreateTriggerSkill
{frequency = sgs.Skill_Compulsory,
name = "wujnts",
events=sgs.PhaseChange,
on_trigger=function(self,event,player,data)
	local room=player:getRoom()
	if player:getPhase()==sgs.Player_Discard then
		local hp=player:getHp()
		local hc=player:getHandcardNum()
		if hc==hp+1 then
			local log=sgs.LogMessage()
			log.from =player
			log.type ="#wujnts"
			room:sendLog(log)
		end
		if hc>hp+1 then
			room:askForDiscard(player,"wujnts",hc-hp-1,hc-hp-1,false,false) 
			local log=sgs.LogMessage()
			log.from =player
			log.type ="#wujnts"
			room:sendLog(log)
		end
		return true--跳过弃牌阶段解决
	end
end,
}

qunjnts = sgs.CreateTriggerSkill
{
frequency = sgs.Skill_Compulsory,
name = "qunjnts",
events={ sgs.SlashEffected},
frequency=sgs.Skill_Compulsory,
on_trigger=function(self,event,player,data)
	local room=player:getRoom()
	if player:getKingdom()~="qun" then return false end
	targets=room:getOtherPlayers(player)
	for _,p in sgs.qlist(room:getOtherPlayers(player)) do
		if p:getKingdom()~="qun" then
			targets:removeOne(p) 
		end 
	end
	local pd=0
	for _,p in sgs.qlist(targets) do
		if player:getHp()>=p:getHp() then
		pd=pd+1
		end
	end
	if pd~=0 then return false end
	local log=sgs.LogMessage()
			log.from =player
			log.type ="#qunjnts"
			room:sendLog(log)
	return true
end,
}
--贾南风列传
jiananfengls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "jiananfengls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--庇亲
LuaFanLiuLi=sgs.CreateTriggerSkill{
	name="LuaFanLiuLi",
	events=sgs.CardEffected,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local effect=data:toCardEffect()
		local from=effect.from
		if effect.card:inherits("Slash") then
			for _,theplayer in sgs.qlist(room:getOtherPlayers(player)) do--循环，逐一检视所有角色
				if theplayer:hasSkill("LuaFanLiuLi") and theplayer:getSeat()~=from:getSeat() and theplayer:canSlash(player) then--有预知这个技能
					if room:askForSkillInvoke(theplayer,"LuaFanLiuLi",data) then
						theplayer:drawCards(1)
						effect.to=theplayer
						data:setValue(effect)
						room:playSkillEffect("LuaFanLiuLi")
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
--贪忌
LuaFanRenDeCard=sgs.CreateSkillCard{
	name="LuaFanRenDeCard",
	target_fixed=true,
	will_throw=false,
	on_use=function(self,room,source,targets)
		local list=sgs.SPlayerList()
		for _,theplayer in sgs.qlist(room:getOtherPlayers(source)) do
			if theplayer:hasSkill("LuaFanRenDe") then list:append(theplayer) end
		end
		local t=room:askForPlayerChosen(source,list,"LuaFanRenDe")
		if not t then return end
		room:moveCardTo(self,t,sgs.Player_Hand,false)
		if t:hasFlag("LuaFanRenDe2") then return end
		if self:getSubcards():length()>=2 or t:hasFlag("LuaFanRenDe1") then
			room:setPlayerFlag(t,"LuaFanRenDe2")
			room:loseHp(t)
			room:playSkillEffect("LuaFanRenDe")
		else
			room:setPlayerFlag(t,"LuaFanRenDe1")
		end
	end,
}
LuaFanRenDeVS=sgs.CreateViewAsSkill{
	name="LuaFanRenDeVS",
	n=999,
	view_filter=function(self,selected,to_select)
		if to_select:isEquipped() then return false end
		return true
	end,
	view_as=function(self,cards)
		if #cards==0 then return end
		local acard=LuaFanRenDeCard:clone()
		for var=1,#cards,1 do
			acard:addSubcard(cards[var])
		end
		return acard
	end,
}
LuaFanRenDe=sgs.CreateTriggerSkill{
	name="LuaFanRenDe",
	events={sgs.GameStart,sgs.PhaseChange},
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if event==sgs.GameStart then
			if not player:hasSkill(self:objectName()) then return false end
			for _,theplayer in sgs.qlist(room:getOtherPlayers(player)) do
				room:acquireSkill(theplayer,"LuaFanRenDeVS")--添加技能，让其可以给牌
			end
			return false
		end
		if player:getPhase() == sgs.Player_Finish then
			for _,theplayer in sgs.qlist(room:getAllPlayers()) do
				room:setPlayerFlag(theplayer,"-LuaFanRenDe1")
				room:setPlayerFlag(theplayer,"-LuaFanRenDe2")
			end
		end
	end,
	can_trigger=function(self,player)
		return player and player:isAlive()--重载cantrigger，不是自己也能用（相当于略去hasskill）
	end,
}
--神孙权列传
shensunquanls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "shensunquanls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--纵横
zonghengs_card = sgs.CreateSkillCard
{--神孙权，by之语
name = "zonghengs_card",
on_effect = function(self, effect)
	local room = effect.from:getRoom()
	local handcards = effect.to:getHandcards()
	local x = effect.to:getHandcardNum()
	room:playSkillEffect("zonghengs")
	for _,cd in sgs.qlist(handcards) do
		room:moveCardTo(cd, effect.from, sgs.Player_Hand, false)
	end
	local value = sgs.QVariant()
	value:setValue(effect.to)
	--以下是返回牌的代码
	local card_ids = sgs.IntList()
	for _,cd in sgs.qlist(effect.from:getHandcards()) do
		local id = cd:getEffectiveId()
		card_ids:append(id)
	end
	for var = 1 , x, 1 do
		room:fillAG(card_ids, effect.from)
		local cdid = room:askForAG(effect.from, card_ids, false, self:objectName())
		room:moveCardTo(sgs.Sanguosha:getCard(cdid), effect.to, sgs.Player_Hand, false)
		card_ids:removeOne(cdid)
		effect.from:invoke("clearAG")
	end
	room:setPlayerFlag(effect.from,"zonghengsused")
end,
}

zonghengs = sgs.CreateViewAsSkill
{
name = "zonghengs",
n = 0,
view_as = function(self, cards)
	if #cards == 0 then 
		local acard = zonghengs_card:clone()
		acard:setSkillName(self:objectName())
		return acard
	end
end,

enabled_at_play = function(self, player)
return not sgs.Self:hasFlag("zonghengsused")
end,

enabled_at_response = function(self, player, pattern)
return false
end,
}
--力挽
--[[liwans=sgs.CreateTriggerSkill{
	frequency = sgs.Skill_NotFrequent, 
	name = "liwans",
	events={sgs.DamageCaused}, --触发时机
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		local damage = data:toDamage()
		local from = data:toDamage().from
		if from~=nil then
			if(player and (not player:isAllNude()) and room:askForSkillInvoke(player, "liwans", data)) then
				--local card_id = room:askForCardChosen(player, player, "hej", "liwans")
				--room:moveCardTo(sgs.Sanguosha:getCard(card_id), from, sgs.Player_Hand,false)--交出去
				--room:askForDiscard(player,1)
				damage.damage=damage.damage-1
				data:setValue(damage)
				room:playSkillEffect("liwans")
			else
				return false
			end
		else
			if(player and (not player:isAllNude()) and room:askForSkillInvoke(player, "liwans", data)) then
				--local card_id = room:askForCardChosen(player, player, "hej", "liwans")
				--room:throwCard(card_id)
				--room:askForDiscard(player,1)
				damage.damage=damage.damage-1
				data:setValue(damage)
				--local log=sgs.LogMessage()
				--log.type = "#liwans"
				--log.from = player
				--room:sendLog(log)
				room:playSkillEffect("liwans")
			else
				return false
			end
		end
	end
}]]

liwans = sgs.CreateTriggerSkill
{
	priority=2,
	frequency=sgs.Skill_NotFrequent,
	name = "liwans",
	events = {sgs.DamageCaused},
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		if ((not player:isAllNude()) and (not room:askForSkillInvoke(player,self:objectName()))) then return false end
		--local card=room:askForCard(player,"..","hh~~")
		local card=room:askForCard(player,"EquipCard","hh~~",data)
	    if card==nil then return end
	    --if not card:inherits("EquipCard") then return end
	room:throwCard(card)
		local damage = data:toDamage()
		local choise = room:askForChoice(player,self:objectName(), "add+one")
		if choise == "add" then
		
			damage.damage = damage.damage + 1
			data:setValue(damage)
			room:playSkillEffect("liwans")
			local log=sgs.LogMessage()
			log.from =player
			log.type ="#lua_suwei_add"
			log.arg = tonumber(damage.damage - 1)
			log.arg2 = tonumber(damage.damage)
			room:sendLog(log)
		else
			local log=sgs.LogMessage()
			log.from =player
			log.type ="#lua_suwei_one"
			log.arg = tonumber(damage.damage)
			log.arg2 = tonumber(damage.damage - 1)
			room:sendLog(log)
		
			damage.damage = damage.damage - 1
			data:setValue(damage)
			room:playSkillEffect("liwans")
		end
	end,
}
--伏寿皇后列传
fushouls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "fushouls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
fushoulss=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "fushoulss$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--伏寿技能
function SkillLog(player,str,typ,num)
	local room=player:getRoom()
	local log1=sgs.LogMessage()
	if num==0 then
		room:playSkillEffect(str)
	else
		room:playSkillEffect(str,num)
		str=str..num
	end
	if typ==1 then
		log1.type="$"..str
	else
		if typ==0 then
			log1.type="#TriggerSkill"
		else
			log1.type="#InvokeSkill"
		end
		log1.from=player
		log1.arg=str
	end
	room:sendLog(log1)--发送信息，无实际意义
	return nil
end

function check(player)
	local room=player:getRoom()
	if player:getHp()>=player:getMark("@mzh") then return nil end

  SkillLog(player,"sfc",0,0)

  for _, p in sgs.qlist(room:getPlayers()) do
    p:unicast("animate lightbox:$sfcanimate:3000")
  end

	room:transfigure(player, "gzfshh", true, true)
end

szh_card = sgs.CreateSkillCard
{--突袭技能卡 by ibicdlcod
	name = "szh",	
	target_fixed = false,	
	will_throw = false,
	
	filter = function(self, targets, to_select)
		if(#targets >= 1) then return false end
		
		if(to_select == self) then return false end
		
		return to_select:topDelayedTrick()
	end,
		
	on_effect = function(self, effect)
		local from = effect.from
		local to = effect.to
		local room=to:getRoom()
			SkillLog(from,"szh",1,0)
	for _,card in sgs.qlist(to:getCards("j")) do
			room:moveCardTo(card, from, sgs.Player_Hand, true)
			from:gainMark("@mzh")
			check(from)
		end
	end,
}

szh_viewas = sgs.CreateViewAsSkill
{--突袭视为技 by ibicdlcod
	name = "szh_viewas",	
	n = 0,
	
	view_as = function()
		return szh_card:clone()		
	end,
	
	enabled_at_play = function()
		return false
	end,
	
	enabled_at_response = function(self, player, pattern)
		return pattern == "@@szh"
	end
}

szh = sgs.CreateTriggerSkill
{--突袭 by ibicdlcod
	name = "szh",
	view_as_skill = szh_viewas,
	events = {sgs.PhaseChange},
	
	on_trigger = function(self, event, player, data)
		if(player:getPhase() == sgs.Player_Start) then
			local room = player:getRoom()
			local can_invoke = false
			local other = room:getOtherPlayers(player)
			for _,aplayer in sgs.qlist(other) do
				if aplayer:topDelayedTrick() then
					can_invoke = true
					break
				end
			end
			if(can_invoke and room:askForUseCard(player, "@@szh", "@szh_card")) then return false end
		return false
		end
	end
}

smy_card = sgs.CreateSkillCard
{--制衡技能卡 by hypercross, ibicdlcod修复getsubcards BUG, coldera修复技能卡objectName失效的BUG
	name = "smy",
	target_fixed = true,
	will_throw = true,
	
	on_use = function(self, room, source, targets)
	SkillLog(source,"smy",1,0)
		for _,ap in sgs.qlist(room:getAllPlayers()) do
			ap:drawCards(1)
		end
		room:setPlayerFlag(source,"smy_used")
	end,
}

smy = sgs.CreateViewAsSkill
{--制衡 by ibicdlcod
	name = "smy",
	n =0,
	view_as = function(self, cards)
			local new_card = smy_card:clone()
			return new_card
	end,
	
	enabled_at_play = function()
		return not sgs.Self:hasFlag("smy_used")
	end
}

sfc = sgs.CreateTriggerSkill
{--突袭 by ibicdlcod
	name = "sfc",
	events = sgs.HpChanged,
	frequency=sgs.Skill_Wake,
	on_trigger = function(self, event, player, data)
		check(player)
	end,
	}
	
sds=sgs.CreateTriggerSkill{
	name="sds",
	events=sgs.CardFinished,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()--获取房间
		local use=data:toCardUse()--使用结构体
		local cd=use.card--使用的牌
		if not (cd and cd:isNDTrick()) then return false end--不是杀
		if use.from:hasSkill("sds") then return false end--不是杀
			local pattern=".|.|.|."--基本牌，锦囊牌，对应花色，加上.a可以让系统不播放牌的音效
			for _,theplayer in sgs.qlist(room:getAllPlayers()) do--循环，逐一检视所有角色
				if theplayer:hasSkill("sds") then--有这个技能，不是使用中（否则两张杀换来换去死循环）
					local card=room:askForCard(theplayer,pattern,"askforsds",data)--请求弃牌
					if card then
						SkillLog(theplayer,self:objectName(),2,0)
						SkillLog(theplayer,self:objectName(),1,0)
						room:moveCardTo(cd,theplayer,sgs.Player_Hand,true)--卡片转移
room:throwCard(card,theplayer)	
return false
				end
			end
		end
	
	end,
	can_trigger=function(self,player)
		return player and player:isAlive()--重载cantrigger，不是自己也能用（相当于略去hasskill）
	end,
}

syj_card = sgs.CreateSkillCard
{--突袭技能卡 by ibicdlcod
	name = "syj",	
	target_fixed = false,	
	will_throw = false,
	
	filter = function(self, targets, to_select)
		if(#targets >= 1) then return false end
		
		if(to_select == self) then return false end
		
		return to_select:topDelayedTrick()
	end,
		
	on_effect = function(self, effect)
		local from = effect.from
		local to = effect.to
		local room=to:getRoom()
		SkillLog(from,"syj",1,0)
		for _,card in sgs.qlist(to:getCards("j")) do
			room:moveCardTo(card, from, sgs.Player_Hand, true)
			from:gainMark("@mzh")
			from:skip(sgs.Player_Play)
		end
	end,
}

syj_viewas = sgs.CreateViewAsSkill
{--突袭视为技 by ibicdlcod
	name = "syj_viewas",	
	n = 0,
	
	view_as = function()
		return syj_card:clone()		
	end,
	
	enabled_at_play = function()
		return false
	end,
	
	enabled_at_response = function(self, player, pattern)
		return pattern == "@@syj"
	end
}

syj = sgs.CreateTriggerSkill
{--突袭 by ibicdlcod
	name = "syj",
	view_as_skill = syj_viewas,
	events = {sgs.PhaseChange},
	
	on_trigger = function(self, event, player, data)
		if(player:getPhase() == sgs.Player_Start) then
			local room = player:getRoom()
			local can_invoke = false
			local other = room:getOtherPlayers(player)
			for _,aplayer in sgs.qlist(other) do
				if aplayer:topDelayedTrick() then
					can_invoke = true
					break
				end
			end
			if(can_invoke and room:askForUseCard(player, "@@syj", "@syj_card")) then return false end
		return false
		end
	end
}

-- 幽怨：你没受到一次伤害，可以弃置1枚标记物，令伤害来源，手牌数调整到与你手牌数相同（弃置或新摸）。令伤害来源，体力值调整到与你当前体力相同（流失或恢复） 
-- TriggerSkill{Damaged} 
syy = sgs.CreateTriggerSkill{
  name = "syy",
  events = {sgs.Damaged},
  frequency = sgs.Skill_NotFrequent,
  
  on_trigger = function(self, event, player, data)
    local room = player:getRoom()
    local damage = data:toDamage()
    local from = damage.from

    mark_count = player:getMark("@mzh")
    if mark_count <= 0 then return end

    local choices = "syy_handcard+syy_hp"
    if mark_count >= 2 then
      choices = choices .. "+syy_both"
    end
    choices = choices .. "+close"

    local choice = room:askForChoice(player, "syy", choices)
    local can_invoke = {}
    if choice == "syy_handcard" then
      can_invoke["syy_handcard"] = true
    elseif choice == "syy_hp" then
      can_invoke["syy_hp"] = true
    elseif choice == "syy_both" then
      can_invoke["syy_handcard"] = true
      can_invoke["syy_hp"] = true
    else
      return
    end

    local log = sgs.LogMessage()
    log.type = "#syy_invoke_skill"
    log.from = player
    room:sendLog(log)

    local log = sgs.LogMessage()
    log.type = "#syy_choice"
    log.from = player
    log.arg = choice
    room:sendLog(log)

    room:playSkillEffect("syy")

    if can_invoke["syy_handcard"] then

      player:loseMark("@mzh")

      mynum = player:getHandcardNum()
      fromnum = from:getHandcardNum() 
      num = math.abs(mynum - fromnum)

      if mynum == fromnum then
        -- pass
      elseif mynum > fromnum then
        from:drawCards(num)
      else
        room:askForDiscard(from, "syy", num, num) 
      end
    end

    if can_invoke["syy_hp"] then
      player:loseMark("@mzh")

      myhp = player:getHp()
      fromhp = from:getHp()
      num = math.abs(myhp - fromhp)

      if myhp == fromhp then
        -- pass
      elseif myhp > fromhp then
        local recover = sgs.RecoverStruct()
        recover.recover = num
        room:recover(from, recover)
      else
        room:loseHp(from, num)
      end
    end
  end,
}
--统率
tongshuai_skill = sgs.CreateViewAsSkill{
  name = "tongshuai",
  n = 0,

  view_as = function(self, cards)
    if #cards == 0 then
      local acard = tongshuai_card:clone()

      return acard
    end
  end,

  enabled_at_play = function(self, player)
    return false
  end,

  enabled_at_response = function(self, player, pattern)
    return pattern == "@@tongshuai"
  end,
}

tongshuai_card = sgs.CreateSkillCard{
  name = "tongshuai",
  target_fixed = false,
  will_throw = true,

  filter = function(self, targets, to_select, player) 
    return #targets < 2 and 
      to_select:objectName() ~= player:objectName()
  end,

	on_use = function(self, room, source, tos)
    local from = source
      for _, to in ipairs(tos) do
      room:playSkillEffect("tongshuai")

      room:drawCards(to, 1, "tongshuai")

      targets = sgs.SPlayerList()
      for _, p in sgs.qlist(room:getOtherPlayers(from)) do
        if from:inMyAttackRange(p) and to:canSlash(p,false) and not array_include_player(tos, p) then
          targets:append(p)
        end
      end

      if targets:isEmpty() then 
        local log = sgs.LogMessage()
        log.type = "#tongshuai_no_target"
        log.from = from
        log.to:append(to)
        room:sendLog(log)

      else
        local target = room:askForPlayerChosen(from, targets, "tongshuai")
        local slash = room:askForCard(to, "slash", string.format("@tongshuai-askfor-slash:%s:%s", from:objectName(), target:objectName()))

        if slash then
          local use = sgs.CardUseStruct()
          use.from = to
          use.to:append(target)
          use.card = slash

          room:setPlayerFlag(target, "tongshuai")
          room:useCard(use,false)
          room:setPlayerFlag(target, "-tongshuai")
        else
          from:drawCards(2)
        end
      end
    end
  end,
}

tongshuai = sgs.CreateTriggerSkill{
  name = "tongshuai",
  events = {sgs.PhaseChange},
  frequency = sgs.Skill_NotFrequent,
  view_as_skill = tongshuai_skill,
  
  on_trigger = function(self, event, player, data)
    local room = player:getRoom()

    if player:getPhase() == sgs.Player_Draw and
      room:askForUseCard(player, "@@tongshuai", "@tongshuai_ask") then

      return true
    end
  end,
}

tongshuai_damage = sgs.CreateTriggerSkill{
  name = "#tongshuai_damage",
  events = {sgs.DamageComplete},
  frequency = sgs.Skill_NotFrequent,
  
  can_trigger = function(self, target) 
    return target:hasFlag("tongshuai")
  end,

  on_trigger = function(self, event, player, data)
    local room = player:getRoom()
    local damage = data:toDamage()
    local me = room:findPlayerBySkillName("tongshuai")  

    if me:isAlive() and damage.damage then
      for i=1,damage.damage do
        if player:isKongcheng() then
          return
        end

        local card_id = room:askForCardChosen(me, player, "h", "tongshuai")
        room:obtainCard(me, card_id)
      end
    end
  end,
}
--猛锐
mengrui = sgs.CreateTriggerSkill{
  name = "mengrui",
  events = {sgs.SlashMissed},
  frequency = sgs.Skill_NotFrequent,
  prority = 3,
  
  on_trigger = function(self, event, player, data)
    local room = player:getRoom()
    local effect = data:toSlashEffect()
    local slash = effect.slash
    local jink = effect.jink
    local to = effect.to

    if player:getPhase() ~= sgs.Player_Play then return end

    if slash:isRed() then
      room:playSkillEffect("mengrui")

      local log = sgs.LogMessage()
      log.type = "#mengrui_invoke"
      log.from = player
      room:sendLog(log)

      player:obtainCard(jink)

      local slash = room:askForCard(player, "slash", "@mengrui")
      if slash then
        local use = sgs.CardUseStruct()
        use.from = player
        use.to:append(to)
        use.card = slash

        room:useCard(use)
      end
    end
  end,
}
--英杰
yingjie = sgs.CreateTriggerSkill{
  name = "yingjie",
  events = {sgs.StartJudge},
  frequency = sgs.Skill_NotFrequent,
  priority = 4,

  can_trigger = function(self, target) 
    return not target:hasSkill("yingjie")
  end,

  on_trigger = function(self, event, player, data)
    local room = player:getRoom()
    local me = room:findPlayerBySkillName("yingjie")  

    if me:isDead() and 
      player:getPhase() ~= sgs.Player_Judge then 
      return 
    end

    local can_invoke = false
    for _,c in sgs.qlist(me:getHandcards()) do
      if c:inherits("BasicCard") then
        can_invoke = true
        break
      end
    end

    if can_invoke and
      room:askForSkillInvoke(me, "yingjie") then

      room:playSkillEffect("yingjie")

      me:drawCards(2)

      if me:getHandcardNum() > me:getMaxHp() then
        local c = room:askForCard(me, ".Basic", "@yingjie-discard")
        if c then
          room:throwCard(c, me) 
        else
          room:loseHp(me, 1)
        end
      end

      return true
    end
  end,
}

--南斗北斗列传
nandoubeidouls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "nandoubeidouls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--仙体
xiantis=sgs.CreateTriggerSkill{--触发技
	frequency = sgs.Skill_Compulsory, --锁定技
	name="xiantis",
	events=sgs.DamageForseen,--受到伤害时
	on_trigger=function(self,event,player,data)--要执行的动作
		local room=player:getRoom()--获取房间
		local damage=data:toDamage()--获取伤害结构体
		local card=damage.card--获取造成伤害的牌
		if not card then --如果没有造成伤害的牌，则触发此技能,不结算伤害事件
			local log=sgs.LogMessage()
			log.type = "#xiantis"
			log.from = player
			room:sendLog(log)
			return true 
		end
		local alive=room:alivePlayerCount()--获取当前场上存活角色数目
		if card:getNumber()~=alive then--若造成伤害的牌点数不等于当前场上存活角色数目
			local log=sgs.LogMessage()
			log.type = "#xiantis"
			log.from = player
			room:sendLog(log)
			room:playSkillEffect("xiantis")
			return true--不结算伤害事件
		else
			return false
		end
	end,
}--code by 之语

--生死
shengsis = sgs.CreateTriggerSkill
{-- by 之语
	name = "shengsis",
	frequency = sgs.Skill_NotFrequent,
	events = {sgs.PhaseChange},
	
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		if (player:getPhase() == sgs.Player_Finish) then
			if (not room:askForSkillInvoke(player,self:objectName())) then return false end--询问是否发动，不发动则无事
			local card_ids = room:getNCards(2)--取走牌堆顶的2张牌
			room:fillAG(card_ids,nil)--所有人打开五谷视图
            room:getThread():delay()
			room:playSkillEffect("shengsis")
			local n=0
            for _,id in sgs.qlist(card_ids) do
				--local n=0
                card = sgs.Sanguosha:getCard(id)
                if card:isRed() then
					n=n+1
                    room:takeAG(nil, id)
				else
					room:takeAG(nil, id)
                end
            end
            room:getThread():delay()
            for _,p in sgs.qlist(room:getAllPlayers()) do
                p:invoke("clearAG")
			end
			if n==1 then 
				local log=sgs.LogMessage()
				log.type = "#shengsisc"
				log.from = player
				room:sendLog(log)
				return true 
			end
			local target = room:askForPlayerChosen(player, room:getOtherPlayers(player), "reason")
				local log=sgs.LogMessage()
				log.type = "#shengsisd"
				log.from = player
				room:sendLog(log)
			if n==0 then
				local log=sgs.LogMessage()
				log.type = "#shengsisa"
				log.from = player
				room:sendLog(log)
				room:loseHp(target,1)
			elseif n==2 then
				local log=sgs.LogMessage()
				log.type = "#shengsisb"
				log.from = player
				room:sendLog(log)
				local recover=sgs.RecoverStruct()
				recover.who = target
				recover.reason = self:objectName()
				recover.recover = 1
				room:recover(target,recover)
			end
		end
	end,
}

--南华老仙
luanhlx:addSkill(nanhualaoxianls)
luanhlx:addSkill(luaxsh_trs)
luanhlx:addSkill(luagm_trs)
luanhlx:addSkill(luatp_trs)

--紫虚上人

--普净法师
luapjfsh:addSkill(pujingfashils)
luapjfsh:addSkill(luachd_trs)
luapjfsh:addSkill(luajl_trs)
luapjfsh:addSkill(luajj_fts)
luapjfsh:addSkill(luajieyin_trs)
luapjfsh:addSkill(luajd_trs)
luapjfsh:addSkill(luajk_trs)

--司马炎


--贾南风
--luajiananfeng:addSkill(jiananfengls)
--luajiananfeng:addSkill(LuaFanLiuLi)
local skill=sgs.Sanguosha:getSkill("LuaFanRenDeVS")
if not skill then
	local skillList=sgs.SkillList()
	skillList:append(LuaFanRenDeVS)
	sgs.Sanguosha:addSkills(skillList)
end
--luajiananfeng:addSkill(LuaFanRenDe)

--神孙权
shensunquans:addSkill(shensunquanls)
shensunquans:addSkill(zonghengs)
shensunquans:addSkill(liwans)

--神孙策
shensunce:addSkill(suncels)
shensunce:addSkill(tongshuai)
shensunce:addSkill(tongshuai_damage)
shensunce:addSkill(mengrui)
--shensunce:addSkill(yingjie)

--伏寿皇后



--南斗北斗
--nandoubds:addSkill(nandoubeidouls) 
--nandoubds:addSkill(xiantis) 
--nandoubds:addSkill(shengsis) 



sgs.LoadTranslationTable{
["dps"]="龙凤神将",
["luanhlx"]="南华老仙",
["#luanhlx"] = "  仙人  ",
["designer:luanhlx"]="廉贞星君丨lwx19911226，之语",
["cv:luanhlx"]="英雄杀",
["nanhualaoxianls"]="人物列传",
[":nanhualaoxianls"]="<b>南华老仙，演义中记载，是张角之师。得道天仙，亲授张角三卷天书太平要术，令其普救世人。实为三国乱世的罪魁祸首。</b>",
	["luaxsh_trs"]="仙术",
	[":luaxsh_trs"]="回合开始阶段，你可选择一名其他存活的角色，并获得其一个技能直到下回合开始时为止（主公技、限定技、觉醒技除外）。",
	["luaxsh_cancel"]="取消",
	["luagm_trs"]="天道",
	["luagm_effect"]="天道",
	[":luagm_trs"]="任意一名角色的判定牌生效前，你可以用自己的一张牌替换之。",
	["@luagm_trs"]="请选择一张牌",
	["luatp_trs"]="太平",
	[":luatp_trs"]="<b>锁定技</b>，雷属性伤害对你无效。",
	["#luatp"]="因为【太平】的效果， %from 受到的雷属性伤害无效",
	["illustrator:luanhlx"] = "插图:霸者无双丨PS:廉贞星君",
	["$luaxsh_trs"] = "哈哈哈~",
    ["$luagm_trs"] = "哈哈哈~",
    ["$luatp_trs"] = "哈哈哈~",
	["~luanhlx"]="原谅我吧~",
["luazxshr"]="紫虚上人",
["#luazxshr"] = "  道士  ",
["designer:luazxshr"]="技能:廉贞星君丨LUA:lwx19911226",
["cv:luazxshr"]="西游杀，英雄杀",
["zixushangrenls"]="人物列传",
[":zixushangrenls"]="<b>紫虚上人，居于锦屏山中的异人，能知人生死贵贱。刘璋派遣刘璝、张任、泠苞、邓贤四人前往雒城守备，四人途经锦屏山，向紫虚上人询问此战吉凶，紫虚上人留下八句言语，预测了庞统之死，又说四人定数难逃。</b>",
	["luayy_trs"]="预言",
	[":luayy_trs"]="摸牌阶段前，你可以声明一种花色，并展示牌堆顶一张牌并弃置，若为所声明花色，则你可以额外摸两张牌；若不为所声明花色，则你少摸一张牌。",
	["luaxzh_vs"]="先知",
	[":luaxzh_vs"]="出牌阶段，你可以查看一名角色手牌，若你本回合使用过【预言】，则你可以获得其手牌中与【预言】声明花色相同的牌。每阶段限用一次。",
	["luafj_trs"]="扶乩",
	[":luafj_trs"]="出牌阶段，你可以交换两名角色武将和技能，你的下个回合开始时换回。其间如果其中一名角色阵亡，或你阵亡，则立即换回。每阶段限用一次。\n★处于被交换武将牌的两名玩家，主公技、限制技、觉醒技都会无法使用。",
	["illustrator:luazxshr"] = "插图:名将志丨PS:廉贞星君",
	["$luayy_trs"] = "让我算一算~",
    ["$luafj_trs"] = "请仙扶鸾，方知趋吉避凶之理~",
	["~luazxshr"]="我将步入永夜之黑暗~",
["luapjfsh"]="普净法师",
["#luapjfsh"] = "  高僧  ",
["designer:luapjfsh"]="技能:廉贞星君丨LUA:lwx19911226",
["cv:luapjfsh"]="英雄杀，西游杀",
["pujingfashils"]="人物列传",
[":pujingfashils"]="<b>普净法师，初关云长千里走单骑时，沂水关守将卞喜欲加害关羽，得普净相救。后关羽败走麦城被吕蒙所杀，冤魂不散，戾气难消。经普净超度而升天。</b>",
	["luachd_trs"]="超度",
	[":luachd_trs"]="<b>限定技</b>，其他角色进入濒死状态时，你可以自减３点体力上限，令其弃置所有的牌和判定区里的牌，并重置其武将牌，然后摸三张牌并将体力回复至３点（若体力上限不足３点则恢复至体力满）。\n★对庞统使用时，不影响庞统的【涅槃】效果，即庞统的【涅槃】本场游戏只能发动一次",	
	["luajl_trs"]="五戒",
	[":luajl_trs"]="<b>戒戮</b>，锁定技，你受到伤害时，最多承受１点伤害。",
	["luajj_fts"]="五戒",
	[":luajj_fts"]="<b>戒酒</b>，锁定技，你的【酒】均视为【桃】。",
	["luajieyin_trs"]="五戒",
	[":luajieyin_trs"]="<b>戒淫</b>，锁定技，女性角色回合内，即时锦囊对你无效。",--之语已修改描述
	["luajd_trs"]="五戒",
	[":luajd_trs"]="<b>戒盗</b>，锁定技，回合外,你失去的牌立即进入弃牌堆。",
	["luajk_trs"]="五戒",
	[":luajk_trs"]="<b>戒诳</b>，锁定技，你的判定牌展示后不能被更改,立即生效。",
	["illustrator:luapjfsh"] = "插图:不详丨PS:廉贞星君",
	["$luachd_trs"] = "南无阿弥陀佛~",
    ["$luajj_fts"] = "贫僧随缘布施些斋吃~",
    ["$luajieyin_trs"] = "美女，给力哦~",
	["~luapjfsh"]="贫僧去也~",
	["@luachd_chaodu"] = "超度",
["simayans"]="司马炎",
["designer:simayans"] = "sailiss，廉贞星君，之语丨之语",--lua制作：之语; 
["cv:simayans"] = "暂无",
["#simayans"] = "晋武帝",
["illustrator:simayans"] = "插图:热血三国丨PS:廉贞星君",
["simayanls"]="人物列传",
[":simayanls"]="<b>司马炎，字安世，河内人，西晋开国武帝。父司马昭，母王元姬。公元280年灭吴，统一天下。太康年间出现一片繁荣景象，史称“太康之治”。但统治后期政治黑暗，为八王之乱埋下隐患。</b>",
	["wangluanvs"] = "王乱",
	["wangluanfs"] = "王乱",
	["jindits"] = "晋帝",
	[":jindits"] = "<b>锁定技</b>，当你武将牌正面朝上时，你获得技能【归心】；当你武将牌背面朝上时，你获得技能【王乱】：<b>锁定技</b>，其他角色:使用黑色【杀】时，无数量限制，对你使用黑色【杀】时，无距离限制。 ★一般的，使用黑色【杀】以后，红色【杀】将不能使用，但反之则可以。",
	["kaiguots"] = "开国",
	[":kaiguots"] = "<b>主公技</b>，回合开始阶段，你可以重新选择势力。与你势力相同的角色（包括自己），获得如下技能直到你下次使用【开国】：\
	\
	<font color='blue'><b>魏</b>：<b>锁定技</b>，每次受到伤害时，你最多承受一点伤害；</font>\
	\
	<font color='red'><b>蜀</b>：<b>锁定技</b>，每使用一张【杀】，你立即摸一张牌；</font>\
	\
	<font color='green'><b>吴</b>：<b>锁定技</b>，你手牌上限+1：</font>\
	\
	<font color='gray'><b>群</b>：<b>锁定技</b>，若你体力为本势力最少，【杀】对你无效。</font>\
	\
	★这四个技能发动【开国】后才能产生。",
	["#wangluands"] = "王乱",
	["shujnts"] = "开国.蜀",
	["weijnts"] = "开国.魏",
	["wujnts"] = "开国.吴",
	["qunjnts"] = "开国.群",
	[":shujnts"] = "<b>锁定技</b>，你每使用一张【杀】，你立即摸一张牌。★注意只是使用，不包括打出。即响应【南蛮入侵】、【决斗】不能触发此技能。摸牌时机在【杀】结算之前。",
	[":weijnts"] = "<b>锁定技</b>，每次受到伤害时，最多承受一点伤害。",
	[":wujnts"] = "<b>锁定技</b>，你手牌上限+1",
	[":qunjnts"] = "<b>锁定技</b>，若你体力为本势力最少，【杀】对你无效。★不包括同为最少",
	[":wangluanfs"] = "<b>锁定技</b>，你使用黑色【杀】时，无数量限制，对司马炎使用黑色【杀】时，无距离限制。 ★一般的，使用黑色【杀】以后，红色【杀】将不能使用，但反之则可以。",
	[":wangluands"] = "<b>锁定技</b>，你使用黑色【杀】时，无数量限制，对司马炎使用黑色【杀】时，无距离限制。 ★一般的，使用黑色【杀】以后，红色【杀】将不能使用，但反之则可以。",
	["#shujnts"] = "%from 的锁定技【<font color='yellow'><b>开国.蜀</b></font>】被触发。",
	["#weijnts"] = "%from 的锁定技【<font color='yellow'><b>开国.魏</b></font>】被触发。",
	["#wujnts"] = "%from 的锁定技【<font color='yellow'><b>开国.吴</b></font>】被触发。",
	["#qunjnts"] = "%from 的锁定技【<font color='yellow'><b>开国.群</b></font>】被触发。",
    ["~simayans"]="后会有期。",	
["luajiananfeng"]="贾南风",
["cv:luajiananfeng"]="暂无",
["designer:luajiananfeng"] = "晴儿雨儿",
["#luajiananfeng"] = "惠贾皇后",
["illustrator:luajiananfeng"] = "插图:三国征战丨PS:廉贞星君",
["jiananfengls"]="人物列传",
[":jiananfengls"]="<b>贾南风，惠贾皇后，平阳襄陵人，曹魏及西晋时期大臣贾充的女儿。西晋时期晋惠帝司马衷的皇后，因惠帝懦弱而一度专权，是西晋时期八王之乱的始作俑者之一。后死于赵王司马伦之手。</b>",
	["LuaFanLiuLi"]="庇亲",
	[":LuaFanLiuLi"]="回合外，每当你攻击范围内的一名其他角色成为【杀】的目标时，你可以摸一张牌，并将此【杀】转移给自己。",	
	["LuaFanRenDe"]="贪忌",
	[":LuaFanRenDe"]="回合外，其他角色可以将任意数量的手牌交给你，若此阶段交给你的牌数达到2张或更多时，你须流失一点体力。",	
	["LuaFanRenDeVS"]="贪忌",
	["$LuaFanLiuLi"]="你真的笨到来挑战我？",
	["$LuaFanRenDe"]="我棺材都为你准备好了！",
	["~luajiananfeng"]="预言者，早已经预见到了我的胜利...",
["shensunquans"]="神孙权",
["designer:shensunquans"] = "技能:之语丨LUA:之语",--lua制作：之语; 构思：之语
["cv:shensunquans"] = "英雄杀",
["#shensunquans"] = "东吴太祖",
["illustrator:shensunquans"] = "插图:霸者无双丨PS:廉贞星君",
["shensunquanls"]="人物列传",
[":shensunquanls"]="<b>孙权，字仲谋，吴郡富春人。承父兄基业，创三分之势。系中国古代兵法家孙武的第二十二世后裔。在位二十四年，史称东吴大帝，庙号太祖。</b>",
	["zonghengs"] = "纵横",
	["zonghengs_card"] = "纵横",
	["liwans"] = "力挽",
	[":zonghengs"] = "出牌阶段限一次，你可指定一名角色，你获得其所有手牌，并立即返还等量手牌。",
	--[":liwans"] = "你每造成一次伤害前，可令此伤害－１；每次伤害仅能发动一次【力挽】。",
	--["#liwans"] = "%from 弃掉了一张牌。",
	["$zonghengs"] = "知己知彼，百战不殆~",
    ["$liwans"] = "何人能及？",
	--["lua_suwei"] = "力挽",
	--["$lua_suwei"] = "何人能及？",
	
	["hh~~"] = "请选择一张装备牌并弃置",
	[":liwans"] = "你造成伤害时，可弃置一张装备牌，然后选择：\
	1、此伤害加１。\
	2、此伤害减１。",
	["lua_suwei:add"] = "伤害加1",
	["lua_suwei:one"] = "伤害减1",
	["add"] = "伤害+1",
	["one"] = "伤害-1",
	["#lua_suwei_one"] = "%from 发动了技能【力挽】，将 %arg 点伤害减少至 %arg2 点",
	["#lua_suwei_add"] = "%from 发动了技能【力挽】，使 %arg 点伤害提高至 %arg2 点",
	["~shensunquans"] = "江东弟子今犹在，肯为君王卷土来~",
["gfshh"]="伏寿皇后",
["gzfshh"]="真·伏寿皇后",
["~gfshh"]="好好享受在世的最后一口气吧。",
["~gzfshh"]="好好享受在世的最后一口气吧。",
["#gfshh"] = "母仪天下",
["#gzfshh"] = "冷宫废后",
["designer:gfshh"]="技能:廉贞星君丨晴儿雨儿,GUTEN",
["designer:gzfshh"]="技能:廉贞星君丨晴儿雨儿,GUTEN",
["cv:gfshh"]="不详",
["cv:gzfshh"]="不详",
["illustrator:gfshh"] = "插图:不详，PS：廉贞星君",
["illustrator:gzfshh"] = "插图：不详，PS：廉贞星君",
	["szh"]="招祸",
	["$szh"]="闭上你的鸟嘴。",
	[":smy"]="出牌阶段，你可以令所有角色各摸一张牌，每阶段限制一次。",
	["smy"]="母仪",
	["$smy"]="让我们开始吧。",
	[":szh"]="回合开始阶段，你可以选择其他一名角色，获得其判定区里的所有牌，并获得X枚【招祸】标记，X为本次由于此技能所获得的牌数。",
	["sfc"]="废黜",
	["$sfc"]="非尽族是，天下不安。",
	[":sfc"]="<b>觉醒技</b>，当你的【招祸】标记大于你当前体力值时，你变身为真·伏寿皇后并恢复满体力。",
    ["$sfcanimate"] = "非尽族是，天下不安！",
	["syj"]="帝殇",
	["$syj"]="破绽百出！",
	["$sds"]="谋定而动！",
	[":syj"]="其他角色的非延迟类锦囊，由于使用或打出而进入弃牌堆时，你可以用一张牌替换。",
	["sds"]="幽禁",
	[":sds"]="回合开始阶段，你可以选择其他一名角色，获得其判定区里的所有牌，并失去当前回合的出牌阶段，且获得X枚【招祸】标记，X为本次由于此技能所获得的牌数。",
	["syy"]="幽怨",
	["$syy1"]="送汝归西！",
	["$syy2"]="即刻斩首！",
	[":syy"]="你每受到一次伤害，可以弃置1枚标记物，令伤害来源，手牌数调整到与你手牌数相同（弃置或新摸）。令伤害来源，体力值调整到与你当前体力相同（流失或恢复）。",
    ["syy_handcard"] = "调整手牌",
    ["syy_hp"] = "调整体力",
    ["syy_both"] = "调整手牌+调整体力",
    ["close"] = "关闭",
    ["#syy_invoke_skill"] = "%from 发动了【幽怨】",
    ["#syy_choice"] = "%from 选着了 %arg",
    ["@szh_card"]="是否发动【招祸】？",
    ["~szh"]="你可以选择其他一名角色，获得其判定区里的所有牌，并获得X枚【招祸】标记，X为本次由于此技能所获得的牌数。",
    ["askforsds"]="请选择一张牌替换弃牌堆中的锦囊牌。",
    ["fushouls"]="人物列传",
    [":fushouls"]="<b>汉献帝伏皇后，讳寿，徐州琅邪郡人氏。伏皇后是西汉大司徒伏湛的八世孙，父亲是学者伏完，母为阳安长公主刘华。曾与汉献帝密谋衣带诏诛杀曹操，计不成，被曹操幽禁冷宫，后赐死。</b>",
    ["fushoulss"]="人物列传",
    [":fushoulss"]="<b>汉献帝伏皇后，讳寿，徐州琅邪郡人氏。伏皇后是西汉大司徒伏湛的八世孙，父亲是学者伏完，母为阳安长公主刘华。曾与汉献帝密谋衣带诏诛杀曹操，计不成，被曹操幽禁冷宫，后赐死。</b>",
	
["nandoubds"] = "南斗北斗",
["designer:nandoubds"] = "技能:廉贞星君丨LUA:之语",--lua制作：之语; 构思：廉贞星君
["cv:nandoubds"] = "英雄杀",
["#nandoubds"] = "生死簿",
["illustrator:nandoubds"] = "插图:霸者无双丨PS:廉贞星君",
["nandoubeidouls"]="人物列传",
[":nandoubeidouls"]="<b>南斗&北斗，神话传说中的两位神仙，南斗注生，北斗注死，掌握世间一切人的寿命长短，在《三国演义》中有所记载。</b>",	
        ["xiantis"] = "仙体",
		[":xiantis"] = "<b>锁定技</b>，任何时候，你受到伤害时，须满足条件：对你造成伤害的牌点数同场上存活的角色数，则伤害有效。没有造成伤害的牌或不满足条件则伤害无效。",
		["#xiantis"] = "%from 的【<font color='yellow'><b>仙体</b></font>】技能被触发",
		["shengsis"] = "生死",
		[":shengsis"] = "回合结束阶段，你可以展示牌堆顶两张牌，若同为红色，你须令一名角色恢复一点体力，若同为黑色，你须令一名角色流失一点体力，每阶段限一次。",
		["#shengsisb"] = "%from 亮出的两张牌均为<font color='yellow'><b>红色</b></font>，休养生息。",
		["#shengsisa"] = "%from 亮出的两张牌均为<font color='yellow'><b>黑色</b></font>，风起云涌。",
		["#shengsisc"] = "%from 亮出的两张牌<font color='yellow'><b>一黑一红</b></font>，天下无事。",
		["#shengsisd"] = "%from 已选择目标。",
		["$xiantis"] = "哈哈哈哈~",
        ["$shengsis"] = "知凶定吉，断死言生~",
        ["~nandoubds"] = "成功是要付出代价的~",
["shensunce"] = "神孙策",
["#shensunce"] = "小霸王",
["cv:shensunce"] = "WOW？",
["illustrator:shensunce"] = "插图:不详丨PS:廉贞星君",
["~shensunce"] = "我们重新再来吧~",
["$tongshuai"]="让他们跪地求饶!",
["$mengrui"]="为苍生而战！",
["designer:shensunce"] = "设计：小霸王丨LUA:Guten",	
["suncels"]="人物列传",
[":suncels"]="<b>孙策，字伯符，江东猛虎也。父孙坚，弟孙权。与周瑜交笃，孙坚死后，孙策继承江东霸业，与周瑜合力收服江东全境（也收服了大小乔），为东吴的建立打下坚实的基础，演义中因冒天下之大不韪处死太平道人于吉，而遭天谴。</b>",
        ["tongshuai"] = "统帅",
        [":tongshuai"] = "你可以跳过摸牌阶段，指定至多两名其他角色各摸１张牌，如此做，你可以令摸牌角色对你攻击范围内你所指定的一角色(不包括自己，也不能是摸牌者)使用一张【杀】，且每造成一点伤害你可以获得伤害角色的一张手牌，若摸牌角色未使用【杀】，你摸２张牌。",
        ["~tongshuai"] = "请选择一到两名角色。",
        ["@tongshuai_ask"] = "是否发动技能【统帅】？",
        ["@tongshuai-askfor-slash"] = "%src 使用了【统帅】，令你砍 %dest，请你使用一张【杀】进行响应",
        ["#tongshuai_no_target"] = "%to 受到【统帅】，需要出一张杀，但由于 %from 的攻击范围内没有其他角色，所以结算中止。",
        ["mengrui"] = "猛锐",
        [":mengrui"] = "出牌阶段，当你使用的红色【杀】被【闪】抵消时，你立即获得该【闪】，并可立即对相同的目标再使用一张【杀】。",
        ["@mengrui"] = "你可以再使用一张【杀】",
        ["#mengrui_invoke"] = "%from 发动了【猛锐】",
	    ["yingjie"] = "英杰",
	    [":yingjie"] = "其他角色判定阶段开始时，你可以弃置一张基本牌，令其跳过判定阶段，然后你摸两张牌。若此时你的手牌数大于你当前的体力上限，你须弃置一张基本牌，否则失去1点体力。",
        ["@yingjie-discard"] = "请弃一张基本牌。",
}

