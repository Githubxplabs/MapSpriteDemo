package org.xianming.map.events {
	import starling.events.Event;
	
	/**
	 * 地图系统自定义事件
	 * @author hanxianming
	 */
	public class MapEvent extends Event {
		/** 点击世界地图中的片区事件类型*/
		public static const CLICK_WORLDMAP_ELEMENT:String = "click_worldmap_element";
		
		public function MapEvent(type:String, bubbles:Boolean = false, data:Object = null) {
			super(type, bubbles, data);
		
		}
	
	}

}