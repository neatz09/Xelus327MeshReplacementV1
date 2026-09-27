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

function TurnOn()
{
    if (NumClasses <= 0)
        return;

    if (bSequential)
        CurrentClass = (CurrentClass + 1) % NumClasses;
    else
        CurrentClass = Rand(NumClasses);

    PowerUp = PickupClasses[CurrentClass];

    if (MyPickup != None)
        MyPickup = MyPickup.Transmogrify(PowerUp);
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