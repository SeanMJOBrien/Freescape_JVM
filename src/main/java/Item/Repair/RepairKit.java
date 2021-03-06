package Item.Repair;

import Common.IScriptEventHandler;
import Enumerations.SkillID;
import GameSystems.DurabilitySystem;
import GameSystems.SkillSystem;
import org.nwnx.nwnx2.jvm.NWObject;
import org.nwnx.nwnx2.jvm.NWScript;
import org.nwnx.nwnx2.jvm.constants.BaseItem;

import java.util.ArrayList;
import java.util.Collections;

@SuppressWarnings("unused")
public class RepairKit implements IScriptEventHandler {
    @Override
    public void runScript(NWObject oPC) {

        // TODO: Genericize and set up for custom weapon types.
        NWObject target = NWScript.getItemActivatedTarget();
        NWObject item = NWScript.getItemActivated();
        int targetType = NWScript.getBaseItemType(target);

        ArrayList<Integer> allowedTypes = new ArrayList<>();
        Collections.addAll(allowedTypes, BaseItem.BELT, BaseItem.ARMOR, BaseItem.GLOVES, BaseItem.BRACER, BaseItem.HELMET);

        if(!allowedTypes.contains(targetType))
        {
            NWScript.sendMessageToPC(oPC, "You cannot repair that item with this kit.");
            return;
        }

        int skill = SkillSystem.GetPCSkill(oPC, SkillID.ItemRepair).getRank();
        float repairAmount = 10.0f + skill * 0.2f;

        DurabilitySystem.RunItemRepair(oPC, item, repairAmount);

        NWScript.destroyObject(item, 0.0f);
    }
}
