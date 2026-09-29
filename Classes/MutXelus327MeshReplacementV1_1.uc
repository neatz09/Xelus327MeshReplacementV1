class MutXelus327MeshReplacementV1_1 extends Mutator
    config (Xelus327MeshReplacement);

#exec OBJ LOAD FILE=..\Textures\XELUS_VanillaHQ_TEX.utx
#exec OBJ LOAD FILE=..\StaticMeshes\FixedXweapons_SM.usx
#exec OBJ LOAD FILE=..\Textures\FixedXWeapons_TEX.utx
#exec OBJ LOAD FILE=..\StaticMeshes\XELUS_VanillaHQ.usx

var() config bool bEnableFixedXWeapons;
var() config bool bEnableXelusAmmoPickups;
var() config bool bEnableXelusChargers;
var() config bool bEnableExperimentalXelusWildcardChargers;
var() config bool bEnableXelusJumpPads;
var() config bool bEnableExperimentalLiftpadReplacement;
var() config bool bEnableExperimentalAmmoGrounding;
var() config bool bEnableHQTextures;
var() config bool bDisablePickupAmbientGlow;
var() config int XelusAdrenalineColor;
var() config int XelusUDamageStyle;
var() config int XelusShieldStyle;
var() config int XelusSuperShieldStyle;
var() config int XelusHealthStyle;
var() config int XelusMegaHealthStyle;
var localized string FixedXWeaponsText;
var localized string FixedXWeaponsDesc;
var localized string XelusAmmoPickupsText;
var localized string XelusAmmoPickupsDesc;
var localized string XelusChargersText;
var localized string XelusChargersDesc;
var localized string ExperimentalXelusWildcardChargersText;
var localized string ExperimentalXelusWildcardChargersDesc;
var localized string XelusJumpPadsText;
var localized string XelusJumpPadsDesc;
var localized string ExperimentalLiftpadReplacementText;
var localized string ExperimentalLiftpadReplacementDesc;
var localized string ExperimentalAmmoGroundingText;
var localized string ExperimentalAmmoGroundingDesc;
var localized string HQTexturesText;
var localized string HQTexturesDesc;
var localized string DisablePickupAmbientGlowText;
var localized string DisablePickupAmbientGlowDesc;
var localized string XelusAdrenalineDesc;
var localized string XelusUDamageDesc;
var localized string XelusShieldDesc;
var localized string XelusSuperShieldDesc;
var localized string XelusHealthDesc;
var localized string XelusMegaHealthDesc;

replication
{
    reliable if (Role == ROLE_Authority && (bNetInitial || bNetDirty))
        bDisablePickupAmbientGlow;
}

event PreBeginPlay()
{
    Super.PreBeginPlay();
    StaticSaveConfig();
    AddToPackageMap("FixedXweapons_SM");
    AddToPackageMap("FixedXWeapons_TEX");
    AddToPackageMap("XELUS_VanillaHQ");
    AddToPackageMap("XELUS_VanillaHQ_TEX");
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    Super.FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.RulesGroup, "bEnableFixedXWeapons", default.FixedXWeaponsText, 0, 1, "Check");
    PlayInfo.AddSetting(default.RulesGroup, "bEnableXelusAmmoPickups", default.XelusAmmoPickupsText, 0, 1, "Check");
    PlayInfo.AddSetting(default.RulesGroup, "bEnableXelusChargers", default.XelusChargersText, 0, 1, "Check");
    PlayInfo.AddSetting(default.RulesGroup, "bEnableExperimentalXelusWildcardChargers", default.ExperimentalXelusWildcardChargersText, 0, 1, "Check");
    PlayInfo.AddSetting(default.RulesGroup, "bEnableXelusJumpPads", default.XelusJumpPadsText, 0, 1, "Check");
    PlayInfo.AddSetting(default.RulesGroup, "bEnableExperimentalLiftpadReplacement", default.ExperimentalLiftpadReplacementText, 0, 1, "Check");
    PlayInfo.AddSetting(default.RulesGroup, "bEnableExperimentalAmmoGrounding", default.ExperimentalAmmoGroundingText, 0, 1, "Check");
    PlayInfo.AddSetting(default.RulesGroup, "bEnableHQTextures", default.HQTexturesText, 0, 1, "Check");
    PlayInfo.AddSetting(default.RulesGroup, "bDisablePickupAmbientGlow", default.DisablePickupAmbientGlowText, 0, 1, "Check");
    PlayInfo.AddSetting(default.RulesGroup, "XelusAdrenalineColor", "Adrenaline Color", 0, 1, "Select", "0;Green;1;Red;2;Blue;4;Purple;3;Stock");
    PlayInfo.AddSetting(default.RulesGroup, "XelusUDamageStyle", "UDamage Style", 0, 1, "Select", "0;Stock;1;Xelus;2;Xelus Classic");
    PlayInfo.AddSetting(default.RulesGroup, "XelusShieldStyle", "Shield Pickup Style", 0, 1, "Select", "0;Stock;1;Xelus;2;Xelus Classic;3;Shield Box");
    PlayInfo.AddSetting(default.RulesGroup, "XelusSuperShieldStyle", "Super Shield Pickup Style", 0, 1, "Select", "0;Stock;1;Xelus;2;Xelus Classic;3;Super Shield Box");
    PlayInfo.AddSetting(default.RulesGroup, "XelusHealthStyle", "Health Pickup Style", 0, 1, "Select", "0;Stock;1;Xelus;2;Xelus Classic;3;Med Box");
    PlayInfo.AddSetting(default.RulesGroup, "XelusMegaHealthStyle", "Big Keg O' Health Pickup Style", 0, 1, "Select", "0;Stock;1;Xelus;2;U1 Style");
}

static event string GetDescriptionText(string PropName)
{
    if (PropName == "bEnableFixedXWeapons")
        return default.FixedXWeaponsDesc;

    if (PropName == "bEnableXelusAmmoPickups")
        return default.XelusAmmoPickupsDesc;

    if (PropName == "bEnableXelusChargers")
        return default.XelusChargersDesc;

    if (PropName == "bEnableExperimentalXelusWildcardChargers")
        return default.ExperimentalXelusWildcardChargersDesc;

    if (PropName == "bEnableXelusJumpPads")
        return default.XelusJumpPadsDesc;

    if (PropName == "bEnableExperimentalLiftpadReplacement")
        return default.ExperimentalLiftpadReplacementDesc;

    if (PropName == "bEnableExperimentalAmmoGrounding")
        return default.ExperimentalAmmoGroundingDesc;

    if (PropName == "bEnableHQTextures")
        return default.HQTexturesDesc;

    if (PropName == "bDisablePickupAmbientGlow")
        return default.DisablePickupAmbientGlowDesc;

    if (PropName == "XelusAdrenalineColor")
        return default.XelusAdrenalineDesc;

    if (PropName == "XelusUDamageStyle")
        return default.XelusUDamageDesc;

    if (PropName == "XelusShieldStyle")
        return default.XelusShieldDesc;

    if (PropName == "XelusSuperShieldStyle")
        return default.XelusSuperShieldDesc;

    if (PropName == "XelusHealthStyle")
        return default.XelusHealthDesc;

    if (PropName == "XelusMegaHealthStyle")
        return default.XelusMegaHealthDesc;

    return Super.GetDescriptionText(PropName);
}

function Texture LoadReplacementTexture(string TextureName)
{
    return Texture(DynamicLoadObject(TextureName, class'Texture'));
}

simulated function Material RemovePickupShaderGlow(Material SourceMaterial)
{
    local Shader SourceShader;
    local Shader ReplacementShader;

    SourceShader = Shader(SourceMaterial);
    if (SourceShader == None
        || (SourceShader.SelfIllumination == None
            && SourceShader.SelfIlluminationMask == None))
        return SourceMaterial;

    ReplacementShader = New(None) Class'Shader';
    if (ReplacementShader == None)
        return SourceMaterial;

    ReplacementShader.Diffuse = SourceShader.Diffuse;
    ReplacementShader.Opacity = SourceShader.Opacity;
    ReplacementShader.Specular = SourceShader.Specular;
    ReplacementShader.SpecularityMask = SourceShader.SpecularityMask;
    ReplacementShader.Detail = SourceShader.Detail;
    ReplacementShader.DetailScale = SourceShader.DetailScale;
    ReplacementShader.OutputBlending = SourceShader.OutputBlending;
    ReplacementShader.TwoSided = SourceShader.TwoSided;
    ReplacementShader.Wireframe = SourceShader.Wireframe;
    ReplacementShader.ModulateStaticLighting2X = SourceShader.ModulateStaticLighting2X;
    ReplacementShader.PerformLightingOnSpecularPass = SourceShader.PerformLightingOnSpecularPass;
    ReplacementShader.ModulateSpecular2X = SourceShader.ModulateSpecular2X;
    ReplacementShader.FallbackMaterial = SourceShader.FallbackMaterial;

    return ReplacementShader;
}

simulated function RemovePickupShaderGlowFromActor(Actor Other)
{
    local int SkinIndex;

    if (Other == None)
        return;

    Other.bUnlit = false;
    for (SkinIndex = 0; SkinIndex < Other.Skins.Length; SkinIndex++)
        Other.Skins[SkinIndex] = RemovePickupShaderGlow(Other.Skins[SkinIndex]);
}

function ApplyPickupAmbientGlowSetting(Actor Other)
{
    local Pickup PickupActor;
    local xPickupBase PickupBase;
    local XelusWeaponChargerVisual WeaponChargerVisual;

    if (!bDisablePickupAmbientGlow)
        return;

    WeaponChargerVisual = XelusWeaponChargerVisual(Other);
    if (WeaponChargerVisual != None)
    {
        WeaponChargerVisual.AmbientGlow = 0;
        RemovePickupShaderGlowFromActor(WeaponChargerVisual);
    }

    PickupActor = Pickup(Other);
    if (PickupActor != None)
    {
        PickupActor.bAmbientGlow = false;
        PickupActor.AmbientGlow = 0;
        RemovePickupShaderGlowFromActor(PickupActor);
    }

    PickupBase = xPickupBase(Other);
    if (PickupBase != None)
    {
        PickupBase.AmbientGlow = 0;
        RemovePickupShaderGlowFromActor(PickupBase);
        if (PickupBase.MyPickup != None)
        {
            PickupBase.MyPickup.bAmbientGlow = false;
            PickupBase.MyPickup.AmbientGlow = 0;
            RemovePickupShaderGlowFromActor(PickupBase.MyPickup);
        }
    }
}

