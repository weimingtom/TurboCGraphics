package wmt.tcgraphics.test 
{
	import flash.display.Sprite;
	import wmt.tcgraphics.core.TurboCGraphics;
	
	public class Test005 extends Sprite
	{	
		private var _tcg:TurboCGraphics;
		
		public function Test005() 
		{
			_tcg = new TurboCGraphics(this.graphics);
			draw();
		}
		
		private function draw():void
		{
			var x:Number, y:Number;
			var a:int = 100;
			var b:int = 10;
			var i:int;
			
			_tcg.initgraph(TurboCGraphics.DETECT, 0, "");
			
			x = y = a;
			for (i = 0; i < 11; i++)
			{
				asteroid(x, y);
				x += b;
				y -= b;
			}
			
			x = y = a;
			for (i = 0; i < 11; i++)
			{
				asteroid(x, y);
				x -= b;
				y += b;
			}
			_tcg.closegraph();
		}
		
		private function asteroid(m:int, n:int):void
		{
			_tcg.line(320, 200 - n, 320 - m, 200);
			_tcg.line(320 - m, 200, 320, 200 + n);
			_tcg.line(320, 200 + n, 320 + m, 200);
			_tcg.line(320 + m, 200, 320, 200 - n);
		}
	}
}