package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author hanxianming
	 */
	[SWF(width=1000,height=600)]
	
	public class Main extends Sprite {
		
		public function Main():void {
			
			if (stage != null)
				init();
			else
				stage.addEventListener(Event.ADDED_TO_STAGE, init);
		
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			var _starling:Starling = new Starling(MapApplicationEntry, this.stage, new Rectangle(0, 0, 1024, 768));
			_starling.start();
		}
	}
}