simulated function ApplyPickupAmbientGlowToLocalActors()
{
    local Pickup PickupActor;
    local xPickupBase PickupBase;
    local XelusWeaponChargerVisual WeaponChargerVisual;

    if (!bDisablePickupAmbientGlow)
        return;

    foreach AllActors(class'XelusWeaponChargerVisual', WeaponChargerVisual)
    {
        WeaponChargerVisual.AmbientGlow = 0;
        RemovePickupShaderGlowFromActor(WeaponChargerVisual);
    }

    foreach AllActors(class'Pickup', PickupActor)
    {
        PickupActor.bAmbientGlow = false;
        PickupActor.AmbientGlow = 0;
        RemovePickupShaderGlowFromActor(PickupActor);
    }

    foreach AllActors(class'xPickupBase', PickupBase)
    {
        PickupBase.AmbientGlow = 0;
        RemovePickupShaderGlowFromActor(PickupBase);
        if (PickupBase.MyPickup != None)
        {
            PickupBase.MyPickup.bAmbientGlow = false;
            PickupBase.MyPickup.AmbientGlow = 0;
            RemovePickupShaderGlowFromActor(PickupBase.MyPickup);
        }
    }
}

simulated event PostNetBeginPlay()
{
    Super.PostNetBeginPlay();

    if (bDisablePickupAmbientGlow)
    {
        ApplyPickupAmbientGlowToLocalActors();
        SetTimer(1.0, true);
    }
}

simulated event PostNetReceive()
{
    if (bDisablePickupAmbientGlow)
    {
        ApplyPickupAmbientGlowToLocalActors();
        SetTimer(1.0, true);
    }
    else
        SetTimer(0.0, false);
}

simulated event Timer()
{
    if (bDisablePickupAmbientGlow)
        ApplyPickupAmbientGlowToLocalActors();
    else
        SetTimer(0.0, false);
}

function CopyPickupState(Pickup OldPickup, Pickup NewPickup)
{
    if (OldPickup.IsInState('WaitingForMatch'))
        NewPickup.GotoState('WaitingForMatch');
    else if (OldPickup.IsInState('Sleeping'))
        NewPickup.GotoState('Sleeping');
    else if (OldPickup.IsInState('Disabled'))
        NewPickup.GotoState('Disabled');
    else if (OldPickup.PickUpBase != None
        && OldPickup.PickUpBase.bDelayedSpawn)
        NewPickup.GotoState('WaitingForMatch');
}

function bool IsXelusBoxPickup(Pickup PickupActor)
{
    return PickupActor != None
        && (PickupActor.IsA('XelusShieldBoxPickup')
            || PickupActor.IsA('XelusSuperShieldBoxPickup')
            || PickupActor.IsA('XelusHealthMedBoxPickup')
            || PickupActor.IsA('XelusU1SuperHealthPickup'));
}

function bool IsWildcardPickup(Pickup PickupActor)
{
    local xPickupBase CandidateBase;

    if (PickupActor == None)
        return false;

    if (PickupActor.PickUpBase != None)
        return PickupActor.PickUpBase.IsA('WildcardBase')
            || PickupActor.PickUpBase.IsA('XelusWildcardCharger');

    foreach AllActors(class'xPickupBase', CandidateBase)
    {
        if ((CandidateBase.IsA('WildcardBase')
            || CandidateBase.IsA('XelusWildcardCharger'))
            && VSize(PickupActor.Location
                - (CandidateBase.Location
                + CandidateBase.SpawnHeight * vect(0,0,1))) <= 2.0)
            return true;
    }

    return false;
}

function ApplySelectedChargerPowerUp(xPickupBase Charger)
{
    if (Charger == None)
        return;

    if (HealthCharger(Charger) != None)
    {
        if (XelusHealthStyle == 1)
            Charger.PowerUp = class'XelusHealthPackPickup';
        else if (XelusHealthStyle == 2)
            Charger.PowerUp = class'XelusClassicHealthPackPickup';
        else if (XelusHealthStyle == 3)
            Charger.PowerUp = class'XelusHealthMedBoxPickup';
    }
    else if (ShieldCharger(Charger) != None)
    {
        if (XelusShieldStyle == 1)
            Charger.PowerUp = class'XelusShieldPickup';
        else if (XelusShieldStyle == 2)
            Charger.PowerUp = class'XelusClassicShieldPickup';
        else if (XelusShieldStyle == 3)
            Charger.PowerUp = class'XelusShieldBoxPickup';
    }
    else if (SuperShieldCharger(Charger) != None)
    {
        if (XelusSuperShieldStyle == 1)
            Charger.PowerUp = class'XelusSuperShieldPickup';
        else if (XelusSuperShieldStyle == 2)
            Charger.PowerUp = class'XelusClassicSuperShieldPickup';
        else if (XelusSuperShieldStyle == 3)
            Charger.PowerUp = class'XelusSuperShieldBoxPickup';
    }
    else if (SuperHealthCharger(Charger) != None)
    {
        if (XelusMegaHealthStyle == 1)
            Charger.PowerUp = class'XelusSuperHealthPickup';
        else if (XelusMegaHealthStyle == 2)
            Charger.PowerUp = class'XelusU1SuperHealthPickup';
    }
    else if (UDamageCharger(Charger) != None)
    {
        if (XelusUDamageStyle == 1)
            Charger.PowerUp = class'XelusUDamagePickup';
        else if (XelusUDamageStyle == 2)
            Charger.PowerUp = class'XelusClassicUDamagePickup';
    }
}

function ApplyWeaponChargerMesh(xWeaponBase Charger)
{
    local XelusWeaponChargerVisual Visual;

    PrepareChargerForRemoval(Charger);
    Charger.bHidden = true;
    Charger.SetDrawType(DT_None);
    Charger.SetCollision(false, false, false);
    Charger.bCollideWorld = false;

    if (Role != ROLE_Authority)
        return;

    foreach AllActors(class'XelusWeaponChargerVisual', Visual)
        if (Visual.Base == Charger)
            return;

    Visual = Spawn(class'XelusWeaponChargerVisual', Charger.Owner, ,
        Charger.Location, Charger.Rotation);
    if (Visual != None)
        Visual.SetBase(Charger);
}

function SpawnWeaponChargerVisual(xWeaponBase Charger)
{
    local XelusWeaponChargerVisual Visual;

    if (Charger == None || Role != ROLE_Authority)
        return;

    Visual = Spawn(class'XelusWeaponChargerVisual', Charger.Owner, ,
        Charger.Location, Charger.Rotation);
    if (Visual != None)
    {
        Visual.SpiralEmitter = Charger.SpiralEmitter;
        Visual.EnsureEmitter();
    }
}

function PrepareChargerForRemoval(xPickupBase Charger)
{
    if (Charger == None)
        return;

    Charger.RemoteRole = ROLE_SimulatedProxy;
    Charger.bAlwaysRelevant = true;
    Charger.NetUpdateFrequency = 0.100000;
    Charger.NetPriority = 1.400000;
}

function ApplyAdrenalineTexture(AdrenalinePickup Pickup)
{
    if (XelusAdrenalineColor == 0)
    {
        Pickup.RepSkin = LoadReplacementTexture("XELUS_VanillaHQ_TEX.Adrenaline.Adrenaline_01_Medium");
        Pickup.Skins[0] = Pickup.RepSkin;
    }
    else if (XelusAdrenalineColor == 1)
    {
        Pickup.RepSkin = LoadReplacementTexture("XELUS_VanillaHQ_TEX.Adrenaline.Adrenaline_01_Small");
        Pickup.Skins[0] = Pickup.RepSkin;
    }
    else if (XelusAdrenalineColor == 2)
    {
        Pickup.RepSkin = LoadReplacementTexture("XELUS_VanillaHQ_TEX.Adrenaline.Adrenaline_01_Large");
        Pickup.Skins[0] = Pickup.RepSkin;
    }
    else if (XelusAdrenalineColor == 4)
    {
        Pickup.RepSkin = LoadReplacementTexture("XELUS_VanillaHQ_TEX.Adrenaline.Adrenaline_01_Ion");
        Pickup.Skins[0] = Pickup.RepSkin;
    }
}

function bool ReplaceAdrenalinePickup(AdrenalinePickup OldPickup)
{
    local XelusAdrenalinePickup NewPickup;

    NewPickup = Spawn(class'XelusAdrenalinePickup', OldPickup.Owner, ,
        OldPickup.Location, OldPickup.Rotation);
    if (NewPickup == None)
        return false;

    NewPickup.AdrenalineAmount = OldPickup.AdrenalineAmount;
    NewPickup.RespawnTime = OldPickup.RespawnTime;
    NewPickup.Event = OldPickup.Event;
    NewPickup.Tag = OldPickup.Tag;
    NewPickup.SetDrawScale(OldPickup.DrawScale);
    NewPickup.SetDrawScale3D(OldPickup.DrawScale3D);
    NewPickup.SetDrawScale3D(vect(1,1,1));
    NewPickup.PrePivot = OldPickup.PrePivot;
    NewPickup.PickUpBase = OldPickup.PickUpBase;
    if (NewPickup.PickUpBase != None)
        NewPickup.PickUpBase.MyPickup = NewPickup;
    ApplyPickupAmbientGlowSetting(NewPickup);

    if (OldPickup.MyMarker != None)
    {
        NewPickup.MyMarker = OldPickup.MyMarker;
        NewPickup.MyMarker.MarkedItem = NewPickup;
        NewPickup.SetLocation(NewPickup.Location
            + (NewPickup.CollisionHeight - OldPickup.CollisionHeight) * vect(0,0,1));
        OldPickup.MyMarker = None;
    }

    ApplyAdrenalineTexture(NewPickup);
    NewPickup.RepAdrenalineSkin = NewPickup.RepSkin;
    OldPickup.Destroy();
    return true;
}

