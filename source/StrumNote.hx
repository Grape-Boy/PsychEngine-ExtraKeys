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
		var numForAnim:Int = NoteInfo.splashNums[mania][noteData % tMania];

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
			setGraphicSize(Std.int(width * PlayState.daPixelZoom * (NoteInfo.noteScales[mania] + 0.3)));

			for (i in 0...9) animation.add(NoteInfo.arrowColors[8][i], [NoteInfo.splashNums[8][i] + 9]);

			addAnimPIXEL(Std.int( Math.abs(noteData) % tMania ));
			//setGraphicSize(Std.int(width * Note.noteScales[mania]));
			updateHitbox();
		}
		else
		{
			frames = Paths.getSparrowAtlas(texture);

			for (i in 0...9) animation.addByPrefix(NoteInfo.arrowColors[8][i], NoteInfo.strumDirs[8][i]);

			antialiasing = ClientPrefs.globalAntialiasing;
			setGraphicSize(Std.int(width * NoteInfo.noteScales[mania]));
			updateHitbox();

			addAnim(NoteInfo.strumDirs[mania][Std.int(Math.abs(noteData))], NoteInfo.arrowDirColors[mania][Std.int(Math.abs(noteData))]);
		}
		updateHitbox();

		if(lastAnim != null)
		{
			playAnim(lastAnim, true);
		}
	}

	public function postAddedToGroup() {
		playAnim('static');
		x += NoteInfo.swagWidth[mania] * noteData;
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
			if (noteData > -1 && noteData < ClientPrefs.arrowHSV.length)
			{
				var hsvNumThing:Int = NoteInfo.splashNums[mania][noteData % tMania];

				colorSwap.hue = ClientPrefs.arrowHSV[hsvNumThing][0] / 360;
				colorSwap.saturation = ClientPrefs.arrowHSV[hsvNumThing][1] / 100;
				colorSwap.brightness = ClientPrefs.arrowHSV[hsvNumThing][2] / 100;
			}

			if(animation.curAnim.name == 'confirm' && !PlayState.isPixelStage) {
				centerOrigin();
			}
		}
	}
}
