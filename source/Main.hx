package;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFieldAutoSize;
import openfl.Lib;

class Main extends Sprite
{
    public static inline var GAME_NAME:String = "NovaBound";
    public static inline var GAME_VERSION:String = "0.1.0";

    private var titleText:TextField;
    private var versionText:TextField;

    public function new()
    {
        super();

        if (stage != null)
            initialize();
        else
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):Void
    {
        removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        initialize();
    }

    private function initialize():Void
    {
        stage.color = 0x000000;
        stage.frameRate = 60;

        createTitle();
        createVersion();

        stage.addEventListener(Event.RESIZE, onResize);

        updateLayout();
    }

    private function createTitle():Void
    {
        titleText = new TextField();
        titleText.defaultTextFormat = new TextFormat(
            "_sans",
            64,
            0xFFFFFF,
            true
        );

        titleText.autoSize = TextFieldAutoSize.CENTER;
        titleText.selectable = false;
        titleText.mouseEnabled = false;
        titleText.text = GAME_NAME;

        addChild(titleText);
    }

    private function createVersion():Void
    {
        versionText = new TextField();
        versionText.defaultTextFormat = new TextFormat(
            "_sans",
            18,
            0xAAAAAA,
            false
        );

        versionText.autoSize = TextFieldAutoSize.CENTER;
        versionText.selectable = false;
        versionText.mouseEnabled = false;
        versionText.text = "Version " + GAME_VERSION;

        addChild(versionText);
    }

    private function onResize(event:Event):Void
    {
        updateLayout();
    }

    private function updateLayout():Void
    {
        var centerX:Float = stage.stageWidth / 2;
        var centerY:Float = stage.stageHeight / 2;

        titleText.x = centerX - titleText.width / 2;
        titleText.y = centerY - titleText.height / 2 - 20;

        versionText.x = centerX - versionText.width / 2;
        versionText.y = titleText.y + titleText.height + 12;
    }
}
