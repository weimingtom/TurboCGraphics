package wmt.tcgraphics.test 
{
	import flash.display.Sprite;
	import wmt.tcgraphics.core.TurboCGraphics;
	import wmt.tcgraphics.core.TurboCGraphicsAffine;
	
	public class Test007 extends Sprite
	{	
		private var _tcg:TurboCGraphicsAffine;
		
		public function Test007() 
		{
			_tcg = new TurboCGraphicsAffine(this.graphics);
			draw();
		}
		
		private function draw():void
		{
			var x1:Array = [0.0, 10.0, 100.0, 110.0, 0.0];
			var y1:Array = [0.0, 50.0, 50.0, -10.0, 0.0];
			var x2:Array = new Array(5);
			var y2:Array = new Array(5);
			var i:int;
			var r:Number, xx:Number, yy:Number;
			_tcg.initgraph(TurboCGraphics.DETECT, 0, "");
			_tcg.axis();
			for (r = 0; r < 360; r = r + 10)
			{
				_tcg.rotate(r);
				for (i = 0; i <= 4; i++)
				{
					x2[i] = _tcg.affinex(x1[i], y1[i], 1.0);
					y2[i] = _tcg.affiney(x1[i], y1[i], 1.0);
				}
				for (i = 0; i <= 3; i++)
				{
					_tcg.line(_tcg.scx(x2[i]), _tcg.scy(y2[i]), _tcg.scx(x2[i + 1]), _tcg.scy(y2[i + 1]));
				}
			}
			_tcg.closegraph();
		}
	}
}