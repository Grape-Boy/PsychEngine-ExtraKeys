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

	/*
	purple = 0
	down = 1
	up = 2
	right = 3

	white = 4

	yellow = 5
	violet = 6
	black = 7
	dark = 8
	*/

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
	]; // "why weird factors?" because the notes are too far apart if I don't

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
	public var noCountNote:Bool = false; // note isn't counted in total notes hit
	public var noCombo:Bool = false; // doesn't add to combo
	public var noStrumAnim:Bool = false; // no strum glow
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

		x += (ClientPrefs.middleScroll ? PlayState.STRUM_X_MIDDLESCROLL[mania] : PlayState.STRUM_X) + 50;
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
				/*
				switch (noteData % 4)
				{
					case 0:
						animToPlay = 'purple';
					case 1:
						animToPlay = 'blue';
					case 2:
						animToPlay = 'green';
					case 3:
						animToPlay = 'red';
				}
				*/
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
			/*
			switch (noteData)
			{
				case 0:
					animation.play('purpleholdend');
				case 1:
					animation.play('blueholdend');
				case 2:
					animation.play('greenholdend');
				case 3:
					animation.play('redholdend');
			}
			*/
			updateHitbox();

			offsetX -= width / 2;

			if (PlayState.isPixelStage)
				offsetX += 30;

			if (prevNote.isSustainNote)
			{
				prevNote.animation.play(Std.string(arrowColors[mania][prevNote.noteData % tMania] + 'hold'));
				/*
				switch (prevNote.noteData)
				{
					case 0:
						prevNote.animation.play('purplehold');
					case 1:
						prevNote.animation.play('bluehold');
					case 2:
						prevNote.animation.play('greenhold');
					case 3:
						prevNote.animation.play('redhold');
				}
				*/
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
				scale.y *= PlayState.daPixelZoom;
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
			setGraphicSize(Std.int(width * PlayState.daPixelZoom));
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
		animation.addByPrefix('purpleScroll', 'purple0');
		animation.addByPrefix('blueScroll', 'blue0');
		animation.addByPrefix('greenScroll', 'green0');
		animation.addByPrefix('redScroll', 'red0');

		animation.addByPrefix('whiteScroll', 'white0');

		animation.addByPrefix('yellowScroll', 'yellow0');
		animation.addByPrefix('violetScroll', 'violet0');
		animation.addByPrefix('blackScroll', 'black0');
		animation.addByPrefix('darkScroll', 'dark0');

		animation.addByPrefix('deathNote', 'kill0');
		animation.addByPrefix('dodgeNote', 'live0');

		if (isSustainNote)
		{
			// Hold Ends

			animation.addByPrefix('purpleholdend', 'purple hold end'); // i forgot that i changed it to 'purple hold end', so 'purple end hold' made the game crash
			animation.addByPrefix('blueholdend', 'blue hold end');
			animation.addByPrefix('greenholdend', 'green hold end');
			animation.addByPrefix('redholdend', 'red hold end');

			animation.addByPrefix('whiteholdend', 'white hold end');

			animation.addByPrefix('yellowholdend', 'yellow hold end');
			animation.addByPrefix('violetholdend', 'violet hold end');
			animation.addByPrefix('blackholdend', 'black hold end');
			animation.addByPrefix('darkholdend', 'dark hold end');

			// Hold Pieces

			animation.addByPrefix('purplehold', 'purple hold piece');
			animation.addByPrefix('bluehold', 'blue hold piece');
			animation.addByPrefix('greenhold', 'green hold piece');
			animation.addByPrefix('redhold', 'red hold piece');

			animation.addByPrefix('whitehold', 'white hold piece');

			animation.addByPrefix('yellowhold', 'yellow hold piece');
			animation.addByPrefix('violethold', 'violet hold piece');
			animation.addByPrefix('blackhold', 'black hold piece');
			animation.addByPrefix('darkhold', 'dark hold piece');
		}

		setGraphicSize(Std.int(width * Note.noteScales[mania]));
		updateHitbox();
	}

	function loadPixelNoteAnims() {
		if(isSustainNote) {
			// Hold Ends

			animation.add('purpleholdend', [PURP_NOTE + 9]);
			animation.add('blueholdend', [BLUE_NOTE + 9]);
			animation.add('greenholdend', [GREEN_NOTE + 9]);
			animation.add('redholdend', [RED_NOTE + 9]);

			animation.add('whiteholdend', [WHITE_NOTE + 9]);
			
			animation.add('yellowholdend', [YELLOW_NOTE + 9]);
			animation.add('violetholdend', [VIOLET_NOTE + 9]);
			animation.add('blackholdend', [BLACK_NOTE + 9]);
			animation.add('darkholdend', [DARK_NOTE + 9]);

			// Hold Pieces

			animation.add('purplehold', [PURP_NOTE]);
			animation.add('bluehold', [BLUE_NOTE]);
			animation.add('greenhold', [GREEN_NOTE]);
			animation.add('redhold', [RED_NOTE]);

			animation.add('whitehold', [WHITE_NOTE]);
			
			animation.add('yellowhold', [YELLOW_NOTE]);
			animation.add('violethold', [VIOLET_NOTE]);
			animation.add('blackhold', [BLACK_NOTE]);
			animation.add('darkhold', [DARK_NOTE]);
		} else {
			animation.add('purpleScroll', [PURP_NOTE + 9]);
			animation.add('blueScroll', [BLUE_NOTE + 9]);
			animation.add('greenScroll', [GREEN_NOTE + 9]);
			animation.add('redScroll', [RED_NOTE + 9]);

			animation.add('whiteScroll', [WHITE_NOTE + 9]);
			
			animation.add('yellowScroll', [YELLOW_NOTE + 9]);
			animation.add('violetScroll', [VIOLET_NOTE + 9]);
			animation.add('blackScroll', [BLACK_NOTE + 9]);
			animation.add('darkScroll', [DARK_NOTE + 9]);
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
