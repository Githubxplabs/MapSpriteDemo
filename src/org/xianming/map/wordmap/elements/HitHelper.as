package org.xianming.map.wordmap.elements {
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author hanxianming
	 */
	public class HitHelper {
		public var sourceData:BitmapData;
		public var tagID:Object;
		public var region:Rectangle;
		
		public function HitHelper(data:BitmapData, region:Rectangle, tagID:Object = null) {
			this.sourceData = data;
			this.tagID = tagID;
			this.region = region;
		}
		
		public function hitTest(mx:int, my:int):Boolean {
			if (sourceData == null || mx < 0 || my < 0)
				return false;
			var hx:int = region.x + mx;
			var hy:int = region.y + my;
			if (hx > region.x + region.width || hy > region.y + region.height)
				return false;
			return sourceData.getPixel32(hx, hy) > 0;
		}
		
		public function dispose():void {
			if (sourceData != null) {
				sourceData.dispose();
			}
			sourceData = null;
			tagID = null;
		}
	}

}