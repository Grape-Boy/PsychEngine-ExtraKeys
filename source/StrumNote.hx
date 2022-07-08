package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class StrumNote extends FlxSprite
{
	private var colorSwap:ColorSwap;
	public var resetAnim:Float = 0;
	private var noteData:Int = 0;
	private var mania:Int = 0;
	private var tMania:Int = 0;
	public var direction:Float = 90;//plan on doing scroll directions soon -bb
	public var downScroll:Bool = false;//plan on doing scroll directions soon -bb
	public var sustainReduce:Bool = true;

	public static var aL:String = "arrowLEFT";
	public static var aD:String = "arrowDOWN";
	public static var aS:String = "arrowSPACE";
	public static var aU:String = "arrowUP";
	public static var aR:String = "arrowRIGHT";
	
	private var player:Int;
	
	public var texture(default, set):String = null;
	private function set_texture(value:String):String {
		if(texture != value) {
			texture = value;
			reloadNote();
		}
		return value;
	}

	public function new(x:Float, y:Float, leData:Int, player:Int, mania:Int) {
		colorSwap = new ColorSwap();
		shader = colorSwap.shader;
		noteData = leData;
		this.player = player;
		this.noteData = leData;
		this.mania = mania;
		this.tMania = mania+1;
		super(x, y);

		var skin:String = 'NOTE_assets';
		if(PlayState.SONG.arrowSkin != null && PlayState.SONG.arrowSkin.length > 1) skin = PlayState.SONG.arrowSkin;
		texture = skin; //Load texture and anims

		scrollFactor.set();
	}

	private function addAnim(arrowName:String, animName:String, ?looped:Bool = false) {
		animation.addByPrefix('static', arrowName);
		animation.addByPrefix('pressed', animName + ' press', 24, looped);
		animation.addByPrefix('confirm', animName + ' confirm', 24, looped);
	}

	private function addAnimPIXEL(noteData:Int) {
		var numForAnim:Int = Note.splashNums[mania][noteData % tMania];

		animation.add('static', [numForAnim]);
		animation.add('pressed', [9 + numForAnim, 18 + numForAnim], 12, false);
		animation.add('confirm', [27 + numForAnim, 36 + numForAnim], 24, false);
	}

	public function reloadNote()
	{
		var lastAnim:String = null;
		if(animation.curAnim != null) lastAnim = animation.curAnim.name;

		if(PlayState.isPixelStage)
		{
			loadGraphic(Paths.image('pixelUI/' + texture));
			width = width / 9;
			height = height / 5;
			loadGraphic(Paths.image('pixelUI/' + texture), true, Math.floor(width), Math.floor(height));

			antialiasing = false;
			setGraphicSize(Std.int(width * PlayState.daPixelZoom));

			animation.add('purple', [9]);
			animation.add('blue', [10]);
			animation.add('green', [11]);
			animation.add('red', [12]);

			animation.add('white', [13]);

			animation.add('yellow', [14]);
			animation.add('violet', [15]);
			animation.add('black', [16]);
			animation.add('dark', [17]);

			addAnimPIXEL(Std.int( Math.abs(noteData) % tMania ));
			//setGraphicSize(Std.int(width * Note.noteScales[mania]));
			updateHitbox();
			/*
			switch (Math.abs(noteData))
			{
				case 0:
					animation.add('static', [0]);
					animation.add('pressed', [4, 8], 12, false);
					animation.add('confirm', [12, 16], 24, false);
				case 1:
					animation.add('static', [1]);
					animation.add('pressed', [5, 9], 12, false);
					animation.add('confirm', [13, 17], 24, false);
				case 2:
					animation.add('static', [2]);
					animation.add('pressed', [6, 10], 12, false);
					animation.add('confirm', [14, 18], 12, false);
				case 3:
					animation.add('static', [3]);
					animation.add('pressed', [7, 11], 12, false);
					animation.add('confirm', [15, 19], 24, false);
			}*/
		}
		else
		{
			frames = Paths.getSparrowAtlas(texture);
			animation.addByPrefix('purple', 'arrowLEFT');
			animation.addByPrefix('blue', 'arrowDOWN');
			animation.addByPrefix('green', 'arrowUP');
			animation.addByPrefix('red', 'arrowRIGHT');

			animation.addByPrefix('white', 'arrowSPACE');

			animation.addByPrefix('yellow', 'arrowLEFT');
			animation.addByPrefix('violet', 'arrowDOWN');
			animation.addByPrefix('black', 'arrowUP');
			animation.addByPrefix('dark', 'arrowRIGHT');

			antialiasing = ClientPrefs.globalAntialiasing;
			setGraphicSize(Std.int(width * Note.noteScales[mania]));
			updateHitbox();
			/*
			switch (Math.abs(noteData))
			{
				case 0:
					animation.addByPrefix('static', 'arrowLEFT');
					animation.addByPrefix('pressed', 'left press', 24, false);
					animation.addByPrefix('confirm', 'left confirm', 24, false);
				case 1:
					animation.addByPrefix('static', 'arrowDOWN');
					animation.addByPrefix('pressed', 'down press', 24, false);
					animation.addByPrefix('confirm', 'down confirm', 24, false);
				case 2:
					animation.addByPrefix('static', 'arrowUP');
					animation.addByPrefix('pressed', 'up press', 24, false);
					animation.addByPrefix('confirm', 'up confirm', 24, false);
				case 3:
					animation.addByPrefix('static', 'arrowRIGHT');
					animation.addByPrefix('pressed', 'right press', 24, false);
					animation.addByPrefix('confirm', 'right confirm', 24, false);
			}*/

			var arrowColors:Array<Array<Array<String>>> = [ // wtf

				// [a, ""]

				[ [aS, "white"] ],

				[ [aL, "left"], [aR, "right"] ],

				[ [aL, "left"], [aS, "white"], [aR, "right"] ],

				[ [aL, "left"], [aD, "down"], [aU, "up"], [aR, "right"] ],

				[ [aL, "left"], [aD, "down"], [aS, "white"], [aU, "up"], [aR, "right"] ],

				[ [aL, "left"], [aU, "up"], [aR, "right"], [aL, "yellow"], [aD, "down"], [aR, "dark"] ],

				[ [aL, "left"], [aU, "up"], [aR, "right"], [aS, "white"], [aL, "yellow"], [aD, "down"], [aR, "dark"] ],

				[ [aL, "left"], [aD, "down"], [aU, "up"], [aR, "right"], [aL, "yellow"], [aD, "violet"], [aU, "black"], [aR, "dark"] ],

				[ [aL, "left"], [aD, "down"], [aU, "up"], [aR, "right"], [aS, "white"], [aL, "yellow"], [aD, "violet"], [aU, "black"], [aR, "dark"] ]

			];

			addAnim(arrowColors[mania][Std.int(Math.abs(noteData))][0], arrowColors[mania][Std.int(Math.abs(noteData))][1]);
		}
		updateHitbox();

		if(lastAnim != null)
		{
			playAnim(lastAnim, true);
		}
	}

	public function postAddedToGroup() {
		playAnim('static');
		x += Note.swagWidth[mania] * noteData;
		x += 50;
		x += ((FlxG.width / 2) * player);
		ID = noteData;
	}

	override function update(elapsed:Float) {
		if(resetAnim > 0) {
			resetAnim -= elapsed;
			if(resetAnim <= 0) {
				playAnim('static');
				resetAnim = 0;
			}
		}
		//if(animation.curAnim != null){ //my bad i was upset
		if(animation.curAnim.name == 'confirm' && !PlayState.isPixelStage) {
			centerOrigin();
		//}
		}

		super.update(elapsed);
	}

	public function playAnim(anim:String, ?force:Bool = false) {
		animation.play(anim, force);
		centerOffsets();
		centerOrigin();
		if(animation.curAnim == null || animation.curAnim.name == 'static') {
			colorSwap.hue = 0;
			colorSwap.saturation = 0;
			colorSwap.brightness = 0;
		} else {
			var hsvNumThing:Int = Note.splashNums[mania][noteData % tMania];

			colorSwap.hue = ClientPrefs.arrowHSV[hsvNumThing][0] / 360;
			colorSwap.saturation = ClientPrefs.arrowHSV[hsvNumThing][1] / 100;
			colorSwap.brightness = ClientPrefs.arrowHSV[hsvNumThing][2] / 100;

			if(animation.curAnim.name == 'confirm' && !PlayState.isPixelStage) {
				centerOrigin();
			}
		}
	}
}
