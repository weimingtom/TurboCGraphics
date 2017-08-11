package wmt.tcgraphics.test 
{
	import flash.display.Sprite;
	import wmt.tcgraphics.core.TurboCGraphics;
	
	/**
	 * FIXME:
	 */
	public class Test009 extends Sprite
	{	
		private var _tcg:TurboCGraphics;
		
		public function Test009() 
		{
			_tcg = new TurboCGraphics(this.graphics);
			draw();
		}
		
		private function draw():void
		{
			const MAX:int = 150;
			var x1:Array = new Array(MAX), y1:Array = new Array(MAX);
			var x2:Array = new Array(MAX), y2:Array = new Array(MAX);
			for (var k:int = 0; k < MAX; k++)
			{
				x1[k] = y1[k] = x2[k] = y2[k] = 0;
			}
			var m:int = 25;
			var x:Number = 0, y:Number = 0;
			var fpx:Number = 0, fpy:Number = 0;
			var lpx:Number = 0, lpy:Number = 0;
			_tcg.initgraph(TurboCGraphics.DETECT, 0, "");
			graph1(x1, y1);
			graph2(x2, y2);
			for (var i:int = 0; i <= m; i++)
			{
				for (var j:int = 0; j < 120; j++)
				{
					x = (x2[j] - x1[j]) / m * i + x1[j];
					y = (y2[j] - y1[j]) / m * i + y1[j];
					x += 320.0;
					y += 200.0;
					if (j == 0)
					{
						fpx = x;
						fpy = y;
					}
					else
					{
						_tcg.line(int(lpx), int(lpy), int(x), int(y));
					}
					lpx = x;
					lpy = y;
				}
				_tcg.line(int(x), int(y), int(fpx), int(fpy));
			}
			_tcg.closegraph();
		}
		
		private function graph1(x1:Array, y1:Array):void
		{
			var r:Number = 180.0;
			var nx:int = 0;
			var ny:int = 0;
			for (var a:Number = 0.0; a < 2 * TurboCGraphics.PI; a += TurboCGraphics.PI / 60)
			{
				x1[nx] = r * Math.cos(a);
				y1[ny] = r * Math.sin(a);
				nx++;
				ny++;
			}
			//trace(nx + "," + ny);
		}
		
		private function graph2(x2:Array, y2:Array):void
		{
			var r:Number = 100.0;
			var b:Number = 0;
			var nx:int = 0;
			var ny:int = 0;
			for (var a:Number = 0.0; a < 2 * TurboCGraphics.PI; a += TurboCGraphics.PI / 60)
			{
				b = r * (1.0 + Math.sin(a * 15.0) / 6.0);
				b *= (0.5 + Math.sin(5.0 * a) / 2.0);
				x2[nx] = b * Math.cos(a);
				y2[ny] = -b * Math.sin(a);
				nx++;
				ny++;
			}
			//trace(nx + "," + ny);
		}
	}
}