package org.xianming.map.adapter {
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	/**
	 * 世界系统资源适配器
	 * @author hanxianming
	 */
	public class WorldResourceAdapter {
		private static var _worldSprite:TextureAtlas;
		public static var worldConfig:XML;
		public static var worldSpriteSource:BitmapData;
		
		[Embed(source="../res/WorldConfig.xml",mimeType="application/octet-stream")]
		private static var WORLD_CONFIG:Class;
		[Embed(source="../res/WorldSpriteAtlas.xml",mimeType="application/octet-stream")]
		private static var WORLD_ATLAS_XML:Class;
		[Embed(source="../res/WorldSpriteAtlas.png")]
		private static var WORLD_SPRITE_ATLAS:Class;
		
		public function WorldResourceAdapter() {
		
		}
		
		public static function initWorldResource():void {
			var bitmapData:BitmapData = new WORLD_SPRITE_ATLAS().bitmapData;
			WorldResourceAdapter.worldSpriteSource = bitmapData;
			WorldResourceAdapter.worldSprite = new TextureAtlas(Texture.fromBitmapData(bitmapData), new XML(new WORLD_ATLAS_XML()));
			WorldResourceAdapter.worldConfig = new XML(new WORLD_CONFIG());
		}
		
		public static function getTexture(name:String):Texture {
			return _worldSprite.getTexture(name);
		}
		
		public static function getTextures(prefix:String = "", result:Vector.<Texture> = null):Vector.<Texture> {
			return _worldSprite.getTextures(prefix, result);
		}
		
		public static function getBitmapData(name:String):BitmapData {
			var rect:Rectangle = _worldSprite.getRegion(name);
			var bitmapData:BitmapData = new BitmapData(rect.width, rect.height, true, 0x00000000);
			bitmapData.copyPixels(worldSpriteSource, rect, new Point());
			return bitmapData;
		}
		
		public static function getRegion(name:String):Rectangle {
			return _worldSprite.getRegion(name);
		}
		
		public static function set worldSprite(value:TextureAtlas):void {
			_worldSprite = value;
		}
		
		/**
		 * 销毁所有的资源
		 */
		public static function destoryAll():void {
			if (_worldSprite != null)
				_worldSprite.dispose();
			if (worldSpriteSource != null)
				worldSpriteSource.dispose();
			worldSpriteSource = null;
			worldConfig = null;
			_worldSprite = null;
		}
	}
}