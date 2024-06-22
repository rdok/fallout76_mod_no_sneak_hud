package {
import Shared.GlobalFunc;

import flash.display.MovieClip;
import flash.events.Event;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

[Embed(source="/_assets/assets.swf", symbol="StealthMeter")]
public class StealthMeter extends MovieClip {

    private static const MODE_NOT_SNEAKING:uint = 0;

    private static const MODE_HIDDEN:uint = 1;

    private static const MODE_DETECTED:uint = 2;

    private static const MODE_CAUTION:uint = 3;

    private static const MODE_DANGER:uint = 4;

    private static const MODE_TO_FRAME_LABEL:Vector.<String> = new <String>["detected", "hidden", "detected", "caution", "danger"];


    public var Internal_mc:MovieClip;

    private var StealthTextInstance:TextField;

    private var LastPercent:Number = 0;

    private var stealthStateFrames:int = 100;

    private var isRed:Boolean = false;

    private var lastText:String = "";

    private var LastMode:uint = 0;

//    private var logField:TextField;

    public function StealthMeter() {
        super();
        addFrameScript(4, this.frame5, 9, this.frame10);
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
//        addEventListener(Event.ADDED_TO_STAGE, this.initLogField);
    }

    private function onAddedToStage(e:Event):void {
        this.Internal_mc.gotoAndPlay("green");
        this.StealthTextInstance = this.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance;
        this.StealthTextInstance.multiline = false;
        this.StealthTextInstance.autoSize = TextFieldAutoSize.CENTER;
//        logMessage("StealthMeter added to stage and initialized.");
    }

    private function UpdateMode(aeNewMode:uint):* {
        var stateName:String = MODE_TO_FRAME_LABEL[aeNewMode];
        this.Internal_mc.stealthTextStates.gotoAndPlay(stateName);
        if (aeNewMode == MODE_HIDDEN || aeNewMode == MODE_DETECTED) {
            if (this.isRed) {
                this.Internal_mc.gotoAndPlay("green");
                this.isRed = false;
            }
        } else if (!this.isRed) {
            this.Internal_mc.gotoAndPlay("red");
            this.isRed = true;
        }
    }

    public function SetStealthMeter(astrSneakText:String, aeSneakMode:uint, aPercent:Number, abForce:Boolean):void {
//        logMessage("SetStealthMeter called with params astrSneakText: " + astrSneakText + ", aeSneakMode: " + aeSneakMode + ", aPercent: " + aPercent + ", aPercent: " + abForce);
        var newPercent:* = aPercent - this.LastPercent;
        var speed:Number = Math.floor(Math.abs(newPercent) / 5) + 1;
        speed = Math.min(speed, 4);
        if (Math.abs(newPercent) < 1 || abForce) {
            newPercent = aPercent;
        } else {
            newPercent = this.LastPercent + (newPercent > 0 ? speed : -speed);
        }
        if (this.LastMode != aeSneakMode) {
            this.LastMode = aeSneakMode;
            this.UpdateMode(aeSneakMode);
        }
        if (this.lastText != astrSneakText) {
            this.lastText = astrSneakText;
            GlobalFunc.SetText(this.StealthTextInstance, astrSneakText, true);
        }
        this.Internal_mc.BracketLeftInstance.x = -75000 - newPercent - this.Internal_mc.BracketLeftInstance.width;
        this.Internal_mc.BracketRightInstance.x = -75 + 15000 + newPercent;
        this.LastPercent = newPercent;
        var currentDate:Date = new Date();
        var dateString:String = currentDate.toString();
         GlobalFunc.SetText(this.StealthTextInstance,"",true);
//         GlobalFunc.SetText(this.StealthTextInstance,dateString,true);
//        GlobalFunc.SetText(this.StealthTextInstance, "alphac", true);
    }

    internal function frame5():* {
        stop();
    }

    internal function frame10():* {
        stop();
    }

//    private function initLogField():void {
//        this.logField = new TextField();
//        this.logField.autoSize = TextFieldAutoSize.CENTER;
//        this.logField.text = "Stealth Mode Activated!";
//
//        var format:TextFormat = new TextFormat();
//        format.font = "Arial";
//        format.size = 24;
//        format.color = 0xFFFFFF;
//        this.logField.setTextFormat(format);
//
//        this.logField.x = (stage.stageWidth - this.logField.width) / 2;
//        this.logField.y = (stage.stageHeight - this.logField.height) / 2;
//
//        this.addChild(this.logField);
//    }

//    private function logMessage(message:String):void {
//        if (this.logField) {
//            this.logField.appendText(message + "\n");
//            this.logField.scrollV = this.logField.maxScrollV;
//        }
//    }

}
}
