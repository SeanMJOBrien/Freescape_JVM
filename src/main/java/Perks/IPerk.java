package Perks;

import org.nwnx.nwnx2.jvm.NWObject;

public interface IPerk {
    boolean CanCastSpell(NWObject oPC, NWObject oTarget);
    String CannotCastSpellMessage();
    int ManaCost(NWObject oPC, int baseManaCost);
    float CastingTime(NWObject oPC, float baseCastingTime);
    float CooldownTime(NWObject oPC, float baseCooldownTime);
    void OnImpact(NWObject oPC, NWObject oTarget);
    void OnPurchased(NWObject oPC, int newLevel);
    void OnRemoved(NWObject oPC);
    void OnItemEquipped(NWObject oPC, NWObject oItem);
    void OnItemUnequipped(NWObject oPC, NWObject oItem);
    boolean IsHostile();

}