function bool ReplaceUDamagePickup(UDamagePack OldPickup)
{
    local class<UDamagePack> ReplacementClass;
    local UDamagePack NewPickup;

    if (XelusUDamageStyle == 1)
        ReplacementClass = class'XelusUDamagePickup';
    else if (XelusUDamageStyle == 2)
        ReplacementClass = class'XelusClassicUDamagePickup';
    else
        return false;

    NewPickup = Spawn(ReplacementClass, OldPickup.Owner, ,
        OldPickup.Location, OldPickup.Rotation);
    if (NewPickup == None)
        return false;

    NewPickup.InventoryType = OldPickup.InventoryType;
    NewPickup.bInstantRespawn = OldPickup.bInstantRespawn;
    NewPickup.bPredictRespawns = OldPickup.bPredictRespawns;
    NewPickup.RespawnTime = OldPickup.RespawnTime;
    NewPickup.PickupMessage = OldPickup.PickupMessage;
    NewPickup.PickupSound = OldPickup.PickupSound;
    NewPickup.PickupForce = OldPickup.PickupForce;
    NewPickup.MaxDesireability = OldPickup.MaxDesireability;
    NewPickup.Event = OldPickup.Event;
    NewPickup.Tag = OldPickup.Tag;
    NewPickup.SetDrawScale(OldPickup.DrawScale);
    NewPickup.SetDrawScale3D(OldPickup.DrawScale3D);
    NewPickup.PrePivot = OldPickup.PrePivot;
    NewPickup.SetCollisionSize(OldPickup.CollisionRadius, OldPickup.CollisionHeight);
    NewPickup.PickUpBase = OldPickup.PickUpBase;
    if (NewPickup.PickUpBase != None)
        NewPickup.PickUpBase.MyPickup = NewPickup;
    ApplyPickupAmbientGlowSetting(NewPickup);
    CopyPickupState(OldPickup, NewPickup);

    if (OldPickup.MyMarker != None)
    {
        NewPickup.MyMarker = OldPickup.MyMarker;
        NewPickup.MyMarker.MarkedItem = NewPickup;
        NewPickup.SetLocation(NewPickup.Location
            + (NewPickup.CollisionHeight - OldPickup.CollisionHeight) * vect(0,0,1));
        OldPickup.MyMarker = None;
    }

    OldPickup.Destroy();
    return true;
}

function bool ReplaceShieldPickup(ShieldPickup OldPickup)
{
    local class<ShieldPickup> ReplacementClass;
    local ShieldPickup NewPickup;

    if (XelusShieldStyle == 1)
        ReplacementClass = class'XelusShieldPickup';
    else if (XelusShieldStyle == 2)
        ReplacementClass = class'XelusClassicShieldPickup';
    else if (XelusShieldStyle == 3)
        ReplacementClass = class'XelusShieldBoxPickup';
    else
        return false;

    NewPickup = Spawn(ReplacementClass, OldPickup.Owner, ,
        OldPickup.Location, OldPickup.Rotation);
    if (NewPickup == None)
        return false;

    NewPickup.ShieldAmount = OldPickup.ShieldAmount;
    NewPickup.bInstantRespawn = OldPickup.bInstantRespawn;
    NewPickup.bPredictRespawns = OldPickup.bPredictRespawns;
    NewPickup.RespawnTime = OldPickup.RespawnTime;
    NewPickup.PickupMessage = OldPickup.PickupMessage;
    NewPickup.PickupSound = OldPickup.PickupSound;
    NewPickup.PickupForce = OldPickup.PickupForce;
    NewPickup.MaxDesireability = OldPickup.MaxDesireability;
    NewPickup.Event = OldPickup.Event;
    NewPickup.Tag = OldPickup.Tag;
    NewPickup.SetDrawScale(OldPickup.DrawScale);
    if (XelusShieldBoxPickup(NewPickup) != None)
        NewPickup.SetDrawScale(0.600000);
    NewPickup.SetDrawScale3D(OldPickup.DrawScale3D);
    NewPickup.PrePivot = OldPickup.PrePivot;
    NewPickup.SetCollisionSize(OldPickup.CollisionRadius, OldPickup.CollisionHeight);
    NewPickup.PickUpBase = OldPickup.PickUpBase;
    if (NewPickup.PickUpBase != None)
        NewPickup.PickUpBase.MyPickup = NewPickup;
    ApplyPickupAmbientGlowSetting(NewPickup);
    CopyPickupState(OldPickup, NewPickup);
    GroundBoxPickup(NewPickup);

    if (OldPickup.MyMarker != None)
    {
        NewPickup.MyMarker = OldPickup.MyMarker;
        NewPickup.MyMarker.MarkedItem = NewPickup;
        NewPickup.SetLocation(NewPickup.Location
            + (NewPickup.CollisionHeight - OldPickup.CollisionHeight) * vect(0,0,1));
        OldPickup.MyMarker = None;
    }

    OldPickup.Destroy();
    return true;
}

function bool ReplaceSuperShieldPickup(SuperShieldPack OldPickup)
{
    local class<SuperShieldPack> ReplacementClass;
    local SuperShieldPack NewPickup;

    if (XelusSuperShieldStyle == 1)
        ReplacementClass = class'XelusSuperShieldPickup';
    else if (XelusSuperShieldStyle == 2)
        ReplacementClass = class'XelusClassicSuperShieldPickup';
    else if (XelusSuperShieldStyle == 3)
        ReplacementClass = class'XelusSuperShieldBoxPickup';
    else
        return false;

    NewPickup = Spawn(ReplacementClass, OldPickup.Owner, ,
        OldPickup.Location, OldPickup.Rotation);
    if (NewPickup == None)
        return false;

    NewPickup.ShieldAmount = OldPickup.ShieldAmount;
    NewPickup.bInstantRespawn = OldPickup.bInstantRespawn;
    NewPickup.bPredictRespawns = OldPickup.bPredictRespawns;
    NewPickup.RespawnTime = OldPickup.RespawnTime;
    NewPickup.PickupMessage = OldPickup.PickupMessage;
    NewPickup.PickupSound = OldPickup.PickupSound;
    NewPickup.PickupForce = OldPickup.PickupForce;
    NewPickup.MaxDesireability = OldPickup.MaxDesireability;
    NewPickup.Event = OldPickup.Event;
    NewPickup.Tag = OldPickup.Tag;
    NewPickup.SetDrawScale(OldPickup.DrawScale);
    if (XelusSuperShieldBoxPickup(NewPickup) != None)
        NewPickup.SetDrawScale(0.800000);
    NewPickup.SetDrawScale3D(OldPickup.DrawScale3D);
    NewPickup.PrePivot = OldPickup.PrePivot;
    NewPickup.SetCollisionSize(OldPickup.CollisionRadius, OldPickup.CollisionHeight);
    NewPickup.PickUpBase = OldPickup.PickUpBase;
    if (NewPickup.PickUpBase != None)
        NewPickup.PickUpBase.MyPickup = NewPickup;
    ApplyPickupAmbientGlowSetting(NewPickup);
    CopyPickupState(OldPickup, NewPickup);
    GroundBoxPickup(NewPickup);

    if (OldPickup.MyMarker != None)
    {
        NewPickup.MyMarker = OldPickup.MyMarker;
        NewPickup.MyMarker.MarkedItem = NewPickup;
        NewPickup.SetLocation(NewPickup.Location
            + (NewPickup.CollisionHeight - OldPickup.CollisionHeight) * vect(0,0,1));
        OldPickup.MyMarker = None;
    }

    OldPickup.Destroy();
    return true;
}

function bool ReplaceHealthPickup(HealthPack OldPickup)
{
    local class<HealthPack> ReplacementClass;
    local HealthPack NewPickup;

    if (XelusHealthStyle == 1)
        ReplacementClass = class'XelusHealthPackPickup';
    else if (XelusHealthStyle == 2)
        ReplacementClass = class'XelusClassicHealthPackPickup';
    else if (XelusHealthStyle == 3)
        ReplacementClass = class'XelusHealthMedBoxPickup';
    else
        return false;

    NewPickup = Spawn(ReplacementClass, OldPickup.Owner, ,
        OldPickup.Location, OldPickup.Rotation);
    if (NewPickup == None)
        return false;

    NewPickup.HealingAmount = OldPickup.HealingAmount;
    NewPickup.bSuperHeal = OldPickup.bSuperHeal;
    NewPickup.bInstantRespawn = OldPickup.bInstantRespawn;
    NewPickup.bPredictRespawns = OldPickup.bPredictRespawns;
    NewPickup.RespawnTime = OldPickup.RespawnTime;
    NewPickup.PickupMessage = OldPickup.PickupMessage;
    NewPickup.PickupSound = OldPickup.PickupSound;
    NewPickup.PickupForce = OldPickup.PickupForce;
    NewPickup.MaxDesireability = OldPickup.MaxDesireability;
    NewPickup.Event = OldPickup.Event;
    NewPickup.Tag = OldPickup.Tag;
    NewPickup.SetDrawScale(OldPickup.DrawScale);
    if (XelusHealthMedBoxPickup(NewPickup) != None)
        NewPickup.SetDrawScale(OldPickup.DrawScale * 2.0);
    NewPickup.SetDrawScale3D(OldPickup.DrawScale3D);
    NewPickup.PrePivot = OldPickup.PrePivot;
    NewPickup.SetCollisionSize(OldPickup.CollisionRadius, OldPickup.CollisionHeight);
    NewPickup.SetCollision(OldPickup.bCollideActors, OldPickup.bBlockActors,
        OldPickup.bBlockPlayers);
    NewPickup.PickUpBase = OldPickup.PickUpBase;
    if (NewPickup.PickUpBase != None)
        NewPickup.PickUpBase.MyPickup = NewPickup;
    ApplyPickupAmbientGlowSetting(NewPickup);
    GroundBoxPickup(NewPickup);

    if (OldPickup.MyMarker != None)
    {
        NewPickup.MyMarker = OldPickup.MyMarker;
        NewPickup.MyMarker.MarkedItem = NewPickup;
        NewPickup.SetLocation(NewPickup.Location
            + (NewPickup.CollisionHeight - OldPickup.CollisionHeight) * vect(0,0,1));
        OldPickup.MyMarker = None;
    }

    OldPickup.Destroy();
    return true;
}

