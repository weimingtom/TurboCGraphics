package wmt.tcgraphics.test 
{
	import flash.display.Sprite;
	import wmt.tcgraphics.core.TurboCGraphics;
	
	public class Test003 extends Sprite
	{	
		private var _tcg:TurboCGraphics;
		
		public function Test003() 
		{
			_tcg = new TurboCGraphics(this.graphics);
			draw();
		}
		
		private function draw():void
		{
			var xx:Array = new Array(20);
			var yy:Array = new Array(20);
			var st:Number = 360.0 / 20 * TurboCGraphics.PI / 180;
			var x0:int = 300;
			var y0:int = 250;
			var r:int = 200;
			var i:int, j:int;
			
			_tcg.initgraph(TurboCGraphics.DETECT, 0, "");
			_tcg.setbkcolor(TurboCGraphics.BLUE);
			_tcg.setcolor(TurboCGraphics.YELLOW);
			for (i = 0; i < xx.length; i++)
			{
				xx[i] = x0 + r * Math.cos(i * st);
				yy[i] = y0 - r * Math.sin(i * st);
			}
			for (i = 0; i < xx.length - 1; i++)
			{
				for (j = i; j < xx.length; j++)
				{
					_tcg.line(xx[i], yy[i], xx[j], yy[j]);
				}
			}
			_tcg.closegraph();
		}
	}
}