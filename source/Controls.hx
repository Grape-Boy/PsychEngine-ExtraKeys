package;

import flixel.FlxG;
import flixel.input.FlxInput;
import flixel.input.actions.FlxAction;
import flixel.input.actions.FlxActionInput;
import flixel.input.actions.FlxActionInputDigital;
import flixel.input.actions.FlxActionManager;
import flixel.input.actions.FlxActionSet;
import flixel.input.gamepad.FlxGamepadButton;
import flixel.input.gamepad.FlxGamepadInputID;
import flixel.input.keyboard.FlxKey;

#if (haxe >= "4.0.0")
enum abstract Action(String) to String from String
{
	var UI_UP = "ui_up";
	var UI_LEFT = "ui_left";
	var UI_RIGHT = "ui_right";
	var UI_DOWN = "ui_down";
	var UI_UP_P = "ui_up-press";
	var UI_LEFT_P = "ui_left-press";
	var UI_RIGHT_P = "ui_right-press";
	var UI_DOWN_P = "ui_down-press";
	var UI_UP_R = "ui_up-release";
	var UI_LEFT_R = "ui_left-release";
	var UI_RIGHT_R = "ui_right-release";
	var UI_DOWN_R = "ui_down-release";

	// 1K

	var NOTE_ONE = "note_one";

	var NOTE_ONE_P = "note_one-press";

	var NOTE_ONE_R = "note_one-release";

	// 2K

	var NOTE_TWO1 = "note_two1";
	var NOTE_TWO2 = "note_two2";

	var NOTE_TWO1_P = "note_two1-press";
	var NOTE_TWO2_P = "note_two2-press";

	var NOTE_TWO1_R = "note_two1-release";
	var NOTE_TWO2_R = "note_two2-release";

	// 3K

	var NOTE_THREE1 = "note_three1";
	var NOTE_THREE2 = "note_three2";
	var NOTE_THREE3 = "note_three3";

	var NOTE_THREE1_P = "note_three1-press";
	var NOTE_THREE2_P = "note_three2-press";
	var NOTE_THREE3_P = "note_three3-press";

	var NOTE_THREE1_R = "note_three1-release";
	var NOTE_THREE2_R = "note_three2-release";
	var NOTE_THREE3_R = "note_three3-release";
	
	// 4K

	var NOTE_LEFT = "note_left";
	var NOTE_DOWN = "note_down";
	var NOTE_UP = "note_up";
	var NOTE_RIGHT = "note_right";

	var NOTE_LEFT_P = "note_left-press";
	var NOTE_DOWN_P = "note_down-press";
	var NOTE_UP_P = "note_up-press";
	var NOTE_RIGHT_P = "note_right-press";

	var NOTE_LEFT_R = "note_left-release";
	var NOTE_DOWN_R = "note_down-release";
	var NOTE_UP_R = "note_up-release";
	var NOTE_RIGHT_R = "note_right-release";
	
	//var NOTE__ = "note_-";
	// 5K

	var NOTE_FIVE1 = "note_five1";
	var NOTE_FIVE2 = "note_five2";
	var NOTE_FIVE3 = "note_five3";
	var NOTE_FIVE4 = "note_five4";
	var NOTE_FIVE5 = "note_five5";

	var NOTE_FIVE1_P = "note_five1-press";
	var NOTE_FIVE2_P = "note_five2-press";
	var NOTE_FIVE3_P = "note_five3-press";
	var NOTE_FIVE4_P = "note_five4-press";
	var NOTE_FIVE5_P = "note_five5-press";

	var NOTE_FIVE1_R = "note_five1-release";
	var NOTE_FIVE2_R = "note_five2-release";
	var NOTE_FIVE3_R = "note_five3-release";
	var NOTE_FIVE4_R = "note_five4-release";
	var NOTE_FIVE5_R = "note_five5-release";

	// 6K

	var NOTE_SIX1 = "note_six1";
	var NOTE_SIX2 = "note_six2";
	var NOTE_SIX3 = "note_six3";
	var NOTE_SIX4 = "note_six4";
	var NOTE_SIX5 = "note_six5";
	var NOTE_SIX6 = "note_six6";

	var NOTE_SIX1_P = "note_six1-press";
	var NOTE_SIX2_P = "note_six2-press";
	var NOTE_SIX3_P = "note_six3-press";
	var NOTE_SIX4_P = "note_six4-press";
	var NOTE_SIX5_P = "note_six5-press";
	var NOTE_SIX6_P = "note_six6-press";

	var NOTE_SIX1_R = "note_six1-release";
	var NOTE_SIX2_R = "note_six2-release";
	var NOTE_SIX3_R = "note_six3-release";
	var NOTE_SIX4_R = "note_six4-release";
	var NOTE_SIX5_R = "note_six5-release";
	var NOTE_SIX6_R = "note_six6-release";

	// 7K

	var NOTE_SEVEN1 = "note_seven1";
	var NOTE_SEVEN2 = "note_seven2";
	var NOTE_SEVEN3 = "note_seven3";
	var NOTE_SEVEN4 = "note_seven4";
	var NOTE_SEVEN5 = "note_seven5";
	var NOTE_SEVEN6 = "note_seven6";
	var NOTE_SEVEN7 = "note_seven7";

	var NOTE_SEVEN1_P = "note_seven1-press";
	var NOTE_SEVEN2_P = "note_seven2-press";
	var NOTE_SEVEN3_P = "note_seven3-press";
	var NOTE_SEVEN4_P = "note_seven4-press";
	var NOTE_SEVEN5_P = "note_seven5-press";
	var NOTE_SEVEN6_P = "note_seven6-press";
	var NOTE_SEVEN7_P = "note_seven7-press";

	var NOTE_SEVEN1_R = "note_seven1-release";
	var NOTE_SEVEN2_R = "note_seven2-release";
	var NOTE_SEVEN3_R = "note_seven3-release";
	var NOTE_SEVEN4_R = "note_seven4-release";
	var NOTE_SEVEN5_R = "note_seven5-release";
	var NOTE_SEVEN6_R = "note_seven6-release";
	var NOTE_SEVEN7_R = "note_seven7-release";

	// 8K

	var NOTE_EIGHT1 = "note_eight1";
	var NOTE_EIGHT2 = "note_eight2";
	var NOTE_EIGHT3 = "note_eight3";
	var NOTE_EIGHT4 = "note_eight4";
	var NOTE_EIGHT5 = "note_eight5";
	var NOTE_EIGHT6 = "note_eight6";
	var NOTE_EIGHT7 = "note_eight7";
	var NOTE_EIGHT8 = "note_eight8";

	var NOTE_EIGHT1_P = "note_eight1-press";
	var NOTE_EIGHT2_P = "note_eight2-press";
	var NOTE_EIGHT3_P = "note_eight3-press";
	var NOTE_EIGHT4_P = "note_eight4-press";
	var NOTE_EIGHT5_P = "note_eight5-press";
	var NOTE_EIGHT6_P = "note_eight6-press";
	var NOTE_EIGHT7_P = "note_eight7-press";
	var NOTE_EIGHT8_P = "note_eight8-press";

	var NOTE_EIGHT1_R = "note_eight1-release";
	var NOTE_EIGHT2_R = "note_eight2-release";
	var NOTE_EIGHT3_R = "note_eight3-release";
	var NOTE_EIGHT4_R = "note_eight4-release";
	var NOTE_EIGHT5_R = "note_eight5-release";
	var NOTE_EIGHT6_R = "note_eight6-release";
	var NOTE_EIGHT7_R = "note_eight7-release";
	var NOTE_EIGHT8_R = "note_eight8-release";

	// 9K

	var NOTE_NINE1 = "note_nine1";
	var NOTE_NINE2 = "note_nine2";
	var NOTE_NINE3 = "note_nine3";
	var NOTE_NINE4 = "note_nine4";
	var NOTE_NINE5 = "note_nine5";
	var NOTE_NINE6 = "note_nine6";
	var NOTE_NINE7 = "note_nine7";
	var NOTE_NINE8 = "note_nine8";
	var NOTE_NINE9 = "note_nine9";

	var NOTE_NINE1_P = "note_nine1-press";
	var NOTE_NINE2_P = "note_nine2-press";
	var NOTE_NINE3_P = "note_nine3-press";
	var NOTE_NINE4_P = "note_nine4-press";
	var NOTE_NINE5_P = "note_nine5-press";
	var NOTE_NINE6_P = "note_nine6-press";
	var NOTE_NINE7_P = "note_nine7-press";
	var NOTE_NINE8_P = "note_nine8-press";
	var NOTE_NINE9_P = "note_nine9-press";

	var NOTE_NINE1_R = "note_nine1-release";
	var NOTE_NINE2_R = "note_nine2-release";
	var NOTE_NINE3_R = "note_nine3-release";
	var NOTE_NINE4_R = "note_nine4-release";
	var NOTE_NINE5_R = "note_nine5-release";
	var NOTE_NINE6_R = "note_nine6-release";
	var NOTE_NINE7_R = "note_nine7-release";
	var NOTE_NINE8_R = "note_nine8-release";
	var NOTE_NINE9_R = "note_nine9-release";

