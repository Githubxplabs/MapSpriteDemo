package org.xianming.map.wordmap.elements {
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	
	import org.xianming.map.adapter.WorldResourceAdapter;
	import org.xianming.map.interpreter.IElementInterpreter;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	/**
	 * 点击世界地图中的片区派发的事件
	 * @eventType	MapEvent.CLICK_WORLDMAP_ELEMENT
	 */
	[Event(name="click_worldmap_element",type="org.xianming.map.events.MapEvent")]
	
	/**
	 * ...
	 * @author hanxianming
	 */
	public class WorldMapElements extends Sprite {
		private var _interpreter:IElementInterpreter;
		private var _worldElements:Vector.<WorldElement>;
		
		private var _oldOpenElement:WorldElement;
		
		public function WorldMapElements() {
			super();
		}
		
		public function buildElements(interpreter:IElementInterpreter):void {
			
			_interpreter = interpreter;
			_worldElements = new Vector.<WorldElement>();
			const elements:Array = _interpreter.elements;
			const len:int = elements.length;
			for (var i:int = 0; i < len; i++) {
				var element:WorldElementVo = elements[i];
				var display:WorldElement = new WorldElement();
				display.tagID = element.tagID;
				display.x = element.x;
				display.y = element.y;
				display.mapName = element.name;
				display.label = element.name;
				var bitmapData:BitmapData = WorldResourceAdapter.worldSpriteSource;
				var region:Rectangle = WorldResourceAdapter.getRegion(String(display.tagID));
				display.hitHelp = new HitHelper(bitmapData, region, display.tagID);
				display.displayContext = new Image(WorldResourceAdapter.getTexture(String(display.tagID)));
				if (element.isDisplay)
					addChild(display);
				_worldElements[i] = display;
			}
			
			addEventListener(TouchEvent.TOUCH, touchHandler);
		}
		
		private function touchHandler(e:TouchEvent):void {
			var touch:Touch = e.getTouch(this);
			if (touch != null) {
				var len:int = _worldElements.length;
				for (var i:int = 0; i < len; i++) {
					var display:WorldElement = _worldElements[i];
					if (display.accurateHittest(touch.globalX, touch.globalY)) {
						//鼠标手型形状开启
						//Mouse.cursor = display.touchable ? MouseCursor.BUTTON : MouseCursor.AUTO;
						display.accurateTouchEvent(touch);
						break;
					}
				}
			}
		}

		public override function dispose():void {
			super.dispose();
			_interpreter = null;
			_worldElements.length = 0;
			_worldElements = null;
		}
	}
}