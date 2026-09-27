class XelusReplicatedPickupBase extends xPickupBase;

var vector ReplicatedDrawScale3D;
var vector ReplicatedPrePivot;

replication
{
    reliable if (Role == ROLE_Authority)
        ReplicatedDrawScale3D, ReplicatedPrePivot;
}

simulated event PostNetReceive()
{
    Super.PostNetReceive();
    SetDrawScale3D(ReplicatedDrawScale3D);
    PrePivot = ReplicatedPrePivot;
}

function SetReplicatedTransform(vector NewDrawScale3D, vector NewPrePivot)
{
    ReplicatedDrawScale3D = NewDrawScale3D;
    ReplicatedPrePivot = NewPrePivot;
    SetDrawScale3D(NewDrawScale3D);
    PrePivot = NewPrePivot;
}

defaultproperties
{
    ReplicatedDrawScale3D=(X=1.000000,Y=1.000000,Z=1.000000)
    ReplicatedPrePivot=(X=0.000000,Y=0.000000,Z=0.000000)
    bNetNotify=True
}