	var ACCEPT = "accept";
	var BACK = "back";
	var PAUSE = "pause";
	var RESET = "reset";
}
#else
@:enum
abstract Action(String) to String from String
{
	var UI_UP = "ui_up";
	var UI_LEFT = "ui_left";
	var UI_RIGHT = "ui_right";
	var UI_DOWN = "ui_down";
	var UI_UP_P = "ui_up-press";
	var UI_LEFT_P = "ui_left-press";
	var UI_RIGHT_P = "ui_right-press";
	var UI_DOWN_P = "ui_down-press";
	var UI_UP_R = "ui_up-release";
	var UI_LEFT_R = "ui_left-release";
	var UI_RIGHT_R = "ui_right-release";
	var UI_DOWN_R = "ui_down-release";
	
	// 1K

	var NOTE_ONE = "note_one";

	var NOTE_ONE_P = "note_one-press";

	var NOTE_ONE_R = "note_one-release";

	// 2K

	var NOTE_TWO1 = "note_two1";
	var NOTE_TWO2 = "note_two2";

	var NOTE_TWO1_P = "note_two1-press";
	var NOTE_TWO2_P = "note_two2-press";

	var NOTE_TWO1_R = "note_two1-release";
	var NOTE_TWO2_R = "note_two2-release";

	// 3K

	var NOTE_THREE1 = "note_three1";
	var NOTE_THREE2 = "note_three2";
	var NOTE_THREE3 = "note_three3";

	var NOTE_THREE1_P = "note_three1-press";
	var NOTE_THREE2_P = "note_three2-press";
	var NOTE_THREE3_P = "note_three3-press";

	var NOTE_THREE1_R = "note_three1-release";
	var NOTE_THREE2_R = "note_three2-release";
	var NOTE_THREE3_R = "note_three3-release";
	
	// 4K

	var NOTE_LEFT = "note_left";
	var NOTE_DOWN = "note_down";
	var NOTE_UP = "note_up";
	var NOTE_RIGHT = "note_right";

	var NOTE_LEFT_P = "note_left-press";
	var NOTE_DOWN_P = "note_down-press";
	var NOTE_UP_P = "note_up-press";
	var NOTE_RIGHT_P = "note_right-press";

	var NOTE_LEFT_R = "note_left-release";
	var NOTE_DOWN_R = "note_down-release";
	var NOTE_UP_R = "note_up-release";
	var NOTE_RIGHT_R = "note_right-release";

	// 5K

	var NOTE_FIVE1 = "note_five1";
	var NOTE_FIVE2 = "note_five2";
	var NOTE_FIVE3 = "note_five3";
	var NOTE_FIVE4 = "note_five4";
	var NOTE_FIVE5 = "note_five5";

	var NOTE_FIVE1_P = "note_five1-press";
	var NOTE_FIVE2_P = "note_five2-press";
	var NOTE_FIVE3_P = "note_five3-press";
	var NOTE_FIVE4_P = "note_five4-press";
	var NOTE_FIVE5_P = "note_five5-press";

	var NOTE_FIVE1_R = "note_five1-release";
	var NOTE_FIVE2_R = "note_five2-release";
	var NOTE_FIVE3_R = "note_five3-release";
	var NOTE_FIVE4_R = "note_five4-release";
	var NOTE_FIVE5_R = "note_five5-release";

	// 6K

	var NOTE_SIX1 = "note_six1";
	var NOTE_SIX2 = "note_six2";
	var NOTE_SIX3 = "note_six3";
	var NOTE_SIX4 = "note_six4";
	var NOTE_SIX5 = "note_six5";
	var NOTE_SIX6 = "note_six6";

	var NOTE_SIX1_P = "note_six1-press";
	var NOTE_SIX2_P = "note_six2-press";
	var NOTE_SIX3_P = "note_six3-press";
	var NOTE_SIX4_P = "note_six4-press";
	var NOTE_SIX5_P = "note_six5-press";
	var NOTE_SIX6_P = "note_six6-press";

	var NOTE_SIX1_R = "note_six1-release";
	var NOTE_SIX2_R = "note_six2-release";
	var NOTE_SIX3_R = "note_six3-release";
	var NOTE_SIX4_R = "note_six4-release";
	var NOTE_SIX5_R = "note_six5-release";
	var NOTE_SIX6_R = "note_six6-release";

	// 7K

	var NOTE_SEVEN1 = "note_seven1";
	var NOTE_SEVEN2 = "note_seven2";
	var NOTE_SEVEN3 = "note_seven3";
	var NOTE_SEVEN4 = "note_seven4";
	var NOTE_SEVEN5 = "note_seven5";
	var NOTE_SEVEN6 = "note_seven6";
	var NOTE_SEVEN7 = "note_seven7";

	var NOTE_SEVEN1_P = "note_seven1-press";
	var NOTE_SEVEN2_P = "note_seven2-press";
	var NOTE_SEVEN3_P = "note_seven3-press";
	var NOTE_SEVEN4_P = "note_seven4-press";
	var NOTE_SEVEN5_P = "note_seven5-press";
	var NOTE_SEVEN6_P = "note_seven6-press";
	var NOTE_SEVEN7_P = "note_seven7-press";

	var NOTE_SEVEN1_R = "note_seven1-release";
	var NOTE_SEVEN2_R = "note_seven2-release";
	var NOTE_SEVEN3_R = "note_seven3-release";
	var NOTE_SEVEN4_R = "note_seven4-release";
	var NOTE_SEVEN5_R = "note_seven5-release";
	var NOTE_SEVEN6_R = "note_seven6-release";
	var NOTE_SEVEN7_R = "note_seven7-release";

	// 8K

	var NOTE_EIGHT1 = "note_eight1";
	var NOTE_EIGHT2 = "note_eight2";
	var NOTE_EIGHT3 = "note_eight3";
	var NOTE_EIGHT4 = "note_eight4";
	var NOTE_EIGHT5 = "note_eight5";
	var NOTE_EIGHT6 = "note_eight6";
	var NOTE_EIGHT7 = "note_eight7";
	var NOTE_EIGHT8 = "note_eight8";

	var NOTE_EIGHT1_P = "note_eight1-press";
	var NOTE_EIGHT2_P = "note_eight2-press";
	var NOTE_EIGHT3_P = "note_eight3-press";
	var NOTE_EIGHT4_P = "note_eight4-press";
	var NOTE_EIGHT5_P = "note_eight5-press";
	var NOTE_EIGHT6_P = "note_eight6-press";
	var NOTE_EIGHT7_P = "note_eight7-press";
	var NOTE_EIGHT8_P = "note_eight8-press";

	var NOTE_EIGHT1_R = "note_eight1-release";
	var NOTE_EIGHT2_R = "note_eight2-release";
	var NOTE_EIGHT3_R = "note_eight3-release";
	var NOTE_EIGHT4_R = "note_eight4-release";
	var NOTE_EIGHT5_R = "note_eight5-release";
	var NOTE_EIGHT6_R = "note_eight6-release";
	var NOTE_EIGHT7_R = "note_eight7-release";
	var NOTE_EIGHT8_R = "note_eight8-release";

	// 9K

	var NOTE_NINE1 = "note_nine1";
	var NOTE_NINE2 = "note_nine2";
	var NOTE_NINE3 = "note_nine3";
	var NOTE_NINE4 = "note_nine4";
	var NOTE_NINE5 = "note_nine5";
	var NOTE_NINE6 = "note_nine6";
	var NOTE_NINE7 = "note_nine7";
	var NOTE_NINE8 = "note_nine8";
	var NOTE_NINE9 = "note_nine9";

	var NOTE_NINE1_P = "note_nine1-press";
	var NOTE_NINE2_P = "note_nine2-press";
	var NOTE_NINE3_P = "note_nine3-press";
	var NOTE_NINE4_P = "note_nine4-press";
	var NOTE_NINE5_P = "note_nine5-press";
	var NOTE_NINE6_P = "note_nine6-press";
	var NOTE_NINE7_P = "note_nine7-press";
	var NOTE_NINE8_P = "note_nine8-press";
	var NOTE_NINE9_P = "note_nine9-press";

	var NOTE_NINE1_R = "note_nine1-release";
	var NOTE_NINE2_R = "note_nine2-release";
	var NOTE_NINE3_R = "note_nine3-release";
	var NOTE_NINE4_R = "note_nine4-release";
	var NOTE_NINE5_R = "note_nine5-release";
	var NOTE_NINE6_R = "note_nine6-release";
	var NOTE_NINE7_R = "note_nine7-release";
	var NOTE_NINE8_R = "note_nine8-release";
	var NOTE_NINE9_R = "note_nine9-release";

	var ACCEPT = "accept";
	var BACK = "back";
	var PAUSE = "pause";
	var RESET = "reset";
}
#end

enum Device
{
	Keys;
	Gamepad(id:Int);
}

/**
 * Since, in many cases multiple actions should use similar keys, we don't want the
 * rebinding UI to list every action. ActionBinders are what the user percieves as
 * an input so, for instance, they can't set jump-press and jump-release to different keys.
 */
enum Control
{
	UI_UP;
	UI_LEFT;
	UI_RIGHT;
	UI_DOWN;
	
	// 1K

	NOTE_ONE;

	// 2K

	NOTE_TWO1;
	NOTE_TWO2;

	// 3K

	NOTE_THREE1;
	NOTE_THREE2;
	NOTE_THREE3;
	
	// 4K

	NOTE_LEFT;
	NOTE_DOWN;
	NOTE_UP;
	NOTE_RIGHT;
	
	// 5K

	NOTE_FIVE1;
	NOTE_FIVE2;
	NOTE_FIVE3;
	NOTE_FIVE4;
	NOTE_FIVE5;

	// 6K

	NOTE_SIX1;
	NOTE_SIX2;
	NOTE_SIX3;
	NOTE_SIX4;
	NOTE_SIX5;
	NOTE_SIX6;

	// 7K

	NOTE_SEVEN1;
	NOTE_SEVEN2;
	NOTE_SEVEN3;
	NOTE_SEVEN4;
	NOTE_SEVEN5;
	NOTE_SEVEN6;
	NOTE_SEVEN7;

	// 8K

	NOTE_EIGHT1;
	NOTE_EIGHT2;
	NOTE_EIGHT3;
	NOTE_EIGHT4;
	NOTE_EIGHT5;
	NOTE_EIGHT6;
	NOTE_EIGHT7;
	NOTE_EIGHT8;

	// 9K

	NOTE_NINE1;
	NOTE_NINE2;
	NOTE_NINE3;
	NOTE_NINE4;
	NOTE_NINE5;
	NOTE_NINE6;
	NOTE_NINE7;
	NOTE_NINE8;
	NOTE_NINE9;

	RESET;
	ACCEPT;
	BACK;
	PAUSE;
}

enum KeyboardScheme
{
	Solo;
	Duo(first:Bool);
	None;
	Custom;
}

/**
 * A list of actions that a player would invoke via some input device.
 * Uses FlxActions to funnel various inputs to a single action.
 */
class Controls extends FlxActionSet
{
	var _ui_up = new FlxActionDigital(Action.UI_UP);
	var _ui_left = new FlxActionDigital(Action.UI_LEFT);
	var _ui_right = new FlxActionDigital(Action.UI_RIGHT);
	var _ui_down = new FlxActionDigital(Action.UI_DOWN);
	var _ui_upP = new FlxActionDigital(Action.UI_UP_P);
	var _ui_leftP = new FlxActionDigital(Action.UI_LEFT_P);
	var _ui_rightP = new FlxActionDigital(Action.UI_RIGHT_P);
	var _ui_downP = new FlxActionDigital(Action.UI_DOWN_P);
	var _ui_upR = new FlxActionDigital(Action.UI_UP_R);
	var _ui_leftR = new FlxActionDigital(Action.UI_LEFT_R);
	var _ui_rightR = new FlxActionDigital(Action.UI_RIGHT_R);
	var _ui_downR = new FlxActionDigital(Action.UI_DOWN_R);
	
	// 1K

	var _note_one = new FlxActionDigital(Action.NOTE_ONE);

	var _note_oneP = new FlxActionDigital(Action.NOTE_ONE_P);

	var _note_oneR = new FlxActionDigital(Action.NOTE_ONE_R);

	// 2K

	var _note_two1 = new FlxActionDigital(Action.NOTE_TWO1);
	var _note_two2 = new FlxActionDigital(Action.NOTE_TWO2);

	var _note_two1P = new FlxActionDigital(Action.NOTE_TWO1_P);
	var _note_two2P = new FlxActionDigital(Action.NOTE_TWO2_P);

	var _note_two1R = new FlxActionDigital(Action.NOTE_TWO1_R);
	var _note_two2R = new FlxActionDigital(Action.NOTE_TWO2_R);

	// 3K

	var _note_three1 = new FlxActionDigital(Action.NOTE_THREE1);
	var _note_three2 = new FlxActionDigital(Action.NOTE_THREE2);
	var _note_three3 = new FlxActionDigital(Action.NOTE_THREE3);

	var _note_three1P = new FlxActionDigital(Action.NOTE_THREE1_P);
	var _note_three2P = new FlxActionDigital(Action.NOTE_THREE2_P);
	var _note_three3P = new FlxActionDigital(Action.NOTE_THREE3_P);

	var _note_three1R = new FlxActionDigital(Action.NOTE_THREE1_R);
	var _note_three2R = new FlxActionDigital(Action.NOTE_THREE2_R);
	var _note_three3R = new FlxActionDigital(Action.NOTE_THREE3_R);
	
	// 4K

	var _note_left = new FlxActionDigital(Action.NOTE_LEFT);
	var _note_down = new FlxActionDigital(Action.NOTE_DOWN);
	var _note_up = new FlxActionDigital(Action.NOTE_UP);
	var _note_right = new FlxActionDigital(Action.NOTE_RIGHT);

	var _note_leftP = new FlxActionDigital(Action.NOTE_LEFT_P);
	var _note_downP = new FlxActionDigital(Action.NOTE_DOWN_P);
	var _note_upP = new FlxActionDigital(Action.NOTE_UP_P);
	var _note_rightP = new FlxActionDigital(Action.NOTE_RIGHT_P);

	var _note_leftR = new FlxActionDigital(Action.NOTE_LEFT_R);
	var _note_downR = new FlxActionDigital(Action.NOTE_DOWN_R);
	var _note_upR = new FlxActionDigital(Action.NOTE_UP_R);
	var _note_rightR = new FlxActionDigital(Action.NOTE_RIGHT_R);
	
	// 5K

	var _note_five1 = new FlxActionDigital(Action.NOTE_FIVE1);
	var _note_five2 = new FlxActionDigital(Action.NOTE_FIVE2);
	var _note_five3 = new FlxActionDigital(Action.NOTE_FIVE3);
	var _note_five4 = new FlxActionDigital(Action.NOTE_FIVE4);
	var _note_five5 = new FlxActionDigital(Action.NOTE_FIVE5);

