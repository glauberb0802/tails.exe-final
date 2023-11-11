package;


#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;

using StringTools;

class ComingSoonScreen extends MusicBeatState
{
	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("coming soon", null);
		#end

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var bg:FlxSprite = new FlxSprite(0).loadGraphic(Paths.image('screen', 'sadfox'));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		add(bg);
		
		#if android
                addVirtualPad(NONE, A);
                #end

		super.create();

	}

	override function update(elapsed:Float)
	{
		if (controls.BACK || controls.ACCEPT)
		{
            if (!FlxG.sound.music.playing) {
                    FlxG.sound.playMusic(Paths.music('freakyMenu'));
            }
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}
