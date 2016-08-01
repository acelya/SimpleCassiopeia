if GetObjectName(GetMyHero()) ~= "Cassiopeia" then return end

local ver = "0.01"

require ("DamageLib")
require ("OpenPredict")

function AutoUpdate(data)
    if tonumber(data) > tonumber(ver) then
        print("New version found! " .. data)
        print("Downloading update, please wait...")
        DownloadFileAsync("https://github.com/acelya/SimpleCassiopeia/blob/master/SimpleCassiopeia.lua", SCRIPT_PATH .. "SimpleCassiopeia.lua", function() print("Update Complete, please 2x F6!") return end)
    end
end
--MENU
CassiopeiaMenu = Menu ("Cassiopeia" 
	
CassiopeiaMenu:SubMenu ("Combo", "Combo")
CassiopeiaMenu.Combo:Boolean("Q", "Use Q", true)
CassiopeiaMenu.Combo:Boolean("W", "Use W", true)
CassiopeiaMenu.Combo:Boolean("E", "Use E", true)
CassiopeiaMenu.Combo:Boolean("R", "Use R", true)

CassiopeiaMenu:SubMenu ("Killsteal", "Killsteal")
CassiopeiaMenu.Killsteal:Boolean("KSQ", "Use Q", true)
CassiopeiaMenu.Killsteal:Boolean("KSE", "Use E", true)
CassiopeiaMenu.Killsteal:Boolean("KSR", "Use R", true)

CassiopeiaMenu:SubMenu ("LaneClear"m "Lane clear")
CassiopeiaMenu.LaneClear:Boolean("ClearQ", "Use Q", true)
CassiopeiaMenu.LaneClear:Boolean("ClearE", "Use E", true)

CassiopeiaMenu:SubMenu ("Lasthit", "Lasthit")
CassiopeiaMenu.Lashit:Boolean("LH", "Last hit minions AA", true)
CassiopeiaMenu.Lashit:Boolean("LHE", "Last hit E small minions", true)
CassiopeiaMenu.Lashit:Boolean("LHE", "Last hit E Big minions", true)
CassiopeiaMenu.Lashit:Slider("ManaQ", "If Mana % is higher than", 50, 10, 100, 5)

Cassiopeia:SubMenu ("Misc", "Misc)
CassiopeiaMenu.Misc:Boolean("Ignite", "Ignite if can kill", true)

--Combo Functions

--Spell Functionsfunction ComboQ()
function ComboQ()
if CassiopeiaMenu.Combo.Q:Value() and Ready(_Q) and ValidTarget(target, QRange) then 
	CastSkillShot(_Q, QPredTarget.PredPos)
	end
end

function ComboW()
	if Cassiopeia.Combo.W:Value() and Ready(_W) and ValidTarget(target, WRange) then
			CastSkillShot(_W, WPredTarget.PredPos)
	end
end
function ComboE()
	if CassiopeiaMenu.Combo.E:Value() and Ready(_E) and ValidTarget(target, ERange) and if GetBuffTypeList(23) then
			CastTargetSpell(target, _E)
		end
	end
	end
function ComboR()
	if CassiopeiaMenu.Combo.R:Value() and Ready(_R) and ValidTarget(target, ERange) and if EnemiesAround(posVector3D, range) < 2 then
			CastSkillshot(_R, RPredTarget.PredPos)
		end
	end
end

OnTick(function (myHero)
	
	--Variables
	target = GetCurrentTarget()
	MaxMana = GetMaxMana(myHero)
	MaxHP = GetMaxHP(myHero)
	CurrentHP = GetCurrentHP(myHero)
	BaseAD = GetBaseDamage(myHero)
	BonusAD = GetBonusDmg(myHero)
	BonusAP = GetBonusAP(myHero)
	MeleeRange = 550
	QRange = 850
	WRange = 850
	ERange = 700
	RRange = 850
	QDmg = 75 + 45 * GetCastLevel(myHero, _Q) + BonusAP * 0.70 
	WDmg = 20 + 10 * GetCastLevel(myHero, _W) + BonusAP * 0.90 
	EDmg = 55 + 25 * GetCastLevel(myHero, _E) + BonusAP * 0.55
	RDmg = 150 + 100 * GetCastLevel(myHero,_R) + BonusAP * 0.50
	
	--LaneClear 
		if Mode() == "LaneClear" then
		
		for _, closeminion in pairs(minionManager.objects) do
			if Cassiopeia.LaneClear.ClearE:Value() and ValidTarget(closeminion, ) and GetTickCount() > nextAttack then
					CastSkillShot(_E, closeminion)
				end
			end

--Combo
	if Mode() == "Combo" then
		
		if CassiopeiaMenu.Combo.Q:Value() and Ready(_Q) and ValidTarget(target, 850) and GetTickCount() > nextAttack then if GetPerfecntMP (myHero) >= then
			local QPred = GetPrediction(target, QStats)
		end
	end
	
	if CassiopeiaMenu.Combo.W:Value() and Ready(_W) then ValidTarget(target, 850) and GetTickCOunt() > nextAttack then
		local WPred = GetLinearAOEPrediction(target, WStats)
	end
end
if CassiopeiaMenu.ComboE:Value() and Ready(_E) and ValidTarget(target, 700) then 
	local EPred = GetOnTargetPrediction(target, EStats)
end
end
if CassiopeiaMenu.ComboR:Value() and Ready(_R) and ValidTarget (target, 850) and GetTickCount() > nextAttack then localRPred = GetAOEPrediction(target, RStats)
end
end

--KS Ignite
if GetCastName(myHero, SUMMONER_1):lower():find("summonerdot")then
	if CassiopeiaMenu.Misc.Ignite:value() and Ready(SUMMONER_1) and ValidTarget(enemy, 600) then
		if GetCurrentHP(enemy) < Idamage then
			CastTargetSpell(enemy, SUMMONER_1)
		end
	end
	if GetCastName(myHero, SUMMONER_2):lower():find("summonerdot")then
	if CassiopeiaMenu.Misc.Ignite:value() and Ready(SUMMONER_2) and ValidTarget(enemy, 600) then
		if GetCurrentHP(enemy) < Idamage then
			CastTargetSpell(enemy, SUMMONER_2)
		end
	end