	var _note_five1P = new FlxActionDigital(Action.NOTE_FIVE1_P);
	var _note_five2P = new FlxActionDigital(Action.NOTE_FIVE2_P);
	var _note_five3P = new FlxActionDigital(Action.NOTE_FIVE3_P);
	var _note_five4P = new FlxActionDigital(Action.NOTE_FIVE4_P);
	var _note_five5P = new FlxActionDigital(Action.NOTE_FIVE5_P);

	var _note_five1R = new FlxActionDigital(Action.NOTE_FIVE1_R);
	var _note_five2R = new FlxActionDigital(Action.NOTE_FIVE2_R);
	var _note_five3R = new FlxActionDigital(Action.NOTE_FIVE3_R);
	var _note_five4R = new FlxActionDigital(Action.NOTE_FIVE4_R);
	var _note_five5R = new FlxActionDigital(Action.NOTE_FIVE5_R);

	// 6K

	var _note_six1 = new FlxActionDigital(Action.NOTE_SIX1);
	var _note_six2 = new FlxActionDigital(Action.NOTE_SIX2);
	var _note_six3 = new FlxActionDigital(Action.NOTE_SIX3);
	var _note_six4 = new FlxActionDigital(Action.NOTE_SIX4);
	var _note_six5 = new FlxActionDigital(Action.NOTE_SIX5);
	var _note_six6 = new FlxActionDigital(Action.NOTE_SIX6);

	var _note_six1P = new FlxActionDigital(Action.NOTE_SIX1_P);
	var _note_six2P = new FlxActionDigital(Action.NOTE_SIX2_P);
	var _note_six3P = new FlxActionDigital(Action.NOTE_SIX3_P);
	var _note_six4P = new FlxActionDigital(Action.NOTE_SIX4_P);
	var _note_six5P = new FlxActionDigital(Action.NOTE_SIX5_P);
	var _note_six6P = new FlxActionDigital(Action.NOTE_SIX6_P);

	var _note_six1R = new FlxActionDigital(Action.NOTE_SIX1_R);
	var _note_six2R = new FlxActionDigital(Action.NOTE_SIX2_R);
	var _note_six3R = new FlxActionDigital(Action.NOTE_SIX3_R);
	var _note_six4R = new FlxActionDigital(Action.NOTE_SIX4_R);
	var _note_six5R = new FlxActionDigital(Action.NOTE_SIX5_R);
	var _note_six6R = new FlxActionDigital(Action.NOTE_SIX6_R);

	// 7K

	var _note_seven1 = new FlxActionDigital(Action.NOTE_SEVEN1);
	var _note_seven2 = new FlxActionDigital(Action.NOTE_SEVEN2);
	var _note_seven3 = new FlxActionDigital(Action.NOTE_SEVEN3);
	var _note_seven4 = new FlxActionDigital(Action.NOTE_SEVEN4);
	var _note_seven5 = new FlxActionDigital(Action.NOTE_SEVEN5);
	var _note_seven6 = new FlxActionDigital(Action.NOTE_SEVEN6);
	var _note_seven7 = new FlxActionDigital(Action.NOTE_SEVEN7);

	var _note_seven1P = new FlxActionDigital(Action.NOTE_SEVEN1_P);
	var _note_seven2P = new FlxActionDigital(Action.NOTE_SEVEN2_P);
	var _note_seven3P = new FlxActionDigital(Action.NOTE_SEVEN3_P);
	var _note_seven4P = new FlxActionDigital(Action.NOTE_SEVEN4_P);
	var _note_seven5P = new FlxActionDigital(Action.NOTE_SEVEN5_P);
	var _note_seven6P = new FlxActionDigital(Action.NOTE_SEVEN6_P);
	var _note_seven7P = new FlxActionDigital(Action.NOTE_SEVEN7_P);

	var _note_seven1R = new FlxActionDigital(Action.NOTE_SEVEN1_R);
	var _note_seven2R = new FlxActionDigital(Action.NOTE_SEVEN2_R);
	var _note_seven3R = new FlxActionDigital(Action.NOTE_SEVEN3_R);
	var _note_seven4R = new FlxActionDigital(Action.NOTE_SEVEN4_R);
	var _note_seven5R = new FlxActionDigital(Action.NOTE_SEVEN5_R);
	var _note_seven6R = new FlxActionDigital(Action.NOTE_SEVEN6_R);
	var _note_seven7R = new FlxActionDigital(Action.NOTE_SEVEN7_R);

	// 8K

	var _note_eight1 = new FlxActionDigital(Action.NOTE_EIGHT1);
	var _note_eight2 = new FlxActionDigital(Action.NOTE_EIGHT2);
	var _note_eight3 = new FlxActionDigital(Action.NOTE_EIGHT3);
	var _note_eight4 = new FlxActionDigital(Action.NOTE_EIGHT4);
	var _note_eight5 = new FlxActionDigital(Action.NOTE_EIGHT5);
	var _note_eight6 = new FlxActionDigital(Action.NOTE_EIGHT6);
	var _note_eight7 = new FlxActionDigital(Action.NOTE_EIGHT7);
	var _note_eight8 = new FlxActionDigital(Action.NOTE_EIGHT8);

	var _note_eight1P = new FlxActionDigital(Action.NOTE_EIGHT1_P);
	var _note_eight2P = new FlxActionDigital(Action.NOTE_EIGHT2_P);
	var _note_eight3P = new FlxActionDigital(Action.NOTE_EIGHT3_P);
	var _note_eight4P = new FlxActionDigital(Action.NOTE_EIGHT4_P);
	var _note_eight5P = new FlxActionDigital(Action.NOTE_EIGHT5_P);
	var _note_eight6P = new FlxActionDigital(Action.NOTE_EIGHT6_P);
	var _note_eight7P = new FlxActionDigital(Action.NOTE_EIGHT7_P);
	var _note_eight8P = new FlxActionDigital(Action.NOTE_EIGHT8_P);

	var _note_eight1R = new FlxActionDigital(Action.NOTE_EIGHT1_R);
	var _note_eight2R = new FlxActionDigital(Action.NOTE_EIGHT2_R);
	var _note_eight3R = new FlxActionDigital(Action.NOTE_EIGHT3_R);
	var _note_eight4R = new FlxActionDigital(Action.NOTE_EIGHT4_R);
	var _note_eight5R = new FlxActionDigital(Action.NOTE_EIGHT5_R);
	var _note_eight6R = new FlxActionDigital(Action.NOTE_EIGHT6_R);
	var _note_eight7R = new FlxActionDigital(Action.NOTE_EIGHT7_R);
	var _note_eight8R = new FlxActionDigital(Action.NOTE_EIGHT8_R);

	// 9K

	var _note_nine1 = new FlxActionDigital(Action.NOTE_NINE1);
	var _note_nine2 = new FlxActionDigital(Action.NOTE_NINE2);
	var _note_nine3 = new FlxActionDigital(Action.NOTE_NINE3);
	var _note_nine4 = new FlxActionDigital(Action.NOTE_NINE4);
	var _note_nine5 = new FlxActionDigital(Action.NOTE_NINE5);
	var _note_nine6 = new FlxActionDigital(Action.NOTE_NINE6);
	var _note_nine7 = new FlxActionDigital(Action.NOTE_NINE7);
	var _note_nine8 = new FlxActionDigital(Action.NOTE_NINE8);
	var _note_nine9 = new FlxActionDigital(Action.NOTE_NINE9);

	var _note_nine1P = new FlxActionDigital(Action.NOTE_NINE1_P);
	var _note_nine2P = new FlxActionDigital(Action.NOTE_NINE2_P);
	var _note_nine3P = new FlxActionDigital(Action.NOTE_NINE3_P);
	var _note_nine4P = new FlxActionDigital(Action.NOTE_NINE4_P);
	var _note_nine5P = new FlxActionDigital(Action.NOTE_NINE5_P);
	var _note_nine6P = new FlxActionDigital(Action.NOTE_NINE6_P);
	var _note_nine7P = new FlxActionDigital(Action.NOTE_NINE7_P);
	var _note_nine8P = new FlxActionDigital(Action.NOTE_NINE8_P);
	var _note_nine9P = new FlxActionDigital(Action.NOTE_NINE9_P);

	var _note_nine1R = new FlxActionDigital(Action.NOTE_NINE1_R);
	var _note_nine2R = new FlxActionDigital(Action.NOTE_NINE2_R);
	var _note_nine3R = new FlxActionDigital(Action.NOTE_NINE3_R);
	var _note_nine4R = new FlxActionDigital(Action.NOTE_NINE4_R);
	var _note_nine5R = new FlxActionDigital(Action.NOTE_NINE5_R);
	var _note_nine6R = new FlxActionDigital(Action.NOTE_NINE6_R);
	var _note_nine7R = new FlxActionDigital(Action.NOTE_NINE7_R);
	var _note_nine8R = new FlxActionDigital(Action.NOTE_NINE8_R);
	var _note_nine9R = new FlxActionDigital(Action.NOTE_NINE9_R);

	var _accept = new FlxActionDigital(Action.ACCEPT);
	var _back = new FlxActionDigital(Action.BACK);
	var _pause = new FlxActionDigital(Action.PAUSE);
	var _reset = new FlxActionDigital(Action.RESET);

	#if (haxe >= "4.0.0")
	var byName:Map<String, FlxActionDigital> = [];
	#else
	var byName:Map<String, FlxActionDigital> = new Map<String, FlxActionDigital>();
	#end

	public var gamepadsAdded:Array<Int> = [];
	public var keyboardScheme = KeyboardScheme.None;

	public var UI_UP(get, never):Bool;

	inline function get_UI_UP()
		return _ui_up.check();

	public var UI_LEFT(get, never):Bool;

	inline function get_UI_LEFT()
		return _ui_left.check();

	public var UI_RIGHT(get, never):Bool;

	inline function get_UI_RIGHT()
		return _ui_right.check();

	public var UI_DOWN(get, never):Bool;

	inline function get_UI_DOWN()
		return _ui_down.check();

	public var UI_UP_P(get, never):Bool;

	inline function get_UI_UP_P()
		return _ui_upP.check();

	public var UI_LEFT_P(get, never):Bool;

	inline function get_UI_LEFT_P()
		return _ui_leftP.check();

	public var UI_RIGHT_P(get, never):Bool;

	inline function get_UI_RIGHT_P()
		return _ui_rightP.check();

	public var UI_DOWN_P(get, never):Bool;

	inline function get_UI_DOWN_P()
		return _ui_downP.check();

	public var UI_UP_R(get, never):Bool;

	inline function get_UI_UP_R()
		return _ui_upR.check();

	public var UI_LEFT_R(get, never):Bool;

	inline function get_UI_LEFT_R()
		return _ui_leftR.check();

	public var UI_RIGHT_R(get, never):Bool;

	inline function get_UI_RIGHT_R()
		return _ui_rightR.check();

	public var UI_DOWN_R(get, never):Bool;

	inline function get_UI_DOWN_R()
		return _ui_downR.check();

	// 1K

	public var NOTE_ONE(get, never):Bool;

	inline function get_NOTE_ONE()
		return _note_one.check();
	public var NOTE_ONE_P(get, never):Bool;

	inline function get_NOTE_ONE_P()
		return _note_oneP.check();

	public var NOTE_ONE_R(get, never):Bool;

	inline function get_NOTE_ONE_R()
		return _note_oneR.check();

	// 2K

	public var NOTE_TWO1(get, never):Bool;

	inline function get_NOTE_TWO1()
		return _note_two1.check();

	public var NOTE_TWO2(get, never):Bool;

	inline function get_NOTE_TWO2()
		return _note_two2.check();
	
	public var NOTE_TWO1_P(get, never):Bool;

	inline function get_NOTE_TWO1_P()
		return _note_two1P.check();

	public var NOTE_TWO2_P(get, never):Bool;

	inline function get_NOTE_TWO2_P()
		return _note_two2P.check();

	public var NOTE_TWO1_R(get, never):Bool;

	inline function get_NOTE_TWO1_R()
		return _note_two1R.check();

	public var NOTE_TWO2_R(get, never):Bool;

