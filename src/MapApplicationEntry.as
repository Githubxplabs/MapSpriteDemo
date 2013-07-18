package {
	import org.xianming.map.MapEntry;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author hanxianming
	 */
	public class MapApplicationEntry extends Sprite {
		public function MapApplicationEntry() {
			super();
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			var _map:MapEntry = new MapEntry();
			addChild(_map);
			_map.init();
		
		}
	}
}