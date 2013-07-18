package org.xianming.map.interpreter {
	
	/**
	 * 元素生成解释器
	 * @author hanxianming
	 */
	public interface IElementInterpreter {
		/**
		 * 解释器方法
		 * @param	data
		 */
		function interpreter(data:Object):void;
		/**
		 * 解释之后的所有元素列表
		 */
		function get elements():Array;
	}

}