package org.xianming.map.wordmap.elements {
	import org.xianming.map.interpreter.IElementInterpreter;
	
	/**
	 * ...
	 * @author hanxianming
	 */
	public class WorldElementInterpreter implements IElementInterpreter {
		private var _elements:Array;
		
		public function WorldElementInterpreter() {
		
		}
		
		public function interpreter(data:Object):void {
			_elements = [];
			var xml:XML = data as XML;
			for each (var node:XML in xml.world.element) {
				var vo:WorldElementVo = new WorldElementVo();
				vo.tagID = int(node.@tagID);
				vo.index = node.@index;
				vo.name = node.@name;
				vo.x = node.@x;
				vo.y = node.@y;
				vo.plotID = node.@plotID;
				vo.isDisplay = true;
				_elements.push(vo);
			}
		}
		
		public function get elements():Array {
			return _elements;
		}
	}
}