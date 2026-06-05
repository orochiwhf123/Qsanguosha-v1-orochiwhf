module("extensions.dpt",package.seeall)
extension = sgs.Package("dpt")


luahchy = sgs.General(extension, "luahchy", "qun", 3, true)
splvbus=sgs.General(extension, "splvbus", "qun", "4", true)
--luaspzhj=sgs.General(extension,"luaspzhj","qun","3",false)
--lualye = sgs.General(extension, "lualye", "wei", 3, false)
luacmzhy = sgs.General(extension, "luacmzhy", "wei", 4, true)
--luamldw = sgs.General(extension, "luamldw", "qun", 4, true)
luawtg = sgs.General(extension, "luawtg", "qun", 5, true)


--马腾列传
matengls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "matengls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--密诏
luamzh_card=sgs.CreateSkillCard{
name="luamzh_effect",
target_fixed=false,
will_throw=true,
once=true,
filter=function(self,targets,to_select)
	--if sgs.Self:getMark("luamzh_tmp")>0 then return false end
	return #targets==0
end,
--feasible=function(self,targets)
	--return #targets==1
--end,
--on_use=function(self,room,source,target)
--end,
on_effect=function(self,effect)
	local room=effect.from:getRoom()
	effect.to:gainMark("@luamzh_mizhao")
	--effect.from:speak("me")
	effect.from:addMark("luamzh_tmp")
	room:setPlayerFlag(effect.from, "luamzh_used")
	room:playSkillEffect("luamzh_trs")
end
}

luamzh_vs=sgs.CreateViewAsSkill{
name="luamzh_vs",
n=1,
view_filter=function(self, selected, to_select)
	return not to_select:isEquipped()
end,
view_as=function(self, cards)
	if #cards~=1 then return nil end
	local a_luamzh_card=luamzh_card:clone()
	a_luamzh_card:addSubcard(cards[1])
	a_luamzh_card:setSkillName(self:objectName())
	return a_luamzh_card
end,
enabled_at_play=function()
	return not sgs.Self:hasFlag("luamzh_used")	
end,
enabled_at_response=function(self, player, pattern)
	return false
end
}

