package Event.Module;
import Common.IScriptEventHandler;
import GameSystems.*;
import org.nwnx.nwnx2.jvm.*;
import org.nwnx.nwnx2.jvm.constants.InventorySlot;

import java.util.Objects;

@SuppressWarnings("unused")
public class OnPlayerEquipItem implements IScriptEventHandler {
	@Override
	public void runScript(final NWObject objSelf) {

		// Bioware Default
		NWScript.executeScript("x2_mod_def_equ", objSelf);

        DurabilitySystem.OnModuleEquip();
		SkillSystem.OnModuleItemEquipped();
		PerkSystem.OnModuleItemEquipped();
		ItemSystem.OnModuleEquipItem();
		HandleEquipmentSwappingDelay();
	}

	// Players abuse a bug in NWN which allows them to gain an extra attack.
    // To work around this I force them to clear all actions. There is a short delay to
    // account for weapons like guns which auto-equip ammo.
	private void HandleEquipmentSwappingDelay()
	{
		NWObject oPC = NWScript.getPCItemLastEquippedBy();
		final NWObject oItem = NWScript.getPCItemLastEquipped();
		NWObject rightHand = NWScript.getItemInSlot(InventorySlot.RIGHTHAND, oPC);
		NWObject leftHand = NWScript.getItemInSlot(InventorySlot.LEFTHAND, oPC);

		if(!NWScript.getIsInCombat(oPC)) return;
		if(Objects.equals(oItem, rightHand) && Objects.equals(oItem, leftHand)) return;
		if(!Objects.equals(oItem, leftHand)) return;

		Scheduler.assign(oPC, () -> NWScript.clearAllActions(false));
	}

}
