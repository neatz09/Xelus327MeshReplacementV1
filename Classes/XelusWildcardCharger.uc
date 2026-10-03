class XelusWildcardCharger extends XelusReplicatedPickupBase;

#exec OBJ LOAD FILE=..\StaticMeshes\XELUS_VanillaHQ.usx
#exec OBJ LOAD FILE=..\Textures\XELUS_VanillaHQ_TEX.utx

var() class<TournamentPickup> PickupClasses[8];
var() bool bSequential;
var int NumClasses;
var int CurrentClass;

simulated function PostBeginPlay()
{
    if (Role == ROLE_Authority)
    {
        NumClasses = 0;
        CurrentClass = 0;
        PowerUp = None;
    }

    Super.PostBeginPlay();
}

function SpawnPickup()
{
    if (MyPickup != None || PowerUp == None)
        return;

    MyPickup = Spawn(PowerUp, self, , Location + SpawnHeight * vect(0,0,1));
    if (MyPickup == None)
    {
        Log("Xelus327: Unable to spawn wildcard pickup "$PowerUp$" for "$self);
        return;
    }
    MyPickup.PickUpBase = self;
    MyPickup.Event = Event;
    if (MyMarker != None)
    {
        MyMarker.MarkedItem = MyPickup;
        MyMarker.ExtraCost = ExtraPathCost;
        MyPickup.MyMarker = MyMarker;
    }
}

function bool UpdatePickup(bool bPreserveState)
{
    local Pickup OldPickup;
    local Pickup NewPickup;

    if (PowerUp == None)
        return false;
    if (MyPickup == None)
    {
        SpawnPickup();
        return MyPickup != None;
    }
    if (MyPickup.Class == PowerUp)
        return true;

    OldPickup = MyPickup;
    NewPickup = Spawn(PowerUp, self, OldPickup.Tag,
        OldPickup.Location, OldPickup.Rotation);
    if (NewPickup == None)
    {
        Log("Xelus327: Unable to change wildcard pickup to "$PowerUp$" for "$self);
        return false;
    }
    NewPickup.PickUpBase = self;
    NewPickup.bInstantRespawn = OldPickup.bInstantRespawn;
    NewPickup.bPredictRespawns = OldPickup.bPredictRespawns;
    NewPickup.RespawnTime = OldPickup.RespawnTime;
    NewPickup.Event = OldPickup.Event;
    if (bPreserveState)
    {
        NewPickup.PickupMessage = OldPickup.PickupMessage;
        NewPickup.PickupSound = OldPickup.PickupSound;
        NewPickup.PickupForce = OldPickup.PickupForce;
        NewPickup.MaxDesireability = OldPickup.MaxDesireability;
        NewPickup.SetCollisionSize(OldPickup.CollisionRadius, OldPickup.CollisionHeight);
        if (TournamentHealth(OldPickup) != None
            && TournamentHealth(NewPickup) != None)
        {
            TournamentHealth(NewPickup).HealingAmount = TournamentHealth(OldPickup).HealingAmount;
            TournamentHealth(NewPickup).bSuperHeal = TournamentHealth(OldPickup).bSuperHeal;
        }
        if (ShieldPickup(OldPickup) != None && ShieldPickup(NewPickup) != None)
            ShieldPickup(NewPickup).ShieldAmount = ShieldPickup(OldPickup).ShieldAmount;
    }
    NewPickup.MyMarker = OldPickup.MyMarker;
    if (NewPickup.MyMarker != None)
    {
        NewPickup.MyMarker.MarkedItem = NewPickup;
        OldPickup.MyMarker = None;
    }
    if (bPreserveState)
    {
        if (OldPickup.IsInState('WaitingForMatch'))
            NewPickup.GotoState('WaitingForMatch');
        else if (OldPickup.IsInState('Sleeping'))
            NewPickup.GotoState('Sleeping');
        else if (OldPickup.IsInState('Disabled'))
            NewPickup.GotoState('Disabled');
    }
    MyPickup = NewPickup;
    OldPickup.Destroy();
    return true;
}

function TurnOn()
{
    local int OldClass;
    local class<Pickup> OldPowerUp;

    if (NumClasses <= 0)
        return;

    OldClass = CurrentClass;
    OldPowerUp = PowerUp;
    if (bSequential)
        CurrentClass = (CurrentClass + 1) % NumClasses;
    else
        CurrentClass = Rand(NumClasses);
    PowerUp = PickupClasses[CurrentClass];
    if (!UpdatePickup(false))
    {
        CurrentClass = OldClass;
        PowerUp = OldPowerUp;
    }
}

defaultproperties
{
    PowerUp=None
    PickupClasses(0)=class'XPickups.HealthPack'
    PickupClasses(1)=class'XPickups.SuperShieldPack'
    PickupClasses(2)=class'XPickups.SuperHealthPack'
    PickupClasses(3)=class'XPickups.UDamagePack'
    bDelayedSpawn=True
    bSequential=False
    SpiralEmitter=class'XEffects.Spiral'
    DrawType=DT_StaticMesh
    StaticMesh=StaticMesh'XELUS_VanillaHQ.Misc.JumpPad'
    DrawScale=0.800000
    Texture=None
    CollisionRadius=60.000000
    CollisionHeight=6.000000
    RemoteRole=ROLE_SimulatedProxy
    bAlwaysRelevant=True
    bStatic=False
    bNoDelete=False
    NetUpdateFrequency=0.100000
    NetPriority=1.400000
}