class MutXelus327MeshReplacementV1_1 extends Mutator
    config (Xelus327MeshReplacement);

#exec OBJ LOAD FILE=..\Textures\XELUS_VanillaHQ_TEX.utx
#exec OBJ LOAD FILE=..\StaticMeshes\FixedXweapons_SM.usx
#exec OBJ LOAD FILE=..\Textures\FixedXWeapons_TEX.utx
#exec OBJ LOAD FILE=..\StaticMeshes\XELUS_VanillaHQ.usx

var() config bool bEnableFixedXWeapons;
var() config bool bEnableXelusPickups;
var() config bool bEnableXelusAmmoPickups;
var() config bool bEnableXelusChargers;
var() config bool bEnableXelusJumpPads;
var() config bool bEnableHQTextures;
var() config bool bDisablePickupAmbientGlow;
var() config int XelusAdrenalineColor;
var localized string FixedXWeaponsText;
var localized string FixedXWeaponsDesc;
var localized string XelusPickupsText;
var localized string XelusPickupsDesc;
var localized string XelusAmmoPickupsText;
var localized string XelusAmmoPickupsDesc;
var localized string XelusChargersText;
var localized string XelusChargersDesc;
var localized string XelusJumpPadsText;
var localized string XelusJumpPadsDesc;
var localized string HQTexturesText;
var localized string HQTexturesDesc;
var localized string DisablePickupAmbientGlowText;
var localized string DisablePickupAmbientGlowDesc;
var localized string XelusAdrenalineDesc;

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
    PlayInfo.AddSetting(default.RulesGroup, "bEnableXelusPickups", default.XelusPickupsText, 0, 1, "Check");
    PlayInfo.AddSetting(default.RulesGroup, "bEnableXelusAmmoPickups", default.XelusAmmoPickupsText, 0, 1, "Check");
    PlayInfo.AddSetting(default.RulesGroup, "bEnableXelusChargers", default.XelusChargersText, 0, 1, "Check");
    PlayInfo.AddSetting(default.RulesGroup, "bEnableXelusJumpPads", default.XelusJumpPadsText, 0, 1, "Check");
    PlayInfo.AddSetting(default.RulesGroup, "bEnableHQTextures", default.HQTexturesText, 0, 1, "Check");
    PlayInfo.AddSetting(default.RulesGroup, "bDisablePickupAmbientGlow", default.DisablePickupAmbientGlowText, 0, 1, "Check");
    PlayInfo.AddSetting(default.RulesGroup, "XelusAdrenalineColor", "Adrenaline Color", 0, 1, "Select", "0;Green;1;Red;2;Blue;3;Stock");
}

static event string GetDescriptionText(string PropName)
{
    if (PropName == "bEnableFixedXWeapons")
        return default.FixedXWeaponsDesc;

    if (PropName == "bEnableXelusPickups")
        return default.XelusPickupsDesc;

    if (PropName == "bEnableXelusAmmoPickups")
        return default.XelusAmmoPickupsDesc;

    if (PropName == "bEnableXelusChargers")
        return default.XelusChargersDesc;

    if (PropName == "bEnableXelusJumpPads")
        return default.XelusJumpPadsDesc;

    if (PropName == "bEnableHQTextures")
        return default.HQTexturesDesc;

    if (PropName == "bDisablePickupAmbientGlow")
        return default.DisablePickupAmbientGlowDesc;

    if (PropName == "XelusAdrenalineColor")
        return default.XelusAdrenalineDesc;

    return Super.GetDescriptionText(PropName);
}

function Texture LoadReplacementTexture(string TextureName)
{
    return Texture(DynamicLoadObject(TextureName, class'Texture'));
}

function ApplyPickupAmbientGlowSetting(Actor Other)
{
    local Pickup PickupActor;
    local xPickupBase PickupBase;

    if (!bDisablePickupAmbientGlow)
        return;

    PickupActor = Pickup(Other);
    if (PickupActor != None)
    {
        PickupActor.bAmbientGlow = false;
        PickupActor.AmbientGlow = 0;
    }

    PickupBase = xPickupBase(Other);
    if (PickupBase != None)
    {
        PickupBase.AmbientGlow = 0;
        if (PickupBase.MyPickup != None)
        {
            PickupBase.MyPickup.bAmbientGlow = false;
            PickupBase.MyPickup.AmbientGlow = 0;
        }
    }
}

function ApplyWeaponChargerMesh(xWeaponBase Charger)
{
    local XelusWeaponChargerVisual Visual;

    Charger.SetDrawType(DT_None);

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

    OldCharger = xPickupBase(Other);
    ExistingPickup = OldCharger.MyPickup;
    OriginalPowerUp = OldCharger.PowerUp;
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

    NewCharger.Event = OldCharger.Event;
    NewCharger.Tag = OldCharger.Tag;
    NewCharger.SetCollisionSize(OldCharger.CollisionRadius, OldCharger.CollisionHeight);
    NewCharger.SetCollision(OldCharger.bCollideActors, OldCharger.bBlockActors, OldCharger.bBlockPlayers);
    NewCharger.ExtraPathCost = OldCharger.ExtraPathCost;
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
        if (NewCharger.MyPickup != None)
            NewCharger.MyPickup.MyMarker = NewCharger.MyMarker;
    }

    OldCharger.Destroy();
    return true;
}