function bool ReplaceMegaHealthPickup(SuperHealthPack OldPickup)
{
    local class<SuperHealthPack> ReplacementClass;
    local SuperHealthPack NewPickup;

    if (XelusMegaHealthStyle == 1)
        ReplacementClass = class'XelusSuperHealthPickup';
    else if (XelusMegaHealthStyle == 2)
        ReplacementClass = class'XelusU1SuperHealthPickup';
    else
        return false;

    NewPickup = Spawn(ReplacementClass, OldPickup.Owner, ,
        OldPickup.Location, OldPickup.Rotation);
    if (NewPickup == None)
        return false;

    NewPickup.HealingAmount = OldPickup.HealingAmount;
    NewPickup.bSuperHeal = OldPickup.bSuperHeal;
    NewPickup.bInstantRespawn = OldPickup.bInstantRespawn;
    NewPickup.bPredictRespawns = OldPickup.bPredictRespawns;
    NewPickup.RespawnTime = OldPickup.RespawnTime;
    NewPickup.PickupMessage = OldPickup.PickupMessage;
    NewPickup.PickupSound = OldPickup.PickupSound;
    NewPickup.PickupForce = OldPickup.PickupForce;
    NewPickup.MaxDesireability = OldPickup.MaxDesireability;
    NewPickup.Event = OldPickup.Event;
    NewPickup.Tag = OldPickup.Tag;
    NewPickup.SetDrawScale(OldPickup.DrawScale);
    if (XelusU1SuperHealthPickup(NewPickup) != None)
        NewPickup.SetDrawScale(OldPickup.DrawScale * 2.0);
    NewPickup.SetDrawScale3D(OldPickup.DrawScale3D);
    NewPickup.PrePivot = OldPickup.PrePivot;
    NewPickup.SetCollisionSize(OldPickup.CollisionRadius, OldPickup.CollisionHeight);
    NewPickup.SetCollision(OldPickup.bCollideActors, OldPickup.bBlockActors,
        OldPickup.bBlockPlayers);
    NewPickup.PickUpBase = OldPickup.PickUpBase;
    if (NewPickup.PickUpBase != None)
        NewPickup.PickUpBase.MyPickup = NewPickup;
    ApplyPickupAmbientGlowSetting(NewPickup);
    CopyPickupState(OldPickup, NewPickup);
    GroundBoxPickup(NewPickup);

    if (OldPickup.MyMarker != None)
    {
        NewPickup.MyMarker = OldPickup.MyMarker;
        NewPickup.MyMarker.MarkedItem = NewPickup;
        NewPickup.SetLocation(NewPickup.Location
            + (NewPickup.CollisionHeight - OldPickup.CollisionHeight) * vect(0,0,1));
        OldPickup.MyMarker = None;
    }

    OldPickup.Destroy();
    return true;
}

function bool ReplaceHealthVialPickup(MiniHealthPack OldPickup)
{
    local XelusHealthVialPickup NewPickup;

    NewPickup = Spawn(class'XelusHealthVialPickup', OldPickup.Owner,
        OldPickup.Tag, OldPickup.Location, OldPickup.Rotation);
    if (NewPickup == None)
        return false;

    NewPickup.HealingAmount = OldPickup.HealingAmount;
    NewPickup.bSuperHeal = OldPickup.bSuperHeal;
    NewPickup.RespawnTime = OldPickup.RespawnTime;
    NewPickup.Event = OldPickup.Event;
    NewPickup.Tag = OldPickup.Tag;
    NewPickup.SetDrawScale(OldPickup.DrawScale);
    NewPickup.SetDrawScale3D(OldPickup.DrawScale3D);
    NewPickup.PrePivot = OldPickup.PrePivot;
    NewPickup.PickUpBase = OldPickup.PickUpBase;
    if (NewPickup.PickUpBase != None)
        NewPickup.PickUpBase.MyPickup = NewPickup;
    ApplyPickupAmbientGlowSetting(NewPickup);

    if (OldPickup.MyMarker != None)
    {
        NewPickup.MyMarker = OldPickup.MyMarker;
        NewPickup.MyMarker.MarkedItem = NewPickup;
        NewPickup.SetLocation(NewPickup.Location
            + (NewPickup.CollisionHeight - OldPickup.CollisionHeight) * vect(0,0,1));
        OldPickup.MyMarker = None;
    }

    OldPickup.Destroy();
    return true;
}

function ApplyHQPickupTexture(Actor Other)
{
    if (Other.IsA('AdrenalinePickup'))
        ApplyAdrenalineTexture(AdrenalinePickup(Other));
    else if (Other.IsA('MiniHealthPack'))
    {
        Other.RepSkin = LoadReplacementTexture("XELUS_VanillaHQ_TEX.Health.Health_01_Small");
        Other.Skins[0] = Other.RepSkin;
    }
    else if (Other.IsA('HealthCharger'))
    {
        Other.RepSkin = LoadReplacementTexture("XELUS_VanillaHQ_TEX.Chargers.Charger_Health_01");
        Other.Skins[0] = Other.RepSkin;
    }
    else if (Other.IsA('ShieldCharger')
        || Other.IsA('SuperShieldCharger')
        || Other.IsA('UDamageCharger'))
    {
        Other.RepSkin = LoadReplacementTexture("XELUS_VanillaHQ_TEX.Chargers.Charger_Shield_01");
        Other.Skins[0] = Other.RepSkin;
    }
    else if (Other.IsA('xWeaponBase'))
    {
        Other.RepSkin = LoadReplacementTexture("XELUS_VanillaHQ_TEX.Chargers.Charger_Weapon_01");
        Other.Skins[0] = Other.RepSkin;
    }
}

function bool ReplaceWeaponPickup(Actor Other)
{
    local WeaponPickup OldPickup;
    local WeaponPickup NewPickup;

    OldPickup = WeaponPickup(Other);
    NewPickup = Spawn(class'XelusLightningRiflePickup', Other.Owner, , Other.Location, Other.Rotation);
    if (NewPickup == None)
        return false;

    NewPickup.InventoryType = OldPickup.InventoryType;
    NewPickup.RespawnTime = OldPickup.RespawnTime;
    NewPickup.bInstantRespawn = OldPickup.bInstantRespawn;
    NewPickup.bWeaponStay = OldPickup.bWeaponStay;
    NewPickup.bThrown = OldPickup.bThrown;
    NewPickup.bDropped = OldPickup.bDropped;
    NewPickup.AmmoAmount[0] = OldPickup.AmmoAmount[0];
    NewPickup.AmmoAmount[1] = OldPickup.AmmoAmount[1];
    NewPickup.Event = OldPickup.Event;
    NewPickup.Tag = OldPickup.Tag;
    NewPickup.PickUpBase = OldPickup.PickUpBase;
    if (NewPickup.PickUpBase != None)
        NewPickup.PickUpBase.MyPickup = NewPickup;
    if (XelusWeaponCharger(OldPickup.PickUpBase) != None)
        NewPickup.GotoState('Pickup');
    else if (OldPickup.IsInState('WaitingForMatch'))
    {
        NewPickup.bHidden = true;
        NewPickup.GotoState('WaitingForMatch');
    }
    else if (OldPickup.IsInState('Sleeping'))
    {
        NewPickup.bHidden = true;
        NewPickup.GotoState('Sleeping');
    }
    else if (OldPickup.IsInState('Disabled'))
    {
        NewPickup.bHidden = true;
        NewPickup.GotoState('Disabled');
    }
    ApplyPickupAmbientGlowSetting(NewPickup);

    if (OldPickup.MyMarker != None)
    {
        NewPickup.MyMarker = OldPickup.MyMarker;
        NewPickup.MyMarker.MarkedItem = NewPickup;
        NewPickup.SetLocation(NewPickup.Location
            + (NewPickup.CollisionHeight - OldPickup.CollisionHeight) * vect(0,0,1));
        OldPickup.MyMarker = None;
    }

    OldPickup.Destroy();
    return true;
}

function bool ReplaceWeaponChargerWithPickup(xWeaponBase OldCharger)
{
    local class<Pickup> ReplacementClass;
    local class<Weapon> OriginalWeaponType;
    local Pickup ExistingPickup;
    local Pickup SpawnedPickup;
    local WeaponPickup NewPickup;
    local InventorySpot Marker;
    local XelusWeaponChargerVisual Visual;
    local vector SpawnLocation;
    local float SpawnHeight;
    local bool bDelayedSpawn;

    if (OldCharger == None || OldCharger.WeaponType == None)
        return false;

    OriginalWeaponType = OldCharger.WeaponType;
    ReplacementClass = OriginalWeaponType.default.PickupClass;
    if (ReplacementClass == None)
        return false;

    if (bEnableFixedXWeapons && OriginalWeaponType == class'SniperRifle')
        ReplacementClass = class'XelusLightningRiflePickup';
    else if (OriginalWeaponType.default.InventoryGroup == 0)
    {
        if (ReplacementClass == class'RedeemerPickup')
            ReplacementClass = class'XelusRedeemerPickup';
        else if (ReplacementClass == class'PainterPickup')
            ReplacementClass = class'XelusPainterPickup';
    }

    ExistingPickup = OldCharger.MyPickup;
    Marker = OldCharger.MyMarker;
    if (Marker == None && ExistingPickup != None)
        Marker = ExistingPickup.MyMarker;

    bDelayedSpawn = OldCharger.bDelayedSpawn
        || OriginalWeaponType.default.InventoryGroup == 0;
    SpawnHeight = OldCharger.SpawnHeight;

    if (ExistingPickup != None)
        NewPickup = WeaponPickup(ExistingPickup);
    else
    {
        SpawnLocation = OldCharger.Location
            + SpawnHeight * vect(0,0,1);
        SpawnedPickup = Spawn(ReplacementClass, OldCharger.Owner, ,
            SpawnLocation, rot(0,0,0));
        NewPickup = WeaponPickup(SpawnedPickup);
        if (NewPickup == None)
        {
            if (SpawnedPickup != None)
                SpawnedPickup.Destroy();
            return false;
        }
    }

    if (NewPickup == None)
        return false;

    NewPickup.InventoryType = OriginalWeaponType;
    NewPickup.Event = OldCharger.Event;
    NewPickup.Tag = OldCharger.Tag;
    NewPickup.PickUpBase = None;
    NewPickup.bShouldBaseAtStartup = false;
    if (ExistingPickup == None)
        NewPickup.SetWeaponStay();

    if (ExistingPickup != None)
    {
        CopyPickupState(ExistingPickup, NewPickup);
        if (bDelayedSpawn && NewPickup.IsInState('Pickup'))
            NewPickup.GotoState('WaitingForMatch');
    }
    else if (bDelayedSpawn)
        NewPickup.GotoState('WaitingForMatch');
    else
        NewPickup.GotoState('Pickup');

    if (Marker != None)
    {
        NewPickup.MyMarker = Marker;
        Marker.myPickupBase = None;
        Marker.markedItem = NewPickup;
        Marker.ExtraCost = OldCharger.ExtraPathCost;
        Marker.bSuperPickup = bDelayedSpawn;
        OldCharger.MyMarker = None;
    }

    ApplyPickupAmbientGlowSetting(NewPickup);

    SpawnWeaponChargerVisual(OldCharger);

    foreach AllActors(class'XelusWeaponChargerVisual', Visual)
        if (Visual.Base == OldCharger)
            Visual.Destroy();
    if (OldCharger.MyEmitter != None)
        OldCharger.MyEmitter.Destroy();

    OldCharger.PowerUp = None;
    OldCharger.WeaponType = None;
    OldCharger.MyPickup = None;
    OldCharger.bHidden = true;
    OldCharger.SetDrawType(DT_None);
    OldCharger.SetCollision(false, false, false);
    OldCharger.bCollideWorld = false;
    PrepareChargerForRemoval(OldCharger);
    OldCharger.Destroy();
    return true;
}

