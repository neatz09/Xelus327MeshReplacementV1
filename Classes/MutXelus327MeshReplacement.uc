class MutXelus327MeshReplacement extends Mutator;

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
var localized string XelusAdrenalineDesc;

event PreBeginPlay()
{
    Super.PreBeginPlay();
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
    PlayInfo.AddSetting(default.RulesGroup, "XelusAdrenalineColor", "Adrenaline Color", 0, 1, "Select", "0;Green;1;Purple;2;Blue;3;Stock");
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

    if (PropName == "XelusAdrenalineColor")
        return default.XelusAdrenalineDesc;

    return Super.GetDescriptionText(PropName);
}

function Texture LoadReplacementTexture(string TextureName)
{
    return Texture(DynamicLoadObject(TextureName, class'Texture'));
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

    NewPickup = Spawn(class'XelusAdrenalinePickup', OldPickup.Owner, OldPickup.Tag,
        OldPickup.Location, OldPickup.Rotation);
    if (NewPickup == None)
        return false;

    NewPickup.AdrenalineAmount = OldPickup.AdrenalineAmount;
    NewPickup.RespawnTime = OldPickup.RespawnTime;
    NewPickup.Event = OldPickup.Event;
    NewPickup.Tag = OldPickup.Tag;
    NewPickup.PickUpBase = OldPickup.PickUpBase;
    if (NewPickup.PickUpBase != None)
        NewPickup.PickUpBase.MyPickup = NewPickup;

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
    return true;
}

function ApplyHQPickupTexture(Actor Other)
{
    if (Other.IsA('AdrenalinePickup'))
        ApplyAdrenalineTexture(AdrenalinePickup(Other));
    else if (Other.Class == class'MiniHealthPack')
    {
        Other.RepSkin = LoadReplacementTexture("XELUS_VanillaHQ_TEX.Health.Health_01_Small");
        Other.Skins[0] = Other.RepSkin;
    }
    else if (Other.Class == class'HealthCharger')
    {
        Other.RepSkin = LoadReplacementTexture("XELUS_VanillaHQ_TEX.Chargers.Charger_Health_01");
        Other.Skins[0] = Other.RepSkin;
    }
    else if (Other.Class == class'ShieldCharger')
    {
        Other.RepSkin = LoadReplacementTexture("XELUS_VanillaHQ_TEX.Chargers.Charger_Shield_01");
        Other.Skins[0] = Other.RepSkin;
    }
    else if (Other.Class == class'xWeaponBase')
    {
        Other.RepSkin = LoadReplacementTexture("XELUS_VanillaHQ_TEX.Chargers.Charger_Weapon_01");
        Other.Skins[0] = Other.RepSkin;
    }
}

function bool ReplaceWeaponPickup(Actor Other)
{
    local Pickup OldPickup;
    local Pickup NewPickup;

    OldPickup = Pickup(Other);
    NewPickup = Spawn(class'XelusAmmoPickup', Other.Owner, Other.Tag, Other.Location, Other.Rotation);
    if (NewPickup == None)
        return false;

    NewPickup.RespawnTime = OldPickup.RespawnTime;
    NewPickup.Event = OldPickup.Event;
    NewPickup.Tag = OldPickup.Tag;
    NewPickup.PickUpBase = OldPickup.PickUpBase;
    if (NewPickup.PickUpBase != None)
        NewPickup.PickUpBase.MyPickup = NewPickup;

    if (OldPickup.MyMarker != None)
    {
        NewPickup.MyMarker = OldPickup.MyMarker;
        NewPickup.MyMarker.MarkedItem = NewPickup;
        NewPickup.SetLocation(NewPickup.Location
            + (NewPickup.CollisionHeight - OldPickup.CollisionHeight) * vect(0,0,1));
        OldPickup.MyMarker = None;
    }

    return true;
}

function bool ReplaceAmmoPickup(Actor Other, class<UTAmmoPickup> ReplacementClass)
{
    local Pickup OldPickup;
    local Pickup NewPickup;

    OldPickup = Pickup(Other);
    NewPickup = Spawn(ReplacementClass, Other.Owner, Other.Tag, Other.Location, Other.Rotation);
    if (NewPickup == None)
        return false;

    NewPickup.PrePivot = OldPickup.PrePivot;

    NewPickup.RespawnTime = OldPickup.RespawnTime;
    NewPickup.Event = OldPickup.Event;
    NewPickup.Tag = OldPickup.Tag;
    NewPickup.PickUpBase = OldPickup.PickUpBase;
    if (NewPickup.PickUpBase != None)
        NewPickup.PickUpBase.MyPickup = NewPickup;

    if (OldPickup.MyMarker != None)
    {
        NewPickup.MyMarker = OldPickup.MyMarker;
        NewPickup.MyMarker.MarkedItem = NewPickup;
        NewPickup.SetLocation(NewPickup.Location
            + (NewPickup.CollisionHeight - OldPickup.CollisionHeight) * vect(0,0,1));
        OldPickup.MyMarker = None;
    }

    return true;
}