function bool ReplaceJumpPad(Actor Other)
{
    local JumpPad OldJumpPad;
    local JumpPad NewJumpPad;
    local StaticMeshActor OldVisual;
    local XelusJumpPadVisual NewVisual;
    local int i;

    OldJumpPad = JumpPad(Other);

    OldJumpPad.RemoteRole = ROLE_SimulatedProxy;
    OldJumpPad.bAlwaysRelevant = true;
    OldJumpPad.NetUpdateFrequency = 0.100000;
    OldJumpPad.NetPriority = 1.400000;
    OldJumpPad.bHidden = true;
    OldJumpPad.SetCollision(false, false, false);
    OldJumpPad.SetDrawType(DT_None);

    foreach AllActors(class'StaticMeshActor', OldVisual)
        if (VSize(OldVisual.Location - OldJumpPad.Location) < 128.0
            && OldVisual.Location.Z < OldJumpPad.Location.Z)
            break;

    if (OldVisual != None)
    {
        OldVisual.RemoteRole = ROLE_SimulatedProxy;
        OldVisual.bAlwaysRelevant = true;
        OldVisual.NetUpdateFrequency = 0.100000;
        OldVisual.NetPriority = 1.400000;
        OldVisual.bHidden = true;
        OldVisual.SetCollision(false, false, false);
        OldVisual.SetDrawType(DT_None);
    }

    NewJumpPad = Spawn(class'XelusJumpPad', Other.Owner, , Other.Location, Other.Rotation);
    if (NewJumpPad == None)
    {
        OldJumpPad.bHidden = false;
        OldJumpPad.SetDrawType(DT_StaticMesh);
        if (OldVisual != None)
        {
            OldVisual.bHidden = false;
            OldVisual.SetDrawType(DT_StaticMesh);
        }
        return false;
    }

    if (OldVisual != None)
    {
        NewVisual = Spawn(class'XelusJumpPadVisual', OldVisual.Owner, ,
            OldVisual.Location, OldVisual.Rotation);
        if (NewVisual != None)
        {
            NewVisual.SetDrawScale(OldVisual.DrawScale);
            NewVisual.SetDrawScale3D(OldVisual.DrawScale3D);
            NewVisual.PrePivot = OldVisual.PrePivot;
            NewVisual.bHidden = false;
        }
    }

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

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
    local UTAmmoPickup AmmoPickupActor;

    bSuperRelevant = 0;

    if (!bEnableFixedXWeapons && !bEnableXelusPickups
        && !bEnableXelusAmmoPickups && !bEnableXelusChargers
        && !bEnableXelusJumpPads && !bEnableHQTextures
        && !bDisablePickupAmbientGlow)
        return true;

    ApplyPickupAmbientGlowSetting(Other);

    if (Other.IsA('XelusLightningRiflePickup')
        || Other.IsA('XelusAdrenalinePickup')
        || Other.IsA('XelusHealthVialPickup')
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
        || Other.IsA('XelusUDamageCharger')
        || Other.IsA('XelusJumpPad')
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

    if (bEnableXelusPickups && Other.Class == class'SniperRiflePickup')
    {
        if (!ReplaceWeaponPickup(Other))
            return true;
        return false;
    }

    if (bEnableXelusChargers && Other.IsA('HealthCharger'))
    {
        if (ReplaceCharger(Other, class'XelusHealthCharger'))
            return false;
    }
    else if (bEnableXelusChargers && Other.IsA('ShieldCharger'))
    {
        if (ReplaceCharger(Other, class'XelusShieldCharger'))
            return false;
    }
    else if (bEnableXelusChargers && Other.IsA('SuperShieldCharger'))
    {
        if (ReplaceCharger(Other, class'XelusSuperShieldCharger'))
            return false;
    }
    else if (bEnableXelusChargers && Other.IsA('UDamageCharger'))
    {
        if (ReplaceCharger(Other, class'XelusUDamageCharger'))
            return false;
    }
    else if (bEnableXelusChargers && xWeaponBase(Other) != None)
    {
        ApplyWeaponChargerMesh(xWeaponBase(Other));
    }

    if (bEnableXelusJumpPads && Other.IsA('UTJumpPad'))
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
    bEnableXelusPickups=True
    bEnableXelusAmmoPickups=True
    bEnableXelusChargers=True
    bEnableXelusJumpPads=True
    bEnableHQTextures=True
    bDisablePickupAmbientGlow=True
    XelusAdrenalineColor=1
    FriendlyName="Xelus327 Mesh Replacement V1_1"
    Description="Replaces selected weapon, ammo, charger, jump pad, and adrenaline visuals without changing gameplay properties."
    FixedXWeaponsText="FixedXWeapons Weapon Models"
    FixedXWeaponsDesc="Enable or disable the FixedXWeapons weapon pickup models and ammo textures."
    XelusPickupsText="Xelus Weapon Pickup Models"
    XelusPickupsDesc="Enable or disable the Xelus replacement weapon pickup model."
    XelusAmmoPickupsText="Xelus Ammo Pickup Models"
    XelusAmmoPickupsDesc="Enable or disable the Xelus replacement ammo pickup models."
    XelusChargersText="Xelus Pickup Chargers"
    XelusChargersDesc="Enable or disable the Xelus replacement health, shield, and weapon charger models."
    XelusJumpPadsText="Xelus Jump Pad Models"
    XelusJumpPadsDesc="Enable or disable the Xelus replacement jump pad model."
    HQTexturesText="Xelus HQ Pickup Textures"
    HQTexturesDesc="Enable or disable Xelus high-quality textures on supported health, adrenaline, and charger pickups."
    DisablePickupAmbientGlowText="Disable Pickup Ambient Glow"
    DisablePickupAmbientGlowDesc="Disable ambient glow on pickups and pickup bases."
    XelusAdrenalineDesc="Choose the stock adrenaline pickup texture or a Xelus color variant."
    GroupName="Xelus327"
    bAddToServerPackages=True
    IconMaterialName="MutatorArt.nosym"
}