function bool IsXelusAmmoPickup(Actor Other)
{
    return Other.IsA('XelusAssaultAmmoPickup')
        || Other.IsA('XelusBioAmmoPickup')
        || Other.IsA('XelusClassicSniperAmmoPickup')
        || Other.IsA('XelusFlakAmmoPickup')
        || Other.IsA('XelusLinkAmmoPickup')
        || Other.IsA('XelusMinigunAmmoPickup')
        || Other.IsA('XelusRocketAmmoPickup')
        || Other.IsA('XelusShockAmmoPickup')
        || Other.IsA('XelusSniperAmmoPickup');
}

function bool GroundPickup(Pickup PickupActor, float GroundOffset,
    optional bool bMoveThroughCollision)
{
    local Actor HitActor;
    local vector HitLocation;
    local vector HitNormal;
    local vector TraceStart;
    local vector TraceEnd;
    local vector GroundLocation;
    local float TraceDistance;
    local bool bOldCollideActors;
    local bool bOldBlockActors;
    local bool bOldBlockPlayers;
    local bool bOldCollideWorld;
    local bool bMoved;

    if (PickupActor == None || PickupActor.bDropped)
        return false;

    if (PickupActor.Base != None)
    {
        if (!bMoveThroughCollision)
            return false;
        PickupActor.SetBase(None);
    }

    TraceDistance = 256.0;
    TraceStart = PickupActor.Location + vect(0,0,16);
    TraceEnd = PickupActor.Location - TraceDistance * vect(0,0,1);
    HitActor = PickupActor.Trace(HitLocation, HitNormal, TraceEnd, TraceStart, false);
    if (HitActor == None || HitNormal.Z < 0.5)
        return false;

    GroundLocation = PickupActor.Location;
    GroundLocation.Z = HitLocation.Z + GroundOffset;
    if (Abs(GroundLocation.Z - PickupActor.Location.Z) < 1.0)
        return false;

    if (bMoveThroughCollision)
    {
        bOldCollideActors = PickupActor.bCollideActors;
        bOldBlockActors = PickupActor.bBlockActors;
        bOldBlockPlayers = PickupActor.bBlockPlayers;
        bOldCollideWorld = PickupActor.bCollideWorld;
        PickupActor.SetCollision(false, false, false);
        PickupActor.bCollideWorld = false;
    }

    bMoved = PickupActor.SetLocation(GroundLocation);

    if (bMoveThroughCollision)
    {
        PickupActor.bCollideWorld = bOldCollideWorld;
        PickupActor.SetCollision(bOldCollideActors, bOldBlockActors,
            bOldBlockPlayers);
    }

    return bMoved;
}

function bool GroundAmmoPickup(UTAmmoPickup Pickup)
{
    local float GroundOffset;

    if (Pickup == None)
        return false;

    GroundOffset = Pickup.CollisionHeight;
    if (bEnableExperimentalAmmoGrounding && Pickup.IsA('FlakAmmoPickup'))
        GroundOffset += 4.0;

    return GroundPickup(Pickup, GroundOffset);
}

function bool GroundBoxPickup(Pickup PickupActor)
{
    if (!IsXelusBoxPickup(PickupActor))
        return false;

    PickupActor.bShouldBaseAtStartup = false;
    if (PickupActor.PickUpBase != None)
    {
        if (PickupActor.PickUpBase.MyPickup == PickupActor)
            PickupActor.PickUpBase.MyPickup = None;
        PickupActor.PickUpBase = None;
    }
    PickupActor.PrePivot = vect(0,0,0);

    return GroundPickup(PickupActor, 0.0, true);
}

function bool ReplaceChargerWithBoxPickup(Actor Other,
    class<Pickup> ReplacementClass)
{
    local xPickupBase OldCharger;
    local Pickup ExistingPickup;
    local Pickup NewPickup;
    local InventorySpot Marker;
    local vector SpawnLocation;
    local float SpawnHeight;
    local bool bDelayedSpawn;
    local bool bIronDeityShield;

    OldCharger = xPickupBase(Other);
    if (OldCharger == None || ReplacementClass == None)
        return false;

    ExistingPickup = OldCharger.MyPickup;
    Marker = OldCharger.MyMarker;
    if (Marker == None && ExistingPickup != None)
        Marker = ExistingPickup.MyMarker;

    SpawnHeight = OldCharger.SpawnHeight;
    bDelayedSpawn = OldCharger.bDelayedSpawn;
    bIronDeityShield = ShieldCharger(OldCharger) != None
        && (Level.Title ~= "IronDeity")
        && (OldCharger.Name == 'ShieldCharger0');
    if (bIronDeityShield)
        SpawnHeight = 130.0;

    SpawnLocation = OldCharger.Location
        + SpawnHeight * vect(0,0,1);
    NewPickup = Spawn(ReplacementClass, OldCharger.Owner, ,
        SpawnLocation, rot(0,0,0));
    if (NewPickup == None)
        return false;

    NewPickup.Event = OldCharger.Event;
    NewPickup.Tag = OldCharger.Tag;
    NewPickup.PickUpBase = None;
    NewPickup.bShouldBaseAtStartup = false;
    NewPickup.PrePivot = vect(0,0,0);

    if (ExistingPickup != None)
    {
        NewPickup.InventoryType = ExistingPickup.InventoryType;
        NewPickup.bInstantRespawn = ExistingPickup.bInstantRespawn;
        NewPickup.bPredictRespawns = ExistingPickup.bPredictRespawns;
        NewPickup.RespawnTime = ExistingPickup.RespawnTime;
        NewPickup.PickupMessage = ExistingPickup.PickupMessage;
        NewPickup.PickupSound = ExistingPickup.PickupSound;
        NewPickup.PickupForce = ExistingPickup.PickupForce;
        NewPickup.MaxDesireability = ExistingPickup.MaxDesireability;
        if (TournamentHealth(ExistingPickup) != None
            && TournamentHealth(NewPickup) != None)
        {
            TournamentHealth(NewPickup).HealingAmount =
                TournamentHealth(ExistingPickup).HealingAmount;
            TournamentHealth(NewPickup).bSuperHeal =
                TournamentHealth(ExistingPickup).bSuperHeal;
        }
        if (ShieldPickup(ExistingPickup) != None
            && ShieldPickup(NewPickup) != None)
        {
            ShieldPickup(NewPickup).ShieldAmount =
                ShieldPickup(ExistingPickup).ShieldAmount;
        }
        CopyPickupState(ExistingPickup, NewPickup);
        ExistingPickup.PickUpBase = None;
        ExistingPickup.MyMarker = None;
    }
    else if (bDelayedSpawn)
        NewPickup.GotoState('WaitingForMatch');
    else
        NewPickup.GotoState('Pickup');

    if (Marker != None)
    {
        NewPickup.MyMarker = Marker;
        Marker.myPickupBase = None;
        Marker.markedItem = NewPickup;
        Marker.ExtraCost = OldCharger.ExtraPathCost;
        Marker.bSuperPickup = bDelayedSpawn;
        OldCharger.MyMarker = None;
    }

    if (bIronDeityShield)
        NewPickup.PrePivot.Z = 85.0;
    else
        GroundBoxPickup(NewPickup);

    ApplyPickupAmbientGlowSetting(NewPickup);

    OldCharger.PowerUp = None;
    OldCharger.bHidden = true;
    OldCharger.SetDrawType(DT_None);
    OldCharger.SetCollision(false, false, false);
    OldCharger.bCollideWorld = false;
    PrepareChargerForRemoval(OldCharger);
    OldCharger.MyPickup = None;
    if (ExistingPickup != None)
        ExistingPickup.Destroy();
    OldCharger.Destroy();
    return true;
}

function bool ReplaceAmmoPickup(Actor Other, class<UTAmmoPickup> ReplacementClass)
{
    local UTAmmoPickup OldPickup;
    local UTAmmoPickup NewPickup;

    OldPickup = UTAmmoPickup(Other);
    NewPickup = Spawn(ReplacementClass, Other.Owner, , Other.Location, Other.Rotation);
    if (NewPickup == None)
        return false;

    NewPickup.InventoryType = OldPickup.InventoryType;
    NewPickup.AmmoAmount = OldPickup.AmmoAmount;
    NewPickup.RespawnTime = OldPickup.RespawnTime;
    NewPickup.bInstantRespawn = OldPickup.bInstantRespawn;
    NewPickup.Event = OldPickup.Event;
    NewPickup.Tag = OldPickup.Tag;
    NewPickup.PickUpBase = OldPickup.PickUpBase;
    if (NewPickup.PickUpBase != None)
        NewPickup.PickUpBase.MyPickup = NewPickup;
    ApplyPickupAmbientGlowSetting(NewPickup);

    if (OldPickup.MyMarker != None)
    {
        NewPickup.MyMarker = OldPickup.MyMarker;
        NewPickup.MyMarker.MarkedItem = NewPickup;
        NewPickup.SetLocation(NewPickup.Location
            + (NewPickup.CollisionHeight - OldPickup.CollisionHeight) * vect(0,0,1));
        OldPickup.MyMarker = None;
    }

    if (bEnableExperimentalAmmoGrounding)
        GroundAmmoPickup(NewPickup);

    OldPickup.Destroy();
    return true;
}

