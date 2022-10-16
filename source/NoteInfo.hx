package;

import haxe.Json;
#if sys
import sys.io.File;
import sys.FileSystem;
#end

using StringTools;

typedef NoteJSON = {
	var minMania:Null<Int>;
	var maxMania:Null<Int>;
	var defaultMania:Null<Int>;

	var noteScales:Array<Float>;

	var arrowColors:Array<Array<String>>;
	var arrowDirColors:Array<Array<String>>;

	var strumDirs:Array<Array<String>>;

	var splashNums:Array<Array<Int>>;

	var coolWidth:Null<Int>;
	var swagWidth:Array<Float>;
}

class NoteInfo
{
    // grape boy try not to steal tpose's ideas challenge 100% impossible
	// i turned this into leather engine but missing features!!

	// VARIABLES (DON'T EDIT THESE)

    public static var minMania:Int;
	public static var maxMania:Int;
	public static var defaultMania:Int;

	public static var noteScales:Array<Float>;

    public static var arrowColors:Array<Array<String>>;
    public static var arrowDirColors:Array<Array<String>>;

    public static var strumDirs:Array<Array<String>>;

    public static var splashNums:Array<Array<Int>>;

	public static var coolWidth:Int = 160;
	public static var radScales:Array<Float>;
    public static var swagWidth:Array<Int>;

	// FUNCTIONS

	public static function updateSwagWidth(?thingerArray:Array<Float>) {
		for (i in 0...thingerArray.length) {
			swagWidth[i] = Std.int(coolWidth * thingerArray[i]);
		}

		trace(swagWidth);
	}

    public static function getInfoFromJson(?swagUpdate:Bool = true) {
		trace('shadda fakkap');

		var stringJson:String = null;
		var noteInfo:NoteJSON;

		var exists:Bool = false;

		#if MOD_ALLOWED
		if (FileSystem.exists(Paths.modsJson('noteInfo')))
			exists = true;
		#else
		if (FileSystem.exists(Paths.json('noteInfo')))
			exists = true;
		#end

		// garbage function down below VVV
		// trace(Paths.fileExists('data/noteInfo.json', TEXT));

		if (exists) {
			trace('noteInfo.json found!');

			#if MODS_ALLOWED
			var moddyFile:String = Paths.modsJson('noteInfo.json');
			if(FileSystem.exists(moddyFile)) {
				stringJson = File.getContent(moddyFile).trim();
			}
			#end
			
			if (stringJson == null) {
				#if sys
				stringJson = File.getContent(Paths.json('noteInfo')).trim();
				#else
				stringJson = Assets.getText(Paths.json('noteInfo')).trim();
				#end
			}

			noteInfo = cast Json.parse(stringJson);

			// if (noteInfo. != null)

			if (noteInfo.minMania != null) {
				trace('NO WAY');
				trace(noteInfo.minMania);
				minMania = noteInfo.minMania;
			}

			if (noteInfo.maxMania != null)
			maxMania = noteInfo.maxMania;

			if (noteInfo.defaultMania != null)
			defaultMania = noteInfo.defaultMania;


			if (noteInfo.noteScales != null)
			noteScales = noteInfo.noteScales;


			if (noteInfo.arrowColors != null)
			arrowColors = noteInfo.arrowColors;

			if (noteInfo.arrowDirColors != null)
			arrowDirColors = noteInfo.arrowDirColors;


			if (noteInfo.strumDirs != null)
			strumDirs = noteInfo.strumDirs;


			if (noteInfo.splashNums != null)
			splashNums = noteInfo.splashNums;


			if (noteInfo.coolWidth != null)
			coolWidth = noteInfo.coolWidth;

			if (noteInfo.swagWidth != null && swagUpdate)
				updateSwagWidth(noteInfo.swagWidth);
			
		} else {
			trace('No noteInfo.json!');
		}
    }

