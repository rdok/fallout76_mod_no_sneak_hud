package {
import flash.display.MovieClip;
import flash.events.Event;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.filters.DropShadowFilter;

public class NoStealthMeter extends MovieClip {
    private var logField:TextField;

    private var debugTextHC:TextField;

    public function NoStealthMeter() {
        super();
        initDebugText();
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);

    }

    private function onAddedToStage(e:Event):void {
        initLogField();
        stage.addChild(debugTextHC);
        logMessage("NoStealthMeter added to stage..");
    }

    private function initLogField():void {
        this.logField = new TextField();
        this.logField.autoSize = TextFieldAutoSize.CENTER;
        this.logField.text = "NoStealthMeter initialised.";

        var format:TextFormat = new TextFormat();
        format.font = "Arial";
        format.size = 24;
        format.color = 0xFFFFFF;
        this.logField.setTextFormat(format);

        this.logField.x = (stage.stageWidth - this.logField.width) / 2;
        this.logField.y = (stage.stageHeight - this.logField.height) / 2;

        this.addChild(this.logField);
    }

    public function logMessage(message:String):void {
        if (!this.logField) return;
        this.logField.appendText(message + "\n");
        this.logField.scrollV = this.logField.maxScrollV;
    }

    public function SetNoStealthMeter(astrText:String, aMode:uint, aPercent:Number, abForce:Boolean):void {
        var logMessage:String = "SetNoStealthMeter called with params astrText: " + astrText + ", aMode: " + aMode + ", aPercent: " + aPercent + ", abForce: " + abForce;
        this.logMessage(logMessage);
    }

    private function displayText(param1:String) : void
    {
        this.debugTextHC.appendText(param1 + "\n");
    }
    private function initDebugText() : void
    {
        var _loc1_:DropShadowFilter = new DropShadowFilter(1,45,0,0.75,4,4,1,3,false,false,false);
        debugTextHC = new TextField();
        var _loc2_:TextFormat = new TextFormat("$MAIN_Font_Light",10,15790320);
        _loc2_.align = "left";
        debugTextHC.defaultTextFormat = _loc2_;
        debugTextHC.setTextFormat(_loc2_);
        debugTextHC.multiline = true;
        debugTextHC.width = 1920;
        debugTextHC.height = 1080;
        debugTextHC.name = "debugTextHC";
        debugTextHC.text = "";
        debugTextHC.filters = [_loc1_];
        debugTextHC.visible = true;
        debugTextHC.appendText("Debugger setup.");

        this.debugTextHC = debugTextHC;
    }
}
}
