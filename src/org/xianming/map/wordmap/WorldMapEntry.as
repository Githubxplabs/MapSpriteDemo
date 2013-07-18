package org.xianming.map.wordmap {
	import org.xianming.map.interpreter.IElementInterpreter;
	import org.xianming.map.wordmap.elements.WorldElementInterpreter;
	import org.xianming.map.wordmap.elements.WorldMapElements;
	
	import starling.display.Sprite;
	/**
	 * 点击世界地图中的片区派发的事件
	 * @eventType MapEvent.CLICK_WORLDMAP_ELEMENT
	 */
	[Event(name="click_worldmap_element",type="org.xianming.map.events.MapEvent")]
	
	/**
	 * ...
	 * @author hanxianming
	 */
	public class WorldMapEntry extends Sprite {
		private var _mapElement:WorldMapElements;
		private var _interpreter:IElementInterpreter;
		
		public function WorldMapEntry() {
			super();
		
		}
		
		public function init():void {
			initMapElement();
		}
		
		private function initMapElement():void {
			_mapElement = new WorldMapElements();
			addChild(_mapElement);
		}
		
		public function setElements(data:Object):void {
			if (_interpreter == null) {
				_interpreter = new WorldElementInterpreter();
			}
			_interpreter.interpreter(data);
			_mapElement.buildElements(_interpreter);
		}
		
		override public function dispose():void {
			super.dispose();
			_mapElement = null;
			_interpreter = null;
		}
	}
}