function bool ReplaceCharger(Actor Other, class<xPickupBase> ReplacementClass)
{
    local xPickupBase OldCharger;
    local xPickupBase NewCharger;

    OldCharger = xPickupBase(Other);
    NewCharger = Spawn(ReplacementClass, Other.Owner, Other.Tag, Other.Location, Other.Rotation);
    if (NewCharger == None)
        return false;

    NewCharger.Event = OldCharger.Event;
    NewCharger.Tag = OldCharger.Tag;
    NewCharger.SetDrawScale(OldCharger.DrawScale);
    NewCharger.SetDrawScale3D(OldCharger.DrawScale3D);
    NewCharger.SpawnHeight = OldCharger.SpawnHeight;
    NewCharger.ExtraPathCost = OldCharger.ExtraPathCost;
    NewCharger.bDelayedSpawn = OldCharger.bDelayedSpawn;
    NewCharger.PowerUp = OldCharger.PowerUp;

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

    if (xWeaponBase(OldCharger) != None)
    {
        xWeaponBase(NewCharger).WeaponType = xWeaponBase(OldCharger).WeaponType;
        if (xWeaponBase(NewCharger).WeaponType != None)
        {
            NewCharger.PowerUp = xWeaponBase(NewCharger).WeaponType.default.PickupClass;
        }
    }

    if (NewCharger.PowerUp != None)
        NewCharger.SpawnPickup();

    if (NewCharger.bDelayedSpawn && (NewCharger.MyPickup != None))
    {
        if (NewCharger.MyPickup.IsInState('Pickup'))
            NewCharger.MyPickup.GotoState('WaitingForMatch');
        if (NewCharger.MyPickup.MyMarker != None)
            NewCharger.MyPickup.MyMarker.bSuperPickup = true;
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

    if (OldCharger.MyPickup != None)
        OldCharger.MyPickup.Destroy();
    return true;
}

function bool ReplaceJumpPad(Actor Other)
{
    local JumpPad OldJumpPad;
    local JumpPad NewJumpPad;
    local int i;

    OldJumpPad = JumpPad(Other);
    NewJumpPad = Spawn(class'XelusJumpPad', Other.Owner, Other.Tag, Other.Location, Other.Rotation);
    if (NewJumpPad == None)
        return false;

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
        && !bEnableXelusJumpPads && !bEnableHQTextures)
        return true;

    if (Other.IsA('XelusAmmoPickup'))
        return true;

    if (Other.IsA('XelusAdrenalinePickup'))
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

        ApplyHQPickupTexture(Other);
    }

    if (bEnableXelusPickups && Other.Class == class'SniperRiflePickup')
    {
        if (!ReplaceWeaponPickup(Other))
            return true;
        return false;
    }

    if (bEnableXelusChargers && Other.Class == class'HealthCharger')
    {
        if (ReplaceCharger(Other, class'XelusHealthCharger'))
            return false;
    }
    else if (bEnableXelusChargers && Other.Class == class'ShieldCharger')
    {
        if (ReplaceCharger(Other, class'XelusShieldCharger'))
            return false;
    }
    else if (bEnableXelusChargers && Other.Class == class'xWeaponBase')
    {
        if (ReplaceCharger(Other, class'XelusWeaponCharger'))
            return false;
    }

    if (bEnableXelusJumpPads && Other.Class == class'UTJumpPad')
    {
        if (ReplaceJumpPad(Other))
            return false;
    }

    AmmoPickupActor = UTAmmoPickup(Other);
    if (bEnableXelusAmmoPickups && AmmoPickupActor != None)
    {
        if (Other.Class == class'AssaultAmmoPickup')
        {
            if (ReplaceAmmoPickup(Other, class'XelusAssaultAmmoPickup'))
                return false;
        }
        else if (Other.Class == class'BioAmmoPickup')
        {
            if (ReplaceAmmoPickup(Other, class'XelusBioAmmoPickup'))
                return false;
        }
        else if (Other.Class == class'FlakAmmoPickup')
        {
            if (ReplaceAmmoPickup(Other, class'XelusFlakAmmoPickup'))
                return false;
        }
        else if (Other.Class == class'LinkAmmoPickup')
        {
            if (ReplaceAmmoPickup(Other, class'XelusLinkAmmoPickup'))
                return false;
        }
        else if (Other.Class == class'MinigunAmmoPickup')
        {
            if (ReplaceAmmoPickup(Other, class'XelusMinigunAmmoPickup'))
                return false;
        }
        else if (Other.Class == class'RocketAmmoPickup')
        {
            if (ReplaceAmmoPickup(Other, class'XelusRocketAmmoPickup'))
                return false;
        }
        else if (Other.Class == class'ShockAmmoPickup')
        {
            if (ReplaceAmmoPickup(Other, class'XelusShockAmmoPickup'))
                return false;
        }
        else if (Other.Class == class'SniperAmmoPickup')
        {
            if (ReplaceAmmoPickup(Other, class'XelusSniperAmmoPickup'))
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
    else if (Pickup.IsA('SniperAmmoPickup'))
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
    XelusAdrenalineColor=0
    FriendlyName="Xelus327 Mesh Replacement"
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
    XelusAdrenalineDesc="Choose the stock adrenaline pickup texture or a Xelus color variant."
    GroupName="Xelus327"
    bAddToServerPackages=True
    IconMaterialName="MutatorArt.nosym"
}