	inline function get_NOTE_TWO2_R()
		return _note_two2R.check();

	// 3K

	public var NOTE_THREE1(get, never):Bool;

	inline function get_NOTE_THREE1()
		return _note_three1.check();

	public var NOTE_THREE2(get, never):Bool;

	inline function get_NOTE_THREE2()
		return _note_three2.check();

	public var NOTE_THREE3(get, never):Bool;

	inline function get_NOTE_THREE3()
		return _note_three3.check();

	public var NOTE_THREE1_P(get, never):Bool;

	inline function get_NOTE_THREE1_P()
		return _note_three1P.check();

	public var NOTE_THREE2_P(get, never):Bool;

	inline function get_NOTE_THREE2_P()
		return _note_three2P.check();

	public var NOTE_THREE3_P(get, never):Bool;

	inline function get_NOTE_THREE3_P()
		return _note_three3P.check();

	public var NOTE_THREE1_R(get, never):Bool;

	inline function get_NOTE_THREE1_R()
		return _note_three1R.check();

	public var NOTE_THREE2_R(get, never):Bool;

	inline function get_NOTE_THREE2_R()
		return _note_three2R.check();

	public var NOTE_THREE3_R(get, never):Bool;

	inline function get_NOTE_THREE3_R()
		return _note_three3R.check();
	
	// 4K

	public var NOTE_UP(get, never):Bool;

	inline function get_NOTE_UP()
		return _note_up.check();

	public var NOTE_LEFT(get, never):Bool;

	inline function get_NOTE_LEFT()
		return _note_left.check();

	public var NOTE_RIGHT(get, never):Bool;

	inline function get_NOTE_RIGHT()
		return _note_right.check();

	public var NOTE_DOWN(get, never):Bool;

	inline function get_NOTE_DOWN()
		return _note_down.check();

	public var NOTE_UP_P(get, never):Bool;

	inline function get_NOTE_UP_P()
		return _note_upP.check();

	public var NOTE_LEFT_P(get, never):Bool;

	inline function get_NOTE_LEFT_P()
		return _note_leftP.check();

	public var NOTE_RIGHT_P(get, never):Bool;

	inline function get_NOTE_RIGHT_P()
		return _note_rightP.check();

	public var NOTE_DOWN_P(get, never):Bool;

	inline function get_NOTE_DOWN_P()
		return _note_downP.check();

	public var NOTE_UP_R(get, never):Bool;

	inline function get_NOTE_UP_R()
		return _note_upR.check();

	public var NOTE_LEFT_R(get, never):Bool;

	inline function get_NOTE_LEFT_R()
		return _note_leftR.check();

	public var NOTE_RIGHT_R(get, never):Bool;

	inline function get_NOTE_RIGHT_R()
		return _note_rightR.check();

	public var NOTE_DOWN_R(get, never):Bool;

	inline function get_NOTE_DOWN_R()
		return _note_downR.check();

	// 5K
	public var NOTE_FIVE1(get, never):Bool;

	inline function get_NOTE_FIVE1()
		return _note_five1.check();

	public var NOTE_FIVE2(get, never):Bool;

	inline function get_NOTE_FIVE2()
		return _note_five2.check();

	public var NOTE_FIVE3(get, never):Bool;

	inline function get_NOTE_FIVE3()
		return _note_five3.check();

	public var NOTE_FIVE4(get, never):Bool;

	inline function get_NOTE_FIVE4()
		return _note_five4.check();

	public var NOTE_FIVE5(get, never):Bool;

	inline function get_NOTE_FIVE5()
		return _note_five5.check();

	public var NOTE_FIVE1_P(get, never):Bool;

	inline function get_NOTE_FIVE1_P()
		return _note_five1P.check();

	public var NOTE_FIVE2_P(get, never):Bool;

	inline function get_NOTE_FIVE2_P()
		return _note_five2P.check();

	public var NOTE_FIVE3_P(get, never):Bool;

	inline function get_NOTE_FIVE3_P()
		return _note_five3P.check();

	public var NOTE_FIVE4_P(get, never):Bool;

	inline function get_NOTE_FIVE4_P()
		return _note_five4P.check();

	public var NOTE_FIVE5_P(get, never):Bool;

	inline function get_NOTE_FIVE5_P()
		return _note_five5P.check();

	public var NOTE_FIVE1_R(get, never):Bool;

	inline function get_NOTE_FIVE1_R()
		return _note_five1R.check();

	public var NOTE_FIVE2_R(get, never):Bool;

	inline function get_NOTE_FIVE2_R()
		return _note_five2R.check();

	public var NOTE_FIVE3_R(get, never):Bool;

	inline function get_NOTE_FIVE3_R()
		return _note_five3R.check();

	public var NOTE_FIVE4_R(get, never):Bool;

	inline function get_NOTE_FIVE4_R()
		return _note_five4R.check();

	public var NOTE_FIVE5_R(get, never):Bool;

	inline function get_NOTE_FIVE5_R()
		return _note_five5R.check();

	// 6K
	public var NOTE_SIX1(get, never):Bool;

	inline function get_NOTE_SIX1()
		return _note_six1.check();

	public var NOTE_SIX2(get, never):Bool;

	inline function get_NOTE_SIX2()
		return _note_six2.check();

	public var NOTE_SIX3(get, never):Bool;

	inline function get_NOTE_SIX3()
		return _note_six3.check();

	public var NOTE_SIX4(get, never):Bool;

	inline function get_NOTE_SIX4()
		return _note_six4.check();

	public var NOTE_SIX5(get, never):Bool;

	inline function get_NOTE_SIX5()
		return _note_six5.check();

	public var NOTE_SIX6(get, never):Bool;

	inline function get_NOTE_SIX6()
		return _note_six6.check();

	public var NOTE_SIX1_P(get, never):Bool;

	inline function get_NOTE_SIX1_P()
		return _note_six1P.check();

	public var NOTE_SIX2_P(get, never):Bool;

	inline function get_NOTE_SIX2_P()
		return _note_six2P.check();

	public var NOTE_SIX3_P(get, never):Bool;

	inline function get_NOTE_SIX3_P()
		return _note_six3P.check();

	public var NOTE_SIX4_P(get, never):Bool;

	inline function get_NOTE_SIX4_P()
		return _note_six4P.check();

	public var NOTE_SIX5_P(get, never):Bool;

	inline function get_NOTE_SIX5_P()
		return _note_six5P.check();

	public var NOTE_SIX6_P(get, never):Bool;

	inline function get_NOTE_SIX6_P()
		return _note_six6P.check();

	public var NOTE_SIX1_R(get, never):Bool;

	inline function get_NOTE_SIX1_R()
		return _note_six1R.check();

	public var NOTE_SIX2_R(get, never):Bool;

	inline function get_NOTE_SIX2_R()
		return _note_six2R.check();

	public var NOTE_SIX3_R(get, never):Bool;

	inline function get_NOTE_SIX3_R()
		return _note_six3R.check();

	public var NOTE_SIX4_R(get, never):Bool;

	inline function get_NOTE_SIX4_R()
		return _note_six4R.check();

	public var NOTE_SIX5_R(get, never):Bool;

	inline function get_NOTE_SIX5_R()
		return _note_six5R.check();

	public var NOTE_SIX6_R(get, never):Bool;

	inline function get_NOTE_SIX6_R()
		return _note_six6R.check();

	// 7K
	public var NOTE_SEVEN1(get, never):Bool;

	inline function get_NOTE_SEVEN1()
		return _note_seven1.check();

	public var NOTE_SEVEN2(get, never):Bool;

	inline function get_NOTE_SEVEN2()
		return _note_seven2.check();

	public var NOTE_SEVEN3(get, never):Bool;

	inline function get_NOTE_SEVEN3()
		return _note_seven3.check();

	public var NOTE_SEVEN4(get, never):Bool;

	inline function get_NOTE_SEVEN4()
		return _note_seven4.check();

	public var NOTE_SEVEN5(get, never):Bool;

	inline function get_NOTE_SEVEN5()
		return _note_seven5.check();

	public var NOTE_SEVEN6(get, never):Bool;

	inline function get_NOTE_SEVEN6()
		return _note_seven6.check();

	public var NOTE_SEVEN7(get, never):Bool;

	inline function get_NOTE_SEVEN7()
		return _note_seven7.check();

	public var NOTE_SEVEN1_P(get, never):Bool;

	inline function get_NOTE_SEVEN1_P()
		return _note_seven1P.check();

	public var NOTE_SEVEN2_P(get, never):Bool;

	inline function get_NOTE_SEVEN2_P()
		return _note_seven2P.check();

	public var NOTE_SEVEN3_P(get, never):Bool;

	inline function get_NOTE_SEVEN3_P()
		return _note_seven3P.check();

	public var NOTE_SEVEN4_P(get, never):Bool;

	inline function get_NOTE_SEVEN4_P()
		return _note_seven4P.check();

	public var NOTE_SEVEN5_P(get, never):Bool;

	inline function get_NOTE_SEVEN5_P()
		return _note_seven5P.check();

	public var NOTE_SEVEN6_P(get, never):Bool;

	inline function get_NOTE_SEVEN6_P()
		return _note_seven6P.check();

	public var NOTE_SEVEN7_P(get, never):Bool;

	inline function get_NOTE_SEVEN7_P()
		return _note_seven7P.check();

	public var NOTE_SEVEN1_R(get, never):Bool;

	inline function get_NOTE_SEVEN1_R()
		return _note_seven1R.check();

	public var NOTE_SEVEN2_R(get, never):Bool;

	inline function get_NOTE_SEVEN2_R()
		return _note_seven2R.check();

	public var NOTE_SEVEN3_R(get, never):Bool;

	inline function get_NOTE_SEVEN3_R()
		return _note_seven3R.check();

	public var NOTE_SEVEN4_R(get, never):Bool;

	inline function get_NOTE_SEVEN4_R()
		return _note_seven4R.check();

	public var NOTE_SEVEN5_R(get, never):Bool;

	inline function get_NOTE_SEVEN5_R()
		return _note_seven5R.check();

	public var NOTE_SEVEN6_R(get, never):Bool;

	inline function get_NOTE_SEVEN6_R()
		return _note_seven6R.check();

	public var NOTE_SEVEN7_R(get, never):Bool;

	inline function get_NOTE_SEVEN7_R()
		return _note_seven7R.check();

	// 8K
	public var NOTE_EIGHT1(get, never):Bool;

	inline function get_NOTE_EIGHT1()
		return _note_eight1.check();

	public var NOTE_EIGHT2(get, never):Bool;

	inline function get_NOTE_EIGHT2()
		return _note_eight2.check();

	public var NOTE_EIGHT3(get, never):Bool;

	inline function get_NOTE_EIGHT3()
		return _note_eight3.check();

	public var NOTE_EIGHT4(get, never):Bool;

	inline function get_NOTE_EIGHT4()
		return _note_eight4.check();

	public var NOTE_EIGHT5(get, never):Bool;

	inline function get_NOTE_EIGHT5()
		return _note_eight5.check();

	public var NOTE_EIGHT6(get, never):Bool;

	inline function get_NOTE_EIGHT6()
		return _note_eight6.check();

	public var NOTE_EIGHT7(get, never):Bool;

	inline function get_NOTE_EIGHT7()
		return _note_eight7.check();

	public var NOTE_EIGHT8(get, never):Bool;

	inline function get_NOTE_EIGHT8()
		return _note_eight8.check();

	public var NOTE_EIGHT1_P(get, never):Bool;

	inline function get_NOTE_EIGHT1_P()
		return _note_eight1P.check();

	public var NOTE_EIGHT2_P(get, never):Bool;

	inline function get_NOTE_EIGHT2_P()
		return _note_eight2P.check();

	public var NOTE_EIGHT3_P(get, never):Bool;

	inline function get_NOTE_EIGHT3_P()
		return _note_eight3P.check();

	public var NOTE_EIGHT4_P(get, never):Bool;

	inline function get_NOTE_EIGHT4_P()
		return _note_eight4P.check();

	public var NOTE_EIGHT5_P(get, never):Bool;

