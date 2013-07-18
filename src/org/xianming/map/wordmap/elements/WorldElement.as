package org.xianming.map.wordmap.elements {
	import flash.geom.Point;
	
	import org.xianming.map.events.MapEvent;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	/**
	 * 点击地图元素派发的事件
	 * @eventType	MapEvent.CLICK_WORLDMAP_ELEMENT
	 */
	[Event(name="click_worldmap_element",type="org.xianming.map.events.MapEvent")]
	
	/**
	 * ...
	 * @author hanxianming
	 */
	public class WorldElement extends Sprite {
		private var _displayContext:DisplayObject;
		private var _helpPoint:Point;
		private var _label:TextField;
		
		public var tagID:int;
		public var mapName:String;
		public var hitHelp:HitHelper;
		
		public function WorldElement() {
			super();
			
			initUI();
		}
		
		private function initUI():void {
			_label = new TextField(100, 40, "", "Verdana", 18);
			addChild(_label);
		}
		
		public function set label(value:String):void {
			_label.text = value;
		}
		
		public function set displayContext(value:DisplayObject):void {
			
			if (value == null) {
				if (_displayContext != null) {
					_displayContext.removeFromParent(true);
				}
			} else {
				if (value == _displayContext)
					return;
				_displayContext = value;
				addChildAt(_displayContext, 0);
				
				_label.x = (_displayContext.width - _label.width) * .5;
				_label.y = (_displayContext.height - _label.height) * .5;
			}
		}
		
		/**
		 * 精确碰撞检测
		 * @param	globalX 全局鼠标坐标x。
		 * @param	globalY 全局鼠标坐标y。
		 * @return
		 */
		public function accurateHittest(globalX:int, globalY:int):Boolean {
			if (!touchable)
				return false;
			if (_helpPoint == null)
				_helpPoint = new Point();
			
			_helpPoint.setTo(globalX, globalY);
			_displayContext.globalToLocal(_helpPoint, _helpPoint);
			return hitHelp.hitTest(_helpPoint.x, _helpPoint.y);
		}
		
		/**
		 * 精确鼠标事件
		 * @param	touch
		 */
		public function accurateTouchEvent(touch:Touch):void {
			switch (touch.phase) {
				case TouchPhase.BEGAN: 
					dispatchEvent(new MapEvent(MapEvent.CLICK_WORLDMAP_ELEMENT, true, mapName));
					break;
				case TouchPhase.HOVER: 
					break;
			}
		}
		
		public override function dispose():void {
			super.dispose();
			destory();
		}
		
		public function destory():void {
			if (hitHelp == null) {
				hitHelp.dispose();
			}
			hitHelp = null;
		}
	}
}