function bool ReplaceCharger(Actor Other, class<xPickupBase> ReplacementClass)
{
    local xPickupBase OldCharger;
    local xPickupBase NewCharger;
    local Pickup ExistingPickup;
    local class<Pickup> OriginalPowerUp;
    local class<Weapon> OriginalWeaponType;
    local bool OriginalHidden;
    local bool OriginalCollideActors;
    local bool OriginalBlockActors;
    local bool OriginalBlockPlayers;
    local bool OriginalCollideWorld;

    OldCharger = xPickupBase(Other);
    ExistingPickup = OldCharger.MyPickup;
    OriginalPowerUp = OldCharger.PowerUp;
    OriginalHidden = OldCharger.bHidden;
    OriginalCollideActors = OldCharger.bCollideActors;
    OriginalBlockActors = OldCharger.bBlockActors;
    OriginalBlockPlayers = OldCharger.bBlockPlayers;
    OriginalCollideWorld = OldCharger.bCollideWorld;
    if (xWeaponBase(OldCharger) != None)
        OriginalWeaponType = xWeaponBase(OldCharger).WeaponType;

    if (ExistingPickup != None)
        ExistingPickup.PickUpBase = None;
    OldCharger.PowerUp = None;
    if (xWeaponBase(OldCharger) != None)
        xWeaponBase(OldCharger).WeaponType = None;

    if (HealthCharger(OldCharger) != None
        || ShieldCharger(OldCharger) != None
        || SuperShieldCharger(OldCharger) != None
        || SuperHealthCharger(OldCharger) != None
        || UDamageCharger(OldCharger) != None)
    {
        OldCharger.RemoteRole = ROLE_SimulatedProxy;
        OldCharger.bAlwaysRelevant = true;
        OldCharger.NetUpdateFrequency = 0.100000;
        OldCharger.NetPriority = 1.400000;
    }
    OldCharger.bHidden = true;

    NewCharger = Spawn(ReplacementClass, Other.Owner, , Other.Location, Other.Rotation);
    if (NewCharger == None)
    {
        OldCharger.PowerUp = OriginalPowerUp;
        if (xWeaponBase(OldCharger) != None)
            xWeaponBase(OldCharger).WeaponType = OriginalWeaponType;
        OldCharger.bHidden = false;
        return false;
    }

    OldCharger.SetDrawType(DT_None);
    OldCharger.SetCollision(false, false, false);
    PrepareChargerForRemoval(OldCharger);

    NewCharger.Event = OldCharger.Event;
    NewCharger.Tag = OldCharger.Tag;
    if (OldCharger.Base != None)
        NewCharger.SetBase(OldCharger.Base);
    NewCharger.SetDrawScale(OldCharger.DrawScale);
    XelusReplicatedPickupBase(NewCharger).SetReplicatedTransform(
        OldCharger.DrawScale3D, OldCharger.PrePivot);
    NewCharger.SetCollisionSize(OldCharger.CollisionRadius, OldCharger.CollisionHeight);
    NewCharger.SetCollision(OriginalCollideActors, OriginalBlockActors,
        OriginalBlockPlayers);
    NewCharger.bCollideWorld = OriginalCollideWorld;
    NewCharger.bHidden = OriginalHidden;
    NewCharger.ExtraPathCost = OldCharger.ExtraPathCost;
    NewCharger.SpawnHeight = OldCharger.SpawnHeight;
    NewCharger.bDelayedSpawn = OldCharger.bDelayedSpawn;
    NewCharger.PowerUp = OriginalPowerUp;
    ApplyPickupAmbientGlowSetting(NewCharger);

    if (OldCharger.MyMarker != None)
    {
        NewCharger.MyMarker = OldCharger.MyMarker;
        OldCharger.MyMarker = None;
    }

    if (ShieldCharger(OldCharger) != None
        && (Level.Title ~= "IronDeity") && (OldCharger.Name == 'ShieldCharger0'))
    {
        NewCharger.SpawnHeight = 130.0;
    }

    if (XelusHealthCharger(NewCharger) != None)
    {
        if (ExistingPickup != None)
            ExistingPickup.Destroy();
        ExistingPickup = None;
    }

    if (xWeaponBase(OldCharger) != None)
    {
        if (ExistingPickup != None)
        {
            ExistingPickup.Destroy();
            ExistingPickup = None;
        }
        xWeaponBase(NewCharger).WeaponType = OriginalWeaponType;
        if (xWeaponBase(NewCharger).WeaponType != None)
        {
            NewCharger.PowerUp = xWeaponBase(NewCharger).WeaponType.default.PickupClass;
        }
    }

    if ((NewCharger.MyPickup == None) && (NewCharger.PowerUp != None))
        NewCharger.SpawnPickup();
    else if (ExistingPickup != None)
    {
        NewCharger.MyPickup = ExistingPickup;
        ExistingPickup.PickUpBase = NewCharger;
    }

    ApplyPickupAmbientGlowSetting(NewCharger);

    if (XelusHealthCharger(NewCharger) != None && NewCharger.MyPickup != None)
    {
        NewCharger.MyPickup.bOnlyReplicateHidden = false;
        NewCharger.MyPickup.bAlwaysRelevant = true;
        NewCharger.MyPickup.NetUpdateFrequency = 0.100000;
        NewCharger.MyPickup.NetPriority = 1.400000;
    }

    if (NewCharger.bDelayedSpawn && (NewCharger.MyPickup != None))
    {
        if (NewCharger.MyPickup.IsInState('Pickup'))
            NewCharger.MyPickup.GotoState('WaitingForMatch');
        if (NewCharger.MyPickup.MyMarker != None)
            NewCharger.MyPickup.MyMarker.bSuperPickup = true;
    }
    else if (XelusWeaponCharger(NewCharger) != None && (NewCharger.MyPickup != None))
    {
        NewCharger.MyPickup.bHidden = false;
        NewCharger.MyPickup.GotoState('Pickup');
    }

    if (ShieldCharger(OldCharger) != None
        && (Level.Title ~= "IronDeity") && (OldCharger.Name == 'ShieldCharger0')
        && (NewCharger.MyPickup != None))
    {
        NewCharger.MyPickup.PrePivot.Z = 85.0;
    }

    if (NewCharger.MyMarker != None)
    {
        NewCharger.MyMarker.MarkedItem = NewCharger.MyPickup;
        NewCharger.MyMarker.ExtraCost = NewCharger.ExtraPathCost;
        if (NewCharger.MyPickup != None)
            NewCharger.MyPickup.MyMarker = NewCharger.MyMarker;
    }

    OldCharger.Destroy();
    return true;
}

function bool ReplaceWildcardCharger(WildcardBase OldCharger)
{
    local XelusWildcardCharger NewCharger;
    local Pickup ExistingPickup;
    local Pickup CandidatePickup;
    local InventorySpot Marker;
    local class<Pickup> OriginalPowerUp;
    local bool OriginalHidden;
    local bool OriginalCollideActors;
    local bool OriginalBlockActors;
    local bool OriginalBlockPlayers;
    local bool OriginalCollideWorld;
    local int i;

    if (OldCharger == None)
        return false;

    ExistingPickup = OldCharger.MyPickup;
    if (ExistingPickup != None
        && ExistingPickup.PickUpBase != OldCharger)
        ExistingPickup = None;
    foreach AllActors(class'Pickup', CandidatePickup)
    {
        if (CandidatePickup.PickUpBase == OldCharger)
        {
            if (ExistingPickup == None)
                ExistingPickup = CandidatePickup;
            else if (CandidatePickup != ExistingPickup)
                CandidatePickup.Destroy();
        }
    }
    Marker = OldCharger.MyMarker;
    if (Marker == None && ExistingPickup != None)
        Marker = ExistingPickup.MyMarker;
    OriginalPowerUp = OldCharger.PowerUp;
    OriginalHidden = OldCharger.bHidden;
    OriginalCollideActors = OldCharger.bCollideActors;
    OriginalBlockActors = OldCharger.bBlockActors;
    OriginalBlockPlayers = OldCharger.bBlockPlayers;
    OriginalCollideWorld = OldCharger.bCollideWorld;

    if (ExistingPickup != None)
        ExistingPickup.PickUpBase = None;
    OldCharger.PowerUp = None;
    OldCharger.bHidden = true;
    OldCharger.SetDrawType(DT_None);
    OldCharger.SetCollision(false, false, false);
    OldCharger.bCollideWorld = false;
    PrepareChargerForRemoval(OldCharger);

    NewCharger = Spawn(class'XelusWildcardCharger', OldCharger.Owner, ,
        OldCharger.Location, OldCharger.Rotation);
    if (NewCharger == None)
    {
        OldCharger.PowerUp = OriginalPowerUp;
        OldCharger.bHidden = OriginalHidden;
        OldCharger.SetDrawType(DT_StaticMesh);
        OldCharger.SetCollision(OriginalCollideActors, OriginalBlockActors,
            OriginalBlockPlayers);
        OldCharger.bCollideWorld = OriginalCollideWorld;
        if (ExistingPickup != None)
            ExistingPickup.PickUpBase = OldCharger;
        return false;
    }

    if (Marker != None)
    {
        NewCharger.MyMarker = Marker;
        OldCharger.MyMarker = None;
    }

    if (OldCharger.Base != None)
        NewCharger.SetBase(OldCharger.Base);
    NewCharger.SetDrawScale(OldCharger.DrawScale);
    NewCharger.SetReplicatedTransform(
        OldCharger.DrawScale3D, OldCharger.PrePivot);
    NewCharger.Event = OldCharger.Event;
    NewCharger.Tag = OldCharger.Tag;
    NewCharger.SetCollisionSize(OldCharger.CollisionRadius,
        OldCharger.CollisionHeight);
    NewCharger.SetCollision(OriginalCollideActors, OriginalBlockActors,
        OriginalBlockPlayers);
    NewCharger.bCollideWorld = OriginalCollideWorld;
    NewCharger.SpawnHeight = OldCharger.SpawnHeight;
    NewCharger.ExtraPathCost = OldCharger.ExtraPathCost;
    NewCharger.bDelayedSpawn = OldCharger.bDelayedSpawn;
    NewCharger.bSequential = OldCharger.bSequential;
    for (i = 0; i < ArrayCount(NewCharger.PickupClasses); i++)
        NewCharger.PickupClasses[i] = OldCharger.PickupClasses[i];
    if (OldCharger.NumClasses > 0)
    {
        NewCharger.NumClasses = OldCharger.NumClasses;
        NewCharger.CurrentClass = OldCharger.CurrentClass;
        NewCharger.PowerUp = OriginalPowerUp;
    }
    else
    {
        NewCharger.NumClasses = 0;
        while (NewCharger.NumClasses < ArrayCount(NewCharger.PickupClasses)
            && NewCharger.PickupClasses[NewCharger.NumClasses] != None)
            NewCharger.NumClasses++;

        if (NewCharger.NumClasses > 0)
        {
            if (NewCharger.bSequential)
                NewCharger.CurrentClass = 0;
            else
                NewCharger.CurrentClass = Rand(NewCharger.NumClasses);
            NewCharger.PowerUp =
                NewCharger.PickupClasses[NewCharger.CurrentClass];
        }
        else
        {
            NewCharger.CurrentClass = 0;
            NewCharger.PowerUp = OriginalPowerUp;
        }
    }
    NewCharger.bHidden = OriginalHidden;

    if (ExistingPickup != None)
    {
        if (NewCharger.MyPickup != None
            && NewCharger.MyPickup != ExistingPickup)
            NewCharger.MyPickup.Destroy();
        NewCharger.MyPickup = ExistingPickup;
        ExistingPickup.PickUpBase = NewCharger;
    }
    else if (NewCharger.MyPickup == None && NewCharger.PowerUp != None)
        NewCharger.SpawnPickup();

    ApplyPickupAmbientGlowSetting(NewCharger);

    if (NewCharger.bDelayedSpawn && (NewCharger.MyPickup != None))
    {
        if (NewCharger.MyPickup.IsInState('Pickup'))
            NewCharger.MyPickup.GotoState('WaitingForMatch');
        if (NewCharger.MyPickup.MyMarker != None)
            NewCharger.MyPickup.MyMarker.bSuperPickup = true;
    }

    if (NewCharger.MyMarker != None)
    {
        NewCharger.MyMarker.MarkedItem = NewCharger.MyPickup;
        NewCharger.MyMarker.ExtraCost = NewCharger.ExtraPathCost;
        if (NewCharger.MyPickup != None)
            NewCharger.MyPickup.MyMarker = NewCharger.MyMarker;
    }

    OldCharger.MyPickup = None;
    if (OldCharger.MyEmitter != None)
        OldCharger.MyEmitter.Destroy();
    OldCharger.Destroy();
    return true;
}

