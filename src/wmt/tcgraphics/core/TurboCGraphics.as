package wmt.tcgraphics.core
{
	import flash.display.Graphics;
	
	public class TurboCGraphics
	{		
		public static const DETECT:int = 0;
		
		public static const YELLOW:uint = 0xffff00;
		public static const BLUE:uint = 0x0000ff;
		
		public static const PI:Number = Math.PI;
		
		private var _graphics:Graphics;
		
		public function TurboCGraphics(graphics:Graphics) 
		{
			init(graphics);
		}
		
		public function init(graphics:Graphics):void
		{
			_graphics = graphics;
		}
		
		public function initgraph(driver:int, mode:int, path:String):void
		{
			setcolor(0);
		}
		
		public function closegraph():void
		{
			_graphics = null;
		}
		
		public function setbkcolor(color:uint):void
		{
			_graphics.beginFill(color, 1);
			_graphics.drawRect(0, 0, 640, 480);
		}
		
		public function setcolor(color:uint):void
		{
			_graphics.lineStyle(0, color, 1);
		}
		
		public function moveto(x:int, y:int):void
		{
			_graphics.moveTo(x, y);
		}
		
		public function lineto(x:int, y:int):void
		{
			_graphics.lineTo(x, y);
		}
		
		public function line(x1:int, y1:int, x2:int, y2:int):void
		{
			_graphics.moveTo(x1, y1);
			_graphics.lineTo(x2, y2);
		}
		
		public function circle(x:int, y:int, r:int):void
		{
			_graphics.drawCircle(x, y, r);
		}
		
		public function rectangle(x1:int, y1:int, x2:int, y2:int):void
		{
			_graphics.drawRect(x1, y1, x2 - x1, y2 - y1);
		}
	}
}