	public static function resetOriginalVars() {

		// EDIT THESE FOR SOURCE MODS

		trace("RESETTING NoteInfo.hx...");

		minMania = 0;
		maxMania = 8;
		defaultMania = 3;

		//				1      2     3     4     5    6     7    8     9
		noteScales = [0.775, 0.75, 0.725, 0.7, 0.65, 0.6, 0.55, 0.5, 0.45];

		arrowColors = [

			[ "white" ], // 1K
	
			[ "purple", "red" ], // 2K
	
			[ "purple", "white", "red" ], // 3K
	
			[ "purple", "blue", "green", "red" ], // 4K
	
			[ "purple", "blue", "white", "green", "red" ], // 5K
	
			[ "purple", "green", "red", "yellow", "blue", "dark" ], // 6K
	
			[ "purple", "green", "red", "white", "yellow", "blue", "dark" ], // 7K
	
			[ "purple", "blue", "green", "red", "yellow", "violet", "black", "dark" ], // 8K
	
			[ "purple", "blue", "green", "red", "white", "yellow", "violet", "black", "dark" ] // 9K
	
		];
		arrowDirColors = [

			[ "white" ], // 1K
	
			[ "left", "right" ], // 2K
	
			[ "left", "white", "right" ], // 3K
	
			[ "left", "down", "up", "right" ], // 4K
	
			[ "left", "down", "white", "up", "right" ], // 5K
	
			[ "left", "up", "right", "yellow", "down", "dark" ], // 6K
	
			[ "left", "up", "right", "white", "yellow", "down", "dark" ], // 7K
	
			[ "left", "down", "up", "right", "yellow", "violet", "black", "dark" ], // 8K
	
			[ "left", "down", "up", "right", "white", "yellow", "violet", "black", "dark" ] // 9K
	
		];

		strumDirs = [

			[ "arrowSPACE" ],
	
			[ "arrowLEFT", "arrowRIGHT" ],
	
			[ "arrowLEFT", "arrowSPACE", "arrowRIGHT" ],
	
			[ "arrowLEFT", "arrowDOWN", "arrowUP", "arrowRIGHT" ],
	
			[ "arrowLEFT", "arrowDOWN", "arrowSPACE", "arrowUP", "arrowRIGHT" ],
	
			[ "arrowLEFT", "arrowUP", "arrowRIGHT", "arrowLEFT", "arrowDOWN", "arrowRIGHT" ],
	
			[ "arrowLEFT", "arrowUP", "arrowRIGHT", "arrowSPACE", "arrowLEFT", "arrowDOWN", "arrowRIGHT" ],
	
			[ "arrowLEFT", "arrowDOWN", "arrowUP", "arrowRIGHT", "arrowLEFT", "arrowDOWN", "arrowUP", "arrowRIGHT" ],
	
			[ "arrowLEFT", "arrowDOWN", "arrowUP", "arrowRIGHT", "arrowSPACE", "arrowLEFT", "arrowDOWN", "arrowUP", "arrowRIGHT" ]
	
		];

		splashNums = [

			[4], // 1K
	
			[0, 3], // 2K
	
			[0, 4, 3], // 3K
	
			[0, 1, 2, 3], // 4K
	
			[0, 1, 4, 2, 3], // 5K
	
			[0, 2, 3, 5, 1, 8], // 6K
	
			[0, 2, 3, 4, 5, 1, 8], // 7K
	
			[0, 1, 2, 3, 5, 6, 7, 8], // 8K
	
			[0, 1, 2, 3, 4, 5, 6, 7, 8] // 9K
	
		];

		coolWidth = 160;

		radScales = [
			0.775, 	// 1
			0.73, 	// 2
			0.725, 	// 3
			0.7, 	// 4
			0.65, 	// 5
			0.58, 	// 6
			0.53, 	// 7
			0.48, 	// 8
			0.43 	// 9
		];

		swagWidth = [];

		updateSwagWidth(radScales);

		trace("RESET NoteInfo.hx!");
	}

	public static function callAll() {
		resetOriginalVars();
		getInfoFromJson();
	}
}