luamzh_trs=sgs.CreateTriggerSkill{
name="luamzh_trs",
view_as_skill=luamzh_vs,
events={sgs.Predamaged,sgs.PhaseChange},
frequency = sgs.Skill_NotFrequent,
--priority=-1,理论上即使是藤甲也没事，2-1+1=1，2+1-1=1，所以优先级就不调整了。——by之语
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.Predamaged then
		local damage=data:toDamage()
		if damage.to:getMark("@luamzh_mizhao")==1 then
			if room:askForChoice(damage.to, self:objectName(), "mzh_choice1+mzh_choice2") == "mzh_choice1" then
				room:playSkillEffect(self:objectName())
				--damage.to:setMark("@luamzh_mizhao",0)
				damage.to:loseMark("@luamzh_mizhao")
				selfplayer:setMark("luamzh_tmp",0)
				room:setPlayerFlag(selfplayer,"-luamzh_used")
				damage.damage=damage.damage-1
				data:setValue(damage)
			end
		end
	elseif event==sgs.PhaseChange and player:getPhase() == sgs.Player_Play then
		if not player:hasSkill(self:objectName()) then return false end
		
		-----------------
		if selfplayer:getMark("luamzh_tmp")>0 then
		
			room:setPlayerFlag(selfplayer,"luamzh_used")
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
--举义
luajy_trs=sgs.CreateTriggerSkill{
name="luajy_trs$",
--view_as_skill=!!_vs,
events={sgs.FinishJudge},
frequency = sgs.Skill_Compulsory,
priority=-1,
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if not selfplayer:isLord() then return false end
	if event==sgs.FinishJudge then
		local judge=data:toJudge()
		--            if(room->getCardPlace(judge->card->getEffectiveId()) == Player::DiscardedPile
        --       && judge->card->getSuit() == Card::Club)
        --      clubs << judge->card;
		if judge.who:getKingdom()~="qun" then return false end
		if judge.who:hasSkill(self:objectName()) then return false end
		if room:getCardPlace(judge.card:getEffectiveId())~=sgs.Player_DiscardedPile then return false end
		--if (room:askForSkillInvoke(selfplayer,self:objectName())~=true) then return false end
		room:playSkillEffect(self:objectName())
		selfplayer:obtainCard(judge.card)
	end	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}
--黄承彦列传
huangchengyanls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "huangchengyanls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--奇门
luaqm_tmplist={0,0,0,0,0,0,0,0,0}
luaqm_sklist={"keji",
					"qingnang",
					"guidao",
					"wuyan",
					"jizhi",
					"wansha",
					"bazhen",
					"guanxing",}

luaqm_trs=sgs.CreateTriggerSkill{
name="luaqm_trs",
--view_as_skill=!!_vs,
events={sgs.TurnStart},
frequency = sgs.Skill_NotFrequent,
priority=4,
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.TurnStart then
		if not player:hasSkill(self:objectName()) then return false end
		local luaqm_tmplist2={0,0,0,0,0,0,0,0,0}
		for var=1,8,1 do
			luaqm_tmplist2[var]=luaqm_tmplist[var]
		end
		for var = 1, selfplayer:getLostHp()+1, 1 do
			local str=""
			local str_t=""
			for var=1,8,1 do
				if luaqm_tmplist2[var]==0 then
					str_t=string.format("%d",var)
					str=str.."qm_choice"..str_t.."+"
				end
			end
			str=str.."qm_choice9"
			local intc=0
			local strc=room:askForChoice(player, self:objectName(), str)
			room:playSkillEffect(self:objectName())
			if strc == "qm_choice1" then 
				intc=1
			elseif strc=="qm_choice2" then
				intc=2
			elseif strc=="qm_choice3" then
				intc=3
			elseif strc=="qm_choice4" then
				intc=4
			elseif strc=="qm_choice5" then
				intc=5
			elseif strc=="qm_choice6" then
				intc=6
			elseif strc=="qm_choice7" then
				intc=7
			elseif strc=="qm_choice8" then
				intc=8
			elseif strc=="qm_choice9" then
				intc=9
			end
			luaqm_tmplist2[intc]=1
		end
		
		for var=1,8,1 do
			if luaqm_tmplist[var]==1 then
				room:detachSkillFromPlayer(selfplayer,luaqm_sklist[var])
			elseif luaqm_tmplist2[var]==1 then
				--room:attachSkillToPlayer(selfplayer,luaqm_sklist[var])
				room:acquireSkill(selfplayer, luaqm_sklist[var]) --添加技能
			end
		end
		
		--room:setPlayerProperty(selfplayer,"general",sgs.QVariant("sujiang"))
		--room:setPlayerProperty(selfplayer,"general",sgs.QVariant("luahchy"))
		
		for var=1,8,1 do
			if luaqm_tmplist[var]==1 then
				luaqm_tmplist[var]=0
			else
				luaqm_tmplist[var]=luaqm_tmplist2[var]
			end
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
--遁甲
luadj_trs=sgs.CreateTriggerSkill{
name="luadj_trs",
--view_as_skill=!!_vs,
events={sgs.CardUsed},
frequency = sgs.Skill_Compulsory,
priority=2,
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.CardUsed then
		local use=data:toCardUse()
		if not use.from:hasSkill(self:objectName()) then return false end
		local b1=false
		local b2=false
		if use.card:inherits("Slash") then b1=true end
		if use.card:inherits("ArcheryAttack") then b1=true end
		if selfplayer:hasFlag("luadj_tmp") then return false end
		for _,p in sgs.qlist(use.to) do
			b2=false
			if p:getArmor()~=nil then
				if p:getArmor():inherits("EightDiagram") then b2=true end
			else
				if p:hasSkill("bazhen") then b2=true end
			end
			if b1 and b2 then
				room:playSkillEffect(self:objectName())
				p:addMark("qinggang")
			end						
		end
		room:setPlayerFlag(selfplayer,"luadj_tmp")
		room:useCard(use,false)
		room:setPlayerFlag(selfplayer,"-luadj_tmp")
		for _,p in sgs.qlist(use.to) do
			if p:getMark("qinggang")>0 then
				p:removeMark("qinggang")
			end						
		end
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
--SP吕布列传
splvbuls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "splvbuls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--争锋
xinwushuangvs=sgs.CreateViewAsSkill{--争锋 by之语
name="xinwushuangvs",
n=998, --需要两张牌
view_filter=function(self, selected, to_select)
	return not to_select:isEquipped() --非装备
end,
view_as=function(self, cards)
    if #cards > 0 then
        local acard=sgs.Sanguosha:cloneCard("duel",sgs.Card_NoSuit, 0)      --克隆一张无颜色无点数的决斗
		local i = 0
		while(i < #cards) do
			i = i + 1
			acard:addSubcard(cards[i])--X张牌成为子卡
			--新增代码
			--
		end
		acard:setSkillName(self:objectName())
		return acard ----返回这个决斗
	end		
end,
enabled_at_play=function()
    return not sgs.Self:hasFlag("xinwushuangused")
end,
enabled_at_response=function(self,pattern)        
    return false  --不响应打出
end
}

xinwushuangts = sgs.CreateTriggerSkill
{--争锋 触发技能 by 之语
	name = "#xinwushuangts",
	events = {sgs.CardEffect,--[[ sgs.CardFinished,]] sgs.CardAsked}, --sgs.SlashEffected},
	priority=4,--修复激将只需出一张杀的BUG
	can_trigger = function(self, player)
		return true
	end,
	
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		if event == sgs.CardEffect then
			local effect = data:toCardEffect()
			local card=effect.card
			local to=effect.to
			room:setPlayerMark(to,"xinwushuang",0)
			if card:getSkillName()~="xinwushuangvs" then return false end
			room:setPlayerFlag(effect.from,"xinwushuangused")--添加使用过的标记
			local x = effect.card:getSubcards():length()--获取子卡数目
			room:setPlayerMark(to,"xinwushuang",x)
			return false
		elseif event == sgs.CardAsked then
			local mark=player:getMark("xinwushuang")
			if mark==0 then return false end
			if data:toString()~="slash" then return false end
			if player:hasFlag("xinwushuangusing") then return false end
			room:playSkillEffect("xinwushuangvs")--修改为自己的专属声效廉贞星君
			for var=1,mark,1 do
				room:setPlayerFlag(player,"xinwushuangusing")
				ask_card = room:askForCard(player,"slash", "xinwushuangts"..(mark-var+1))
				room:setPlayerFlag(player,"-xinwushuangusing")
				if not ask_card then
					room:provide(nil)
					return true
				end
			end
			room:provide(ask_card)
			return true
		end
	end,
}
--飞将
feijiangts = sgs.CreateTriggerSkill{
  name = "feijiangts",
  events = {sgs.CardUsed, sgs.PhaseChange},
  frequency = sgs.Skill_NotFrequent,
  priority = 5,
  
  on_trigger = function(self, event, player, data)
    local room = player:getRoom()
    local use = data:toCardUse()
    local card = use.card
    local from = use.from
    local tos = use.to

    if event == sgs.CardUsed then
      if card:inherits("Slash") and player:isKongcheng() then
	  
	  		local pl = sgs.SPlayerList()
		    for _,f in sgs.qlist(tos) do
            if not f:isNude() then
			    pl:append(f)--把有牌的目标加进列表
			end
			end
			if pl:isEmpty() then return end--都没牌就结束
			
        if room:askForSkillInvoke(player, "feijiangts") then--有目标有牌即触发单次询问（比如方天杀三个，其中有人有牌有人没有）
          room:playSkillEffect("feijiangts")
          for _,to in sgs.qlist(pl) do
            local card_id = room:askForCardChosen(player, to, "he", "feijiangts")
            --room:obtainCard(player, card_id, false)--这个写法是错的，会造成服务器显示BUG
			room:obtainCard(player,sgs.Sanguosha:getCard(card_id),room:getCardPlace(card_id)~=sgs.Player_Hand)--依次拿有牌的人，最后个参数是某类牌强制显示，在这里就是非手牌就显示给人看（其实严格来说应该每个人都要询问）
          end
        end
      end

		elseif event == sgs.PhaseChange and player:getPhase() == sgs.Player_Finish then
			for _,p in sgs.qlist(room:getAlivePlayers()) do
        if p:getMark("xinwushuang")==1 then
           room:setPlayerMark(p,"xinwushuang",0)--修复一个BUG
        end
      end
    end
  end
}
--[[
feijiangts = sgs.CreateTriggerSkill
{--飞将 by之语
	name = "feijiangts",
	events = {sgs.CardEffect, sgs.CardEffected, sgs.CardResponsed,sgs.CardLost,sgs.PhaseChange},
	priority=5,
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		if event == sgs.CardLost then
			if player:isKongcheng() and move.from_place == sgs.Player_Hand then
				room:setPlayerFlag(player,"feijiangusing")
			end
		elseif event == sgs.CardEffected then
			local effect = data:toCardEffect()
			local value = sgs.QVariant()
			value:setValue(effect.from)
			room:setTag("feijiangTo", value)
		elseif event == sgs.CardEffect then
			local effect = data:toCardEffect()
			if effect.card:inherits("Slash") and effect.from:hasFlag("feijiangusing") and not effect.to:isNude() and room:askForSkillInvoke(player, "feijiangts") then
				local card_id = room:askForCardChosen(effect.from, effect.to, "he", "feijiang")
				room:moveCardTo(sgs.Sanguosha:getCard(card_id), effect.from, sgs.Player_Hand, false)
				room:playSkillEffect("feijiangts")
			end
		elseif event ==sgs.CardResponsed then
			local card = data:toCard()
			local target = room:getTag("feijiangTo"):toPlayer()
			if not card:inherits("Slash") or not player:hasFlag("feijiangusing") or not target or target:isNude() or not room:askForSkillInvoke(player, "feijiangts") then return false end
			local card_id = room:askForCardChosen(player, target, "he", "feijiang")
			room:moveCardTo(sgs.Sanguosha:getCard(card_id), player, sgs.Player_Hand, false)
		elseif (event==sgs.PhaseChange) and (player:getPhase()==sgs.Player_Finish) then
			for _,p in sgs.qlist(room:getAlivePlayers()) do
                if p:getMark("xinwushuang")==1 then
                   room:setPlayerMark(p,"xinwushuang",0)--修复一个BUG
                end
            end
		end
	end,
}
--]]
--SP甄姬列传
spzhenjils=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "spzhenjils$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--游离
youlis = sgs.CreateTriggerSkill
{--游离，by 之语
	name = "youlis",
	events = {sgs.CardResponsed},
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		local card = data:toCard()
		if card:getSkillName() ~= "qingguo" or not room:askForSkillInvoke(player, "youlis") then return false end
		local pfc=room:getAlivePlayers()
		local pfc_t=room:getAlivePlayers()
		for _,p in sgs.qlist(pfc_t) do--限制距离为1以内
			if player:distanceTo(p) > 1 then
				pfc:removeOne(p)
			end				
		end
		--
		
		--
		local targeta = room:askForPlayerChosen(player, pfc, "reason")--挑选要拿的人
		room:playSkillEffect("youlis")
		--
		
		--
		if targeta:isNude() then 
			return false 
		else
		--
		
		--
			local card_id = room:askForCardChosen(player, targeta, "he", "youlis")--挑选牌（手牌和装备）
			room:moveCardTo(sgs.Sanguosha:getCard(card_id), player, sgs.Player_Hand,room:getCardPlace(card_id)~=sgs.Player_Hand)--先拿到自己手里
			local cardids=sgs.IntList()
			cardids:append(card_id)
			room:askForYiji(player,cardids)--edit by suuny
		end
	end,
}
--SP诸葛瑾列传
zhugejinls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "zhugejinls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--议和
YiheCard = sgs.CreateSkillCard{
	name = "yihecard",
	
	filter = function(self, targets, to_select)
		if(#targets > 0)then return false
		else return to_select:getHp() >= sgs.Self:getHp() end
	end,
	
	on_effect = function(self, effect)
		local room = effect.from:getRoom()
		local to = room:askForPlayerChosen(effect.from, room:getOtherPlayers(effect.to), "luayihe")
		for _, cd in sgs.qlist(effect.to:getHandcards()) do
			room:moveCardTo(cd, to, sgs.Player_Hand, false)
					room:playSkillEffect("luayihe")
		end
		local i = to:getHandcardNum() / 2
		for v = 1, i , 1 do
			local card_id = room:askForCardChosen(to, to, "h", "luayihe")
			local card = sgs.Sanguosha:getCard(card_id)
			room:moveCardTo(card, effect.to, sgs.Player_Hand, false)
		end
	end,
}

luayihe = sgs.CreateViewAsSkill{
	name = "luayihe",
	n = 0,
	
	view_as = function(self, cards)
		return YiheCard:clone()
	end,
	
	enabled_at_play = function(self, player)
		return not player:hasUsed("#yihecard")
	end,
}
--尽忠
luajinzhong = sgs.CreateTriggerSkill{
	name = "luajinzhong",
	events = sgs.Dying,
	frequency=sgs.Skill_Frequent,--默认频繁发动
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		if(not player:askForSkillInvoke(self:objectName(), data))then return false end
		local card = sgs.Sanguosha:getCard(room:drawCard())
		room:moveCardTo(card, nil, sgs.Player_DiscardedPile, true)
		room:getThread():delay()
		if(card:isRed())then
			room:setPlayerProperty(player, "hp", sgs.QVariant(1))
			return true
		else
			return false
		end
	end,
}
--来莺儿列传
laiyingerls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "laiyingerls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--余音
luayuyin = sgs.CreateTriggerSkill{
	name = "luayuyin",
	events = {sgs.CardDiscarded},
	
	on_trigger = function(self, event, player, data)
		if player:getPhase() ~= sgs.Player_Discard then return false end
		local room = player:getRoom()
		local card = data:toCard()
		if card:subcardsLength() == 0 then return false end
		local idlist = card:getSubcards()
		local targets = sgs.SPlayerList()
		for _,p in sgs.qlist(room:getAlivePlayers()) do
			if p:objectName() ~= player:objectName() then
				targets:append(p)
			end
		end
		for var=1,math.min(targets:length(),idlist:length()),1 do
			if not room:askForSkillInvoke(player,"luayuyin",sgs.QVariant(var)) then break end
			room:fillAG(idlist,player)
			local cd_id = nil
			cd_id = room:askForAG(player,idlist,false,self:objectName())
			if cd_id ~= -1 then
				idlist:removeOne(cd_id)
				player:invoke("clearAG")
				local target = room:askForPlayerChosen(player, targets, self:objectName())
				targets:removeOne(target)
				room:obtainCard(target,cd_id)
				room:playSkillEffect("luayuyin")
			else
				player:invoke("clearAG")
				break
			end
		end
		local tcard = sgs.Sanguosha:cloneCard("snatch", sgs.Card_NoSuit, 0)
		for _,tc in sgs.qlist(idlist) do
			tcard:addSubcard(tc)
		end
		data:setValue(tcard)
	end,
}
--怜惜
lualianxi = sgs.CreateTriggerSkill{
	name = "lualianxi",
	frequency = sgs.Skill_Compulsory,
	events = {sgs.Predamaged},
	
	on_trigger = function(self, event, player, data)
		if player:getPhase() ~= sgs.Player_NotActive then return false end
		local damage = data:toDamage()
		--if not damage.card:inherits("Slash") then return false end 改为所有伤害
		local room = player:getRoom()
		local from = damage.from
		if from == nil then return false end --没有伤害来源或伤害来源已经死亡则不触发， 之语
		room:playSkillEffect("lualianxi")
		local judge = sgs.JudgeStruct()
		judge.pattern = sgs.QRegExp("(.*):(spade|club):(.*)")
		judge.good = true
		judge.reason = "lualianxi"
		judge.who = from
		room:judge(judge)
		
		if(judge:isGood()) then return false end
		from:drawCards(2)
		local cdlist = sgs.IntList()
		local hcnum = from:getHandcardNum()
		cdlist:append(from:handCards():at(hcnum-1))
		cdlist:append(from:handCards():at(hcnum-2))
		room:fillAG(cdlist,from)
		local cd_id = room:askForAG(from,cdlist,false,self:objectName())
		from:invoke("clearAG")
		room:obtainCard(player,cd_id)
		local log = sgs.LogMessage()
		log.type = "#lualianxi"
		log.arg  = self:objectName()
		log.arg2 = damage.card:objectName()
		room:sendLog(log)
		return true
	end,
}
--殉情
luaxunqing = sgs.CreateTriggerSkill{
	name = "luaxunqing",
	frequency = sgs.Skill_Limited,
	events = {sgs.Dying},
	priority=0,
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		if not player:getGeneral():isMale() then return false end
		local laiyingers = sgs.SPlayerList()
		for _,p in sgs.qlist(room:getAlivePlayers()) do
			if p:hasSkill(self:objectName()) then
				laiyingers:append(p)
			end
		end
		for _,laiyinger in sgs.qlist(laiyingers) do
			if player:getHp() < 1 and room:askForSkillInvoke(laiyinger, self:objectName()) then
				room:setPlayerProperty(player, "hp", sgs.QVariant(1))
				local damage = sgs.DamageStruct()
				damage.from = laiyinger
				room:killPlayer(laiyinger,damage)
			end
		end
	end,
	can_trigger=function(self,player)
  		return player:getRoom():findPlayerBySkillName(self:objectName())
 	end,
}
--蔡瑁张允列传
caimaozhangyunls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "caimaozhangyunls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--列阵
lualzh_trs=sgs.CreateTriggerSkill{
name="lualzh_trs",
--view_as_skill=!!_vs,
events={sgs.CardEffected},
frequency = sgs.Skill_Compulsory,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	if event==sgs.CardEffected then
		local effect=data:toCardEffect()
		if not effect.to:hasSkill(self:objectName()) then return false end
		if effect.from:hasSkill(self:objectName()) then return false end
		--if effect.card:inherits("Duel") or effect.card:inherits("ArcheryAttack") then
		if effect.card:inherits("FireAttack") or effect.card:inherits("IronChain") then
			room:playSkillEffect(self:objectName())
			return true
		end
	end	
end,
--can_trigger=function()
	--return true
--end
}
--枉死
luaws_trs=sgs.CreateTriggerSkill{
name="luaws_trs",
--view_as_skill=!!_vs,
events={sgs.CardEffected},
frequency = sgs.Skill_Compulsory,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.CardEffected then
		local effect=data:toCardEffect()
		if not effect.to:hasSkill(self:objectName()) then return false end
		if effect.card:inherits("FanjianCard") then
	--[[		 int card_id = zhouyu->getRandomHandCardId();
    const Card *card = Sanguosha->getCard(card_id);
    Card::Suit suit = room->askForSuit(target);

    LogMessage log;
    log.type = "#ChooseSuit";
    log.from = target;
    log.arg = Card::Suit2String(suit);
    room->sendLog(log);

    room->getThread()->delay();
    target->obtainCard(card);
    room->showCard(target, card_id);

    if(card->getSuit() != suit){
        DamageStruct damage;
        damage.card = NULL;
        damage.from = zhouyu;
        damage.to = target;

        room->damage(damage);
    }]]--
			--player:speak("fanjian")
			local id=effect.from:getRandomHandCardId()
			local cd=sgs.Sanguosha:getCard(id)
			local suit=room:askForSuit(effect.to,self:objectName())
			local log=sgs.LogMessage()
			log.type="#ChooseSuit"
			log.from=effect.to
			log.arg=sgs.Card_Suit2String(suit)
			room:sendLog(log)
			room:getThread():delay()
			effect.to:obtainCard(cd)
			room:showCard(effect.to,id)
			if cd:getSuit()~=suit then
				local damage = sgs.DamageStruct()
				damage.from=effect.from
				damage.to=effect.to
				damage.damage=2
				room:damage(damage)
				room:playSkillEffect(self:objectName())
			end		
			return true
		end
	end	
end,
--can_trigger=function()
	--return true
--end
}
--水师
luashsh_dts=sgs.CreateDistanceSkill{
name= "luashsh_dts",
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
--司马徽列传
simahuils=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "simahuils$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--水镜
luashj_trs=sgs.CreateTriggerSkill{
name="luashj_trs",
--view_as_skill=!!_vs,
events={sgs.Damaged},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.Damaged then
		local damage=data:toDamage()
		if not damage.to:hasSkill(self:objectName()) then return false end
		for var=1,damage.damage,1 do
			if (room:askForSkillInvoke(selfplayer,self:objectName(),data)~=true) then return false end
			--local cd=room:askForCard(selfplayer,".","@luashj_trs")
			if room:askForDiscard(selfplayer,self:objectName(),1,1,true,false) then
				room:playSkillEffect(self:objectName())
				local pfc=room:getOtherPlayers(selfplayer)
				local pfc_t=room:getOtherPlayers(selfplayer)
				for _,p in sgs.qlist(pfc_t) do
					if not selfplayer:canSlash(p) then
						pfc:removeOne(p)
					end				
				end
				local pc=room:askForPlayerChosen(selfplayer,pfc,self:objectName())
				if pc~=nil then
					local jink_t=room:askForCard(pc,"jink","@luashj_trs")
					if jink_t==nil then
						local damage_t=sgs.DamageStruct()
						damage_t.from=damage.from
						damage_t.to=pc
						damage_t.damage=1
						damage_t.nature=sgs.DamageStruct_Thunder
						room:damage(damage_t)
					end
				end
			end
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
--举贤
luajx_trs=sgs.CreateTriggerSkill{
	name="luajx_trs",
	events=sgs.TurnStart,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local otherplayers=room:getOtherPlayers(player)
		if not room:askForSkillInvoke(player,self:objectName(),data) then return false end
		room:playSkillEffect(self:objectName())
		local pc=room:askForPlayerChosen(player,otherplayers,self:objectName())
		if pc~=nil then
      pc:play()
      player:getNextAlive():play()
		end
		return true
	end,
}
--张仲景列传
zhangzhongjingls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "zhangzhongjingls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--悬壶 by sunny
function LuaXuanHuLose(player,color)
	local room=player:getRoom()
	if color=="red" then
		player:loseMark("@LuaXuanHuRed")
	else
		player:loseMark("@LuaXuanHuBlack")
	end
	player:jilei(".")
	player:invoke("jilei",".")
	room:detachSkillFromPlayer(player,"LuaXuanHuTR2")
end
function LuaXuanHuGet(player,color)
	local room=player:getRoom()
	local str=""
	if color=="red" then
		player:gainMark("@LuaXuanHuRed")
		str=".|heart,diamond|.|."
	else
		player:gainMark("@LuaXuanHuBlack")
		str=".|club,spade|.|."
	end
	player:jilei(str)
	player:invoke("jilei",str)
	room:acquireSkill(player,"LuaXuanHuTR2")
	room:playSkillEffect("LuaXuanHu")
end
LuaXuanHuCard=sgs.CreateSkillCard{
	name="LuaXuanHuCard",
	filter=function(self,targets,to_select)
		return #targets==0
	end,
	on_effect=function(self,effect)
		local player=effect.from
		local room=player:getRoom()
		local choice=room:askForChoice(player,"LuaXuanHu","black+red")
		LuaXuanHuGet(effect.to,choice)
		room:setPlayerMark(player,"LuaXuanHuTemp",1)
	end,
}
LuaXuanHu=sgs.CreateViewAsSkill{
	name="LuaXuanHu",
	view_as=function(self,cards)
		local acard=LuaXuanHuCard:clone()
		return acard
	end,
	enabled_at_play=function()
		return sgs.Self:getMark("LuaXuanHuTemp")==0
	end,
}
LuaXuanHuTR=sgs.CreateTriggerSkill{
	name="#LuaXuanHuTR",
	events={sgs.CardUsed,sgs.CardResponsed,sgs.Death,sgs.DamageComplete},
	frequency=sgs.Skill_Compulsory,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if event==sgs.Death then
			if player:getMark("@LuaXuanHuBlack")+player:getMark("@LuaXuanHuRed")+player:getMark("LuaXuanHuTemp")>0 then
				for _,theplayer in sgs.qlist(room:getAllPlayers()) do--循环，逐一检视所有角色
					room:setPlayerMark(theplayer,"LuaXuanHuTemp",0)
					if theplayer:getMark("@LuaXuanHuBlack")>0 then LuaXuanHuLose(theplayer,"black") end
					if theplayer:getMark("@LuaXuanHuRed")>0 then LuaXuanHuLose(theplayer,"red") end
				end
			end
			return false
		end
		if event==sgs.DamageComplete then
			--player:speak("DamageComplete")
			for _,theplayer in sgs.qlist(room:getAllPlayers()) do--循环，逐一检视所有角色
				local nxt=theplayer:getNextAlive()
				if theplayer:getMark("@LuaXuanHuBlack")>0 then
					LuaXuanHuLose(theplayer,"black")
					LuaXuanHuGet(nxt,"black")
					return false
				end
				if theplayer:getMark("@LuaXuanHuRed")>0 then
					LuaXuanHuLose(theplayer,"red")
					LuaXuanHuGet(nxt,"red")
					return false
				end
			end
		end
	end,
	can_trigger=function(self,player)
		return true
	end
}
LuaXuanHuTR2=sgs.CreateTriggerSkill{
	name="LuaXuanHuTR2",
	events=sgs.PhaseChange,--阶段改变时发动
	frequency=sgs.Skill_Compulsory,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if player:getPhase()==sgs.Player_Discard then
			str="."
		else
			if player:getMark("@LuaXuanHuRed")>0 then
				str=".|heart,diamond|.|."
			else
				str=".|club,spade|.|."
			end
		end
		player:jilei(str)
		player:invoke("jilei",str)
		room:setPlayerFlag(player,"jilei")
	end,
}
local skill=sgs.Sanguosha:getSkill("LuaXuanHuTR2")
if not skill then
	local skillList=sgs.SkillList()
	skillList:append(LuaXuanHuTR2)
	sgs.Sanguosha:addSkills(skillList)
end
--济世 by sunny
LuaJiShiCard=sgs.CreateSkillCard{
	name="LuaJiShiCard",
	target_fixed=true,
	on_use=function(self,room,source,targets)
		for _,theplayer in sgs.qlist(room:getAllPlayers()) do
			if theplayer:getMark("@LuaXuanHuBlack")+theplayer:getMark("@LuaXuanHuRed")>0 then
				if theplayer:isWounded() then
					room:throwCard(self)
					local recov=sgs.RecoverStruct()
					recov.card=self
					recov.who=source
					room:recover(theplayer,recov)
					room:playSkillEffect("LuaJiShi")
				end
			end
		end
	end,
}
LuaJiShi=sgs.CreateViewAsSkill{
	name="LuaJiShi",
	n=1,
	view_filter=function(self,selected,to_select)
		return true
	end,
	view_as=function(self,cards)
		if #cards~=1 then return nil end
		local qcard=LuaJiShiCard:clone()
		qcard:addSubcard(cards[1])
		return qcard
	end,
	enabled_at_play=function()
		return true
	end,
	enabled_at_response=function(self,player,pattern)
		return sgs.Self:hasFlag("LuaJiShiCanUse") and string.find(pattern,"peach")
	end,
}
LuaJiShiTR=sgs.CreateTriggerSkill{
	name="#LuaJiShiTR",
	events=sgs.Dying,
	frequency=sgs.Skill_Compulsory,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local str="-"
		if player:getMark("@LuaXuanHuBlack")+player:getMark("@LuaXuanHuRed")>0 then str="" end
		str=str.."LuaJiShiCanUse"
		for _,theplayer in sgs.qlist(room:getAllPlayers()) do--循环，逐一检视所有角色
			room:setPlayerFlag(theplayer,str)
		end
		return false
	end,
	can_trigger=function(self,player)
		return true
	end
}
--杂病 by sunny
LuaZaBingCard=sgs.CreateSkillCard{
	name="LuaZaBingCard",
	target_fixed=true,
	on_use=function(self,room,source,targets)
		room:throwCard(self)
		for _,theplayer in sgs.qlist(room:getAllPlayers()) do--循环，逐一检视所有角色
			if theplayer:getMark("@LuaXuanHuBlack")>0 then
				LuaXuanHuLose(theplayer,"black")
				LuaXuanHuGet(theplayer,"red")
				return
			end
			if theplayer:getMark("@LuaXuanHuRed")>0 then
				LuaXuanHuLose(theplayer,"red")
				LuaXuanHuGet(theplayer,"black")
				return
			end
		end
	end,
}
LuaZaBing=sgs.CreateViewAsSkill{
	name="LuaZaBing",
	n=1,--一次一张牌
	view_filter=function(self,selected,to_select)
		return not to_select:isEquipped()
	end,
	view_as=function(self,cards)
		if #cards~=1 then return nil end
		local acard=LuaZaBingCard:clone()
		acard:addSubcard(cards[1])
		return acard
	end,
	enabled_at_play=function()
		return sgs.Self:getMark("LuaXuanHuTemp")>0
	end,
}
--木鹿大王列传
muludawangls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "muludawangls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--驭兽
luaysh_vs=sgs.CreateViewAsSkill{
	name="luaysh_vs",
	n=2,
	view_filter=function(self, selected, to_select)
		if #selected==0 then return not to_select:isEquipped() and to_select:isBlack() end
		if #selected==1 then
			local cc=selected[1]:getSuit()
			return not to_select:isEquipped() and to_select:getSuit()==cc
		else
			return false
		end
	end,
	view_as=function(self,cards)
		if #cards==2 then
			local card1=cards[1]
			local card2=cards[2]
			local acard=sgs.Sanguosha:cloneCard("savage_assault",card1:getSuit(),0) 
			acard:addSubcard(card1:getId())
			acard:addSubcard(card2:getId())
			acard:setSkillName(self:objectName())
			return acard
		end
	end,
	enabled_at_play=function()
		return true
	end,
	enabled_at_response=function(self,pattern)        
		return false
	end,
}--code by sunny

luaysh_trs=sgs.CreateTriggerSkill{
name="#luaysh_trs",
view_as_skill=luaysh_vs,
events={sgs.CardEffected,sgs.CardFinished},
frequency = sgs.Skill_NotFrequent,
priority=0,
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.CardEffected then
		local effect=data:toCardEffect()
		if effect.from==nil then return false end
		if not effect.from:hasSkill(self:objectName()) then return false end
		if not effect.card:inherits("SavageAssault") then return false end
		--player:speak("nm")
		room:setPlayerFlag(effect.to,"luaysh_tmp")
	elseif event==sgs.CardFinished then
		local use=data:toCardUse()
		if not use.from:hasSkill(self:objectName()) then return false end
		if not use.card:inherits("SavageAssault") then return false end
		for _,p in sgs.qlist(otherplayers) do
			if p:hasFlag("luaysh_tmp") then
				room:setPlayerFlag(p,"-luaysh_tmp")
			end			
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
--木兽
luaysh2_trs=sgs.CreateTriggerSkill{
name="luaysh2_trs",
--view_as_skill=!!_vs,
events={sgs.CardResponsed},
frequency = sgs.Skill_Compulsory,
--priority=-1,
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.CardResponsed then
		local cd=data:toCard()
		if not player:hasFlag("luaysh_tmp") then return false end
		--if not cd:inherits("Slash") then return false end
		room:setPlayerFlag(player,"-luaysh_tmp")
		--player:speak("in")
		if cd:inherits("FireSlash") then
			--player:speak("ok")
			room:playSkillEffect(self:objectName())
			room:loseHp(selfplayer,1)
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
----妖术 code by sunny
luayaoshu_trs=sgs.CreateTriggerSkill{--触发技
	name="luayaoshu_trs",
	events=sgs.Damaged,--受到伤害时
	on_trigger=function(self,event,player,data)--要执行的动作
		local room=player:getRoom()--获取房间
		local damage=data:toDamage()--获取伤害结构体
		local nature=damage.nature
		if not (nature==sgs.DamageStruct_Fire or nature==sgs.DamageStruct_Thunder) then return false end
		local card=damage.card
		if not card then return false end
		local suit=card:getSuit()
		if not room:askForSkillInvoke(player,self:objectName(),data) then return false end--询问是否拼点
		local cardids=sgs.IntList()--建立空的卡牌表，用于添加可选的牌
		local cards=player:getCards("he")
		cards=sgs.QList2Table(cards)
		for _,carda in ipairs(cards)  do
			if carda:getSuit()==suit then cardids:append(carda:getId()) end--加到列表
		end
		if cardids:isEmpty() then return false end
		room:fillAG(cardids,player)--装填五谷界面让玩家选牌
		local cdid=room:askForAG(player,cardids,false,self:objectName())--记录选择
		room:throwCard(sgs.Sanguosha:getCard(cdid))--先移走再获得，让其公开
		player:invoke("clearAG")--清除五谷界面
		local p=room:askForPlayerChosen(player,room:getAllPlayers(),self:objectName())--选择玩家
		local damagex=sgs.DamageStruct()--创建新的伤害结构体
		damage=1--点数
		damagex.nature=nature
		damagex.from=player--来源是自己
		damagex.to=p--伤害对象
		room:playSkillEffect(self:objectName())
		room:damage(damagex)--执行伤害	
	end,
}--code by sunny
--兀突骨列传
wutuguls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "wutuguls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--藤甲
luatengbing = sgs.CreateTriggerSkill{
name = "luatengbing",
frequency = sgs.Skill_Compulsory,
events={sgs.Predamaged, sgs.SlashEffected, sgs.CardEffected},
on_trigger=function(self,event,player,data)
--if player:getArmor() then return false end
	local room = player:getRoom()	
	    if event == sgs.SlashEffected then
	local effect = data:toSlashEffect()
        if effect.nature == sgs.DamageStruct_Normal then
        --local log=sgs.LogMessage()
        --log.type = "#luatengbingNullify"
       -- log.from = player
        --log.arg  = self:objectName()
        --log.arg2 = "slash"
        --room:sendLog(log)
        return true
        end
    elseif event == sgs.CardEffected then
        local effect=data:toCardEffect()
        if(effect.card and effect.card:inherits("AOE")) then
   -- local log=sgs.LogMessage()
       -- log.type = "#SkillNullify"
       -- log.from = player
       -- log.arg  = self:objectName()
        --log.arg2 = effect.card:objectName()
       -- room:sendLog(log)
        return true
        end
    elseif event == sgs.Predamaged then
        local damage = data:toDamage()
        if damage.nature == sgs.DamageStruct_Fire then
       -- local log=sgs.LogMessage()
       -- log.type = "#luatengbingdamage"
       -- log.from = player
       -- log.arg  = tonumber(damage.damage)
           -- log.arg2 = tonumber(damage.damage + 1)
           -- room:sendLog(log)

        damage.damage = damage.damage + 1
            data:setValue(damage)
            end
        end
    return false
end,

can_trigger=function(self,target)
    return (target:getArmor()==nil) and (target:getMark("qinggang")==0) and (not target:hasFlag("wuqian")) and (target:hasSkill(self:objectName()))
end,
}

---燃殇
wtgranshang = sgs.CreateTriggerSkill
{
	name = "wtgranshang",
	frequency = sgs.Skill_Compulsory,
	events = {sgs.Damaged},
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		local damage = data:toDamage()
		if damage.nature == sgs.DamageStruct_Fire and damage.damage > 1 then
		room:playSkillEffect("wtgranshang")
		room:loseMaxHp(player,1)	
		return false
		end
	end,
}

--严颜列传
yanyanls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "yanyanls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--老骥 by sunny
LuaLaoJiDS=sgs.CreateDistanceSkill{
	name="#LuaLaoJiDS",
	correct_func=function(self,from,to)
		if from:hasFlag("LuaLaoJiUsed") then
			return -998
		end
	end,
}
LuaLaoJiCard=sgs.CreateSkillCard{
	name="LuaLaoJiCard",
	target_fixed=true,
	on_use=function(self,room,source,targets)
		room:throwCard(self)
		room:setPlayerFlag(source,"LuaLaoJiUsed")
		room:playSkillEffect("LuaLaoJi")
	end,
}
LuaLaoJi=sgs.CreateViewAsSkill{
	name="LuaLaoJi",
	n=1,
	view_filter=function(self,selected,to_select)
		return not to_select:isEquipped()
	end,
	view_as=function(self,cards)
		if #cards==0 then return nil end
		local acard=LuaLaoJiCard:clone()
		acard:addSubcard(cards[1])
		return acard
	end,
	enabled_at_play=function(self,player)
		return not player:hasFlag("LuaLaoJiUsed")
	end,
}
--忠烈 by sunny
LuaZhongLie=sgs.CreateTriggerSkill{
	name="LuaZhongLie",
	events=sgs.Dying,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()--获取房间
		local dying=data:toDying()
		local card=dying.damage.card
		if card and card:isBlack() then--红桃
			room:playSkillEffect("LuaZhongLie")
			return true--跳过濒死结算
		end
		return false
	end,
}
--潘凤列传
panfengls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "panfengls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--骁勇
luaxy_trs=sgs.CreateTriggerSkill{
name="luaxy_trs",
--view_as_skill=!!_vs,
events={sgs.DamageCaused},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.DamageCaused then
		if selfplayer:getPhase()~=sgs.Player_Play then return false end
		local damage=data:toDamage()
		if not damage.from:hasSkill(self:objectName()) then return false end
		if damage.card==nil then return false end
		--player:speak("1")
		local b=false
		if damage.card:inherits("Duel") then b=true end
		if damage.card:inherits("Slash") then b=(damage.card:getSuit()==sgs.Card_Spade) or (damage.card:getSuit()==sgs.Card_Diamond) end
		--player:speak("2")
		if b then
			if (room:askForSkillInvoke(selfplayer,self:objectName(),data)~=true) then return false end
			room:playSkillEffect(self:objectName())
			local judge=sgs.JudgeStruct() --判定结构体
        	judge.pattern=sgs.QRegExp("(.*):(spade|diamond):(.*)");
        	judge.good=true
        	judge.reason=self:objectName() --判定原因
        	judge.who=selfplayer --谁判定
        	room:judge(judge) --判定 ，跳入FinishJudge事件
			--player:speak("3")
			if judge:isGood() then
				damage.damage=damage.damage+1
				data:setValue(damage)
				local log=sgs.LogMessage()
				log.from=selfplayer
				log.to:append(damage.to)
				log.type="#luaxy"
				log.arg=tonumber(damage.damage-1)
				log.arg2=log.arg+1
				room:sendLog(log)
			end
		end
	end	
end,
--[[can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end]]--
}




--人物技能


--黄承彦
luahchy:addSkill(huangchengyanls)
luahchy:addSkill(luaqm_trs)
luahchy:addSkill(luadj_trs)
--SP吕布
splvbus:addSkill(splvbuls)
splvbus:addSkill(xinwushuangvs)
splvbus:addSkill(xinwushuangts)
splvbus:addSkill(feijiangts)
--SP甄姬
--luaspzhj:addSkill(spzhenjils)
--luaspzhj:addSkill("qingguo")
--luaspzhj:addSkill(youlis)
--来莺儿
--lualye:addSkill(laiyingerls)
--lualye:addSkill(luayuyin)
--lualye:addSkill(lualianxi)
--lualye:addSkill(luaxunqing)
--蔡瑁张允
luacmzhy:addSkill(caimaozhangyunls)
luacmzhy:addSkill(lualzh_trs)
--luacmzhy:addSkill(luaws_trs)
luacmzhy:addSkill(luajinzhong)
--木鹿大王
--luamldw:addSkill(muludawangls)
--luamldw:addSkill(luaysh_vs)
--luamldw:addSkill(luaysh_trs)
--luamldw:addSkill(luaysh2_trs)
--luamldw:addSkill(luayaoshu_trs)
--兀突骨
luawtg:addSkill(wutuguls)
luawtg:addSkill(luatengbing)
luawtg:addSkill(wtgranshang)

sgs.LoadTranslationTable{
["dpt"]="龙凤前传",

["luamt"]="马腾",
["#luamt"] = "西凉太守",
["designer:luamt"]="廉贞星君丨lwx19911226，之语",
["cv:luamt"]="英雄杀，三国志",
["matengls"]="人物列传",
[":matengls"]="<b>马腾，字寿成，扶风茂陵人。相传其为东汉名将马援之后。三国时割据西凉。马超、马云禄之父，马岱之叔父。曾参与献帝衣带诏一事，因此被曹操设伏诛杀。</b>",
	["luamzh_trs"]="密诏",
	[":luamzh_trs"]="出牌阶段，如果场上没有【密诏】指示物，你可以舍弃一张手牌，选择一名角色放置一枚【密诏】指示物。当其受到伤害时，他/她可以弃置【密诏】指示物，令伤害减少1点。",
	["mzh_choice1"]="弃置【密诏】指示物，令伤害减少1点",
	["mzh_choice2"]="受到伤害",
	["luajy_trs"]="举义",
	[":luajy_trs"]="<b>主公技</b>，<b>锁定技</b>，当其他群雄角色的判定牌生效且进入弃牌堆时，你可以将其加入手牌。",
	["illustrator:luamt"] = "插图:JACK丨PS:廉贞星君",
	["$luamzh_trs"] = "悉听遵命~",
    ["$luajy_trs"] = "岂能无牌~",
	["~luamt"]="马蹄声",
	["@luamzh_mizhao"] = "密诏",
	["luamzh_effect"]="密诏",
["luahchy"]="黄承彦",
["#luahchy"] = "隐居奇人",
["designer:luahchy"]="技能:廉贞星君丨LUA:lwx19911226",
["cv:luahchy"]="官方",
["huangchengyanls"]="人物列传",
[":huangchengyanls"]="<b>黄承彦，荆州名士，黄月英之父，诸葛亮之岳父。精通奇门遁甲之术。夷陵之战后，东吴都督陆逊曾困于鱼腹浦的八阵图中，正是黄承彦指引方能脱险。</b>",
	["luadj_trs"]="遁甲",
	[":luadj_trs"]="<b>锁定技</b>，目标角色无法用【八卦阵】响应你的【杀】和【万箭齐发】。",
	["luaqm_trs"]="奇门",
	[":luaqm_trs"]="每个回合开始前，你可以选择获得以下X+1个技能，直到你的下个回合开始前。X为你损失的体力值，不能连续两个回合获得相同的技能。休门【克己】；生门【青囊】；伤门【鬼道】；杜门【无言】；景门【集智】；死门【完杀】；惊门【八阵】；开门【观星】。",
	["qm_choice1"]="休门【克己】",
	["qm_choice2"]="生门【青囊】",
	["qm_choice3"]="伤门【鬼道】",
	["qm_choice4"]="杜门【无言】",
	["qm_choice5"]="景门【集智】",
	["qm_choice6"]="死门【完杀】",
	["qm_choice7"]="惊门【八阵】",
	["qm_choice8"]="开门【观星】",
	["qm_choice9"]="取消",
	["illustrator:luahchy"] = "插图:霸者无双丨PS:廉贞星君",
	["$luadj_trs"] = "遁形幻千，随意所欲~",
	["~luahchy"]="劫数难逃...",
["splvbus"]="SP吕布",
["designer:splvbus"] = "leowebber丨Guten，晴儿雨儿",--lua制作：之语; 构思：leowebber
["cv:splvbus"] = "英雄杀",
["#splvbus"] = "武的化身",
["illustrator:splvbus"] = "插图:赤壁丨PS：廉贞星君",
["splvbuls"]="人物列传",
[":splvbuls"]="<b>吕布，字奉先，五原人。东汉末年第一猛将，桃园三兄弟合力尚不及。曾先后为丁原、董卓效力。王允以貂蝉为诱，吕布刺杀董卓。李傕和郭汜受贾诩献计，招旧部杀回京城，吕布战败而逃，沦为地方残余割据势力，最后在下邳被曹操和刘备所诛。</b>",
	["xinwushuangvs"] = "争锋",
	["xinwushuangts"] = "无双ts",
	["xinwushuangvs_card"] = "争锋",
	["xinwushuangts1"]="你还要出1张杀",
	["xinwushuangts2"]="你还要出2张杀",
	["xinwushuangts3"]="你还要出3张杀",
	["xinwushuangts4"]="你还要出4张杀",
	["xinwushuangts5"]="你还要出5张杀",
	["xinwushuangts6"]="你还要出6张杀",
	["xinwushuangts7"]="你还要出7张杀",
	["xinwushuangts8"]="你还要出8张杀",
	["xinwushuangts9"]="你还要出9张杀",
	["xinwushuangts10"]="你还要出10张杀",
	["xinwushuangts11"]="你还要出11张杀",
	["xinwushuangts12"]="你还要出12张杀",
	["feijiangts"] = "飞将",
	[":xinwushuangvs"] = "出牌阶段，你可将任意X张手牌当【决斗】使用，目标角色每次需连续打出X张【杀】。X至少为1，每阶段限一次。\n★X的取值前后一致。",
	[":feijiangts"] = "若你使用或打出的【杀】是你最后一张手牌，你可以立即获得所有目标各一张手牌或装备。",
    ["$xinwushuangvs"] = "还有哪个敢挑战我！",
    ["$feijiangts"] = "匹夫受死！",
	["~splvbus"] = "不，这不可能！",
["luaspzhj"]="SP甄姬",
["designer:luaspzhj"] = "技能:廉贞星君丨LUA:之语",--lua制作：之语; 构思：廉贞星君
["cv:luaspzhj"] = "官方，英雄杀",
["#luaspzhj"] = "薄幸美人",
["illustrator:luaspzhj"] = "插图:巴萨小马丨PS:廉贞星君",
["spzhenjils"]="人物列传",
[":spzhenjils"]="<b>甄姬，字嫦娥，中山无极人。懂诗文，貌艳丽。三国时与大小乔齐名的美女。初为袁绍次子袁熙之妻。邺城沦陷后，被曹丕所得，纳之。后生魏明帝曹睿。追谥曰文昭皇后。后世流传，甄姬与曹植互有爱慕之心，其被曹丕赐死也因郭女王所谮。史料均无确切记载。</b>",
	["youlis"] = "游离",
	[":youlis"] = "每当你发动【倾国】使用或打出一张手牌时，你可获得与你距离为1以内的一名角色的一张手牌或装备并立即交给任意一名角色。",
	["qingguos"] = "倾国",
	[":qingguos"] = "你可以将你的黑色手牌当【闪】使用或打出。",
    ["$youlis"] = "来帮我一下吧~",
	["~luaspzhj"]="阵亡词",
["luazhgj"]="SP诸葛瑾",
["#luazhgj"] = "忠义之臣",
["designer:luazhgj"] = "技能:廉贞星君丨LUA:【群】皇叔",
["cv:luazhgj"] = "三国志，英雄杀",
["zhugejinls"]="人物列传",
[":zhugejinls"]="<b>诸葛瑾，字子瑜，徐州琅邪人。诸葛亮之兄，诸葛恪之父。胸怀宽广，温厚诚信，但貌丑似驴。吕蒙去世后，领吴兵权。为蜀汉联合抗曹立下汗马功劳。</b>",
	["luayihe"]="议和",
	[":luayihe"]="出牌阶段，你可以先指定一名体力值不小于你的角色，再指定一名除他之外的任意一名角色，令前者将所有手牌交给后者，后者再将手牌数的一半（向下取整）交给前者，每阶段限一次。\n★后者交给前者时须随机给出。",
	["luajinzhong"]="尽忠",
	[":luajinzhong"]="当你进入濒死状态时，可展示并弃置牌堆顶的第一张牌，若为红色，则你恢复至1点体力。",	
	["illustrator:luazhgj"] = "插图:巴萨小马丨PS:廉贞星君",
	["$luayihe"] = "冷静点吧~",
	["~luazhgj"]="臣愧对主公托孤之重~",
["lualye"] = "来莺儿",
["#lualye"] = "洛阳名妓",
["designer:lualye"] = "廉贞星君丨高达一号，sailiss",
["cv:lualye"] = "英雄杀",
["illustrator:lualye"] = "插图:刀剑如梦丨PS:廉贞星君",
["laiyingerls"]="人物列传",
[":laiyingerls"]="<b>来莺儿，东汉建安年间洛阳之名妓，董卓焚洛阳时，被曹操慕名救下，后爱上曹操的侍卫王图，王图因延误军机而押赴刑场，当时来莺儿奋不顾身以己命换王图一死。得曹操许诺，操又怜惜之，不肯杀之。来莺儿却曰：有罪之人不罚，何以安天下？遂自尽而终。</b>",
	["luayuyin"]="余音",
	[":luayuyin"]="弃牌阶段，你可以将你所弃的牌交给其他几名角色，且每名角色每阶段最多获得一张，未被交出的弃牌进入弃牌堆。\n★操作提示：剩下的不想交出的牌，请按确定结束。",
	["lualianxi"]="怜惜",
	[":lualianxi"]="<b>锁定技</b>，回合外，你每受到一次伤害时，伤害来源需进行一次判定，若结果为红色，则伤害来源摸两张牌，并将其中一张交给你，此伤害对你无效。",--之语修改
	["#lualianxi"]="由于技能【%arg】的效果，%arg2 的伤害被无效",
	["luaxunqing"]="殉情",
	[":luaxunqing"]="<b>限定技</b>，当有男性角色处于濒死状态时，你可以选择令其体力恢复至1点，然后你立即阵亡。",
	["$luayuyin"] = "琴声~",
    ["$lualianxi"] = "可怜可怜我吧~",
	["~lualye"] = "世事如棋，我们都只是棋子~",
["luacmzhy"]="蔡瑁张允",
["#luacmzhy"] = "曹营水将",
["designer:luacmzhy"]="技能:廉贞星君丨LUA:lwx19911226",
["cv:luacmzhy"]="英雄杀，三国志",	
["caimaozhangyunls"]="人物列传",
[":caimaozhangyunls"]="<b>蔡瑁，字德珪，荆州名族，其姐分别嫁与黄承彦、刘表为继室。张允，东汉太尉张温之子，母蔡氏。与蔡瑁为表亲。二人善领水军，赤壁之战时，被周瑜施反间计诛杀。</b>",
	["lualzh_trs"]="列阵",
	[":lualzh_trs"]="<b>锁定技</b>，其他角色使用的【火攻】和【铁索连环】对你无效。\n★注意：你自己使用是有效的。",
	["luaws_trs"]="枉死",
	[":luaws_trs"]="<b>锁定技</b>，【反间】对你造成伤害时，伤害+1。",
	["luashsh_dts"]="水师",
	[":luashsh_dts"]="<b>锁定技</b>，任何时候，你计算与其他角色的距离时，无视其+1马；其他角色计算与你的距离时，无视其-1马",
	["illustrator:luacmzhy"] = "插图:KOEI丨PS:廉贞星君",
	["$lualzh_trs"] = "没必要啊~",
    ["$luaws_trs"] = "中计了吧！",
	["~luacmzhy"]="故三军可夺气，将军可夺心啊~",
["luasmh"]="司马徽",
["#luasmh"] = "好好先生",
["designer:luasmh"]="技能:廉贞星君丨LUA:lwx19911226",
["cv:luasmh"]="英雄杀",
["simahuils"]="人物列传",
[":simahuils"]="<b>司马徽，字德操，号水镜，颍川人，东汉隐士,一生湮没不彰。善知人，通琴艺。在荆州曾与玄德言：儒生俗士，岂识时务。识时务者在于俊杰。此间自有伏龙凤雏。与庞统私交甚笃。</b>",
	["luashj_trs"]="水镜",
	[":luashj_trs"]="你每受到一点伤害，你可以弃掉一张手牌，并令你攻击范围内任意一名角色打出一张【闪】，否则你的伤害来源对其造成一点雷属性伤害。",
	["@luashj_trs"]="因为【水镜】的效果，请打出一张【闪】，否则将受到一点雷属性伤害。",
	["luajx_trs"]="举贤",
	[":luajx_trs"]="你的回合开始前，你可以选择跳过此回合，选择一名其他角色获得一个额外的回合。\n★因为举贤是回合开始前技能，根据翻面的规则可以发动举贤，若如此做，翻面效果不会消失。",
	["illustrator:luasmh"] = "插图:霸者无双丨PS:廉贞星君",
    ["$luashj_trs"] = "斗转星移，万物乾坤~",
    ["$luajx_trs"] = "让我好好考虑一下吧~",
	["~luasmh"]="阵亡词",
["LuaZhangZhongJing"]="张仲景",
["cv:LuaZhangZhongJing"]="英雄杀",
["designer:LuaZhangZhongJing"] = "技能:廉贞星君丨LUA:晴儿雨儿",
["#LuaZhangZhongJing"] = "众生医者",
["illustrator:LuaZhangZhongJing"] = "插图:youxiandaxia丨PS:廉贞星君",
["zhangzhongjingls"]="人物列传",
[":zhangzhongjingls"]="<b>张机，字仲景，南阳人。东汉末年著名医学家、世界医史伟人。为人谦虚谨慎，朴实无华。汉桓帝、汉灵帝、汉献帝三朝常有瘟疫流行，张仲景行走天下，悬壶济世。著有《伤寒杂病论》一书。</b>",
	["LuaXuanHu"]="悬壶",
	["LuaXuanHuTR"]="悬壶",
	["LuaXuanHuTR2"]="悬壶",
	["LuaXuanHuCard"]="悬壶",
	["black"]="黑壶",
	["red"]="红壶",
	["@LuaXuanHuBlack"]="黑壶",
	["@LuaXuanHuRed"]="红壶",
	[":LuaXuanHu"]="出牌阶段，若场上没有【悬壶】指示物，你可以选择任意一名角色并标记一种【悬壶】指示物，【红壶】：被标记的角色将不能使用、打出、弃置（弃牌阶段除外）任意红色牌。【黑壶】：被标记的角色将不能使用、打出、弃置（弃牌阶段除外）任意黑色牌。场上每有一次伤害结算后，【悬壶】标记移动到下一名角色。\n★操作提示：当你遇到被火攻被拼点时，如果无法展示手牌，请点一下托管，然后取消托管即可。",
	["LuaJiShi"]="济世",
	["LuaJiShiTR"]="济世",
	[":LuaJiShi"]="求桃阶段及你的出牌阶段，你可以弃置一张牌，然后令【悬壶】所标记的角色恢复一点体力。",
	["LuaZaBing"]="杂病",
	[":LuaZaBing"]="出牌阶段，你可以弃置一张手牌，令【悬壶】标记改变颜色。",
	["$LuaXuanHu"] = "养精蓄锐~",
    ["$LuaJiShi"] = "妙手回春~",
	["~LuaZhangZhongJing"] = "阵亡词",	
	["@LuaXuanHuBlack"] = "黑壶",
	["@LuaXuanHuRed"] = "红壶",
["luamldw"]="木鹿大王",
["#luamldw"] = "八纳洞主",
["designer:luamldw"]="廉贞星君丨lwx19911226，晴儿雨儿",
["cv:luamldw"]="英雄杀",
["muludawangls"]="人物列传",
[":muludawangls"]="<b>木鹿大王，八纳洞洞主，能使法术，呼风唤雨，操纵猛兽，自己骑巨象出征，被孟获请来抗蜀，初战大捷。后诸葛亮用喷火木兽破其驭兽之术，死于受惊的坐骑脚下。</b>",
	["luaysh_vs"]="驭兽",
	[":luaysh_vs"]="出牌阶段，你可以将手牌中任意两张梅花或两张黑桃当作【南蛮入侵】使用。",
	["luaysh2_trs"]="木兽",
	[":luaysh2_trs"]="<b>锁定技</b>，你使用【南蛮入侵】结算时，每当有玩家打出一张火属性【杀】，你流失一点体力。",
	["luayaoshu_trs"]="妖术",
	[":luayaoshu_trs"]="每当你受到一次属性伤害，你可以弃一张与造成伤害的牌相同花色的牌，令任意一名玩家受到一点同属性伤害。",
	["illustrator:luamldw"] = "插图:群英赋丨PS:廉贞星君",	
	["$luaysh2_trs"] = "闪过了？",
    ["$luaysh_vs"] = "全军冲击~",
    ["$luayaoshu_trs"] = "畏惧我吧~",
	["~luamldw"]="阵亡词",
["luawtg"]="兀突骨",
["#luawtg"] = "乌戈国王",
["designer:luawtg"] = "廉贞星君",
["cv:luawtg"] = "英雄杀",
["wutuguls"]="人物列传",
[":wutuguls"]="<b>兀突骨，南蛮乌戈国主，身长十二尺。孟获六擒六纵之后，向其求援，其亲率三万藤甲兵上阵。着藤甲者，刀枪不入，遇水不沉，独惧火攻。</b>",
	["luatengbing"]="藤兵",
	[":luatengbing"]="<b>锁定技</b>，若你的装备区没有防具牌，视为你装备着【藤甲】",
	["wtgranshang"]="燃殇",
	[":wtgranshang"]="<b>锁定技</b>，你受到≥2点火焰伤害后，体力上限-1",
	["$wtgranshang"] = "尔等竟如此歹毒！",
	["illustrator:luawtg"] = "插图:隐形人丨PS:廉贞星君",		
	["~luawtg"]="撤……快撤！",
["LuaYanYan"]="严颜",
["cv:LuaYanYan"]="英雄杀",
["designer:LuaYanYan"] = "技能:廉贞星君丨LUA:晴儿雨儿",
["#LuaYanYan"] = "老当益壮",
["illustrator:LuaYanYan"] = "插图:一将成名丨PS:廉贞星君",
["yanyanls"]="人物列传",
[":yanyanls"]="<b>严颜，字希伯，巴郡人。属刘璋部将，任巴郡太守，后被张飞所败，张飞对其劝降，严颜义正言辞，曰：卿等无状，侵夺我州，我州但有断头将军，无降将军也！彰显高风亮节。史书到此再无记载，是否降蜀亦成千古之谜。</b>",
	["LuaLaoJi"]="老骥",
	[":LuaLaoJi"]="出牌阶段，你可以弃置一张手牌，若如此做，本回合你计算与其他角色距离时，始终为1。",	
	["LuaZhongLie"]="忠烈",
	[":LuaZhongLie"]="<b>锁定技</b>，黑色牌对你造成伤害，并进入濒死状态时，你不会阵亡。\n★不恢复体力。",
	["$LuaLaoJi"] = "休想全身而退~",
    ["$LuaZhongLie"] = "大丈夫，不惧死亡~",
	["~LuaYanYan"] = "我真的老了吗？",
["luapf"]="潘凤",
["#luapf"] = "无双上将",
["designer:luapf"]="技能:廉贞星君丨LUA:lwx19911226",
["cv:luapf"]="英雄杀",
["panfengls"]="人物列传",
[":panfengls"]="<b>潘凤，字无双，河北名将。效力于韩馥帐下，十八路诸侯讨伐董卓之时，董卓大将华雄在汜水关无人能挡，韩馥曰：吾有上将潘凤，可斩华雄。不料去不多时，飞马来报，潘凤被华雄所斩。</b>",
	["luaxy_trs"]="骁勇",
	[":luaxy_trs"]="出牌阶段，你的【决斗】、黑桃和方块的【杀】造成伤害时，你可以进行一次判定，若为黑桃或方块，则伤害+1。\n★判定牌花色不需要与造成伤害的杀牌花色对应。",
	["#luaxy"]="因为【骁勇】的效果， %from 对 %to 的伤害从 %arg 点上升至 %arg2 点",
	["illustrator:luapf"] = "插图:不详丨PS:廉贞星君",
	["$luaxy_trs"] = "与我较量一番！",
	["~luapf"]="老子不依！",
	
	
}



--废弃的代码
--[[luayaoshu_trs=sgs.CreateTriggerSkill{
name="luayaoshu_trs",
--view_as_skill=!!_vs,
events={sgs.Damaged},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.Damaged then
		local damage=data:toDamage()
		if not damage.to:hasSkill(self:objectName()) then return false end
		if damage.nature==sgs.DamageStruct_Normal then return false end
		if selfplayer:isKongcheng() then return false end
		if (room:askForSkillInvoke(selfplayer,self:objectName())~=true) then return false end
		local suit=damage.card:getSuit()
		local cd=nil
		if suit==sgs.Card_Spade then
			cd=room:askForCard(selfplayer,".S",self:objectName(),data)
		elseif suit==sgs.Card_Heart then
			cd=room:askForCard(selfplayer,".H",self:objectName(),data)
		elseif suit==sgs.Card_Club then
			cd=room:askForCard(selfplayer,".C",self:objectName(),data)
		elseif suit==sgs.Card_Diamond then
			cd=room:askForCard(selfplayer,".D",self:objectName(),data)
		end
		if cd~=nil then
			local pc=room:askForPlayerChosen(selfplayer,room:getAlivePlayers(),self:objectName())
			if pc~=nil then
				local damage_t=sgs.DamageStruct()
				damage_t.damage=1
				damage_t.from=selfplayer
				damage_t.to=pc
				damage_t.nature=damage.nature
				room:damage(damage_t)
			end
		end
	end	
end,
--can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end--
}]]--

--[[luawj_trs=sgs.CreateTriggerSkill{
name="luawj_trs",
--view_as_skill=!!_vs,
events={sgs.GameStart},
frequency = sgs.Skill_Compulsory,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}]]--
