package Trigger;

import Common.IScriptEventHandler;
import Helper.ColorToken;
import org.nwnx.nwnx2.jvm.NWObject;
import org.nwnx.nwnx2.jvm.Scheduler;

import java.util.UUID;

import static org.nwnx.nwnx2.jvm.NWScript.*;

public class ExplorationTrigger implements IScriptEventHandler {
    @Override
    public void runScript(NWObject objSelf) {
        NWObject oPC = getEnteringObject();
        if(!getIsPC(oPC) || getIsDM(oPC) || getIsDMPossessed(oPC)) return;

        String triggerID = getLocalString(objSelf, "TRIGGER_ID");
        if(triggerID.equals(""))
        {
            triggerID = UUID.randomUUID().toString();
            setLocalString(objSelf, "TRIGGER_ID", triggerID);
        }

        if(getLocalInt(oPC, triggerID) == 1) return;

        String message = getLocalString(objSelf, "DISPLAY_TEXT");
        sendMessageToPC(oPC, ColorToken.Cyan() + message + ColorToken.End());
        setLocalInt(oPC, triggerID, 1);

        Scheduler.assignNow(oPC, () -> playSound("gui_prompt"));
    }
}
