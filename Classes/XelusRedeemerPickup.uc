class XelusRedeemerPickup extends RedeemerPickup;

function bool IsSuperItem()
{
    return Super.IsSuperItem()
        || (MyMarker != None && MyMarker.bSuperPickup);
}