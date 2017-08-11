package wmt.tcgraphics.test 
{
	import flash.display.ShaderParameter;
	import flash.display.Sprite;
	import wmt.tcgraphics.core.TurboCGraphics;
	
	/**
	 * FIXME:
	 */
	public class Test012 extends Sprite
	{	
		private var _tcg:TurboCGraphics;
		
		private var dx:Array = [0, 200, 200, 0, 200, 200, 140, 140, 104, 104, 0, 0, 50, 50, 0, 0, 200, 200];
		private var dy:Array = [0, 0, 140, 140, 40, 140, 140, 40, 100, 140, 140, 100, 40, 60, 60, 0, 0, 40];
		private var dz:Array = [0, 0, 0, 0, 40, 40, 40, 40, 80, 80, 80, 80, 140, 140, 140, 140, 140, 140];
		private var ld:Array = [1, 2, 3, 10, 11, 14, 15, 16, 17, 4, 5, 6, 9, 8, 13, 12, 17, 4, 7, 12, 6, 7, 13, 14, 8, 11, 9, 10, 1, 16, 2, 5];
		private var tl:Array = [0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1];
		private var x0:int = 300;
		private var y0:int = 200;
		private var pn:int = 31;
		
		public function Test012() 
		{
			_tcg = new TurboCGraphics(this.graphics);
			draw();
		}
		
		private function draw():void
		{
			trace(dx.length, dy.length, dz.length, ld.length, tl.length);
			_tcg.initgraph(TurboCGraphics.DETECT, 0, "");
			for (var i:int = 0; i <= pn; i++)
			{
				var j:int = ld[i];
				var x:int = int(x0 - (0.94 * dx[j] - 0.35 * dy[j]));
				var y:int = int(y0 - (0.94 * dz[j] - 0.12 * dx[j] - 0.31 * dy[j]));
				if (tl[i] == 0)
				{
					_tcg.moveto(x, y);
				}
				_tcg.lineto(x, y);
			}
			_tcg.closegraph();
		}
	}
}