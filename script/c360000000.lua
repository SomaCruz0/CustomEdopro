--Rescue-Ace Fire Keeper
--Scripted by SomaCruz
local s,id=GetID()
function s.initial_effect(c)
	c:EnableReviveLimit()
	--Link Summon
	Link.AddProcedure(c,s.matfilter,1,1)
	--Set field from Deck/GY
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_ATKCHANGE)
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_O)
	e1:SetCode(EVENT_ATTACK_ANNOUNCE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCondition(s.atkcon)
	e1:SetCost(Cost.SelfTribute)
	e1:SetOperation(s.atkop)
	c:RegisterEffect(e1)
end

function s.matfilter(c,scard,sumtype,tp)
	return not c:IsType(TYPE_LINK,scard,sumtype,tp) and c:IsAttribute(ATTRIBUTE_FIRE,scard,sumtype,tp)
end

function s.cfilter(c,ft,tp)
	return c:IsLevel(1) and (ft>0 or c:GetSequence()<5)
end
function s.spcost(e,tp,eg,ep,ev,re,r,rp,chk)
	local ft=Duel.GetLocationCount(tp,LOCATION_MZONE)
	if chk==0 then return ft>-1 and Duel.CheckReleaseGroupCost(tp,s.cfilter,1,false,nil,nil,ft,tp) end
	local g=Duel.SelectReleaseGroupCost(tp,s.cfilter,1,1,false,nil,nil,ft,tp)
	Duel.Release(g,REASON_COST)
end
function s.sptg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return e:GetHandler():IsCanBeSpecialSummoned(e,0,tp,false,false) end
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,e:GetHandler(),1,0,0)
end
function s.spop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if c:IsRelateToEffect(e) then 
		Duel.SpecialSummon(c,0,tp,tp,false,false,POS_FACEUP)
	end
end