package wmt.tcgraphics.test 
{
	import flash.display.Sprite;
	import wmt.tcgraphics.core.TurboCGraphics;
	
	/**
	 * FIXME:
	 */
	public class Test011 extends Sprite
	{	
		private var _tcg:TurboCGraphics;
		private var pt:int = 32;
		private var dx:Array = [0, 120, 120, 0, 0, 120, 120, 0, 45, 97.5, 97.5, 45];
		private var dy:Array = [0, 0, 80, 80, 0, 0, 80, 80, 30, 15, 65, 20];
		private var dz:Array = [0, 0, 0, 0, 80, 80, 80, 80, 140, 110, 110, 140];
		private var ld:Array = [0, 1, 2, 3, 0, 4, 8, 9, 5, 4, 7, 3, 2, 6, 7, 11, 8, 11, 10, 9, 5, 10, 6, 5, 1];
		private var tl:Array = [0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1];
		private var x0:int = 300;
		private var y0:int = 200;
		private var vh:int = 100, vw:int = 100;
		public function Test011() 
		{
			_tcg = new TurboCGraphics(this.graphics);
			draw();
		}
		
		private function draw():void
		{
			_tcg.initgraph(TurboCGraphics.DETECT, 0, "");
			trace(dx.length, dy.length, dz.length, ld.length, tl.length);
			zu();
			fu();
			zo();
			_tcg.closegraph();
		}
		
		private function zu():void
		{
			for (var i:int = 0; i < pt; i++)
			{
				var j:int = ld[i];
				var x:int = x0 - dx[j];
				var y:int = y0 - dz[j];
				if (tl[i] == 0)
				{
					_tcg.moveto(x, y);
				}
				_tcg.lineto(x, y);
			}
		}
		
		private function fu():void
		{
			for (var i:int = 0; i < pt; i++)
			{
				var j:int = ld[i];
				var x:int = x0 - dx[j];
				var y:int = y0 + dy[j] + vh;
				if (tl[i] == 0)
				{
					_tcg.moveto(x, y);
				}
				_tcg.lineto(x, y);
			}
		}
		
		private function zo():void
		{
			for (var i:int = 0; i < pt; i++)
			{
				var j:int = ld[i];
				var x:int = x0 + dy[j] + vw;
				var y:int = y0 - dz[j];
				if (tl[i] == 0)
				{
					_tcg.moveto(x, y);
				}
				_tcg.lineto(x, y);
			}
		}
	}
}