	inline function get_NOTE_EIGHT5_P()
		return _note_eight5P.check();

	public var NOTE_EIGHT6_P(get, never):Bool;

	inline function get_NOTE_EIGHT6_P()
		return _note_eight6P.check();

	public var NOTE_EIGHT7_P(get, never):Bool;

	inline function get_NOTE_EIGHT7_P()
		return _note_eight7P.check();

	public var NOTE_EIGHT8_P(get, never):Bool;

	inline function get_NOTE_EIGHT8_P()
		return _note_eight8P.check();

	public var NOTE_EIGHT1_R(get, never):Bool;

	inline function get_NOTE_EIGHT1_R()
		return _note_eight1R.check();

	public var NOTE_EIGHT2_R(get, never):Bool;

	inline function get_NOTE_EIGHT2_R()
		return _note_eight2R.check();

	public var NOTE_EIGHT3_R(get, never):Bool;

	inline function get_NOTE_EIGHT3_R()
		return _note_eight3R.check();

	public var NOTE_EIGHT4_R(get, never):Bool;

	inline function get_NOTE_EIGHT4_R()
		return _note_eight4R.check();

	public var NOTE_EIGHT5_R(get, never):Bool;

	inline function get_NOTE_EIGHT5_R()
		return _note_eight5R.check();

	public var NOTE_EIGHT6_R(get, never):Bool;

	inline function get_NOTE_EIGHT6_R()
		return _note_eight6R.check();

	public var NOTE_EIGHT7_R(get, never):Bool;

	inline function get_NOTE_EIGHT7_R()
		return _note_eight7R.check();

	public var NOTE_EIGHT8_R(get, never):Bool;

	inline function get_NOTE_EIGHT8_R()
		return _note_eight8R.check();

	// 9K
	public var NOTE_NINE1(get, never):Bool;

	inline function get_NOTE_NINE1()
		return _note_nine1.check();

	public var NOTE_NINE2(get, never):Bool;

	inline function get_NOTE_NINE2()
		return _note_nine2.check();

	public var NOTE_NINE3(get, never):Bool;

	inline function get_NOTE_NINE3()
		return _note_nine3.check();

	public var NOTE_NINE4(get, never):Bool;

	inline function get_NOTE_NINE4()
		return _note_nine4.check();

	public var NOTE_NINE5(get, never):Bool;

	inline function get_NOTE_NINE5()
		return _note_nine5.check();

	public var NOTE_NINE6(get, never):Bool;

	inline function get_NOTE_NINE6()
		return _note_nine6.check();

	public var NOTE_NINE7(get, never):Bool;

	inline function get_NOTE_NINE7()
		return _note_nine7.check();

	public var NOTE_NINE8(get, never):Bool;

	inline function get_NOTE_NINE8()
		return _note_nine8.check();

	public var NOTE_NINE9(get, never):Bool;

	inline function get_NOTE_NINE9()
		return _note_nine9.check();

	public var NOTE_NINE1_P(get, never):Bool;

	inline function get_NOTE_NINE1_P()
		return _note_nine1P.check();

	public var NOTE_NINE2_P(get, never):Bool;

	inline function get_NOTE_NINE2_P()
		return _note_nine2P.check();

	public var NOTE_NINE3_P(get, never):Bool;

	inline function get_NOTE_NINE3_P()
		return _note_nine3P.check();

	public var NOTE_NINE4_P(get, never):Bool;

	inline function get_NOTE_NINE4_P()
		return _note_nine4P.check();

	public var NOTE_NINE5_P(get, never):Bool;

	inline function get_NOTE_NINE5_P()
		return _note_nine5P.check();

	public var NOTE_NINE6_P(get, never):Bool;

	inline function get_NOTE_NINE6_P()
		return _note_nine6P.check();

	public var NOTE_NINE7_P(get, never):Bool;

	inline function get_NOTE_NINE7_P()
		return _note_nine7P.check();

	public var NOTE_NINE8_P(get, never):Bool;

	inline function get_NOTE_NINE8_P()
		return _note_nine8P.check();

	public var NOTE_NINE9_P(get, never):Bool;

	inline function get_NOTE_NINE9_P()
		return _note_nine9P.check();

	public var NOTE_NINE1_R(get, never):Bool;

	inline function get_NOTE_NINE1_R()
		return _note_nine1R.check();

	public var NOTE_NINE2_R(get, never):Bool;

	inline function get_NOTE_NINE2_R()
		return _note_nine2R.check();

	public var NOTE_NINE3_R(get, never):Bool;

	inline function get_NOTE_NINE3_R()
		return _note_nine3R.check();

	public var NOTE_NINE4_R(get, never):Bool;

	inline function get_NOTE_NINE4_R()
		return _note_nine4R.check();

	public var NOTE_NINE5_R(get, never):Bool;

	inline function get_NOTE_NINE5_R()
		return _note_nine5R.check();

	public var NOTE_NINE6_R(get, never):Bool;

	inline function get_NOTE_NINE6_R()
		return _note_nine6R.check();

	public var NOTE_NINE7_R(get, never):Bool;

	inline function get_NOTE_NINE7_R()
		return _note_nine7R.check();

	public var NOTE_NINE8_R(get, never):Bool;

	inline function get_NOTE_NINE8_R()
		return _note_nine8R.check();

	public var NOTE_NINE9_R(get, never):Bool;

	inline function get_NOTE_NINE9_R()
		return _note_nine9R.check();

	public var ACCEPT(get, never):Bool;

	inline function get_ACCEPT()
		return _accept.check();

	public var BACK(get, never):Bool;

	inline function get_BACK()
		return _back.check();

	public var PAUSE(get, never):Bool;

	inline function get_PAUSE()
		return _pause.check();

	public var RESET(get, never):Bool;

	inline function get_RESET()
		return _reset.check();

	#if (haxe >= "4.0.0")
	public function new(name, scheme = None)
	{
		super(name);

		add(_ui_up);
		add(_ui_left);
		add(_ui_right);
		add(_ui_down);
		add(_ui_upP);
		add(_ui_leftP);
		add(_ui_rightP);
		add(_ui_downP);
		add(_ui_upR);
		add(_ui_leftR);
		add(_ui_rightR);
		add(_ui_downR);

		// 1K

		add(_note_one);
		add(_note_oneP);
		add(_note_oneR);

		// 2K

		add(_note_two1);
		add(_note_two1P);
		add(_note_two1R);

		add(_note_two2);
		add(_note_two2P);
		add(_note_two2R);

		// 3K

		add(_note_three1);
		add(_note_three1P);
		add(_note_three1R);

		add(_note_three2);
		add(_note_three2P);
		add(_note_three2R);

		add(_note_three3);
		add(_note_three3P);
		add(_note_three3R);
		
		// 4K

		add(_note_left);
		add(_note_leftP);
		add(_note_leftR);

		add(_note_down);
		add(_note_downP);
		add(_note_downR);

		add(_note_up);
		add(_note_upP);
		add(_note_upR);

		add(_note_right);
		add(_note_rightP);
		add(_note_rightR);

		// 5K

		add(_note_five1);
		add(_note_five1P);
		add(_note_five1R);

		add(_note_five2);
		add(_note_five2P);
		add(_note_five2R);

		add(_note_five3);
		add(_note_five3P);
		add(_note_five3R);

		add(_note_five4);
		add(_note_five4P);
		add(_note_five4R);

		add(_note_five5);
		add(_note_five5P);
		add(_note_five5R);

		// 6K
		
		add(_note_six1);
		add(_note_six1P);
		add(_note_six1R);

		add(_note_six2);
		add(_note_six2P);
		add(_note_six2R);

		add(_note_six3);
		add(_note_six3P);
		add(_note_six3R);

		add(_note_six4);
		add(_note_six4P);
		add(_note_six4R);

		add(_note_six5);
		add(_note_six5P);
		add(_note_six5R);

		add(_note_six6);
		add(_note_six6P);
		add(_note_six6R);

		// 7K

		add(_note_seven1);
		add(_note_seven1P);
		add(_note_seven1R);

		add(_note_seven2);
		add(_note_seven2P);
		add(_note_seven2R);

		add(_note_seven3);
		add(_note_seven3P);
		add(_note_seven3R);

		add(_note_seven4);
		add(_note_seven4P);
		add(_note_seven4R);

		add(_note_seven5);
		add(_note_seven5P);
		add(_note_seven5R);

		add(_note_seven6);
		add(_note_seven6P);
		add(_note_seven6R);

		add(_note_seven7);
		add(_note_seven7P);
		add(_note_seven7R);

		// 8K

		add(_note_eight1);
		add(_note_eight1P);
		add(_note_eight1R);

		add(_note_eight2);
		add(_note_eight2P);
		add(_note_eight2R);

		add(_note_eight3);
		add(_note_eight3P);
		add(_note_eight3R);

		add(_note_eight4);
		add(_note_eight4P);
		add(_note_eight4R);

		add(_note_eight5);
		add(_note_eight5P);
		add(_note_eight5R);

		
		add(_note_eight6);
		add(_note_eight6P);
		add(_note_eight6R);

		add(_note_eight7);
		add(_note_eight7P);
		add(_note_eight7R);

		add(_note_eight8);
		add(_note_eight8P);
		add(_note_eight8R);

		// 9K

		add(_note_nine1);
		add(_note_nine1P);
		add(_note_nine1R);

		add(_note_nine2);
		add(_note_nine2P);
		add(_note_nine2R);

		add(_note_nine3);
		add(_note_nine3P);
		add(_note_nine3R);

		add(_note_nine4);
		add(_note_nine4P);
		add(_note_nine4R);

		add(_note_nine5);
		add(_note_nine5P);
		add(_note_nine5R);

		add(_note_nine6);
		add(_note_nine6P);
		add(_note_nine6R);

		add(_note_nine7);
		add(_note_nine7P);
		add(_note_nine7R);

		add(_note_nine8);
		add(_note_nine8P);
		add(_note_nine8R);

		add(_note_nine9);
		add(_note_nine9P);
		add(_note_nine9R);
		
		add(_accept);
		add(_back);
		add(_pause);
		add(_reset);

		for (action in digitalActions)
			byName[action.name] = action;

		setKeyboardScheme(scheme, false);
	}
	#else
	public function new(name, scheme:KeyboardScheme = null)
	{
		super(name);

		add(_ui_up);
		add(_ui_left);
		add(_ui_right);
		add(_ui_down);
		add(_ui_upP);
		add(_ui_leftP);
		add(_ui_rightP);
		add(_ui_downP);
		add(_ui_upR);
		add(_ui_leftR);
		add(_ui_rightR);
		add(_ui_downR);
		
		// 1K

		add(_note_one);
		add(_note_oneP);
		add(_note_oneR);

		// 2K

		add(_note_two1);
		add(_note_two1P);
		add(_note_two1R);

		add(_note_two2);
		add(_note_two2P);
		add(_note_two2R);

		// 3K

		add(_note_three1);
		add(_note_three1P);
		add(_note_three1R);

		add(_note_three2);
		add(_note_three2P);
		add(_note_three2R);

		add(_note_three3);
		add(_note_three3P);
		add(_note_three3R);
		
		// 4K

		add(_note_left);
		add(_note_leftP);
		add(_note_leftR);

		add(_note_down);
		add(_note_downP);
		add(_note_downR);

		add(_note_up);
		add(_note_upP);
		add(_note_upR);

		add(_note_right);
		add(_note_rightP);
		add(_note_rightR);

		// 5K
		
		add(_note_five1);
		add(_note_five1P);
		add(_note_five1R);

		add(_note_five2);
		add(_note_five2P);
		add(_note_five2R);

		add(_note_five3);
		add(_note_five3P);
		add(_note_five3R);

		add(_note_five4);
		add(_note_five4P);
		add(_note_five4R);

		add(_note_five5);
		add(_note_five5P);
		add(_note_five5R);

		// 6K
		
		add(_note_six1);
		add(_note_six1P);
		add(_note_six1R);

		add(_note_six2);
		add(_note_six2P);
		add(_note_six2R);

		add(_note_six3);
		add(_note_six3P);
		add(_note_six3R);

		add(_note_six4);
		add(_note_six4P);
		add(_note_six4R);

		add(_note_six5);
		add(_note_six5P);
		add(_note_six5R);

		add(_note_six6);
		add(_note_six6P);
		add(_note_six6R);

		// 7K

		add(_note_seven1);
		add(_note_seven1P);
		add(_note_seven1R);

		add(_note_seven2);
		add(_note_seven2P);
		add(_note_seven2R);

		add(_note_seven3);
		add(_note_seven3P);
		add(_note_seven3R);

		add(_note_seven4);
		add(_note_seven4P);
		add(_note_seven4R);

		add(_note_seven5);
		add(_note_seven5P);
		add(_note_seven5R);

		add(_note_seven6);
		add(_note_seven6P);
		add(_note_seven6R);

		add(_note_seven7);
		add(_note_seven7P);
		add(_note_seven7R);

		// 8K

		add(_note_eight1);
		add(_note_eight1P);
		add(_note_eight1R);

		add(_note_eight2);
		add(_note_eight2P);
		add(_note_eight2R);

		add(_note_eight3);
		add(_note_eight3P);
		add(_note_eight3R);

		add(_note_eight4);
		add(_note_eight4P);
		add(_note_eight4R);

		add(_note_eight5);
		add(_note_eight5P);
		add(_note_eight5R);

		
		add(_note_eight6);
		add(_note_eight6P);
		add(_note_eight6R);

		add(_note_eight7);
		add(_note_eight7P);
		add(_note_eight7R);

		add(_note_eight8);
		add(_note_eight8P);
		add(_note_eight8R);

		// 9K

		add(_note_nine1);
		add(_note_nine1P);
		add(_note_nine1R);

		add(_note_nine2);
		add(_note_nine2P);
		add(_note_nine2R);

		add(_note_nine3);
		add(_note_nine3P);
		add(_note_nine3R);

		add(_note_nine4);
		add(_note_nine4P);
		add(_note_nine4R);

		add(_note_nine5);
		add(_note_nine5P);
		add(_note_nine5R);

		add(_note_nine6);
		add(_note_nine6P);
		add(_note_nine6R);

		add(_note_nine7);
		add(_note_nine7P);
		add(_note_nine7R);

		add(_note_nine8);
		add(_note_nine8P);
		add(_note_nine8R);

		add(_note_nine9);
		add(_note_nine9P);
		add(_note_nine9R);

		add(_accept);
		add(_back);
		add(_pause);
		add(_reset);

		for (action in digitalActions)
			byName[action.name] = action;
			
		if (scheme == null)
			scheme = None;
		setKeyboardScheme(scheme, false);
	}
	#end

