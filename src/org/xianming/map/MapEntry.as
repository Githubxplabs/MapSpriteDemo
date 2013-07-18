package org.xianming.map {
	import org.xianming.map.adapter.WorldResourceAdapter;
	import org.xianming.map.events.MapEvent;
	import org.xianming.map.wordmap.WorldMapEntry;
	
	import starling.display.Sprite;
	import starling.text.TextField;
	
	/**
	 * ...
	 * @author hanxianming
	 */
	public class MapEntry extends Sprite {
		private var _worldMapEntry:WorldMapEntry;
		private var _printText:TextField;
		
		public function MapEntry() {
			super();
		
		}
		
		public function init():void {
			WorldResourceAdapter.initWorldResource();
			
			initWorldMap();
			initUI();
		}
		
		private function initUI():void {
			_printText = new TextField(200, 30, "");
			addChild(_printText);
		}
		
		private function initWorldMap():void {
			_worldMapEntry = new WorldMapEntry();
			addChild(_worldMapEntry);
			_worldMapEntry.init();
			_worldMapEntry.addEventListener(MapEvent.CLICK_WORLDMAP_ELEMENT, clickWorldMapElementHandler);
			setWorldElement();
		}
		
		private function setWorldElement():void {
			_worldMapEntry.setElements(WorldResourceAdapter.worldConfig);
		}
		
		private function clickWorldMapElementHandler(e:MapEvent):void {
			_printText.text = "点击的地区：" + e.data;
		}
		
		override public function dispose():void {
			super.dispose();
			WorldResourceAdapter.destoryAll();
			_worldMapEntry = null;
		}
	}
}