function bool ReplaceJumpPad(Actor Other)
{
    local JumpPad OldJumpPad;
    local JumpPad NewJumpPad;
    local int i;

    OldJumpPad = JumpPad(Other);

    OldJumpPad.RemoteRole = ROLE_SimulatedProxy;
    OldJumpPad.bAlwaysRelevant = true;
    OldJumpPad.NetUpdateFrequency = 0.100000;
    OldJumpPad.NetPriority = 1.400000;
    OldJumpPad.bHidden = true;
    OldJumpPad.SetCollision(false, false, false);
    OldJumpPad.SetDrawType(DT_None);

    NewJumpPad = Spawn(class'XelusJumpPad', Other.Owner, , Other.Location, Other.Rotation);
    if (NewJumpPad == None)
    {
        OldJumpPad.bHidden = false;
        OldJumpPad.SetDrawType(DT_StaticMesh);
        return false;
    }

    if (OldJumpPad.Base != None)
        NewJumpPad.SetBase(OldJumpPad.Base);

    NewJumpPad.JumpVelocity = OldJumpPad.JumpVelocity;
    NewJumpPad.BACKUP_JumpVelocity = OldJumpPad.BACKUP_JumpVelocity;
    NewJumpPad.JumpTarget = OldJumpPad.JumpTarget;
    NewJumpPad.JumpZModifier = OldJumpPad.JumpZModifier;
    NewJumpPad.JumpSound = OldJumpPad.JumpSound;
    NewJumpPad.Event = OldJumpPad.Event;
    NewJumpPad.Tag = OldJumpPad.Tag;
    NewJumpPad.SetCollisionSize(OldJumpPad.CollisionRadius, OldJumpPad.CollisionHeight);

    if ((Level.Game != None) && Level.Game.IsA('ONSOnslaughtGame'))
    {
        for (i = 0; i < NewJumpPad.PathList.Length; i++)
            if (NewJumpPad.PathList[i].End == NewJumpPad.JumpTarget)
            {
                NewJumpPad.PathList[i].Distance *= 0.5;
                break;
            }
    }

    return true;
}

function bool IsExperimentalLiftpad(Actor Other)
{
    local JumpPad Pad;
    local StaticMeshActor Visual;

    Pad = JumpPad(Other);
    if (Pad == None)
        return false;

    foreach AllActors(class'StaticMeshActor', Visual)
        if (VSize(Visual.Location - Pad.Location) < 128.0
            && Visual.Location.Z < Pad.Location.Z)
            break;

    if (Visual == None || Pad.Base != Visual || Visual.StaticMesh == None)
        return false;

    return Visual.StaticMesh.Name == 'pipeouterrim02AL';
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
    local UTAmmoPickup AmmoPickupActor;

    bSuperRelevant = 0;

    if (!bEnableFixedXWeapons
        && !bEnableXelusAmmoPickups && !bEnableXelusChargers
        && !bEnableExperimentalXelusWildcardChargers
        && !bEnableXelusJumpPads && !bEnableHQTextures
        && !bDisablePickupAmbientGlow
        && !bEnableExperimentalLiftpadReplacement
        && !bEnableExperimentalAmmoGrounding
        && XelusUDamageStyle == 0
        && XelusShieldStyle == 0
        && XelusSuperShieldStyle == 0
        && XelusHealthStyle == 0
        && XelusMegaHealthStyle == 0)
        return true;

    ApplyPickupAmbientGlowSetting(Other);

    if (bEnableExperimentalAmmoGrounding && IsXelusAmmoPickup(Other))
        GroundAmmoPickup(UTAmmoPickup(Other));

    if ((Other.IsA('UDamagePack')
        || Other.IsA('ShieldPack')
        || Other.IsA('SuperShieldPack')
        || Other.IsA('HealthPack')
        || Other.IsA('SuperHealthPack'))
        && IsWildcardPickup(Pickup(Other)))
        return true;

    if (Other.IsA('XelusLightningRiflePickup')
        || Other.IsA('XelusRedeemerPickup')
        || Other.IsA('XelusPainterPickup')
        || Other.IsA('XelusAdrenalinePickup')
        || Other.IsA('XelusHealthVialPickup')
        || Other.IsA('XelusHealthPackPickup')
        || Other.IsA('XelusClassicHealthPackPickup')
        || Other.IsA('XelusHealthMedBoxPickup')
        || Other.IsA('XelusSuperHealthPickup')
        || Other.IsA('XelusU1SuperHealthPickup')
        || Other.IsA('XelusAssaultAmmoPickup')
        || Other.IsA('XelusBioAmmoPickup')
        || Other.IsA('XelusClassicSniperAmmoPickup')
        || Other.IsA('XelusFlakAmmoPickup')
        || Other.IsA('XelusLinkAmmoPickup')
        || Other.IsA('XelusMinigunAmmoPickup')
        || Other.IsA('XelusRocketAmmoPickup')
        || Other.IsA('XelusShockAmmoPickup')
        || Other.IsA('XelusSniperAmmoPickup')
        || Other.IsA('XelusHealthCharger')
        || Other.IsA('XelusShieldCharger')
        || Other.IsA('XelusSuperShieldCharger')
        || Other.IsA('XelusSuperHealthCharger')
        || Other.IsA('XelusUDamageCharger')
        || Other.IsA('XelusUDamagePickup')
        || Other.IsA('XelusClassicUDamagePickup')
        || Other.IsA('XelusShieldPickup')
        || Other.IsA('XelusClassicShieldPickup')
        || Other.IsA('XelusShieldBoxPickup')
        || Other.IsA('XelusSuperShieldPickup')
        || Other.IsA('XelusClassicSuperShieldPickup')
        || Other.IsA('XelusSuperShieldBoxPickup')
        || Other.IsA('XelusJumpPad')
        || Other.IsA('XelusWildcardCharger')
        || Other.IsA('XelusWeaponCharger'))
        return true;

    if (bEnableHQTextures)
    {
        if (Other.IsA('AdrenalinePickup'))
        {
            if (XelusAdrenalineColor != 3)
            {
                if (ReplaceAdrenalinePickup(AdrenalinePickup(Other)))
                    return false;
            }
            return true;
        }

        if (Other.IsA('MiniHealthPack'))
        {
            if (ReplaceHealthVialPickup(MiniHealthPack(Other)))
                return false;
        }

        ApplyHQPickupTexture(Other);
    }

    if (XelusUDamageStyle != 0 && Other.IsA('UDamagePack'))
    {
        if (ReplaceUDamagePickup(UDamagePack(Other)))
            return false;
    }

    if (XelusShieldStyle != 0 && Other.IsA('ShieldPack'))
    {
        if (ReplaceShieldPickup(ShieldPickup(Other)))
            return false;
    }

    if (XelusSuperShieldStyle != 0 && Other.IsA('SuperShieldPack'))
    {
        if (ReplaceSuperShieldPickup(SuperShieldPack(Other)))
            return false;
    }

    if (XelusHealthStyle != 0 && Other.IsA('HealthPack'))
    {
        if (ReplaceHealthPickup(HealthPack(Other)))
            return false;
    }

    if (XelusMegaHealthStyle != 0 && Other.IsA('SuperHealthPack'))
    {
        if (ReplaceMegaHealthPickup(SuperHealthPack(Other)))
            return false;
    }

    if (bEnableFixedXWeapons && Other.Class == class'SniperRiflePickup')
    {
        if (!ReplaceWeaponPickup(Other))
            return true;
        return false;
    }

    if (bEnableExperimentalXelusWildcardChargers
        && Other.IsA('WildcardBase'))
    {
        if (ReplaceWildcardCharger(WildcardBase(Other)))
            return false;
    }

    if (xPickupBase(Other) != None)
        ApplySelectedChargerPowerUp(xPickupBase(Other));

    if (Other.IsA('HealthCharger') && XelusHealthStyle == 3)
    {
        if (ReplaceChargerWithBoxPickup(Other,
            class'XelusHealthMedBoxPickup'))
            return false;
    }
    else if (bEnableXelusChargers && Other.IsA('HealthCharger'))
    {
        if (ReplaceCharger(Other, class'XelusHealthCharger'))
            return false;
    }
    else if (Other.IsA('ShieldCharger') && XelusShieldStyle == 3)
    {
        if (ReplaceChargerWithBoxPickup(Other,
            class'XelusShieldBoxPickup'))
            return false;
    }
    else if (bEnableXelusChargers && Other.IsA('ShieldCharger'))
    {
        if (ReplaceCharger(Other, class'XelusShieldCharger'))
            return false;
    }
    else if (Other.IsA('SuperShieldCharger') && XelusSuperShieldStyle == 3)
    {
        if (ReplaceChargerWithBoxPickup(Other,
            class'XelusSuperShieldBoxPickup'))
            return false;
    }
    else if (bEnableXelusChargers && Other.IsA('SuperShieldCharger'))
    {
        if (ReplaceCharger(Other, class'XelusSuperShieldCharger'))
            return false;
    }
    else if (Other.IsA('SuperHealthCharger') && XelusMegaHealthStyle == 2)
    {
        if (ReplaceChargerWithBoxPickup(Other,
            class'XelusU1SuperHealthPickup'))
            return false;
    }
    else if (bEnableXelusChargers && Other.IsA('SuperHealthCharger'))
    {
        if (ReplaceCharger(Other, class'XelusSuperHealthCharger'))
            return false;
    }
    else if (bEnableXelusChargers && Other.IsA('UDamageCharger'))
    {
        if (ReplaceCharger(Other, class'XelusUDamageCharger'))
            return false;
    }
    else if (bEnableXelusChargers && xWeaponBase(Other) != None)
    {
        if (ReplaceWeaponChargerWithPickup(xWeaponBase(Other)))
            return false;
        ApplyWeaponChargerMesh(xWeaponBase(Other));
    }

    if (Other.IsA('UTJumpPad')
        && (bEnableXelusJumpPads
            || (bEnableExperimentalLiftpadReplacement
                && IsExperimentalLiftpad(Other))))
    {
        if (ReplaceJumpPad(Other))
            return false;
    }

    AmmoPickupActor = UTAmmoPickup(Other);
    if (bEnableXelusAmmoPickups && AmmoPickupActor != None)
    {
        if (Other.IsA('AssaultAmmoPickup'))
        {
            if (ReplaceAmmoPickup(Other, class'XelusAssaultAmmoPickup'))
                return false;
        }
        else if (Other.IsA('BioAmmoPickup'))
        {
            if (ReplaceAmmoPickup(Other, class'XelusBioAmmoPickup'))
                return false;
        }
        else if (Other.IsA('FlakAmmoPickup'))
        {
            if (ReplaceAmmoPickup(Other, class'XelusFlakAmmoPickup'))
                return false;
        }
        else if (Other.IsA('LinkAmmoPickup'))
        {
            if (ReplaceAmmoPickup(Other, class'XelusLinkAmmoPickup'))
                return false;
        }
        else if (Other.IsA('MinigunAmmoPickup'))
        {
            if (ReplaceAmmoPickup(Other, class'XelusMinigunAmmoPickup'))
                return false;
        }
        else if (Other.IsA('RocketAmmoPickup'))
        {
            if (ReplaceAmmoPickup(Other, class'XelusRocketAmmoPickup'))
                return false;
        }
        else if (Other.IsA('ShockAmmoPickup'))
        {
            if (ReplaceAmmoPickup(Other, class'XelusShockAmmoPickup'))
                return false;
        }
        else if (Other.IsA('SniperAmmoPickup'))
        {
            if (ReplaceAmmoPickup(Other, class'XelusSniperAmmoPickup'))
                return false;
        }
        else if (Other.IsA('ClassicSniperAmmoPickup'))
        {
            if (ReplaceAmmoPickup(Other, class'XelusClassicSniperAmmoPickup'))
                return false;
        }
    }

    AmmoPickupActor = UTAmmoPickup(Other);
    if (bEnableExperimentalAmmoGrounding && AmmoPickupActor != None)
        GroundAmmoPickup(AmmoPickupActor);

    if (bEnableFixedXWeapons && AmmoPickupActor != None)
    {
        ApplyAmmoPickupMesh(AmmoPickupActor);
        return true;
    }

    return true;
}