	override function update()
	{
		super.update();
	}

	// inline
	public function checkByName(name:Action):Bool
	{
		#if debug
		if (!byName.exists(name))
			throw 'Invalid name: $name';
		#end
		return byName[name].check();
	}

	public function getDialogueName(action:FlxActionDigital):String
	{
		var input = action.inputs[0];
		return switch input.device
		{
			case KEYBOARD: return '[${(input.inputID : FlxKey)}]';
			case GAMEPAD: return '(${(input.inputID : FlxGamepadInputID)})';
			case device: throw 'unhandled device: $device';
		}
	}

	public function getDialogueNameFromToken(token:String):String
	{
		return getDialogueName(getActionFromControl(Control.createByName(token.toUpperCase())));
	}

	function getActionFromControl(control:Control):FlxActionDigital
	{
		return switch (control)
		{
			case UI_UP: _ui_up;
			case UI_DOWN: _ui_down;
			case UI_LEFT: _ui_left;
			case UI_RIGHT: _ui_right;

			// 1K

			case NOTE_ONE: _note_one;

			// 2K

			case NOTE_TWO1: _note_two1;
			case NOTE_TWO2: _note_two2;

			// 3K

			case NOTE_THREE1: _note_three1;
			case NOTE_THREE2: _note_three2;
			case NOTE_THREE3: _note_three3;
			
			// 4K

			case NOTE_LEFT: _note_left;
			case NOTE_DOWN: _note_down;
			case NOTE_UP: _note_up;
			case NOTE_RIGHT: _note_right;

			// 5K

			case NOTE_FIVE1: _note_five1;
			case NOTE_FIVE2: _note_five2;
			case NOTE_FIVE3: _note_five3;
			case NOTE_FIVE4: _note_five4;
			case NOTE_FIVE5: _note_five5;
			
			// 6K

			case NOTE_SIX1: _note_six1;
			case NOTE_SIX2: _note_six2;
			case NOTE_SIX3: _note_six3;
			case NOTE_SIX4: _note_six4;
			case NOTE_SIX5: _note_six5;
			case NOTE_SIX6: _note_six6;

			// 7K

			case NOTE_SEVEN1: _note_seven1;
			case NOTE_SEVEN2: _note_seven2;
			case NOTE_SEVEN3: _note_seven3;
			case NOTE_SEVEN4: _note_seven4;
			case NOTE_SEVEN5: _note_seven5;
			case NOTE_SEVEN6: _note_seven6;
			case NOTE_SEVEN7: _note_seven7;

			// 8K

			case NOTE_EIGHT1: _note_eight1;
			case NOTE_EIGHT2: _note_eight2;
			case NOTE_EIGHT3: _note_eight3;
			case NOTE_EIGHT4: _note_eight4;
			case NOTE_EIGHT5: _note_eight5;
			case NOTE_EIGHT6: _note_eight6;
			case NOTE_EIGHT7: _note_eight7;
			case NOTE_EIGHT8: _note_eight8;

			// 9K
			
			case NOTE_NINE1: _note_nine1;
			case NOTE_NINE2: _note_nine2;
			case NOTE_NINE3: _note_nine3;
			case NOTE_NINE4: _note_nine4;
			case NOTE_NINE5: _note_nine5;
			case NOTE_NINE6: _note_nine6;
			case NOTE_NINE7: _note_nine7;
			case NOTE_NINE8: _note_nine8;
			case NOTE_NINE9: _note_nine9;

			case ACCEPT: _accept;
			case BACK: _back;
			case PAUSE: _pause;
			case RESET: _reset;
		}
	}

	static function init():Void
	{
		var actions = new FlxActionManager();
		FlxG.inputs.add(actions);
	}

	/**
	 * Calls a function passing each action bound by the specified control
	 * @param control
	 * @param func
	 * @return ->Void)
	 */
	function forEachBound(control:Control, func:FlxActionDigital->FlxInputState->Void)
	{
		switch (control)
		{
			case UI_UP:
				func(_ui_up, PRESSED);
				func(_ui_upP, JUST_PRESSED);
				func(_ui_upR, JUST_RELEASED);
			case UI_LEFT:
				func(_ui_left, PRESSED);
				func(_ui_leftP, JUST_PRESSED);
				func(_ui_leftR, JUST_RELEASED);
			case UI_RIGHT:
				func(_ui_right, PRESSED);
				func(_ui_rightP, JUST_PRESSED);
				func(_ui_rightR, JUST_RELEASED);
			case UI_DOWN:
				func(_ui_down, PRESSED);
				func(_ui_downP, JUST_PRESSED);
				func(_ui_downR, JUST_RELEASED);

			// 1K

			case NOTE_ONE:
				func(_note_one, PRESSED);
				func(_note_oneP, JUST_PRESSED);
				func(_note_oneR, JUST_RELEASED);

			// 2K

			case NOTE_TWO1:
				func(_note_two1, PRESSED);
				func(_note_two1P, JUST_PRESSED);
				func(_note_two1R, JUST_RELEASED);

			case NOTE_TWO2:
				func(_note_two2, PRESSED);
				func(_note_two2P, JUST_PRESSED);
				func(_note_two2R, JUST_RELEASED);

			// 3K

			case NOTE_THREE1:
				func(_note_three1, PRESSED);
				func(_note_three1P, JUST_PRESSED);
				func(_note_three1R, JUST_RELEASED);

			case NOTE_THREE2:
				func(_note_three2, PRESSED);
				func(_note_three2P, JUST_PRESSED);
				func(_note_three2R, JUST_RELEASED);

			case NOTE_THREE3:
				func(_note_three3, PRESSED);
				func(_note_three3P, JUST_PRESSED);
				func(_note_three3R, JUST_RELEASED);
			
			// 4K

			case NOTE_LEFT:
				func(_note_left, PRESSED);
				func(_note_leftP, JUST_PRESSED);
				func(_note_leftR, JUST_RELEASED);
			
			case NOTE_DOWN:
				func(_note_down, PRESSED);
				func(_note_downP, JUST_PRESSED);
				func(_note_downR, JUST_RELEASED);
	
			case NOTE_UP:
				func(_note_up, PRESSED);
				func(_note_upP, JUST_PRESSED);
				func(_note_upR, JUST_RELEASED);
	
			case NOTE_RIGHT:
				func(_note_right, PRESSED);
				func(_note_rightP, JUST_PRESSED);
				func(_note_rightR, JUST_RELEASED);

			// 5K

			case NOTE_FIVE1:
				func(_note_five1, PRESSED);
				func(_note_five1P, JUST_PRESSED);
				func(_note_five1R, JUST_RELEASED);

			case NOTE_FIVE2:
				func(_note_five2, PRESSED);
				func(_note_five2P, JUST_PRESSED);
				func(_note_five2R, JUST_RELEASED);

			case NOTE_FIVE3:
				func(_note_five3, PRESSED);
				func(_note_five3P, JUST_PRESSED);
				func(_note_five3R, JUST_RELEASED);

			case NOTE_FIVE4:
				func(_note_five4, PRESSED);
				func(_note_five4P, JUST_PRESSED);
				func(_note_five4R, JUST_RELEASED);

			case NOTE_FIVE5:
				func(_note_five5, PRESSED);
				func(_note_five5P, JUST_PRESSED);
				func(_note_five5R, JUST_RELEASED);

			// 6K

			case NOTE_SIX1:
				func(_note_six1, PRESSED);
				func(_note_six1P, JUST_PRESSED);
				func(_note_six1R, JUST_RELEASED);

			case NOTE_SIX2:
				func(_note_six2, PRESSED);
				func(_note_six2P, JUST_PRESSED);
				func(_note_six2R, JUST_RELEASED);

			case NOTE_SIX3:
				func(_note_six3, PRESSED);
				func(_note_six3P, JUST_PRESSED);
				func(_note_six3R, JUST_RELEASED);

			case NOTE_SIX4:
				func(_note_six4, PRESSED);
				func(_note_six4P, JUST_PRESSED);
				func(_note_six4R, JUST_RELEASED);

			case NOTE_SIX5:
				func(_note_six5, PRESSED);
				func(_note_six5P, JUST_PRESSED);
				func(_note_six5R, JUST_RELEASED);

			case NOTE_SIX6:
				func(_note_six6, PRESSED);
				func(_note_six6P, JUST_PRESSED);
				func(_note_six6R, JUST_RELEASED);

			// 7K

			case NOTE_SEVEN1:
				func(_note_seven1, PRESSED);
				func(_note_seven1P, JUST_PRESSED);
				func(_note_seven1R, JUST_RELEASED);

			case NOTE_SEVEN2:
				func(_note_seven2, PRESSED);
				func(_note_seven2P, JUST_PRESSED);
				func(_note_seven2R, JUST_RELEASED);

			case NOTE_SEVEN3:
				func(_note_seven3, PRESSED);
				func(_note_seven3P, JUST_PRESSED);
				func(_note_seven3R, JUST_RELEASED);

			case NOTE_SEVEN4:
				func(_note_seven4, PRESSED);
				func(_note_seven4P, JUST_PRESSED);
				func(_note_seven4R, JUST_RELEASED);

			case NOTE_SEVEN5:
				func(_note_seven5, PRESSED);
				func(_note_seven5P, JUST_PRESSED);
				func(_note_seven5R, JUST_RELEASED);

			case NOTE_SEVEN6:
				func(_note_seven6, PRESSED);
				func(_note_seven6P, JUST_PRESSED);
				func(_note_seven6R, JUST_RELEASED);

			case NOTE_SEVEN7:
				func(_note_seven7, PRESSED);
				func(_note_seven7P, JUST_PRESSED);
				func(_note_seven7R, JUST_RELEASED);

			// 8K

			case NOTE_EIGHT1:
				func(_note_eight1, PRESSED);
				func(_note_eight1P, JUST_PRESSED);
				func(_note_eight1R, JUST_RELEASED);

			case NOTE_EIGHT2:
				func(_note_eight2, PRESSED);
				func(_note_eight2P, JUST_PRESSED);
				func(_note_eight2R, JUST_RELEASED);

			case NOTE_EIGHT3:
				func(_note_eight3, PRESSED);
				func(_note_eight3P, JUST_PRESSED);
				func(_note_eight3R, JUST_RELEASED);

			case NOTE_EIGHT4:
				func(_note_eight4, PRESSED);
				func(_note_eight4P, JUST_PRESSED);
				func(_note_eight4R, JUST_RELEASED);

			case NOTE_EIGHT5:
				func(_note_eight5, PRESSED);
				func(_note_eight5P, JUST_PRESSED);
				func(_note_eight5R, JUST_RELEASED);

			case NOTE_EIGHT6:
				func(_note_eight6, PRESSED);
				func(_note_eight6P, JUST_PRESSED);
				func(_note_eight6R, JUST_RELEASED);

			case NOTE_EIGHT7:
				func(_note_eight7, PRESSED);
				func(_note_eight7P, JUST_PRESSED);
				func(_note_eight7R, JUST_RELEASED);

			case NOTE_EIGHT8:
				func(_note_eight8, PRESSED);
				func(_note_eight8P, JUST_PRESSED);
				func(_note_eight8R, JUST_RELEASED);

			// 9K

			case NOTE_NINE1:
				func(_note_nine1, PRESSED);
				func(_note_nine1P, JUST_PRESSED);
				func(_note_nine1R, JUST_RELEASED);

			case NOTE_NINE2:
				func(_note_nine2, PRESSED);
				func(_note_nine2P, JUST_PRESSED);
				func(_note_nine2R, JUST_RELEASED);

			case NOTE_NINE3:
				func(_note_nine3, PRESSED);
				func(_note_nine3P, JUST_PRESSED);
				func(_note_nine3R, JUST_RELEASED);

			case NOTE_NINE4:
				func(_note_nine4, PRESSED);
				func(_note_nine4P, JUST_PRESSED);
				func(_note_nine4R, JUST_RELEASED);

			case NOTE_NINE5:
				func(_note_nine5, PRESSED);
				func(_note_nine5P, JUST_PRESSED);
				func(_note_nine5R, JUST_RELEASED);

			case NOTE_NINE6:
				func(_note_nine6, PRESSED);
				func(_note_nine6P, JUST_PRESSED);
				func(_note_nine6R, JUST_RELEASED);

			case NOTE_NINE7:
				func(_note_nine7, PRESSED);
				func(_note_nine7P, JUST_PRESSED);
				func(_note_nine7R, JUST_RELEASED);

			case NOTE_NINE8:
				func(_note_nine8, PRESSED);
				func(_note_nine8P, JUST_PRESSED);
				func(_note_nine8R, JUST_RELEASED);

			case NOTE_NINE9:
				func(_note_nine9, PRESSED);
				func(_note_nine9P, JUST_PRESSED);
				func(_note_nine9R, JUST_RELEASED);

			case ACCEPT:
				func(_accept, JUST_PRESSED);
			case BACK:
				func(_back, JUST_PRESSED);
			case PAUSE:
				func(_pause, JUST_PRESSED);
			case RESET:
				func(_reset, JUST_PRESSED);
		}
	}

