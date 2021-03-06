package NWNX;

import org.nwnx.nwnx2.jvm.NWObject;

import static org.nwnx.nwnx2.jvm.NWScript.*;

public class NWNX_Core {
// These following functions should be called by NWNX plugin developers, who should expose
// their own, more friendly headers.
//
// For example, this following function would wrap a call which passes three parameters,
// receives three back, and constructs a vector frm the result.
//
//     vector GetVectorFromCoords(float x, float y, float z)
//     {
//         String pluginName = "NWNX_TestPlugin";
//         String funcName = "GiveMeBackTheSameValues";
//
//         // Note the inverse argument push order.
//         // C++-side, arguments will be consumed from right to left.
//         NWNX_PushArgumentFloat(pluginName, funcName, z);
//         NWNX_PushArgumentFloat(pluginName, funcName, y);
//         NWNX_PushArgumentFloat(pluginName, funcName, x);
//
//         // This calls the function, which will prepare the return values.
//         NWNX_CallFunction(pluginName, funcName);
//
//         // C++-side pushes the return values in reverse order so we can consume them naturally here.
//         float _x = NWNX_GetReturnValueFloat(pluginName, funcName);
//         float _y = NWNX_GetReturnValueFloat(pluginName, funcName);
//         float _z = NWNX_GetReturnValueFloat(pluginName, funcName);
//
//         return vector(_x, _y, _z);
//     }

    public static void NWNX_CallFunction(String pluginName, String functionName)
    {
        NWNX_INTERNAL_CallFunction(pluginName, functionName);
    }

    public static void NWNX_PushArgumentInt(String pluginName, String functionName, int value)
    {
        NWNX_INTERNAL_PushArgument(pluginName, functionName, "0 " + intToString(value));
    }

    public static void NWNX_PushArgumentFloat(String pluginName, String functionName, float value)
    {
        NWNX_INTERNAL_PushArgument(pluginName, functionName, "1 " + floatToString(value, 18, 9));
    }

    public static void NWNX_PushArgumentObject(String pluginName, String functionName, NWObject value)
    {
        NWNX_INTERNAL_PushArgument(pluginName, functionName, "2 " + Integer.toHexString(value.getObjectId()));
    }

    public static void NWNX_PushArgumentString(String pluginName, String functionName, String value)
    {
        NWNX_INTERNAL_PushArgument(pluginName, functionName, "3 " + value);
    }

    public static int NWNX_GetReturnValueInt(String pluginName, String functionName)
    {
        return stringToInt(NWNX_INTERNAL_GetReturnValueString(pluginName, functionName, "0 "));
    }

    public static float NWNX_GetReturnValueFloat(String pluginName, String functionName)
    {
        return stringToFloat(NWNX_INTERNAL_GetReturnValueString(pluginName, functionName, "1 "));
    }

    public static NWObject NWNX_GetReturnValueObject(String pluginName, String functionName)
    {
        return NWNX_INTERNAL_GetReturnValueObject(pluginName, functionName, "2 ");
    }

    public static String NWNX_GetReturnValueString(String pluginName, String functionName)
    {
        return NWNX_INTERNAL_GetReturnValueString(pluginName, functionName, "3 ");
    }

    public static void NWNX_INTERNAL_CallFunction(String pluginName, String functionName)
    {
        setLocalString(getModule(), "NWNXEE!CALL_FUNCTION!" + pluginName + "!" + functionName, "1");
    }

    public static void NWNX_INTERNAL_PushArgument(String pluginName, String functionName, String value)
    {
        setLocalString(getModule(), "NWNXEE!PUSH_ARGUMENT!" + pluginName + "!" + functionName, value);
    }

    public static String NWNX_INTERNAL_GetReturnValueString(String pluginName, String functionName, String type)
    {
        return getLocalString(getModule(), "NWNXEE!GET_RETURN_VALUE!" + pluginName + "!" + functionName + "!" + type);
    }

    public static NWObject NWNX_INTERNAL_GetReturnValueObject(String pluginName, String functionName, String type)
    {
        return getLocalObject(getModule(), "NWNXEE!GET_RETURN_VALUE!" + pluginName + "!" + functionName + "!" + type);
    }


}