function ApplyAmmoPickupMesh(UTAmmoPickup Pickup)
{
    if (Pickup.IsA('AssaultAmmoPickup'))
    {
        Pickup.RepSkin = LoadReplacementTexture("FixedXWeapons_TEX.AmmoPickups.AssaultAmmoTex");
    }
    else if (Pickup.IsA('BioAmmoPickup'))
    {
        Pickup.RepSkin = LoadReplacementTexture("FixedXWeapons_TEX.AmmoPickups.BioRiflePickup");
    }
    else if (Pickup.IsA('FlakAmmoPickup'))
    {
        Pickup.RepSkin = LoadReplacementTexture("FixedXWeapons_TEX.AmmoPickups.FlakAmmoTex");
    }
    else if (Pickup.IsA('LinkAmmoPickup'))
    {
        Pickup.RepSkin = LoadReplacementTexture("FixedXWeapons_TEX.AmmoPickups.LinkAmmoTex");
    }
    else if (Pickup.IsA('MinigunAmmoPickup'))
    {
        Pickup.RepSkin = LoadReplacementTexture("FixedXWeapons_TEX.AmmoPickups.MinigunAmmoTex");
    }
    else if (Pickup.IsA('RocketAmmoPickup'))
    {
        Pickup.RepSkin = LoadReplacementTexture("FixedXWeapons_TEX.AmmoPickups.RocketAmmoTex");
    }
    else if (Pickup.IsA('ShockAmmoPickup'))
    {
        Pickup.RepSkin = LoadReplacementTexture("FixedXWeapons_TEX.AmmoPickups.ShockAmmoTex");
    }
    else if (Pickup.IsA('SniperAmmoPickup')
        || Pickup.IsA('ClassicSniperAmmoPickup'))
    {
        Pickup.RepSkin = LoadReplacementTexture("FixedXWeapons_TEX.AmmoPickups.SniperAmmoTex");
    }
}

defaultproperties
{
    bEnableFixedXWeapons=True
    bEnableXelusAmmoPickups=True
    bEnableXelusChargers=True
    bEnableExperimentalXelusWildcardChargers=False
    bEnableXelusJumpPads=True
    bEnableExperimentalLiftpadReplacement=False
    bEnableExperimentalAmmoGrounding=False
    bEnableHQTextures=True
    bDisablePickupAmbientGlow=False
    XelusAdrenalineColor=1
    XelusUDamageStyle=1
    XelusShieldStyle=1
    XelusSuperShieldStyle=1
    XelusHealthStyle=1
    XelusMegaHealthStyle=1
    FriendlyName="Xelus327 Mesh Replacement V1_1"
    Description="Replaces selected weapon, ammo, charger, jump pad, adrenaline, health, Big Keg O' Health, UDamage, Shield, and Super Shield visuals without changing gameplay properties."
    FixedXWeaponsText="Weapon Pickup Models and Ammo Textures"
    FixedXWeaponsDesc="Enable or disable the FixedXWeapons weapon pickup model and matching ammo textures."
    XelusAmmoPickupsText="Xelus Ammo Pickup Models"
    XelusAmmoPickupsDesc="Enable or disable the Xelus replacement ammo pickup models."
    XelusChargersText="Xelus Pickup Chargers"
    XelusChargersDesc="Enable or disable the Xelus replacement health and shield charger models and standalone weapon pickups."
    ExperimentalXelusWildcardChargersText="Experimental Xelus Wildcard Chargers"
    ExperimentalXelusWildcardChargersDesc="Enable the experimental Xelus replacement for wildcard charger bases."
    XelusJumpPadsText="Xelus Jump Pad Models"
    XelusJumpPadsDesc="Enable or disable the Xelus replacement jump pad model."
    ExperimentalLiftpadReplacementText="Experimental Liftpad Replacement"
    ExperimentalLiftpadReplacementDesc="Enable the experimental replacement for Deck17-style liftpads."
    ExperimentalAmmoGroundingText="Experimental Ammo Grounding"
    ExperimentalAmmoGroundingDesc="Try to place map ammo on the nearest walkable surface below it."
    HQTexturesText="Xelus HQ Pickup Textures"
    HQTexturesDesc="Enable or disable Xelus high-quality textures on supported health, adrenaline, and charger pickups."
    DisablePickupAmbientGlowText="Disable Pickup Ambient Glow"
    DisablePickupAmbientGlowDesc="Disable ambient glow on pickups and pickup bases, including Xelus health-keg glow maps."
    XelusAdrenalineDesc="Choose the stock adrenaline pickup texture or a Xelus color variant."
    XelusUDamageDesc="Choose the stock, Xelus, or Xelus Classic UDamage pickup visual."
    XelusShieldDesc="Choose the stock, Xelus, Xelus Classic, or Shield Box pickup visual."
    XelusSuperShieldDesc="Choose the stock, Xelus, Xelus Classic, or Super Shield Box pickup visual."
    XelusHealthDesc="Choose the stock, Xelus, Xelus Classic, or Med Box health pickup visual."
    XelusMegaHealthDesc="Choose the stock, Xelus Big Keg O' Health, or U1 Style pickup visual."
    GroupName="Xelus327"
    bAlwaysRelevant=True
    bNetNotify=True
    RemoteRole=ROLE_SimulatedProxy
    bAddToServerPackages=True
    IconMaterialName="MutatorArt.nosym"
}
