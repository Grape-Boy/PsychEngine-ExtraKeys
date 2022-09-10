package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flash.display.BitmapData;
import editors.ChartingState;

using StringTools;

typedef EventNote = {
	strumTime:Float,
	event:String,
	value1:String,
	value2:String
}

class Note extends FlxSprite
{
	public var extraData:Map<String,Dynamic> = [];

	public static var minMania:Int = 0;
	public static var maxMania:Int = 8;
	public static var defaultMania:Int = 3;
	//											   1      2     3     4     5    6     7    8     9
	public static var noteScales:Array<Float> = [0.775, 0.75, 0.725, 0.7, 0.65, 0.6, 0.55, 0.5, 0.45]; // yeah

	public static var arrowColors:Array<Array<String>> = [ // yeah that's more efficient I think

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

	public static var arrowDirColors:Array<Array<String>> = [ // same thing but for the xml names

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

	public static var strumDirs:Array<Array<String>> = [

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

	public static var splashNums:Array<Array<Int>> = [

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

	public var strumTime:Float = 0;
	public var mustPress:Bool = false;
	public var noteData:Int = 0;
	public var mania:Int = 0;
	public var tMania:Int = 0;
	public var canBeHit:Bool = false;
	public var tooLate:Bool = false;
	public var wasGoodHit:Bool = false;
	public var ignoreNote:Bool = false;
	public var hitByOpponent:Bool = false;
	public var noteWasHit:Bool = false;
	public var prevNote:Note;
	public var nextNote:Note;

	public var spawned:Bool = false;

	public var tail:Array<Note> = []; // for sustains
	public var parent:Note;
	public var blockHit:Bool = false; // only works for player

	public var sustainLength:Float = 0;
	public var isSustainNote:Bool = false;
	public var noteType(default, set):String = null;

	public var eventName:String = '';
	public var eventLength:Int = 0;
	public var eventVal1:String = '';
	public var eventVal2:String = '';

	public var colorSwap:ColorSwap;
	public var inEditor:Bool = false;

	public var animSuffix:String = '';
	public var gfNote:Bool = false;
	public var earlyHitMult:Float = 0.5;
	public var lateHitMult:Float = 1;
	public var lowPriority:Bool = false;

	public static var swagWidth:Array<Int> = [
		Std.int(160 * 0.775), 	// 1
		Std.int(160 * 0.73), 	// 2
		Std.int(160 * 0.725), 	// 3
		Std.int(160 * 0.7), 	// 4
		Std.int(160 * 0.65), 	// 5
		Std.int(160 * 0.58), 	// 6
		Std.int(160 * 0.53), 	// 7
		Std.int(160 * 0.48), 	// 8
		Std.int(160 * 0.43) 	// 9
	]; // "why weird factors?" because the notes are too far apart if I don't // this is actually kinda cringe tbh

	public static var PURP_NOTE:Int = 0;
	public static var BLUE_NOTE:Int = 1;
	public static var GREEN_NOTE:Int = 2;
	public static var RED_NOTE:Int = 3;

	public static var WHITE_NOTE:Int = 4;

	public static var YELLOW_NOTE:Int = 5;
	public static var VIOLET_NOTE:Int = 6;
	public static var BLACK_NOTE:Int = 7;
	public static var DARK_NOTE:Int = 8;

	// Lua shit
	public var noteSplashDisabled:Bool = false;
	public var noteSplashTexture:String = null;
	public var noteSplashHue:Float = 0;
	public var noteSplashSat:Float = 0;
	public var noteSplashBrt:Float = 0;

	public var offsetX:Float = 0;
	public var offsetY:Float = 0;
	public var offsetAngle:Float = 0;
	public var multAlpha:Float = 1;
	public var multSpeed(default, set):Float = 1;

	public var copyX:Bool = true;
	public var copyY:Bool = true;
	public var copyAngle:Bool = true;
	public var copyAlpha:Bool = true;

	public var hitHealth:Float = 0.023;
	public var missHealth:Float = 0.0475;
	public var rating:String = 'unknown';
	public var ratingMod:Float = 0; //9 = unknown, 0.25 = shit, 0.5 = bad, 0.75 = good, 1 = sick
	public var ratingDisabled:Bool = false;

	public var texture(default, set):String = null;

	public var noAddScore:Bool = false; // note doesn't add score
	public var noCombo:Bool = false; // doesn't add to combo
	public var noStrumAnim:Bool = false; // no strum glow
	public var countNote:Bool = true; // note isn't counted in total notes hit if false
	public var noAnimation:Bool = false;
	public var noMissAnimation:Bool = false;
	public var hitCausesMiss:Bool = false;
	public var distance:Float = 2000; //plan on doing scroll directions soon -bb

	public var hitsoundDisabled:Bool = false;

	private function set_multSpeed(value:Float):Float {
		resizeByRatio(value / multSpeed);
		multSpeed = value;
		//trace('fuck cock');
		return value;
	}

	public function resizeByRatio(ratio:Float) //haha funny twitter shit
	{
		if(isSustainNote && !animation.curAnim.name.endsWith('end'))
		{
			scale.y *= ratio;
			updateHitbox();
		}
	}

	private function set_texture(value:String):String {
		if(texture != value) {
			reloadNote('', value);
		}
		texture = value;
		return value;
	}

	private function set_noteType(value:String):String {
		noteSplashTexture = PlayState.SONG.splashSkin;
		if (noteData > -1 && noteData < ClientPrefs.arrowHSV.length)
		{
			var hsvNumThing:Int = Note.splashNums[mania][noteData % tMania];

			colorSwap.hue = ClientPrefs.arrowHSV[hsvNumThing][0] / 360;
			colorSwap.saturation = ClientPrefs.arrowHSV[hsvNumThing][1] / 100;
			colorSwap.brightness = ClientPrefs.arrowHSV[hsvNumThing][2] / 100;
		}

		if(noteData > -1 && noteType != value) {
			switch(value) {
				case 'Hurt Note':
					ignoreNote = mustPress;
					reloadNote('HURT');
					noteSplashTexture = 'HURTnoteSplashes';
					colorSwap.hue = 0;
					colorSwap.saturation = 0;
					colorSwap.brightness = 0;
					lowPriority = true;

					if(isSustainNote) {
						missHealth = 0.1;
					} else {
						missHealth = 0.3;
					}
					hitCausesMiss = true;
				case 'Alt Animation':
					animSuffix = '-alt';
				case 'No Animation':
					noAnimation = true;
					noMissAnimation = true;
				case 'GF Sing':
					gfNote = true;
				case 'Kill Note':
					animation.play('deathNote');

					ignoreNote = mustPress;

					colorSwap.hue = 0;
					colorSwap.saturation = 0;
					colorSwap.brightness = 0;

					lowPriority = true;
					missHealth = Math.POSITIVE_INFINITY;
					hitCausesMiss = true;
				case 'Dodge Note':
					animation.play('dodgeNote');

					colorSwap.hue = 0;
					colorSwap.saturation = 0;
					colorSwap.brightness = 0;

					missHealth = Math.POSITIVE_INFINITY;
			}
			noteType = value;
		}
		noteSplashHue = colorSwap.hue;
		noteSplashSat = colorSwap.saturation;
		noteSplashBrt = colorSwap.brightness;
		return value;
	}

	public function new(strumTime:Float, noteData:Int, ?prevNote:Note, ?sustainNote:Bool = false, ?inEditor:Bool = false, mania:Int)
	{
		super();

		if (prevNote == null)
			prevNote = this;

		this.prevNote = prevNote;
		isSustainNote = sustainNote;
		this.inEditor = inEditor;

		x += (ClientPrefs.middleScroll ? PlayState.STRUM_X_MIDDLESCROLL[mania] : PlayState.STRUM_X[mania]) + 50;
		// MAKE SURE ITS DEFINITELY OFF SCREEN?
		y -= 2000;
		this.strumTime = strumTime;
		if(!inEditor) this.strumTime += ClientPrefs.noteOffset;

		this.noteData = noteData;
		this.mania = mania;
		this.tMania = mania+1;

		if(noteData > -1) {
			texture = '';
			colorSwap = new ColorSwap();
			shader = colorSwap.shader;

			x += swagWidth[mania] * (noteData % tMania);
			
			if(!isSustainNote && noteData > -1 && noteData < tMania) { //Doing this 'if' check to fix the warnings on Senpai songs
				var animToPlay:String = '';

				animToPlay = arrowColors[mania][noteData % tMania];

				animation.play(animToPlay + 'Scroll');
			}
		}

		// trace(prevNote);

		if(prevNote!=null)
			prevNote.nextNote = this;

		if (isSustainNote && prevNote != null)
		{
			alpha = 0.6;
			multAlpha = 0.6;
			hitsoundDisabled = true;
			if(ClientPrefs.downScroll) flipY = true;

			offsetX += width / 2;
			copyAngle = false;

			animation.play(Std.string(arrowColors[mania][noteData % tMania] + 'holdend'));

			updateHitbox();

			offsetX -= width / 2;

			if (PlayState.isPixelStage)
				offsetX += 30;

			if (prevNote.isSustainNote)
			{
				prevNote.animation.play(Std.string(arrowColors[mania][prevNote.noteData % tMania] + 'hold'));
				
				prevNote.scale.y *= Conductor.stepCrochet / 100 * 1.05;
				if(PlayState.instance != null)
				{
					prevNote.scale.y *= PlayState.instance.songSpeed;
				}

				if(PlayState.isPixelStage) {
					prevNote.scale.y *= 1.19;
					prevNote.scale.y *= (6 / height); //Auto adjust note size
				}
				prevNote.updateHitbox();
				// prevNote.setGraphicSize();
			}

			if(PlayState.isPixelStage) {
				scale.y *= PlayState.daPixelZoom * (Note.noteScales[mania] + 0.3);
				updateHitbox();
			}
		} else if(!isSustainNote) {
			earlyHitMult = 1;
		}
		x += offsetX;
	}

	var lastNoteOffsetXForPixelAutoAdjusting:Float = 0;
	var lastNoteScaleToo:Float = 1;
	public var originalHeightForCalcs:Float = 6;
	function reloadNote(?prefix:String = '', ?texture:String = '', ?suffix:String = '') {
		if(prefix == null) prefix = '';
		if(texture == null) texture = '';
		if(suffix == null) suffix = '';

		var skin:String = texture;
		if(texture.length < 1) {
			skin = PlayState.SONG.arrowSkin;
			if(skin == null || skin.length < 1) {
				skin = 'NOTE_assets';
			}
		}

		var animName:String = null;
		if(animation.curAnim != null) {
			animName = animation.curAnim.name;
		}

		var arraySkin:Array<String> = skin.split('/');
		arraySkin[arraySkin.length-1] = prefix + arraySkin[arraySkin.length-1] + suffix;

		var lastScaleY:Float = scale.y;
		var blahblah:String = arraySkin.join('/');
		if(PlayState.isPixelStage) {
			if(isSustainNote) {
				loadGraphic(Paths.image('pixelUI/' + blahblah + 'ENDS'));
				width = width / 9;
				height = height / 2;
				originalHeightForCalcs = height;
				loadGraphic(Paths.image('pixelUI/' + blahblah + 'ENDS'), true, Math.floor(width), Math.floor(height));
			} else {
				loadGraphic(Paths.image('pixelUI/' + blahblah));
				width = width / 9;
				height = height / 5;
				loadGraphic(Paths.image('pixelUI/' + blahblah), true, Math.floor(width), Math.floor(height));
			}
			setGraphicSize(Std.int(width * PlayState.daPixelZoom * (Note.noteScales[mania] + 0.3)));
			loadPixelNoteAnims();
			antialiasing = false;

			if(isSustainNote) {
				offsetX += lastNoteOffsetXForPixelAutoAdjusting;
				lastNoteOffsetXForPixelAutoAdjusting = (width - 7) * (PlayState.daPixelZoom / 2);
				offsetX -= lastNoteOffsetXForPixelAutoAdjusting;

				/*if(animName != null && !animName.endsWith('end'))
				{
					lastScaleY /= lastNoteScaleToo;
					lastNoteScaleToo = (6 / height);
					lastScaleY *= lastNoteScaleToo;
				}*/
			}
		} else {
			frames = Paths.getSparrowAtlas(blahblah);
			loadNoteAnims();
			antialiasing = ClientPrefs.globalAntialiasing;
		}
		if(isSustainNote) {
			scale.y = lastScaleY;
		}
		updateHitbox();

		if(animName != null)
			animation.play(animName, true);

		if(inEditor) {
			setGraphicSize(ChartingState.GRID_SIZE, ChartingState.GRID_SIZE);
			updateHitbox();
		}
	}

	function loadNoteAnims() {

		for (i in 0...9) animation.addByPrefix(arrowColors[8][i] + 'Scroll', arrowColors[8][i] + '0');

		animation.addByPrefix('deathNote', 'kill0');
		animation.addByPrefix('dodgeNote', 'live0');

		if (isSustainNote)
		{
			// Hold Ends

			for (i in 0...9) animation.addByPrefix(arrowColors[8][i] + 'holdend', arrowColors[8][i] + ' hold end');

			// Hold Pieces

			for (i in 0...9) animation.addByPrefix(arrowColors[8][i] + 'hold', arrowColors[8][i] + ' hold piece');
		}

		setGraphicSize(Std.int(width * Note.noteScales[mania]));
		updateHitbox();
	}

	function loadPixelNoteAnims() {
		if(isSustainNote) {
			// Hold Ends

			for (i in 0...9) animation.add(arrowColors[8][i] + 'holdend', [splashNums[8][i] + 9]);

			// Hold Pieces

			for (i in 0...9) animation.add(arrowColors[8][i] + 'hold', [splashNums[8][i]]);

		} else {

			for (i in 0...9) animation.add(arrowColors[8][i] + 'Scroll', [splashNums[8][i] + 9]);
		}
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (mustPress)
		{
			// ok river
			if (strumTime > Conductor.songPosition - (Conductor.safeZoneOffset * lateHitMult)
				&& strumTime < Conductor.songPosition + (Conductor.safeZoneOffset * earlyHitMult))
				canBeHit = true;
			else
				canBeHit = false;

			if (strumTime < Conductor.songPosition - Conductor.safeZoneOffset && !wasGoodHit)
				tooLate = true;
		}
		else
		{
			canBeHit = false;

			if (strumTime < Conductor.songPosition + (Conductor.safeZoneOffset * earlyHitMult))
			{
				if((isSustainNote && prevNote.wasGoodHit) || strumTime <= Conductor.songPosition)
					wasGoodHit = true;
			}
		}

		if (tooLate && !inEditor)
		{
			if (alpha > 0.3)
				alpha = 0.3;
		}
	}
}