	public function replaceBinding(control:Control, device:Device, ?toAdd:Int, ?toRemove:Int)
	{
		if (toAdd == toRemove)
			return;

		switch (device)
		{
			case Keys:
				if (toRemove != null)
					unbindKeys(control, [toRemove]);
				if (toAdd != null)
					bindKeys(control, [toAdd]);

			case Gamepad(id):
				if (toRemove != null)
					unbindButtons(control, id, [toRemove]);
				if (toAdd != null)
					bindButtons(control, id, [toAdd]);
		}
	}

	public function copyFrom(controls:Controls, ?device:Device)
	{
		#if (haxe >= "4.0.0")
		for (name => action in controls.byName)
		{
			for (input in action.inputs)
			{
				if (device == null || isDevice(input, device))
					byName[name].add(cast input);
			}
		}
		#else
		for (name in controls.byName.keys())
		{
			var action = controls.byName[name];
			for (input in action.inputs)
			{
				if (device == null || isDevice(input, device))
				byName[name].add(cast input);
			}
		}
		#end

		switch (device)
		{
			case null:
				// add all
				#if (haxe >= "4.0.0")
				for (gamepad in controls.gamepadsAdded)
					if (!gamepadsAdded.contains(gamepad))
						gamepadsAdded.push(gamepad);
				#else
				for (gamepad in controls.gamepadsAdded)
					if (gamepadsAdded.indexOf(gamepad) == -1)
					  gamepadsAdded.push(gamepad);
				#end

				mergeKeyboardScheme(controls.keyboardScheme);

			case Gamepad(id):
				gamepadsAdded.push(id);
			case Keys:
				mergeKeyboardScheme(controls.keyboardScheme);
		}
	}

	inline public function copyTo(controls:Controls, ?device:Device)
	{
		controls.copyFrom(this, device);
	}

	function mergeKeyboardScheme(scheme:KeyboardScheme):Void
	{
		if (scheme != None)
		{
			switch (keyboardScheme)
			{
				case None:
					keyboardScheme = scheme;
				default:
					keyboardScheme = Custom;
			}
		}
	}

	/**
	 * Sets all actions that pertain to the binder to trigger when the supplied keys are used.
	 * If binder is a literal you can inline this
	 */
	public function bindKeys(control:Control, keys:Array<FlxKey>)
	{
		var copyKeys:Array<FlxKey> = keys.copy();
		for (i in 0...copyKeys.length) {
			if(i == NONE) copyKeys.remove(i);
		}

		#if (haxe >= "4.0.0")
		inline forEachBound(control, (action, state) -> addKeys(action, copyKeys, state));
		#else
		forEachBound(control, function(action, state) addKeys(action, copyKeys, state));
		#end
	}

	/**
	 * Sets all actions that pertain to the binder to trigger when the supplied keys are used.
	 * If binder is a literal you can inline this
	 */
	public function unbindKeys(control:Control, keys:Array<FlxKey>)
	{
		var copyKeys:Array<FlxKey> = keys.copy();
		for (i in 0...copyKeys.length) {
			if(i == NONE) copyKeys.remove(i);
		}

		#if (haxe >= "4.0.0")
		inline forEachBound(control, (action, _) -> removeKeys(action, copyKeys));
		#else
		forEachBound(control, function(action, _) removeKeys(action, copyKeys));
		#end
	}

	inline static function addKeys(action:FlxActionDigital, keys:Array<FlxKey>, state:FlxInputState)
	{
		for (key in keys)
			if(key != NONE)
				action.addKey(key, state);
	}

	static function removeKeys(action:FlxActionDigital, keys:Array<FlxKey>)
	{
		var i = action.inputs.length;
		while (i-- > 0)
		{
			var input = action.inputs[i];
			if (input.device == KEYBOARD && keys.indexOf(cast input.inputID) != -1)
				action.remove(input);
		}
	}

	public function setKeyboardScheme(scheme:KeyboardScheme, reset = true)
	{
		if (reset)
			removeKeyboard();

		keyboardScheme = scheme;
		var keysMap = ClientPrefs.keyBinds;
		
		#if (haxe >= "4.0.0")
		switch (scheme)
		{
			case Solo:
				inline bindKeys(Control.UI_UP, keysMap.get('ui_up'));
				inline bindKeys(Control.UI_DOWN, keysMap.get('ui_down'));
				inline bindKeys(Control.UI_LEFT, keysMap.get('ui_left'));
				inline bindKeys(Control.UI_RIGHT, keysMap.get('ui_right'));

				// 1K

				inline bindKeys(Control.NOTE_ONE, keysMap.get('note_one'));

				// 2K

				inline bindKeys(Control.NOTE_TWO1, keysMap.get('note_two1'));
				inline bindKeys(Control.NOTE_TWO2, keysMap.get('note_two2'));

				// 3K

				inline bindKeys(Control.NOTE_THREE1, keysMap.get('note_three1'));
				inline bindKeys(Control.NOTE_THREE2, keysMap.get('note_three2'));
				inline bindKeys(Control.NOTE_THREE3, keysMap.get('note_three3'));
				
				// 4K

				inline bindKeys(Control.NOTE_LEFT, keysMap.get('note_left'));
				inline bindKeys(Control.NOTE_DOWN, keysMap.get('note_down'));
				inline bindKeys(Control.NOTE_UP, keysMap.get('note_up'));
				inline bindKeys(Control.NOTE_RIGHT, keysMap.get('note_right'));

				// 5K

				inline bindKeys(Control.NOTE_FIVE1, keysMap.get('note_five1'));
				inline bindKeys(Control.NOTE_FIVE2, keysMap.get('note_five2'));
				inline bindKeys(Control.NOTE_FIVE3, keysMap.get('note_five3'));
				inline bindKeys(Control.NOTE_FIVE4, keysMap.get('note_five4'));
				inline bindKeys(Control.NOTE_FIVE5, keysMap.get('note_five5'));

				// 6K

				inline bindKeys(Control.NOTE_SIX1, keysMap.get('note_six1'));
				inline bindKeys(Control.NOTE_SIX2, keysMap.get('note_six2'));
				inline bindKeys(Control.NOTE_SIX3, keysMap.get('note_six3'));
				inline bindKeys(Control.NOTE_SIX4, keysMap.get('note_six4'));
				inline bindKeys(Control.NOTE_SIX5, keysMap.get('note_six5'));
				inline bindKeys(Control.NOTE_SIX6, keysMap.get('note_six6'));

				// 7K

				inline bindKeys(Control.NOTE_SEVEN1, keysMap.get('note_seven1'));
				inline bindKeys(Control.NOTE_SEVEN2, keysMap.get('note_seven2'));
				inline bindKeys(Control.NOTE_SEVEN3, keysMap.get('note_seven3'));
				inline bindKeys(Control.NOTE_SEVEN4, keysMap.get('note_seven4'));
				inline bindKeys(Control.NOTE_SEVEN5, keysMap.get('note_seven5'));
				inline bindKeys(Control.NOTE_SEVEN6, keysMap.get('note_seven6'));
				inline bindKeys(Control.NOTE_SEVEN7, keysMap.get('note_seven7'));

				// 8K

				inline bindKeys(Control.NOTE_EIGHT1, keysMap.get('note_eight1'));
				inline bindKeys(Control.NOTE_EIGHT2, keysMap.get('note_eight2'));
				inline bindKeys(Control.NOTE_EIGHT3, keysMap.get('note_eight3'));
				inline bindKeys(Control.NOTE_EIGHT4, keysMap.get('note_eight4'));
				inline bindKeys(Control.NOTE_EIGHT5, keysMap.get('note_eight5'));
				inline bindKeys(Control.NOTE_EIGHT6, keysMap.get('note_eight6'));
				inline bindKeys(Control.NOTE_EIGHT7, keysMap.get('note_eight7'));
				inline bindKeys(Control.NOTE_EIGHT8, keysMap.get('note_eight8'));
				
				// 9K

				inline bindKeys(Control.NOTE_NINE1, keysMap.get('note_nine1'));
				inline bindKeys(Control.NOTE_NINE2, keysMap.get('note_nine2'));
				inline bindKeys(Control.NOTE_NINE3, keysMap.get('note_nine3'));
				inline bindKeys(Control.NOTE_NINE4, keysMap.get('note_nine4'));
				inline bindKeys(Control.NOTE_NINE5, keysMap.get('note_nine5'));
				inline bindKeys(Control.NOTE_NINE6, keysMap.get('note_nine6'));
				inline bindKeys(Control.NOTE_NINE7, keysMap.get('note_nine7'));
				inline bindKeys(Control.NOTE_NINE8, keysMap.get('note_nine8'));
				inline bindKeys(Control.NOTE_NINE9, keysMap.get('note_nine9'));

				inline bindKeys(Control.ACCEPT, keysMap.get('accept'));
				inline bindKeys(Control.BACK, keysMap.get('back'));
				inline bindKeys(Control.PAUSE, keysMap.get('pause'));
				inline bindKeys(Control.RESET, keysMap.get('reset'));
			case Duo(true):
				inline bindKeys(Control.UI_UP, [W]);
				inline bindKeys(Control.UI_DOWN, [S]);
				inline bindKeys(Control.UI_LEFT, [A]);
				inline bindKeys(Control.UI_RIGHT, [D]);
				inline bindKeys(Control.NOTE_UP, [W]);
				inline bindKeys(Control.NOTE_DOWN, [S]);
				inline bindKeys(Control.NOTE_LEFT, [A]);
				inline bindKeys(Control.NOTE_RIGHT, [D]);
				inline bindKeys(Control.ACCEPT, [G, Z]);
				inline bindKeys(Control.BACK, [H, X]);
				inline bindKeys(Control.PAUSE, [ONE]);
				inline bindKeys(Control.RESET, [R]);
			case Duo(false):
				inline bindKeys(Control.UI_UP, [FlxKey.UP]);
				inline bindKeys(Control.UI_DOWN, [FlxKey.DOWN]);
				inline bindKeys(Control.UI_LEFT, [FlxKey.LEFT]);
				inline bindKeys(Control.UI_RIGHT, [FlxKey.RIGHT]);
				inline bindKeys(Control.NOTE_UP, [FlxKey.UP]);
				inline bindKeys(Control.NOTE_DOWN, [FlxKey.DOWN]);
				inline bindKeys(Control.NOTE_LEFT, [FlxKey.LEFT]);
				inline bindKeys(Control.NOTE_RIGHT, [FlxKey.RIGHT]);
				inline bindKeys(Control.ACCEPT, [O]);
				inline bindKeys(Control.BACK, [P]);
				inline bindKeys(Control.PAUSE, [ENTER]);
				inline bindKeys(Control.RESET, [BACKSPACE]);
			case None: // nothing
			case Custom: // nothing
		}
		#else
		switch (scheme)
		{
			case Solo:
				bindKeys(Control.UI_UP, [W, FlxKey.UP]);
				bindKeys(Control.UI_DOWN, [S, FlxKey.DOWN]);
				bindKeys(Control.UI_LEFT, [A, FlxKey.LEFT]);
				bindKeys(Control.UI_RIGHT, [D, FlxKey.RIGHT]);
				bindKeys(Control.NOTE_UP, [W, FlxKey.UP]);
				bindKeys(Control.NOTE_DOWN, [S, FlxKey.DOWN]);
				bindKeys(Control.NOTE_LEFT, [A, FlxKey.LEFT]);
				bindKeys(Control.NOTE_RIGHT, [D, FlxKey.RIGHT]);
				bindKeys(Control.ACCEPT, [Z, SPACE, ENTER]);
				bindKeys(Control.BACK, [BACKSPACE, ESCAPE]);
				bindKeys(Control.PAUSE, [P, ENTER, ESCAPE]);
				bindKeys(Control.RESET, [R]);
			case Duo(true):
				bindKeys(Control.UI_UP, [W]);
				bindKeys(Control.UI_DOWN, [S]);
				bindKeys(Control.UI_LEFT, [A]);
				bindKeys(Control.UI_RIGHT, [D]);
				bindKeys(Control.NOTE_UP, [W]);
				bindKeys(Control.NOTE_DOWN, [S]);
				bindKeys(Control.NOTE_LEFT, [A]);
				bindKeys(Control.NOTE_RIGHT, [D]);
				bindKeys(Control.ACCEPT, [G, Z]);
				bindKeys(Control.BACK, [H, X]);
				bindKeys(Control.PAUSE, [ONE]);
				bindKeys(Control.RESET, [R]);
			case Duo(false):
				bindKeys(Control.UI_UP, [FlxKey.UP]);
				bindKeys(Control.UI_DOWN, [FlxKey.DOWN]);
				bindKeys(Control.UI_LEFT, [FlxKey.LEFT]);
				bindKeys(Control.UI_RIGHT, [FlxKey.RIGHT]);
				bindKeys(Control.NOTE_UP, [FlxKey.UP]);
				bindKeys(Control.NOTE_DOWN, [FlxKey.DOWN]);
				bindKeys(Control.NOTE_LEFT, [FlxKey.LEFT]);
				bindKeys(Control.NOTE_RIGHT, [FlxKey.RIGHT]);
				bindKeys(Control.ACCEPT, [O]);
				bindKeys(Control.BACK, [P]);
				bindKeys(Control.PAUSE, [ENTER]);
				bindKeys(Control.RESET, [BACKSPACE]);
			case None: // nothing
			case Custom: // nothing
		}
		#end
	}

	function removeKeyboard()
	{
		for (action in this.digitalActions)
		{
			var i = action.inputs.length;
			while (i-- > 0)
			{
				var input = action.inputs[i];
				if (input.device == KEYBOARD)
					action.remove(input);
			}
		}
	}

	public function addGamepad(id:Int, ?buttonMap:Map<Control, Array<FlxGamepadInputID>>):Void
	{
		gamepadsAdded.push(id);
		
		#if (haxe >= "4.0.0")
		for (control => buttons in buttonMap)
			inline bindButtons(control, id, buttons);
		#else
		for (control in buttonMap.keys())
			bindButtons(control, id, buttonMap[control]);
		#end
	}

	inline function addGamepadLiteral(id:Int, ?buttonMap:Map<Control, Array<FlxGamepadInputID>>):Void
	{
		gamepadsAdded.push(id);

		#if (haxe >= "4.0.0")
		for (control => buttons in buttonMap)
			inline bindButtons(control, id, buttons);
		#else
		for (control in buttonMap.keys())
			bindButtons(control, id, buttonMap[control]);
		#end
	}

	public function removeGamepad(deviceID:Int = FlxInputDeviceID.ALL):Void
	{
		for (action in this.digitalActions)
		{
			var i = action.inputs.length;
			while (i-- > 0)
			{
				var input = action.inputs[i];
				if (input.device == GAMEPAD && (deviceID == FlxInputDeviceID.ALL || input.deviceID == deviceID))
					action.remove(input);
			}
		}

		gamepadsAdded.remove(deviceID);
	}

	public function addDefaultGamepad(id):Void
	{
		#if !switch
		addGamepadLiteral(id, [
			Control.ACCEPT => [A, START],
			Control.BACK => [B],
			Control.UI_UP => [DPAD_UP, LEFT_STICK_DIGITAL_UP],
			Control.UI_DOWN => [DPAD_DOWN, LEFT_STICK_DIGITAL_DOWN],
			Control.UI_LEFT => [DPAD_LEFT, LEFT_STICK_DIGITAL_LEFT],
			Control.UI_RIGHT => [DPAD_RIGHT, LEFT_STICK_DIGITAL_RIGHT],
			Control.NOTE_UP => [DPAD_UP, LEFT_STICK_DIGITAL_UP, RIGHT_STICK_DIGITAL_UP, Y],
			Control.NOTE_DOWN => [DPAD_DOWN, LEFT_STICK_DIGITAL_DOWN, RIGHT_STICK_DIGITAL_DOWN, A],
			Control.NOTE_LEFT => [DPAD_LEFT, LEFT_STICK_DIGITAL_LEFT, RIGHT_STICK_DIGITAL_LEFT, X],
			Control.NOTE_RIGHT => [DPAD_RIGHT, LEFT_STICK_DIGITAL_RIGHT, RIGHT_STICK_DIGITAL_RIGHT, B],
			Control.PAUSE => [START],
			Control.RESET => [8]
		]);
		#else
		addGamepadLiteral(id, [
			//Swap A and B for switch
			Control.ACCEPT => [B, START],
			Control.BACK => [A],
			Control.UI_UP => [DPAD_UP, LEFT_STICK_DIGITAL_UP, RIGHT_STICK_DIGITAL_UP],
			Control.UI_DOWN => [DPAD_DOWN, LEFT_STICK_DIGITAL_DOWN, RIGHT_STICK_DIGITAL_DOWN],
			Control.UI_LEFT => [DPAD_LEFT, LEFT_STICK_DIGITAL_LEFT, RIGHT_STICK_DIGITAL_LEFT],
			Control.UI_RIGHT => [DPAD_RIGHT, LEFT_STICK_DIGITAL_RIGHT, RIGHT_STICK_DIGITAL_RIGHT],
			Control.NOTE_UP => [DPAD_UP, LEFT_STICK_DIGITAL_UP, RIGHT_STICK_DIGITAL_UP, X],
			Control.NOTE_DOWN => [DPAD_DOWN, LEFT_STICK_DIGITAL_DOWN, RIGHT_STICK_DIGITAL_DOWN, B],
			Control.NOTE_LEFT => [DPAD_LEFT, LEFT_STICK_DIGITAL_LEFT, RIGHT_STICK_DIGITAL_LEFT, Y],
			Control.NOTE_RIGHT => [DPAD_RIGHT, LEFT_STICK_DIGITAL_RIGHT, RIGHT_STICK_DIGITAL_RIGHT, A],
			Control.PAUSE => [START],
			Control.RESET => [8],
		]);
		#end
	}

	/**
	 * Sets all actions that pertain to the binder to trigger when the supplied keys are used.
	 * If binder is a literal you can inline this
	 */
	public function bindButtons(control:Control, id, buttons)
	{
		#if (haxe >= "4.0.0")
		inline forEachBound(control, (action, state) -> addButtons(action, buttons, state, id));
		#else
		forEachBound(control, function(action, state) addButtons(action, buttons, state, id));
		#end
	}

	/**
	 * Sets all actions that pertain to the binder to trigger when the supplied keys are used.
	 * If binder is a literal you can inline this
	 */
	public function unbindButtons(control:Control, gamepadID:Int, buttons)
	{
		#if (haxe >= "4.0.0")
		inline forEachBound(control, (action, _) -> removeButtons(action, gamepadID, buttons));
		#else
		forEachBound(control, function(action, _) removeButtons(action, gamepadID, buttons));
		#end
	}

	inline static function addButtons(action:FlxActionDigital, buttons:Array<FlxGamepadInputID>, state, id)
	{
		for (button in buttons)
			action.addGamepad(button, state, id);
	}

	static function removeButtons(action:FlxActionDigital, gamepadID:Int, buttons:Array<FlxGamepadInputID>)
	{
		var i = action.inputs.length;
		while (i-- > 0)
		{
			var input = action.inputs[i];
			if (isGamepad(input, gamepadID) && buttons.indexOf(cast input.inputID) != -1)
				action.remove(input);
		}
	}

	public function getInputsFor(control:Control, device:Device, ?list:Array<Int>):Array<Int>
	{
		if (list == null)
			list = [];

		switch (device)
		{
			case Keys:
				for (input in getActionFromControl(control).inputs)
				{
					if (input.device == KEYBOARD)
						list.push(input.inputID);
				}
			case Gamepad(id):
				for (input in getActionFromControl(control).inputs)
				{
					if (input.deviceID == id)
						list.push(input.inputID);
				}
		}
		return list;
	}

	public function removeDevice(device:Device)
	{
		switch (device)
		{
			case Keys:
				setKeyboardScheme(None);
			case Gamepad(id):
				removeGamepad(id);
		}
	}

	static function isDevice(input:FlxActionInput, device:Device)
	{
		return switch device
		{
			case Keys: input.device == KEYBOARD;
			case Gamepad(id): isGamepad(input, id);
		}
	}

	inline static function isGamepad(input:FlxActionInput, deviceID:Int)
	{
		return input.device == GAMEPAD && (deviceID == FlxInputDeviceID.ALL || input.deviceID == deviceID);
	}
}